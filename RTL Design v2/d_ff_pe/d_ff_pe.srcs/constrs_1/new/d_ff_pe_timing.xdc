# Learning clock: 10 ns period = 100 MHz.
create_clock -name sys_clk -period 10.000 [get_ports clock]

# Assumed external data arrival times.
set_input_delay -clock [get_clocks sys_clk] -max 2.000 [get_ports data] #input side setup
set_input_delay -clock [get_clocks sys_clk] -min 0.500 [get_ports data] #input side hold

# Assumed external receiving-device timing requirements.
set_output_delay -clock [get_clocks sys_clk] -max 2.000 [get_ports q] #output side setup
set_output_delay -clock [get_clocks sys_clk] -min -0.500 [get_ports q] #output side hold