`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2024 01:54:23 PM
// Design Name: 
// Module Name: upcounter
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
module upcounter(
    input clk, 
    input rst, 
    input en, 
    output reg [11:0] count
);

    reg [16:0] cycle_count;  

    initial begin
        count = 12'd0;
        cycle_count = 17'd0;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 12'd0;
            cycle_count <= 17'd0;
        end else if (en) begin
            if (cycle_count == 17'd131071) begin
                count <= count + 1; 
                cycle_count <= 17'd0;
            end else begin
                cycle_count <= cycle_count + 1; 
            end
        end
    end

endmodule


