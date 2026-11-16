create_clock -name sys_clk -period 10.000 [get_ports clock]

set_input_delay -clock [get_clocks sys_clk] -clock_fall \
    -max 2.000 [get_ports data]
set_input_delay -clock [get_clocks sys_clk] -clock_fall \
    -min 0.500 [get_ports data]

set_output_delay -clock [get_clocks sys_clk] -clock_fall \
    -max 2.000 [get_ports q]
set_output_delay -clock [get_clocks sys_clk] -clock_fall \
    -min -0.500 [get_ports q]