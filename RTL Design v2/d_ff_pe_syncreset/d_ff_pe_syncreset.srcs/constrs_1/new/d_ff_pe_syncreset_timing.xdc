# 10 ns clock period = 100 MHz.
create_clock -name sys_clk -period 10.000 [get_ports clock]

# External arrival assumptions for data and synchronous reset.
set_input_delay -clock [get_clocks sys_clk] \
    -max 2.000 [get_ports {data reset}]

set_input_delay -clock [get_clocks sys_clk] \
    -min 0.500 [get_ports {data reset}]

# External receiver timing assumptions.
set_output_delay -clock [get_clocks sys_clk] \
    -max 2.000 [get_ports q]

set_output_delay -clock [get_clocks sys_clk] \
    -min -0.500 [get_ports q]