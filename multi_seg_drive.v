`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:11:02 PM
// Design Name: 
// Module Name: multi_seg_drive
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


module multi_seg_drive(
input clk,
input [15:0] bcd_in,
output [3:0] sseg_a_o,
output [6:0] sseg_c_o);

wire [6:0] sseg_o;
wire [3:0] bcd_seg;
wire [3:0] anode;

Seven_seg_decoder uut1(.clk(clk), .bcd(bcd_seg),.seg(sseg_c_o));

Anode_generator uut2 (.clk(clk),.out(anode));

Mux_4_1_16b uut3 (.i(bcd_in),.s(anode),.bcd(bcd_seg));

assign  sseg_a_o = ~anode;
//assign  sseg_c_o = sseg_c_o;
       
endmodule
