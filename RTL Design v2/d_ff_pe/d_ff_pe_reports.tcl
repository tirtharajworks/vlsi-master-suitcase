# Open completed synthesis.
open_run synth_1

# Report directory.
set report_dir [file join \
    [get_property DIRECTORY [current_project]] reports d_ff_pe]
file mkdir $report_dir

# General reports.
report_utilization \
    -file [file join $report_dir utilization.rpt]

report_clocks \
    -file [file join $report_dir clocks.rpt]

check_timing -verbose \
    -file [file join $report_dir timing_checks.rpt]

report_timing_summary \
    -file [file join $report_dir timing_summary.rpt]

# Clear combined detailed timing report.
set timing_file [file join $report_dir timing_details.rpt]
set fh [open $timing_file w]
close $fh

# One worst max and min result for each path category.
foreach delay_type {max min} {
    report_timing \
        -delay_type $delay_type \
        -from [get_ports data] \
        -to [get_pins q_reg/D] \
        -max_paths 1 -nworst 1 \
        -append -file $timing_file

    report_timing \
        -delay_type $delay_type \
        -from [get_cells q_reg] \
        -to [get_ports q] \
        -max_paths 1 -nworst 1 \
        -append -file $timing_file
}

# Estimated power and methodology checks.
report_power \
    -file [file join $report_dir power.rpt]

report_methodology \
    -file [file join $report_dir methodology.rpt]

puts "Reports saved in: $report_dir"