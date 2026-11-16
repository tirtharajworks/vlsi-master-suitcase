# ============================================================
# two_one_mux — Post-synthesis reports
# Run after synthesis completes successfully.
# ============================================================

# Open synthesized design.
open_run synth_1

# Create report directory inside the project directory.
set report_dir [file join \
    [get_property DIRECTORY [current_project]] \
    reports two_one_mux]

file mkdir $report_dir

# ------------------------------------------------------------
# 1. Resource utilization
# ------------------------------------------------------------
report_utilization \
    -file [file join $report_dir utilization.rpt]

# ------------------------------------------------------------
# 2. Clock definitions, including the virtual clock
# ------------------------------------------------------------
report_clocks \
    -file [file join $report_dir clocks.rpt]

# ------------------------------------------------------------
# 3. Timing constraint checks
# ------------------------------------------------------------
check_timing -verbose \
    -file [file join $report_dir timing_checks.rpt]

# ------------------------------------------------------------
# 4. Overall maximum/minimum timing summary
# ------------------------------------------------------------
report_timing_summary \
    -delay_type min_max \
    -file [file join $report_dir timing_summary.rpt]

# ------------------------------------------------------------
# 5. Detailed timing for each input-to-output path
#    max: maximum-delay analysis
#    min: minimum-delay analysis
# ------------------------------------------------------------
foreach delay_type {max min} {
    foreach input_port {a b select} {

        set report_name \
            "timing_${input_port}_to_y_${delay_type}.rpt"

        report_timing \
            -delay_type $delay_type \
            -from [get_ports $input_port] \
            -to [get_ports y] \
            -max_paths 1 \
            -nworst 1 \
            -path_type full \
            -file [file join $report_dir $report_name]
    }
}

# ------------------------------------------------------------
# 6. Design rule checks
# ------------------------------------------------------------
report_drc \
    -file [file join $report_dir drc.rpt]

# ------------------------------------------------------------
# 7. Methodology checks
# ------------------------------------------------------------
report_methodology \
    -file [file join $report_dir methodology.rpt]

# ------------------------------------------------------------
# 8. Estimated power
# ------------------------------------------------------------
report_power \
    -file [file join $report_dir power.rpt]

puts "2:1 Mux Reports saved in: $report_dir"