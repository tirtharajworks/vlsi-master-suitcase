# Open the existing synthesis result.
open_run synth_1

# Create the reports directory.
set project_dir [get_property DIRECTORY [current_project]]
set report_dir [file join $project_dir reports]
file mkdir $report_dir

# Report resource utilization.
report_utilization \
    -file [file join $report_dir utilization.rpt]

# Report one worst-case path for each input/output pair.
foreach output_port {difference borrow} {
    foreach input_port {a b} {
        report_timing \
            -delay_type max \
            -from [get_ports $input_port] \
            -to [get_ports $output_port] \
            -max_paths 1 \
            -nworst 1 \
	    -append \
	    -file [file join $report_dir timing_all_paths.rpt]
    }
}

# Report estimated power.
report_power \
    -file [file join $report_dir power.rpt]

# Report methodology checks.
report_methodology \
    -file [file join $report_dir methodology.rpt]

puts "Half-subtractor reports saved in: $report_dir"