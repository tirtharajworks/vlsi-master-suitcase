module half_subtractor(input wire a,b,output wire difference,borrow);
assign difference=a^b;
assign borrow=(~a)&b;
endmodule
