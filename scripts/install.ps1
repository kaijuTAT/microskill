param(
  [string]$SkillName = "microcomputer-review-heu",
  [string]$CodexSkillsDir = "$env:USERPROFILE\.codex\skills",
  [string]$MaterialsRoot = "D:\微机原理",
  [string]$RcloneSource = ""
)

$ErrorActionPreference = "Stop"

$repoDir = (Resolve-Path ".").Path
$target = Join-Path $CodexSkillsDir $SkillName

if (-not (Test-Path -LiteralPath $CodexSkillsDir)) {
  New-Item -ItemType Directory -Path $CodexSkillsDir | Out-Null
}

if (Test-Path -LiteralPath $target) {
  Write-Host "Updating existing skill at $target"
  Remove-Item -Recurse -Force -LiteralPath $target
}

New-Item -ItemType Directory -Path $target | Out-Null
Copy-Item -Recurse -Path (Join-Path $repoDir "*") -Destination $target -Exclude ".git"
Write-Host "Installed skill to $target"

if ($RcloneSource) {
  if (-not (Get-Command rclone -ErrorAction SilentlyContinue)) {
    throw "rclone is not installed. Install it and run 'rclone config' first."
  }
  if (-not (Test-Path -LiteralPath $MaterialsRoot)) {
    New-Item -ItemType Directory -Path $MaterialsRoot | Out-Null
  }
  Write-Host "Pulling materials from $RcloneSource to $MaterialsRoot"
  rclone sync $RcloneSource $MaterialsRoot --progress
}

Write-Host "Install script finished."
