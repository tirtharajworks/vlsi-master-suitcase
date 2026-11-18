`timescale 1ns / 1ps

module half_subtractor_tb;
    reg test_a,test_b;
    wire test_difference, test_borrow;
    integer i,errors=0;
    reg [1:0]actual_output;

half_subtractor dut(.a(test_a), .b(test_b), .difference(test_difference), .borrow(test_borrow));

initial begin
    for(i=0;i<4;i=i+1)begin
        {test_a,test_b}=i[1:0]; #10;
        actual_output=test_a-test_b;
//        $display("i=%0d test_a=%b test_b=%b test_borrow=%b test_difference=%b actual_output=%b",i, test_a,test_b,test_borrow, test_difference, actual_output);
        if({test_borrow,test_difference}!==actual_output)begin
            $display("FAIL: test_a=%b test_b=%b test_borrow=%b test_difference=%b Expected=%b", test_a, test_b, test_borrow, test_difference, actual_output);
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
