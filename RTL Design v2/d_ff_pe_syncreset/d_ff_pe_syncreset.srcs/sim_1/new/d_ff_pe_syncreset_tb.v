`timescale 1ns / 1ps
module d_ff_pe_syncreset_tb;

reg test_data,test_clock,test_reset;
wire test_q;

d_ff_pe_syncreset dut(.data(test_data),.clock(test_clock),.reset(test_reset),.q(test_q));

always #5 test_clock=~test_clock;

initial begin
    test_clock=0;
    test_reset=0;
    #5 test_data=1;
    #3 test_data=0;
    #6 test_data=1;
    #3 test_reset=1;
    #8 test_data=1; //25ns
    #8 test_reset=0;
    
    #17 $finish;
    
end
endmodule
