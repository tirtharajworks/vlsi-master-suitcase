module d_ff_pe_enable(input wire data,clock,enable,output reg q);
always @ (posedge clock)
    if(enable)
        q<=data;
endmodule
