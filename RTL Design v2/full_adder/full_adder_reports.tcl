# Open the existing synthesis result.
open_run synth_1

# Create the report directory.
set project_dir [get_property DIRECTORY [current_project]]
set report_dir [file join $project_dir reports]
file mkdir $report_dir

# Resource utilization.
report_utilization \
    -file [file join $report_dir utilization.rpt]

# Six input-to-output maximum-delay reports: one worst path per pair.
set timing_file [file join $report_dir timing_all_paths.rpt]

# Clear the report once before generating fresh results.
set fh [open $timing_file w]
close $fh

set path_pairs {
    {a   sum}
    {b   sum}
    {cin sum}
    {a   cout}
    {b   cout}
    {cin cout}
}

foreach pair $path_pairs {
    lassign $pair input_port output_port

    report_timing \
        -delay_type max \
        -from [get_ports $input_port] \
        -to [get_ports $output_port] \
        -max_paths 1 \
        -nworst 1 \
        -append \
        -file $timing_file
}

# Estimated power.
report_power \
    -file [file join $report_dir power.rpt]

# Methodology checks.
report_methodology \
    -file [file join $report_dir methodology.rpt]

puts "Full-adder reports saved in: $report_dir"