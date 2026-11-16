module d_ff_pe_syncreset(input wire data,clock,reset,output reg q);
always @ (posedge clock) begin
    if(reset)
        q<=1'b0;
    else
        q<=data;
end
endmodule