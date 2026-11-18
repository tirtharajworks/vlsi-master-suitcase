# Open the existing synthesis result.
open_run synth_1

# Create a reports folder inside the current project directory.
set project_dir [get_property DIRECTORY [current_project]]
set report_dir [file join $project_dir reports]
file mkdir $report_dir

# Resource utilization.
report_utilization \
    -file [file join $report_dir utilization.rpt]

# Timing from input a to output y.
report_timing \
    -from [get_ports a] \
    -to [get_ports y] \
    -file [file join $report_dir timing_a_to_y.rpt]

# Timing from input b to output y.
report_timing \
    -from [get_ports b] \
    -to [get_ports y] \
    -file [file join $report_dir timing_b_to_y.rpt]

# Estimated power.
report_power \
    -file [file join $report_dir power.rpt]

# Methodology checks.
report_methodology \
    -file [file join $report_dir methodology.rpt]

puts "XNOR gate reports saved in: $report_dir"