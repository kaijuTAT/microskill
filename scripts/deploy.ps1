param(
  [string]$Config = ".\deploy.json",
  [switch]$PushSkill,
  [switch]$SyncMaterials,
  [switch]$RefreshIndexes
)

$ErrorActionPreference = "Stop"

function Read-Config($Path) {
  if (-not (Test-Path -LiteralPath $Path)) {
    throw "Config file not found: $Path. Copy deploy.example.json to deploy.json and edit it."
  }
  return Get-Content -Raw -LiteralPath $Path | ConvertFrom-Json
}

function Resolve-RepoPath($ConfigValue) {
  if ([string]::IsNullOrWhiteSpace($ConfigValue) -or $ConfigValue -eq ".") {
    return (Resolve-Path ".").Path
  }
  return (Resolve-Path $ConfigValue).Path
}

$cfg = Read-Config $Config
$repoDir = Resolve-RepoPath $cfg.skill_repo_dir
$courseRoot = $cfg.course_root
$branch = if ($cfg.git_branch) { $cfg.git_branch } else { "master" }

Set-Location $repoDir

if ($RefreshIndexes -or $cfg.refresh_indexes) {
  Write-Host "Refreshing generated indexes..."
  python -X utf8 ".\scripts\build_course_index.py" `
    --root $courseRoot `
    --output ".\references\generated-course-index.md" `
    --focus-output ".\references\focus-evidence.md" `
    --courseware-output ".\references\courseware-evidence.md"
}

if ($PushSkill) {
  Write-Host "Validating skill..."
  python "$env:USERPROFILE\.codex\skills\.system\skill-creator\scripts\quick_validate.py" "."

  Write-Host "Pushing skill repository..."
  git add .
  $status = git status --short
  if ($status) {
    git commit -m "Deploy skill updates"
  } else {
    Write-Host "No skill repository changes to commit."
  }
  git push origin $branch
}

if ($SyncMaterials -or $cfg.sync_materials) {
  if (-not (Get-Command rclone -ErrorAction SilentlyContinue)) {
    throw "rclone is not installed. Install it, run 'rclone config', then set rclone_remote in deploy.json."
  }

  $remote = $cfg.rclone_remote
  $remotePath = $cfg.rclone_materials_path
  if ([string]::IsNullOrWhiteSpace($remote) -or [string]::IsNullOrWhiteSpace($remotePath)) {
    throw "rclone_remote and rclone_materials_path must be set in deploy.json."
  }

  Write-Host "Syncing original materials to private cloud storage..."
  rclone sync $courseRoot "$remote/$remotePath" `
    --exclude ".git/**" `
    --exclude "microcomputer-review-heu-skill/.git/**" `
    --progress

  $manifest = if ($cfg.materials_manifest) { $cfg.materials_manifest } else { "materials-manifest.txt" }
  Get-ChildItem -Recurse -File -LiteralPath $courseRoot |
    Where-Object { $_.FullName -notmatch "\\microcomputer-review-heu-skill\\\.git\\" } |
    ForEach-Object { $_.FullName.Substring($courseRoot.Length).TrimStart("\") } |
    Set-Content -Encoding UTF8 -LiteralPath $manifest
  Write-Host "Wrote $manifest"
}

Write-Host "Deploy script finished."
