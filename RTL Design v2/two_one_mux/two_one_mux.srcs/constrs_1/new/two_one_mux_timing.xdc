# Learning assumptions only — not board-derived specifications.
# All time values are in ns.

# Virtual reference clock: 10 ns period.
create_clock -name virtual_clk -period 10.000

# External input arrival times.
set_input_delay -clock [get_clocks virtual_clk] \
    -max 2.000 [get_ports {a b select}]

set_input_delay -clock [get_clocks virtual_clk] \
    -min 0.500 [get_ports {a b select}]

# External output timing requirements.
set_output_delay -clock [get_clocks virtual_clk] \
    -max 2.000 [get_ports y]

set_output_delay -clock [get_clocks virtual_clk] \
    -min -0.500 [get_ports y]