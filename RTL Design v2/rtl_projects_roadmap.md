Skills: Industry training and hiring material repeatedly identify **RTL, SystemVerilog, UVM, assertions,** and **coverage** as core employer requirements.





1. **Truth tables, Boolean expressions, Logic minimizations**



**2.Combinational foundations**

OR → AND → NOT → NAND → NOR → XOR → XNOR

↓

Truth tables → Boolean equations → Combinational logic

↓

Half Adder

↓

① Half Subtractor

↓

Binary multiplication by hand

→ AND-generated partial products

→ Column weights and carry propagation

→ Vectors, bit selection and output widths

↓

② 2-bit Unsigned Multiplier                 \[Tomorrow: project 1]

↓

2:1 Multiplexer

→ Conditional operator

→ 4-bit-wide 2:1 Multiplexer

→ Combinational always @(\*)

→ Blocking assignments

→ Complete assignments and latch avoidance

&#x20;                                             \[Tomorrow: project 2]

↓

4:1 Multiplexer → case statements → Default handling

↓

1:2 Demultiplexer → 1:4 Demultiplexer

↓

2-to-4 Decoder → Enable → One-hot outputs

↓

4-to-2 Priority Encoder

→ Multiple asserted inputs

→ Priority ordering

→ Valid output for the no-request case

↓

Full Adder

→ Carry-in versus carry-out

→ Three-input arithmetic reference model

↓

Full Subtractor

→ Borrow-in versus borrow-out

→ Operand order and arithmetic reference model

↓

4-bit Ripple-Carry Adder

↓

4-bit Adder/Subtractor

→ Two's-complement subtraction

→ Carry/borrow versus signed overflow

↓

Comparator → Small ALU

→ Operation selection → Zero/carry/overflow flags



**3. Storage, clocks, counters and shifting**

Combinational logic versus stored state

↓

SR Latch

→ Feedback → Hold/set/reset

→ Forbidden input condition for the chosen implementation

↓

D Latch

→ Enable → Level-sensitive transparency

↓

D Flip-Flop

→ Edge-triggered storage → Clock edges

→ Nonblocking assignments

→ Synchronous reset → Clock enable

↓

Reset styles

→ Synchronous versus asynchronous reset

→ Reset release considerations

↓

JK Flip-Flop

→ Hold/set/reset/toggle behaviour

→ Edge-triggered RTL model

↓

4-bit Register

↓

Binary Up Counter → Wraparound

↓

Down Counter → Direction control

↓

③ 4-bit Up/Down Counter with Reset and Enable

↓

Terminal-count detection → Modulo-N Counter

→ Clock-enable pulse generation

↓

4-bit Left Shift Register

↓

4-bit Right Shift Register

↓

Bidirectional shifting

→ Concatenation → Serial input/output

→ Parallel loading → Reset/load/shift priority

↓

④ 8-bit Parallel-Load Shift Register



**4. FSMs and your first integrated controller projects**

State diagrams → State transitions

↓

State registers → Next-state logic → Output logic

↓

Moore versus Mealy FSMs

→ Reset state → Illegal-state handling

↓

Overlapping sequences

↓

⑤ Overlapping 101 Sequence Detector

↓

Controller + Datapath integration

↓

Digital Clock

→ Clock-enable ticks

→ Seconds/minutes/hours counters

→ Rollover and reset

→ BCD/display encoding

→ Optional multiplexed-display controller

↓

UART Transmitter

→ Baud-rate enable → Framing → TX FSM

↓

UART Receiver

→ Input synchronization

→ Sampling strategy → RX FSM

→ Framing-error checks

↓

UART TX/RX integration and loopback verification



**5. Memories and FIFOs**

Verilog arrays → Memory read/write behaviour

↓

Single-port RAM

→ Synchronous read versus asynchronous read

→ Read-during-write specification

↓

Circular buffer

→ Read/write pointers → Occupancy tracking

↓

16×8 Synchronous FIFO

→ Single clock

→ Full/empty flags

→ Simultaneous read/write

→ Overflow/underflow policy

→ Pointer wraparound

