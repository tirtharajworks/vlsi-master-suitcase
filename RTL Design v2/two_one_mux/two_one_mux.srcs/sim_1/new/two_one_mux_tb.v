`timescale 1ns / 1ps
module two_one_mux_tb;
reg test_a, test_b, test_select;
wire test_y;
integer i,errors=0;
reg actual_output;
two_one_mux dut(.a(test_a),.b(test_b),.select(test_select),.y(test_y));

initial begin
//   test_select=1;
//   test_a=1'b1;
//   test_b=1'b0;
//   #5;
//   test_select=1;
//   test_a=1'b0;
//   test_b=1'b1; 
//   #5;
//   test_select=0;
//   test_a=1'b0;
//   test_b=1'b1;
//    #10; satisfactory manual checks
errors=0;
for(i=0;i<8;i=i+1)begin
    {test_select,test_a,test_b}=i[2:0];#3;
    $display("test_select=%b test_a=%b test_b=%b", test_select,test_a,test_b);
//    if(test_select==0)begin
//        actual_output=test_a;
//        $display("actual_output=%b test_a=%b",actual_output,test_a);
//        if(test_y!==actual_output)begin
//            $display("FAIL test_y=%b actual_output=%b", test_y,actual_output);
//            errors=errors+1;
//         end
//     else if (test_select==1)
//        actual_output=test_b;
//        $display("actual_output=%b test_b=%b",actual_output,test_b);
//        if(test_y!==actual_output)begin
//            $display("FAIL test_y=%b actual_output=%b", test_y,actual_output);
//            errors=errors+1;
//         end
//     end
if (test_select == 1'b0) begin
    actual_output = test_a;

    $display("actual_output=%b test_a=%b",
             actual_output, test_a);
end
else begin
    actual_output = test_b;

    $display("actual_output=%b test_b=%b",
             actual_output, test_b);
end

if (test_y !== actual_output) begin
    $display("FAIL test_y=%b actual_output=%b",
             test_y, actual_output);

    errors = errors + 1;
end
end
if(errors==0)
        $display("PASS: All input test cases passed!");
     else
        $display("FAIL: %0d input test cases failed XX",errors);
   $finish; 
    
end
endmodule
