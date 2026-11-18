# Learning target: maximum 10 ns for existing input-to-output paths.
set_max_delay 10.000 \
    -from [get_ports {a[*] b[*] cin}] \
    -to [get_ports {sum[*] cout}]