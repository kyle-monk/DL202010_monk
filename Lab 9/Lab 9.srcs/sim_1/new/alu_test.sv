`timescale 1ns / 1ps
//Lab 9, created by Kyle Monk, 04-01-20

module alu_test();

reg [7:0] in0, in1;
reg [3:0] op;
wire [7:0] out;

alu #(.N(8)) a(.in0(in0), .in1(in1), .op(op), .out(out));
initial begin
op = 0; in0 = 8'h14; in1 = 8'h7A; #10;
op = 1; in0 = 8'h14; in1 = 8'h7A; #10;
op = 2; in0 = 8'h14; in1 = 8'h7A; #10;
op = 3; in0 = 8'h14; in1 = 8'h7A; #10;
op = 4; in0 = 8'h14; in1 = 8'h7A; #10;
op = 5; in0 = 8'h14; in1 = 8'h7A; #10;
$finish;
end
endmodule
