# Assembly Programming

## Core Review Targets

- Program structure: data segment, code segment, stack segment, `ASSUME`, labels, `END`.
- Data definitions: `DB`, `DW`, `DUP`, strings, arrays, and buffer layout.
- Addressing: immediate, register, direct, register indirect, based, indexed, based-indexed, and displacement.
- Data transfer: `MOV`, `XCHG`, `PUSH`, `POP`, `LEA`, `IN`, `OUT`.
- Arithmetic and logic: `ADD`, `ADC`, `SUB`, `SBB`, `INC`, `DEC`, `CMP`, `AND`, `OR`, `XOR`, `TEST`, shifts and rotates.
- Branch and loop: `JMP`, conditional jumps, `LOOP`, `JCXZ`, flag-driven decisions.
- String and DOS calls: `MOVSB/MOVSW`, `CMPS`, `SCAS`, `INT 21H` common services.

## Standard Program Skeleton

Use this skeleton for moderate exam-style programs:

```asm
DATA SEGMENT
    ; data definitions
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
START:
    MOV AX, DATA
    MOV DS, AX

    ; main logic

    MOV AH, 4CH
    INT 21H
CODE ENDS
END START
```

## Program-Writing Heuristics

- Initialize `DS` before accessing variables in the data segment.
- Use `LEA` for effective address, not for reading memory content.
- Use `CMP` before conditional jumps when comparing values.
- Use `LOOP` with `CX`; preserve `CX` if nested loops are needed.
- For byte arrays use `AL`, `BL`, `CL`, `DL`; for word arrays use `AX`, `BX`, `CX`, `DX`.
- Make the result location explicit: register, variable, buffer, or screen output.
- For string output via DOS `INT 21H/AH=09H`, the string should end with `$`.

## Common Exam Programs

- Sum or count elements in an array.
- Find max/min in a byte or word array.
- Count positive, negative, zero, odd, or even values.
- Convert or display simple characters using DOS calls.
- Copy, compare, or scan short strings.
- Use branches to implement piecewise logic.
- Use port I/O in a short interface program.

## Common Mistakes

- `MOV DS, DATA` is invalid; load through AX: `MOV AX, DATA`, then `MOV DS, AX`.
- Memory-to-memory transfer is usually invalid: use a register as bridge.
- `PUSH` and `POP` operate on words in 8086.
- `BP` defaults to `SS`, while `BX`, `SI`, and `DI` normally default to `DS`.
- `INC` and `DEC` do not affect CF.
- Confusing physical address with logical address. The formula is `segment * 10H + offset`.
- Confusing signed overflow OF with unsigned carry CF.

## Question Pattern

For an assembly program-writing question, include:

- Given data.
- Task requirement.
- Register or memory output requirement.
- Any allowed assumptions.
- Reference solution.
- One-line explanation of the key instruction sequence.

