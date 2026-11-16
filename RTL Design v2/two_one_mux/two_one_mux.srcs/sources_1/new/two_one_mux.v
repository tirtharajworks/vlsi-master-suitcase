module two_one_mux(input wire a,b,select,output wire y);
assign y=select?b:a;
endmodule
