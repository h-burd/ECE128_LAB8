`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2024 02:26:48 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb;

    // Testbench signals
    reg clk;                         // Clock signal
    wire [3:0] sseg_a_o;             // Output for segment selection
    wire [6:0] sseg_c_o;             // Output for segment data

    // Instantiate the top module
    top uut (
        .clk(clk),
        .sseg_a_o(sseg_a_o),
        .sseg_c_o(sseg_c_o)
    );

    // Generate the clock signal
    initial begin
        clk = 0;
        forever #1 clk = ~clk;       // 100 MHz clock (period = 10 ns)
    end

endmodule

