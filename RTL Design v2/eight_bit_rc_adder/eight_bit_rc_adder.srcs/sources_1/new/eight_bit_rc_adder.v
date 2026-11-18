`timescale 1ns / 1ps

module eight_bit_rc_adder(
input wire [7:0]a,b, 
input wire cin,
output wire [7:0] sum,
output wire cout);

wire c0,c1,c2,c3,c4,c5,c6;

assign sum[0] = a[0]^b[0]^cin;
assign c0 = (a[0] & b[0])|(cin & (a[0]^b[0]));

assign sum[1] = a[1]^b[1]^c0;
assign c1 = (a[1] & b[1])|(c0 & (a[1]^b[1]));

assign sum[2] = a[2]^b[2]^c1;
assign c2 = (a[2] & b[2])|(c1 & (a[2]^b[2]));

assign sum[3] = a[3]^b[3]^c2;
assign c3 = (a[3] & b[3])|(c2 & (a[3]^b[3]));

assign sum[4] = a[4]^b[4]^c3;
assign c4 = (a[4] & b[4])|(c3 & (a[4]^b[4]));

assign sum[5] = a[5]^b[5]^c4;
assign c5 = (a[5] & b[5])|(c4 & (a[5]^b[5]));

assign sum[6] = a[6]^b[6]^c5;
assign c6 = (a[6] & b[6])|(c5 & (a[6]^b[6]));

assign sum[7] = a[7]^b[7]^c6;
assign cout = (a[7] & b[7])|(c6 & (a[7]^b[7]));

endmodule
