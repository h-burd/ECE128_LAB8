`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 02:07:09 PM
// Design Name: 
// Module Name: upcounter_tb
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


module upcounter_tb();
    
    reg rst, clk, en;
    wire [11:0] count;
    
    initial begin
        rst=0;
        clk = 0;
        en = 1;
        forever #1 clk = ~clk;
    end

        
    upcounter uut(.clk(clk), .rst(rst), .count(count),.en(en));
    
endmodule
