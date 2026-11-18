# Open the existing synthesis result.
open_run synth_1

# Create the report directory.
set project_dir [get_property DIRECTORY [current_project]]
set report_dir [file join $project_dir reports]
file mkdir $report_dir

# Resource utilization.
report_utilization \
    -file [file join $report_dir utilization.rpt]

# Build all connected input/output pairs.
set path_pairs {}

# a[i] and b[i] connect to sum[i] through sum[7], and cout.
for {set i 0} {$i < 8} {incr i} {
    foreach bus {a b} {
        set input_port [format {%s[%d]} $bus $i]

        for {set j $i} {$j < 8} {incr j} {
            lappend path_pairs \
                [list $input_port [format {sum[%d]} $j]]
        }

        lappend path_pairs [list $input_port cout]
    }
}

# cin connects to every sum bit and cout.
for {set j 0} {$j < 8} {incr j} {
    lappend path_pairs [list cin [format {sum[%d]} $j]]
}
lappend path_pairs [list cin cout]

# Clear the combined timing report once.
set timing_file [file join $report_dir timing_all_paths.rpt]
set fh [open $timing_file w]
close $fh

# Append one worst max-delay result per pair.
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

puts "8-bit RCA reports saved in: $report_dir"