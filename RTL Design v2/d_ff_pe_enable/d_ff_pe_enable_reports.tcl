# ============================================================
# D flip-flop with enable: post-synthesis reports
# Top module: d_ff_pe_enable
#
# Prerequisites:
#   1. RTL and XDC saved.
#   2. Synthesis completed successfully.
#
# This script opens existing synthesis results.
# It does NOT launch synthesis.
# ============================================================

# Open completed synthesis.
open_run synth_1

# Create report directory.
set report_dir [file join \
    [get_property DIRECTORY [current_project]] \
    reports d_ff_pe_enable]
file mkdir $report_dir

# Resource utilization.
report_utilization \
    -file [file join $report_dir utilization.rpt]

# Hierarchical resource utilization.
# More informative when future projects contain submodules.
report_utilization -hierarchical \
    -file [file join $report_dir utilization_hierarchical.rpt]

# Clock definitions.
report_clocks \
    -file [file join $report_dir clocks.rpt]

# Timing constraint checks.
check_timing -verbose \
    -file [file join $report_dir timing_checks.rpt]

# Setup and hold summary, including constraint checks
# and visibility of unconstrained paths.
report_timing_summary \
    -delay_type min_max \
    -check_timing_verbose \
    -report_unconstrained \
    -max_paths 10 \
    -file [file join $report_dir timing_summary.rpt]

# Clear the combined detailed timing report.
set timing_file [file join $report_dir timing_details.rpt]
set fh [open $timing_file w]
puts $fh "D flip-flop with enable: detailed timing"
puts $fh "max = setup analysis; min = hold analysis"
close $fh

# Detailed setup and hold timing.
foreach delay_type {max min} {

    # Add a section heading.
    set fh [open $timing_file a]
    puts $fh "\n=================================================="
    puts $fh "Delay type: $delay_type"
    puts $fh "=================================================="
    puts $fh "\nOverall worst timing paths"
    close $fh

    # Overall worst paths.
    report_timing \
        -delay_type $delay_type \
        -path_type full_clock_expanded \
        -max_paths 10 -nworst 1 \
        -append -file $timing_file

    # Data input paths.
    set fh [open $timing_file a]
    puts $fh "\nPaths starting at data input"
    close $fh

    report_timing \
        -delay_type $delay_type \
        -from [get_ports data] \
        -path_type full_clock_expanded \
        -max_paths 10 -nworst 1 \
        -append -file $timing_file

    # Enable input paths.
    # Do not assume enable maps to a particular register pin.
    set fh [open $timing_file a]
    puts $fh "\nPaths starting at enable input"
    close $fh

    report_timing \
        -delay_type $delay_type \
        -from [get_ports enable] \
        -path_type full_clock_expanded \
        -max_paths 10 -nworst 1 \
        -append -file $timing_file

    # Output paths.
    # In this design, these are the register-to-output paths.
    set fh [open $timing_file a]
    puts $fh "\nPaths ending at output q"
    close $fh

    report_timing \
        -delay_type $delay_type \
        -to [get_ports q] \
        -path_type full_clock_expanded \
        -max_paths 10 -nworst 1 \
        -append -file $timing_file
}

# Estimated power.
# No simulation switching-activity file is supplied here.
# Treat this as an assumption-dependent estimate.
report_power \
    -file [file join $report_dir power.rpt]

# Design rule checks.
report_drc \
    -file [file join $report_dir drc.rpt]

# Methodology checks.
report_methodology \
    -file [file join $report_dir methodology.rpt]

# Clock interaction.
# Run when at least one clock is defined.
set clock_interaction_file \
    [file join $report_dir clock_interaction.rpt]

if {[llength [get_clocks -quiet *]] > 0} {

    report_clock_interaction \
        -file $clock_interaction_file

} else {

    set fh [open $clock_interaction_file w]
    puts $fh "Clock interaction report not run: no clocks are defined."
    puts $fh "For a sequential design, investigate missing clock constraints."
    puts $fh "For a purely combinational design, this may be expected."
    close $fh
}

puts "D-Flip Flop +ET w/ Enable reports saved in: $report_dir"
puts "These are post-synthesis reports, not post-route signoff."