# Managing Original Course Materials

This repository intentionally excludes original videos, slides, PDFs, DOCX files, subtitles, images, and metadata files.

That keeps the public repository lightweight and avoids redistributing course source materials without permission.

## Recommended Setup

Use two layers:

1. Public repository: this skill, distilled references, prompts, generated indexes, and scripts.
2. Private material storage: original videos, slides, PDFs, DOCX files, subtitles, and screenshots.

## Option A: Private Cloud Drive

Best for classmates who only need access to files.

Suggested structure:

```text
microcomputer-materials/
  videos/
  subtitles/
  slides/
  practice/
  screenshots/
```

Then each user can keep the files locally and run:

```powershell
python -X utf8 .\scripts\build_course_index.py `
  --root "D:\微机原理" `
  --output ".\references\generated-course-index.md" `
  --focus-output ".\references\focus-evidence.md" `
  --courseware-output ".\references\courseware-evidence.md"
```

## Option B: Private Git Repository With Git LFS

Best if you want version control for large files and everyone has permission to access the materials.

Do not put these files in the public skill repository. Create a separate private repo, then use Git LFS:

```powershell
git lfs install
git lfs track "*.mp4" "*.pptx" "*.pdf" "*.docx" "*.srt" "*.ass" "*.jpg" "*.png"
git add .gitattributes
git add videos subtitles slides practice
git commit -m "Add course materials"
git push
```

## Option C: Public Sample Only

Best if you want the public repository to be easy to understand.

Include only:

- A tiny synthetic sample subtitle
- A tiny synthetic sample slide or Markdown note
- Generated indexes
- Skill references

Do not include full original course materials unless you have explicit permission.

## Why The Current `.gitignore` Blocks Source Files

The current `.gitignore` excludes:

- video files: `.mp4`, `.mkv`, `.avi`, `.mov`
- courseware: `.pptx`, `.pdf`, `.docx`
- subtitles and metadata: `.srt`, `.ass`, `.xml`, `.nfo`
- images: `.jpg`, `.png`

This is intentional. The public repository is for the distilled skill, not for redistributing the course source archive.

