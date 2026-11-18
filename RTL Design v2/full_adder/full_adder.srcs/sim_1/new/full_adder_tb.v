`timescale 1ns / 1ps
module full_adder_tb;
    reg test_a, test_b, test_cin;
    wire test_sum, test_cout;
    integer i,j,k,errors=0;
    reg [1:0] actual_output;
    
full_adder dut(.a(test_a),.b(test_b),.cin(test_cin),.sum(test_sum),.cout(test_cout));

initial begin
    for(i=0;i<2;i=i+1)begin
        for(j=0;j<2;j=j+1)begin
            for(k=0;k<2;k=k+1)begin
                test_a=i[1:0];
                test_b=j[1:0];
                test_cin=k[1:0];
                #10;
                actual_output = test_a + test_b + test_cin;
                $display("%b %b %b %b %b %b", test_a, test_b, test_cin, test_cout, test_sum, actual_output);
                if({test_cout,test_sum}!==actual_output)begin
                    $display("FAIL: For a=%b b=%b cin=%b Expected=%b",test_a,test_b,test_cin,actual_output);
                    $display("Error caught");
                    errors=errors+1;
                end
            end  
        end
    end
    $display("Total errors=%0d",errors);
    if(errors==0)
        $display("PASS: All input test cases passed!");
    else
        $display("FAIL: %0d input test cases failed XX", errors);
    $finish;
end
endmodule
