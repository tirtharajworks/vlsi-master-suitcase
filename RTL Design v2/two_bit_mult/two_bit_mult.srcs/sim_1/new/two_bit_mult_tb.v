`timescale 1ns / 1ps

module two_bit_mult_tb;
    reg [1:0] test_a, test_b;
    wire [3:0] test_p;
    
    reg [3:0] actual_output;
    
    integer i,j,errors=0;

two_bit_mult dut(.a(test_a), .b(test_b), .p(test_p));

initial begin
    for(i=0; i<4; i=i+1)begin
        for(j=0; j<4; j=j+1)begin
            test_a = i[1:0];
            test_b = j[1:0];
            #10;
            actual_output = test_a * test_b;
            $display("%b %b %b %b", test_a, test_b, test_p, actual_output);
            if(test_p !== actual_output)begin
                $display("FAIL: test_a=%b test_b=%b test_p=%b Expected=%b",test_a, test_b, test_p, actual_output);
                errors=errors+1;
            end
        end
     end
        if(errors == 0)
            $display("PASS: All input test cases passed!");
        else
           $display("FAIL: %0d input test cases failed XX", errors); 
    $finish;
 end
endmodule
