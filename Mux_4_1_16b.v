`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 02:05:29 PM
// Design Name: 
// Module Name: Mux_4_1_16b
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


module Mux_4_1_16b(
input [15:0] i,
input [3:0] s,
output reg [3:0] bcd
);

    always@(*)
    begin
        case(s)
            4'b1000 : bcd = i[15:12];
            4'b0100 : bcd = i[11:8];
            4'b0010 : bcd = i[7:4];
            4'b0001 : bcd = i[3:0];
            default: bcd = 4'b0000;
        endcase

    end
    
endmodule
