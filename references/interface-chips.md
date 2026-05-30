# Interface Chips

## 8259 Programmable Interrupt Controller

### What To Master

- 8259 expands and manages external interrupt requests.
- It has request, mask, and service tracking logic: IRR, IMR, and ISR.
- `IR0-IR7` receive interrupt requests.
- Initialization uses ICW commands; operation uses OCW commands.
- Interrupt vector base is set during initialization, then each IR line maps to one vector number.
- In many exam questions, the task is to write initialization commands or explain interrupt service order.

### Typical Questions

- Determine interrupt vector number from base type and IR line.
- Explain the role of IRR, IMR, and ISR.
- Write ICW1-ICW4 for a single 8259 system.
- Use OCW1 to mask or unmask interrupt lines.
- Explain end-of-interrupt handling.

### Common Mistakes

- Confusing interrupt vector number with interrupt service routine address.
- Forgetting that masking blocks requests but does not remove the hardware source.
- Mixing ICW and OCW purposes.
- Ignoring priority order when several IR lines request at once.

## 8253 Programmable Interval Timer

### What To Master

- 8253 has three independent counters: counter 0, counter 1, counter 2.
- Each counter has `CLK`, `GATE`, and `OUT`.
- Control word selects counter, read/write format, mode, and BCD/binary counting.
- Common exam modes: mode 0, mode 2, and mode 3.
- Initial count calculation usually follows `N = input frequency / output frequency` or `N = delay / clock period`.

### Typical Questions

- Build a control word for a selected counter and mode.
- Calculate initial count from frequency or delay.
- Write OUT instructions to control port and counter port.
- Explain output waveform behavior for a common mode.

### Common Mistakes

- Forgetting to write low byte then high byte when using LSB/MSB format.
- Confusing mode 2 rate generator with mode 3 square wave generator.
- Treating count value 0 as literal zero; in many contexts it represents the maximum count.
- Forgetting that each counter has its own data port.

## 8255 Programmable Parallel Interface

### What To Master

- 8255 provides ports A, B, and C.
- Port C can be split into upper PC7-PC4 and lower PC3-PC0.
- Mode set control word configures group A and group B.
- Bit set/reset control word controls individual Port C bits.
- Modes: mode 0 basic I/O, mode 1 strobed I/O, mode 2 bidirectional bus for port A.

### Typical Questions

- Build the mode set control word from I/O direction requirements.
- Distinguish mode set control word from bit set/reset control word.
- Write a short program to initialize ports and input/output data.
- Explain handshaking signals in mode 1.

### Common Mistakes

- Forgetting D7 distinguishes mode set control word from bit set/reset control word.
- Mixing upper and lower Port C direction bits.
- Assuming all ports support all modes equally.
- Writing data to the control port instead of the target data port.

## Default Practice Style

For 8259/8253/8255, prefer these question types:

- Fill the control word.
- Choose the correct command sequence.
- Calculate vector, count, or port direction.
- Debug a wrong initialization snippet.
- Explain one signal or register in one sentence.

