# Open the existing synthesis result.
open_run synth_1

# Create the reports directory.
set project_dir [get_property DIRECTORY [current_project]]
set report_dir [file join $project_dir reports]
file mkdir $report_dir

# Report resource utilization.
report_utilization \
    -file [file join $report_dir utilization.rpt]

# Start a fresh combined timing report.
set timing_file [file join $report_dir timing_all_paths.rpt]
set fh [open $timing_file w]
close $fh

# List the connected input/output pairs.
# Braces keep bus-index brackets literal in Tcl.
set path_pairs {
    {a[0] p[0]}
    {b[0] p[0]}

    {a[0] p[1]}
    {a[1] p[1]}
    {b[0] p[1]}
    {b[1] p[1]}

    {a[0] p[2]}
    {a[1] p[2]}
    {b[0] p[2]}
    {b[1] p[2]}

    {a[0] p[3]}
    {a[1] p[3]}
    {b[0] p[3]}
    {b[1] p[3]}
}

# Append one worst-case timing path for each pair.
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

# Report estimated power.
report_power \
    -file [file join $report_dir power.rpt]

# Report methodology checks.
report_methodology \
    -file [file join $report_dir methodology.rpt]

puts "2-bit Multiplier reports saved in: $report_dir"