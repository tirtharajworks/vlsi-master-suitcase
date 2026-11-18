`timescale 1ns / 1ps
module xnor_gate_tb;
    reg test_a, test_b;
    wire test_y;
    integer errors=0;
    
    xnor_gate dut(.a(test_a), .b(test_b), .y(test_y));
    initial begin
        
        test_a=1'b0; test_b=1'b0; #10;
        if(test_y !== 1) begin
            $display("FAIL: test_a=%b test_b=%b test_y=%b Expected=1", test_a, test_b, test_y);
            errors=errors+1;
        end
        
        test_a=1'b0; test_b=1'b1; #10;
        if(test_y !== 0) begin
            $display("FAIL: test_a=%b test_b=%b test_y=%b Expected=0", test_a, test_b, test_y);
            errors=errors+1;
        end
        
        test_a=1'b1; test_b=1'b0; #10;
        if(test_y !== 0) begin
            $display("FAIL: test_a=%b test_b=%b test_y=%b Expected=0", test_a, test_b, test_y);
            errors=errors+1;
        end
        
        test_a=1'b1; test_b=1'b1; #10;
        if(test_y !== 1) begin
            $display("FAIL: test_a=%b test_b=%b test_y=%b Expected=1", test_a, test_b, test_y);
            errors=errors+1;
        end
        
        if(errors !== 0)
            $display("FAIL: %0d input test cases failed XX", errors);
        else
            $display("PASS: All input test cases passed!");
        
        $finish;
    end
endmodule
