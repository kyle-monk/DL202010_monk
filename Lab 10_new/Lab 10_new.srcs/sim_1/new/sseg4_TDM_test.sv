`timescale 1ns / 1ps


module sseg4_TDM_test();
reg [15:0] data;
reg hex_dec, sign, reset, clock;
wire [6:0] seg;
wire dp;
wire [3:0] an;

sseg4_TDM s(.data(data), .hex_dec(hex_dec), .sign(sign), .reset(reset), .clock(clock), .seg(seg), .dp(dp), .an(an));
always begin
clock = ~ clock; #5;
end

initial begin
clock = 0; reset = 0; hex_dec = 0; sign = 0; #1280;
reset = 1; #80;
data = 1; #80;
hex_dec = 0; sign = 1; reset = 0; #10240;
sign = 0; #10240;
sign = 1; #40;
$finish;
end
endmodule
