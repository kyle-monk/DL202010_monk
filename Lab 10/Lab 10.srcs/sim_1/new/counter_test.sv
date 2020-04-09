`timescale 1ns / 1ps


module counter_test();
reg clk, rst, en;
wire [3:0] count; 
wire tick;

counter #(.N(4)) c(.clk(clk), .rst(rst), .en(en), .count(count), .tick(tick));
always begin
clk = ~clk; #5;
end

initial begin
clk = 0; rst = 0; en = 0; #7;
rst = 1; #3;
en = 1; rst = 0; #10;
en = 0; #10;
en = 1; #2;
$finish;
end
endmodule
