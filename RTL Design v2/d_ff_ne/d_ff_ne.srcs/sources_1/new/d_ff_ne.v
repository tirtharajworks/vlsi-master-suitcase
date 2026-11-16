module d_ff_ne(input wire data,clock,output reg q);
always @(negedge clock)
    q<=data;
endmodule
