# Exam Focus

## Default Difficulty

The user's exam scope is not especially hard. Keep questions practical and course-aligned. Avoid deep hardware design unless it appears in the slides or practice files.

## Weighting

- High: assembly program writing and reading.
- High: 8259, 8253, and 8255.
- Medium: 8086/8088 segmentation, address calculation, flags, instruction formats, and I/O addressing.
- Medium: interrupts and bus/control signals.
- Lower: broad history, rarely used instructions, and advanced chip internals beyond control words and application flow.

## Must-Practice Skills

- Convert segment:offset to physical address: `physical = segment * 10H + offset`.
- Decide default segment register for memory operands, especially BP using SS.
- Determine CF, OF, ZF, SF, PF, and AF after simple ADD/SUB.
- Read and write short 8086 assembly programs with data segment initialization.
- Configure 8259 with ICW and OCW in common single-chip or cascaded scenarios.
- Configure 8253 mode and initial count from frequency or delay requirements.
- Configure 8255 mode set control word and bit set/reset control word.

## Review Output Standard

For each topic, produce:

1. 核心结论: 3-6 bullet points.
2. 必背细节: compact formulas, control-word fields, or instruction rules.
3. 典型题型: what the exam usually asks.
4. 易错点: common confusions and corrections.
5. 小练习: one quick question with answer.

