# HEU Microcomputer Review Skill

This repository packages a course-specific review skill for the HEU microcomputer principles and interface technology course.

It is optimized for efficient exam review, especially:

- 8086 assembly program writing
- 8259 programmable interrupt controller
- 8253 programmable interval timer
- 8255 programmable parallel interface
- Moderate-difficulty practice questions, answer keys, and mistake diagnosis

## What Is Included

- `SKILL.md`: Codex skill entry point and workflow rules.
- `references/course-map.md`: 47-lesson course map.
- `references/generated-course-index.md`: generated index for 47 subtitles and 20 local courseware files.
- `references/focus-evidence.md`: subtitle evidence for assembly, 8259, 8253, and 8255.
- `references/courseware-evidence.md`: slide/PDF/DOCX evidence for priority topics.
- `references/assembly-programming.md`: assembly review guide.
- `references/interface-chips.md`: 8259, 8253, and 8255 review guide.
- `references/question-templates.md`: practice and mock exam templates.
- `scripts/build_course_index.py`: local index refresh script.

## Install For Codex

Copy this folder to:

```text
C:\Users\Elvis\.codex\skills\microcomputer-review-heu
```

Then invoke it with:

```text
Use $microcomputer-review-heu to review 8255 with core conclusions, must-memorize details, typical question patterns, common mistakes, and a mini practice set.
```

## Use In VSCode, Cursor, Or Other Agents

Open this repository and point your agent to:

```text
SKILL.md
references/
```

Recommended prompt:

```text
Use the HEU Microcomputer Review skill in this repository. Help me review assembly programming, 8259, 8253, and 8255 at moderate exam difficulty. Prefer the course references and evidence files before general textbook knowledge.
```

## Refresh Local Indexes

If local course files change, run:

```powershell
python -X utf8 .\scripts\build_course_index.py `
  --root "D:\微机原理" `
  --output ".\references\generated-course-index.md" `
  --focus-output ".\references\focus-evidence.md" `
  --courseware-output ".\references\courseware-evidence.md"
```

## Notes

This repository intentionally does not include original videos, slides, PDFs, or DOCX courseware. It includes generated study indexes and review references only.

