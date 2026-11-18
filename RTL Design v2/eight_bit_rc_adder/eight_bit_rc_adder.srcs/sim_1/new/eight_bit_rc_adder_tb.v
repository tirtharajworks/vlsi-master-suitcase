`timescale 1ns / 1ps

module eight_bit_rc_adder_tb;
reg [7:0]test_a,test_b;
reg test_cin;
wire [7:0]test_sum;
wire test_cout;

reg [8:0] actual_output;
integer i,j,p,errors=0;

//for(k) 
//                for(l) 
//                    for(m)  
//                         for(n)  
//                            for(o) 

eight_bit_rc_adder dut(.a(test_a),.b(test_b),.cin(test_cin),.sum(test_sum),.cout(test_cout));
initial begin
    for(i=0;i<256;i=i+1)begin 
        for(j=0;j<256;j=j+1)begin
             for(p=0;p<2;p=p+1)begin
                test_a=i[7:0];
                test_b=j[7:0];
                test_cin=p;
                #10;
                actual_output=test_a+test_b+test_cin;  ////FAILL
                $display("test_a=%b test_b=%b test_cin=%b test_cout=%b test_sum=%b actual=%b", test_a,test_b,test_cin,test_cout,test_sum,actual_output);
                if({test_cout,test_sum}!==actual_output)begin
                    $display("FAIL: test_a=%b test_b=%b test_cin=%b test_cout=%b test_sum=%b Expected=%b", test_a,test_b,test_cin,test_cout,test_sum,actual_output);
                    errors=errors+1;
                end
//                if(test_cout!==actual_output[8])begin
//                    $display("FAIL: test_a=%b test_b=%b test_cin=%b test_cout=%b Expected MSB=%b Expected sum=%b", test_a, test_b, test_cin, test_cout,actual_output[8],actual_output);
//                    errors=errors+1;
//                end
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
