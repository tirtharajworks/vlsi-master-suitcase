# d_ff_pe_enable.xdc
# Practice timing assumptions only; not board specifications.
# All timing values are in nanoseconds.

# Primary clock: 10 ns period = 100 MHz
create_clock -name sys_clk -period 10.000 \
    -waveform {0.000 5.000} [get_ports clock]

# Assume external synchronous sources drive data and enable.
# Earliest arrival: 0.5 ns after the reference clock edge.
# Latest arrival:   2.0 ns after the reference clock edge.
set_input_delay -clock [get_clocks sys_clk] -min 0.500 \
    [get_ports {data enable}]

set_input_delay -clock [get_clocks sys_clk] -max 2.000 \
    [get_ports {data enable}]

# Assume an external synchronous receiver captures q.
# Receiver setup requirement: 2.0 ns.
# Receiver hold requirement:  0.5 ns.
# Board clock/data skew is assumed zero for this exercise.
set_output_delay -clock [get_clocks sys_clk] -max 2.000 \
    [get_ports q]

set_output_delay -clock [get_clocks sys_clk] -min -0.500 \
    [get_ports q]