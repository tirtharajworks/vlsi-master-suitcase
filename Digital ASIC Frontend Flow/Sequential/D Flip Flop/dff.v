module dff(q,data,clk,rst);
output reg q;
input data,clk,rst;
always @(posedge clk or posedge rst)
begin
    if(rst)
	q<=1'b0;
    else
	q<=data;
end
endmodule