↓

Clock-domain crossing foundations

→ Metastability → Synchronizers

→ Why independently synchronizing a data bus is unsafe

→ Handshake-based transfers

↓

Binary-to-Gray and Gray-to-binary conversion

↓

16×8 Asynchronous FIFO

→ Independent read/write clocks

→ Local binary pointers

→ Synchronized Gray pointers

→ Full/empty generation

→ Reset strategy

→ CDC-aware review and timing constraints



**6. SystemVerilog verification and the AHB-to-APB bridge**

Self-checking Verilog testbenches              \[Already practising]

↓

Reusable tasks → Reference models → Regression tests

↓

SystemVerilog verification foundations

→ Types and arrays → Interfaces

→ Race-aware stimulus/sampling

→ Assertions → Functional coverage

↓

Classes → Constrained randomization

→ Transactions → Drivers → Monitors → Scoreboards

↓

APB protocol fundamentals

↓

Small APB register peripheral

↓

AHB-Lite protocol fundamentals

↓

Precisely specified AHB-Lite-to-APB Bridge RTL

→ Address decode → Transfer sequencing

→ Wait states → Read/write response → Error handling

↓

Directed self-checking SystemVerilog verification

↓

UVM foundations

→ Sequence/sequencer → Driver → Monitor

→ Agent → Environment → Scoreboard

↓

UVM verification of the bridge

→ Randomized transfers → Assertions

→ Functional coverage → Regression and debug



**7. Processor design: 8-bit first, then 16-bit**

ALU + Registers + Multiplexers + Decoder + FSM

↓

Program Counter → Instruction Register

↓

Instruction-set specification

→ Instruction encoding → Flags → Memory map

↓

Small Register File

↓

Datapath + Control Unit

↓

8-bit Multi-Cycle Processor

→ Fetch → Decode → Execute → Write-back

↓

Instruction and data memory

→ Small assembly test programs

→ Instruction-by-instruction reference checking

↓

Memory-mapped UART / GPIO / timer

↓

Bus-based peripheral integration

↓

16-bit Processor

→ Revisit ISA and immediate/address widths

→ Wider datapath and register file

→ Expanded verification

↓

Optional pipelining

→ Data hazards → Control hazards → Stalls/forwarding





**8. DSP and image-processing branch**

Signed arithmetic

→ Fixed-point formats

→ Product/accumulator widths

→ Rounding → Saturation → Overflow

↓

Multiply-Accumulate datapath

↓

Pipelining → Latency versus throughput

→ Valid signals → Backpressure where needed

↓

Small Digital FIR Filter

→ Delay line → Coefficients → MAC structure

→ Impulse/step/random-input reference tests

↓

Streaming pixel processing

→ Pixel widths → Frame/line boundaries

↓

Line buffers → Sliding 3×3 window

↓

Simple image filter

→ Box/mean filter

↓

Edge detection

→ Sobel gradients

→ Magnitude approximation → Thresholding

↓

Integrated streaming image-processing pipeline





**9. Separate branch: CMOS gate design, layout and characterization**

MOS transistor fundamentals → CMOS switching

↓

CMOS Inverter

→ Transistor sizing → DC/transient simulation

↓

NAND2 → NOR2

↓

Layout using a specific PDK

↓

DRC → LVS

↓

Parasitic extraction

↓

Post-layout simulation

↓

Delay, transition, power and load/slew characterization

↓

Optional standard-cell library generation





IBUF → connecting interconnect → LUT → connecting interconnect → OBUF

&#x20;      ↑ route delay                  ↑ route delay









15Nov2026



d\_ff\_pe — positive-edge D flip-flop. ✅



d\_ff\_ne — negative-edge D flip-flop. ✅



D flip-flop with synchronous reset. ✅



2:1 mux. ✅



D flip-flop with enable.



4:1 mux.



4-bit up/down counter with reset and enable.



A short register-to-register timing lesson.



First CDC exercise — a single-bit signal crossing between two unrelated clocks, followed by a two-flop synchronizer.



Parallel-load shift register, then overlapping 101 detector.

