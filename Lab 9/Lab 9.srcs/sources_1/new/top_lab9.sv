`timescale 1ns / 1ps
//Lab 9, created by Kyle Monk 04-01-20

module top_lab9(
input btnU, btnD, clk, btnC, input [15:0] sw, 
output [15:0] led);

wire [7:0] r1out, aluout, r2out;

register #(.N(8)) r1(.clk(clk), .D(sw[7:0]), .en(btnD), .rst(btnC), .Q(r1out));
alu #(.N(8)) a1(.in0(sw[7:0]), .in1(r1out), .op(sw[11:8]), .out(aluout));
register #(.N(8)) r2(.clk(clk), .D(aluout), .en(btnU), .rst(btnC), .Q(r2out));
assign led = {r2out, r1out};

endmodule
