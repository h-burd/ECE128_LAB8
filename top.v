`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 03:41:40 PM
// Design Name: 
// Module Name: top
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


module top(clk,sseg_a_o,sseg_c_o);

    input clk;
    wire [11:0] bin;
    wire [15:0] bcd_in;
    output [3:0] sseg_a_o;
    output [6:0] sseg_c_o;
    wire rdy;
    reg [15:0] bcd_reg;
    upcounter uut0 (.clk(clk), .rst(0), .count(bin),.en(rdy));
    
    bin_to_BCD uut1(.clk(clk), .en(1),.bin_d_in(bin), .bcd_d_out(bcd_in),.rdy(rdy));
    
    
    multi_seg_drive uut2 (.clk(clk),.bcd_in(bcd_reg),.sseg_a_o(sseg_a_o),.sseg_c_o(sseg_c_o));
    
    always @(posedge clk)
    begin
    if(rdy)
    bcd_reg  <= bcd_in;
    else 
    bcd_reg <= bcd_reg;
    end


endmodule
