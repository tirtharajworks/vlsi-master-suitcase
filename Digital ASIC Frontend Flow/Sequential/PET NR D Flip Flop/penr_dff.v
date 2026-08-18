module penr_dff(q,data,rst,clk);
output reg q;
input data,rst,clk;
always @(posedge clk or negedge rst)
begin
    if(rst==0)
	q<=1'b0;
    else
	q<=data;
end
endmodule

