# Open the existing synthesis result.
open_run synth_1

# Create the report directory.
set project_dir [get_property DIRECTORY [current_project]]
set report_dir [file join $project_dir reports]
file mkdir $report_dir

# Resource utilization.
report_utilization \
    -file [file join $report_dir utilization.rpt]

# Four input-to-output maximum-delay reports.
report_timing \
    -delay_type max \
    -from [get_ports {a b}] \
    -to [get_ports {sum carry}] \
    -max_paths 4 \
    -nworst 2 \
    -file [file join $report_dir timing_all_paths.rpt]

# Estimated power.
report_power \
    -file [file join $report_dir power.rpt]

# Methodology checks.
report_methodology \
    -file [file join $report_dir methodology.rpt]

puts "Half-adder reports saved in: $report_dir"