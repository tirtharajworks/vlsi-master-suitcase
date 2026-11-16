# Open completed synthesis.
open_run synth_1

# Create report directory.
set report_dir [file join \
    [get_property DIRECTORY [current_project]] \
    reports d_ff_sync_reset]
file mkdir $report_dir

# Resource utilization.
report_utilization \
    -file [file join $report_dir utilization.rpt]

# Clock definitions.
report_clocks \
    -file [file join $report_dir clocks.rpt]

# Timing constraint checks.
check_timing -verbose \
    -file [file join $report_dir timing_checks.rpt]

# Setup and hold summary.
report_timing_summary -delay_type min_max \
    -file [file join $report_dir timing_summary.rpt]

# Clear the combined detailed timing report.
set timing_file [file join $report_dir timing_details.rpt]
set fh [open $timing_file w]
close $fh

# Detailed setup and hold timing.
foreach delay_type {max min} {
    # Data input to register D pin.
    report_timing \
        -delay_type $delay_type \
        -from [get_ports data] \
        -to [get_pins q_reg/D] \
        -max_paths 1 -nworst 1 \
        -append -file $timing_file

    # Synchronous reset input to register R pin.
    report_timing \
        -delay_type $delay_type \
        -from [get_ports reset] \
        -to [get_pins q_reg/R] \
        -max_paths 1 -nworst 1 \
        -append -file $timing_file

    # Register to output.
    report_timing \
        -delay_type $delay_type \
        -from [get_cells q_reg] \
        -to [get_ports q] \
        -max_paths 1 -nworst 1 \
        -append -file $timing_file
}

# Estimated power.
report_power \
    -file [file join $report_dir power.rpt]

# Methodology checks.
report_methodology \
    -file [file join $report_dir methodology.rpt]

puts "D-Flip Flop w/ Synchronous Reset Reports saved in: $report_dir"