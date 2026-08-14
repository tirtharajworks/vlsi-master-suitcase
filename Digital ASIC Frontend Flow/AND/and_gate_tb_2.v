`timescale 1ns/1ps

module and_gate_tb;
    // 1. Creating registers for inputs and a wire for the output
    reg test_a;
    reg test_b;
    wire test_y;

    // 2. Instantiating the actual AND gate module (connect pins)
    and_gate uut (
	.y(test_y),
	.a(test_a),
	.b(test_b)
    );

   // 3. Generating the input signals over time
   initial begin
	// Telling iverilog to dump waveform data for GTKWave
	$dumpfile("simulation.vcd");
	$dumpvars(0, and_gate_tb);

	// Test case 1- a=0,b=0
	test_a=0; test_b=0; #20;
	// Test case 2- a=0,b=1
	test_a=0; test_b=1; #30;
	// Test case 3- a=1,b=0
	test_a=1; test_b=0; #40;
	// Test case 4- a=1,b=1
	test_a=1; test_b=1; #50;

	$finish; // End simulation
end
endmodule