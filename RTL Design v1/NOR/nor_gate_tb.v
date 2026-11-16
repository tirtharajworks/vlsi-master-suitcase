`timescale 1ns/1ps

module nor_gate_tb;
    // 1. Creating registers for inputs and a wire for the output
   reg test_a;
   reg test_b;
   wire test_y;
   
   // 2. Instantiating the actual NOR gate module (connect pins)
   nor_gate uut (
	.y(test_y),
	.a(test_a),
	.b(test_b)
   );

  // 3. Generating the input signals over time
  initial begin
	// Telling iverilog to dump waveform data for GTKWave
	$dumpfile("simulation.vcd");
	$dumpvars(0, nor_gate_tb);

	// Test Case 1: Both 0;
	test_a = 0; test_b = 0; #5;

	// Test Case 2: 0 and 1;
	test_a = 0; test_b = 1; #10;

	// Test Case 3: 1 and 0;
	test_a = 1; test_b = 0; #15;

	// Test Case 4: 1 and 1;
	test_a = 1; test_b = 1; #1.5;

        $finish; // End simulation
    end
endmodule

