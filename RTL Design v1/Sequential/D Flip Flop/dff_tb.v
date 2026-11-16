`timescale 1ns/1ps

module dff_tb;
    // 1. Creating registers for inputs and a wire for the output
   reg test_clk;
   reg test_rst;
   reg test_data;
   wire test_q;

   // 2. Instantiating the actual D Flip Flop module (connect pins)
   dff uut (
	.q(test_q),
	.clk(test_clk),
	.rst(test_rst),
	.data(test_data)
	);

   // 3. Generating a clock, test_clk changes every 5 ns, so time-period of clock = 10 ns
    always #5 test_clk = ~test_clk;

  // 4. Generating the input signals over time
   initial begin
        // Telling iverilog to dump waveform data for GTKWave
	$dumpfile("simulation.vcd");
	$dumpvars(0, dff_tb);

  // 5. Initial condition
        test_clk  = 0;
        test_rst  = 1;

        // Test Case 1: while D Flip Flop is in asynchronous reset, setting data = 0 and then data = 1
	test_data = 0; #10
	test_data = 1; #10

        // Test Case 2: Setting data = 1 before a rising clock edge
	test_rst = 0; #10;
        test_data = 1; #10;

        // Test Case 3: Changing data to 0 before the next rising edge
        test_data = 0; #10;

        // Test Case 4: Setting data = 1 again
        test_data = 1; #10;

        // Test Case 5: Resetting instantly while clock is running
        test_rst = 1; #10

        // Test Case 6: While reset is active, let's give data = 0
       	test_data = 0;
	
	$finish; // End simulation
end
endmodule