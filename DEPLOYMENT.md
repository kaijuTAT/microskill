# One-Command Deployment

This repository supports a two-layer deployment model:

1. Public skill repository on GitHub.
2. Private original materials in cloud storage.

This keeps the public repo usable while avoiding public redistribution of full course videos and courseware.

## First-Time Setup

Create a local deploy config:

```powershell
Copy-Item .\deploy.example.json .\deploy.json
```

Edit `deploy.json`.

Important fields:

- `course_root`: local folder containing videos, subtitles, slides, PDFs, and DOCX files.
- `github_remote`: public skill Git repository.
- `rclone_remote`: private cloud remote configured by rclone.
- `rclone_materials_path`: destination folder in private cloud storage.
- `sync_materials`: set to `true` only when you want to upload original course materials.

## Configure Private Cloud Storage

Install rclone:

```powershell
winget install Rclone.Rclone
```

Then configure your cloud account:

```powershell
rclone config
```

Common choices include OneDrive, Google Drive, S3-compatible storage, WebDAV, or a private NAS.

## Deploy Skill Only

```powershell
.\scripts\deploy.ps1 -Config .\deploy.json -PushSkill
```

This validates the skill, commits changes if needed, and pushes to GitHub.

## Deploy Skill And Private Materials

```powershell
.\scripts\deploy.ps1 -Config .\deploy.json -PushSkill -SyncMaterials
```

This refreshes indexes, pushes the public skill repo, and syncs original course files to the configured private cloud location.

## Install After Clone

After cloning the repository:

```powershell
.\scripts\install.ps1
```

If the user also has access to the private material cloud path:

```powershell
.\scripts\install.ps1 -RcloneSource "mycloud:/microskill/materials" -MaterialsRoot "D:\微机原理"
```

## What Gets Published Publicly

Public GitHub:

- Skill instructions
- Distilled references
- Generated indexes
- Study guide
- Scripts

Private cloud:

- Original videos
- Original slides
- Original PDFs and DOCX files
- Original subtitles
- Screenshots and metadata

