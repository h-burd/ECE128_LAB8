`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:49:20 PM
// Design Name: 
// Module Name: decode_2_4
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


module decode_2_4(
input [1:0] cnt_q,
output reg [3:0] out
);

    always @(*)    
    begin        
        case (cnt_q)
            2'b00: out = 4'b1000;
            2'b01: out = 4'b0100;
            2'b10: out = 4'b0010;
            2'b11: out = 4'b0001;
            default: out = 4'b0000;
       endcase             
    end       


endmodule
