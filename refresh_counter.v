`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2024 01:20:54 PM
// Design Name: 
// Module Name: refresh_counter
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

module refresh_counter(
    input clk,
    output reg [1:0] cnt_q
);

reg[1:0] cnt_d = 2'b00;
reg[9:0] count = 10'd0;

always @(posedge clk)
    begin
    if(count == 10'd2048) begin  // Changed from 10'd1024 to 10'd2048
        count <= 10'd1;
        if(cnt_d == 2'b11) begin
            cnt_d <= 2'b0;
            cnt_q <= cnt_d;
        end
        else begin
            cnt_d <= cnt_d + 1'b1;
            cnt_q <= cnt_d;
        end
    end
    else begin
        count <= count + 10'd1;
    end
end

endmodule

