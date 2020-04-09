`timescale 1ns / 1ps


module bcd11(
input [10:0] in,
output [15:0] out
    );
wire [3:0] w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
add3 c1(.in({0,in[10:8]}), .out(w1));
add3 c2(.in({w1[2:0],in[7]}), .out(w2));
add3 c3(.in({w2[2:0],in[6]}), .out(w3));
add3 c4(.in({w3[2:0],in[5]}), .out(w4));
add3 c5(.in({w4[2:0],in[4]}), .out(w5));
add3 c6(.in({w5[2:0],in[3]}), .out(w6));
add3 c7(.in({w6[2:0],in[2]}), .out(w7));
add3 c8(.in({w7[2:0],in[1]}), .out(w8));
add3 c9(.in({0,w1[3],w2[3],w3[3]}), .out(w9));
add3 c10(.in({w9[2:0],w4[3]}), .out(w10));
add3 c11(.in({w10[2:0],w5[3]}), .out(w11));
add3 c12(.in({w11[2:0],w6[3]}), .out(w12));
add3 c13(.in({w12[2:0],w7[3]}), .out(w13));
add3 c14(.in({0,w9[3],w10[3],w11[3]}), .out(w14));
add3 c15(.in({w14[2:0],w12[3]}), .out(w15));

assign out = {0,0,w14[3],w15[3],w15[2:0],w13[3],w13[2:0],w8[3],w8[2:0],in[0]};

endmodule
