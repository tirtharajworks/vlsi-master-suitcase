module two_bit_mult(input wire [1:0] a,b, output wire [3:0]p);

//defining internal wires and their respective operations
wire a0b0, a1b0, a0b1, a1b1, c1;
assign a0b0 = a[0] & b[0];
assign a1b0 = a[1] & b[0];
assign a0b1 = a[0] & b[1];
assign a1b1 = a[1] & b[1];

assign p[0] = a0b0;

assign p[1] = a1b0 ^ a0b1;
assign c1 = a1b0 & a0b1;

assign p[2] = a1b1 ^ c1;

assign p[3] = a1b1 & c1;

endmodule
