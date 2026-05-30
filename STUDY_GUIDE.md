# Study Guide Without Original Course Files

You can use this repository even if you only cloned the repo and do not have the original videos, slides, PDFs, or DOCX files.

The repository includes distilled study material and evidence indexes. It is enough for review, practice generation, and AI-assisted tutoring.

## What You Can Do After Cloning

- Review the course map in `references/course-map.md`.
- Study the priority exam scope in `references/exam-focus.md`.
- Review assembly programming with `references/assembly-programming.md`.
- Review 8259, 8253, and 8255 with `references/interface-chips.md`.
- Generate practice questions from `references/question-templates.md`.
- Use `references/focus-evidence.md` and `references/courseware-evidence.md` as compact source traces.

## Recommended Learning Order

1. Read `references/exam-focus.md`.
2. Review 8086 basics from `references/course-map.md`.
3. Study assembly programming from `references/assembly-programming.md`.
4. Practice assembly code reading and writing.
5. Study 8259, 8253, and 8255 from `references/interface-chips.md`.
6. Use `references/question-templates.md` to generate a mock exam.

## Recommended Agent Prompt

```text
Use this repository as a microcomputer-principles review skill.
Focus on moderate exam difficulty.
Teach me in Chinese.
Prioritize assembly programming, 8259, 8253, and 8255.
Use SKILL.md and references/ before general textbook knowledge.
Give me concise explanations, typical question patterns, common mistakes, and practice questions with answers.
```

## Example Requests

```text
帮我复习 8255，输出核心结论、必背细节、典型题型、易错点和 5 道练习题。
```

```text
给我出一套汇编程序编写专项题，难度中等，带答案和关键步骤解释。
```

```text
我总是分不清 8253 方式 2 和方式 3，帮我用考题角度讲清楚。
```

```text
围绕 8259 的 ICW/OCW、优先级和中断类型号出 15 道题。
```

## If You Have Your Own Course Files

Put your videos, subtitles, slides, PDFs, and DOCX files in a local course folder. Then refresh the generated indexes:

```powershell
python -X utf8 .\scripts\build_course_index.py `
  --root "D:\微机原理" `
  --output ".\references\generated-course-index.md" `
  --focus-output ".\references\focus-evidence.md" `
  --courseware-output ".\references\courseware-evidence.md"
```

The script supports:

- `.srt` subtitles
- `.pptx` slides
- `.pdf` files
- `.docx` files

## What Is Not Included

Original course videos and original courseware are not included in this repository. This keeps the repo lightweight and avoids redistributing source course materials.

