`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:22:33 PM
// Design Name: 
// Module Name: Seven_seg_decoder
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


module Seven_seg_decoder(clk, bcd,seg); 
    input clk; 
    input [3:0] bcd; 
    output reg[6:0] seg;// 
//    wire [3:0] an;// maybe has to be an output
    
//    assign an = 4'b1110;     //always block for converting bcd digit into 7 segment format    
    
    always @(posedge clk)    
    begin        
    case (bcd)
        0: seg = 7'b1000000;
        1: seg = 7'b1111001;
        2: seg = 7'b0100100;
        3: seg = 7'b0110000;
        4: seg = 7'b0011001;
        5: seg = 7'b0010010;
        6: seg = 7'b0000010;
        7: seg = 7'b1111000;
        8: seg = 7'b0000000;
        9: seg = 7'b0010000;
        default: seg = 7'b1111111;
       endcase             
    end                
endmodule
