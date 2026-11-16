`timescale 1ns/1ps

module not_gate_tb;
// 1. Creating a register for the input and a wire for the output
	reg test_a;
	wire test_y;

// 2. Instantiating the actual NOT gate module (connect pins)
	not_gate uut(
	.y(test_y),
	.a(test_a)
	);

// 3. Generate the input signals over time
    initial begin
	// Telling iverilog to dump waveform data for GTKWave
        $dumpfile("simulation.vcd");
        $dumpvars(0, not_gate_tb);

	// Test case 1: a=0
	test_a = 0; #15;
	// Test case 2: a=1
	test_a = 1; #15;

	$finish; // End simulation
	end
endmodule
