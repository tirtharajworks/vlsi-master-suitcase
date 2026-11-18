`timescale 1ns / 1ps
module d_ff_pe_enable_tb;

reg test_data, test_clock, test_enable;
wire test_q;

d_ff_pe_enable dut(.data(test_data), .clock(test_clock), .enable(test_enable), .q(test_q));

always #5 test_clock=~test_clock;

initial begin
    test_clock=0;
    
    #3 test_data=1;
    #3 test_enable=1;
    #1 test_data=0;
    #3 test_data=1;
    #2 test_data=0;
    #2 test_data=1;
    #2 test_enable=0;
    #1 test_data=0;
    #2 test_data=1;
    #6;
    
    $finish;
end
endmodule
