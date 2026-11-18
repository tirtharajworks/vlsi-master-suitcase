module d_ff_pe(input wire data,clock,output reg q);
always @(posedge clock)
    q<=data;
endmodule
