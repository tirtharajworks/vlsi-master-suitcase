`timescale 1ns / 1ps

module half_adder_tb;
    reg test_a, test_b;
    wire test_sum, test_carry;
    integer i,errors=0;
    reg [1:0]actual_output;
    
    half_adder dut(.a(test_a), .b(test_b), .sum(test_sum), .carry(test_carry));
    
    initial begin
        
//        test_a=1'b0; test_b=1'b0;#10;
//        $display("%b %b %b", test_a, test_b, {test_a, test_b, test_carry, test_sum});
//        if({test_carry, test_sum}!==2'b00)begin
//            $display("FAIL: test_a=%b test_b=%b test_carry=%b test_sum=%b Expected=00", test_a, test_b, test_carry, test_sum);
//            errors=errors+1;
//        end
        
//        test_a=1'b0; test_b=1'b1;#10;
//        $display("%b %b %b", test_a, test_b, {test_carry, test_sum});
//        if({test_carry, test_sum}!==2'b01)begin
//            $display("FAIL: test_a=%b test_b=%b test_carry=%b test_sum=%b Expected=01", test_a, test_b, test_carry, test_sum);
//            errors=errors+1;
//        end
        
//        test_a=1'b1; test_b=1'b0;#10;
//        $display("%b %b %b", test_a, test_b, {test_carry, test_sum});
//        if({test_carry, test_sum}!==2'b01)begin
//            $display("FAIL: test_a=%b test_b=%b test_carry=%b test_sum=%b Expected=01", test_a, test_b, test_carry, test_sum);
//            errors=errors+1;
//        end
        
//        test_a=1'b1; test_b=1'b1;#10;
//        $display("%b %b %b", test_a, test_b, {test_carry, test_sum});
//        if({test_carry, test_sum}!==2'b10)begin
//            $display("FAIL: test_a=%b test_b=%b test_carry=%b test_sum=%b Expected=10", test_a, test_b, test_carry, test_sum);
//            errors=errors+1;
//        end

//v2.0 efficient code
        for(i=0; i<4; i=i+1)begin
            {test_a,test_b}=i[1:0];#10; //{test_a,test_b} generates a 2-bit vector such as 00,01,10,11
            actual_output=test_a+test_b; //arithmatic operation used
            $display("%0d %b %b %b %b",i, test_a, test_b, {test_carry, test_sum}, actual_output);
            if({test_carry,test_sum}!==actual_output)begin
                $display("FAIL: test_a=%b test_b=%b test_carry=%b test_sum=%b Expected=%b", test_a, test_b, test_carry, test_sum, actual_output);
                errors=errors+1;
            end
        end
            
        if(errors==0)
            $display("PASS: All input test cases passed!");
        else
            $display("FAIL: %0d input test cases failed XX",errors);
            
        $finish;
     end
        
endmodule
