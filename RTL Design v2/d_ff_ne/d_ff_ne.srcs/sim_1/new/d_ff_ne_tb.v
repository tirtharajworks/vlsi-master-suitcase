`timescale 1ns / 1ps
module d_ff_ne_tb;

reg test_data, test_clock;
wire test_q;

d_ff_ne dut(.data(test_data),.clock(test_clock),.q(test_q));

//initial begin
//    test_clock=0;
//    always #5 test_clock=~test_clock;
//end -> always not allowed inside initial
always #5 test_clock=~test_clock;

initial begin
    test_clock=0;
    test_data = 0;
    #5 test_data = 1;
    #7 test_data = 0;
    #7 test_data = 1;
    #4 test_data = 0;
    #8 test_data = 1;
    #10;
    $finish;
end
endmodule

