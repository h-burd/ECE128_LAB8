`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:37:41 PM
// Design Name: 
// Module Name: Anode_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Anode_generator(
input clk,
output [3:0] out
);

wire [1:0] cnt_q;// = 2'b00;

refresh_counter uut(clk, cnt_q);

decode_2_4 uut1(.cnt_q(cnt_q),.out(out));


endmodule
