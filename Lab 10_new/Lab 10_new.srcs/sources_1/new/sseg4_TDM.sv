`timescale 1ns / 1ps


module sseg4_TDM(input [15:0] data, input hex_dec, sign, reset, clock,
output [6:0] seg, output dp, output [3:0] an);

wire [15:0] bcdout, mux2out;
wire [3:0]  mux4out;
wire [6:0] ssegout, seg;
wire andout;
wire dig3on;
wire [1:0] digit_sel;
wire ticktoclk;

bcd11 mod(.in(data[10:0]), .out(bcdout));

mux2 #(.N(16)) mod2(.in0(bcdout), .in1(data), .sel(hex_dec), .out(mux2out));

mux4 #(.N(4)) mod3(.in0(mux2out[3:0]), .in1(mux2out[7:4]), .in2(mux2out[11:8]), .in3(mux2out[15:12]), .sel(digit_sel), .out(mux4out));

sseg_decoder mod4(.num(mux4out), .sseg(ssegout));

an_decoder mod5(.in(digit_sel), .out(an));

assign dig3on = ~an[3];

and mod6(andout, sign, dig3on);

mux2 #(.N(7)) mod7(.in0(ssegout), .in1(7'b0111111), .out(seg), .sel(andout));

assign dp = 1;

counter #(.N(18)) timer(.clk(clock), .rst(reset), .en(1), .tick(ticktoclk));

counter #(.N(2)) counter2(.clk(ticktoclk), .rst(reset), .en(1), .count(digit_sel));

endmodule
