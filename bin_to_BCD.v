`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2024 03:36:06 PM
// Design Name: 
// Module Name: bin_to_BCD
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


module bin_to_BCD(
    input           clk,
    input           en,
    input   [11:0]  bin_d_in,
    output  [15:0]  bcd_d_out,
    output          rdy
    );
    
    //State variables
    parameter IDLE      = 3'b000;
    parameter SETUP     = 3'b001;
    parameter ADD       = 3'b010;
    parameter SHIFT     = 3'b011;
    parameter DONE      = 3'b100;
    
    reg [27:0]  bin_bcd_data    = 0;
    reg [2:0]   current_state   = 0;
    reg         processing_flag = 0;
    reg [3:0]   shift_counter   = 0;
    reg [1:0]   add_counter     = 0;
    reg         output_ready    = 0;
    
    
    always @(posedge clk)
        begin
        if(en)
            begin
                if(~processing_flag)
                    begin
                    bin_bcd_data   <= {16'b0, bin_d_in};
                    current_state  <= SETUP;
                    end
            end
        
        case(current_state)
        
            IDLE:
                begin
                    output_ready  <= 0;
                    processing_flag <= 0;
                end
                
            SETUP:
                begin
                processing_flag <= 1;
                current_state   <= ADD;
                end
                     
            ADD:
                begin
                
                case(add_counter)
                    0:
                        begin
                        if(bin_bcd_data[15:12] > 4)
                            begin
                                bin_bcd_data[27:12] <= bin_bcd_data[27:12] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                    
                    1:
                        begin
                        if(bin_bcd_data[19:16] > 4)
                            begin
                                bin_bcd_data[27:16] <= bin_bcd_data[27:16] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                        
                    2:
                        begin
                        if((bin_bcd_data[23:20] > 4))
                            begin
                                bin_bcd_data[27:20] <= bin_bcd_data[27:20] + 3;
                            end
                            add_counter <= add_counter + 1;
                        end
                        
                    3:
                        begin
                        if((bin_bcd_data[27:24] > 4))
                            begin
                                bin_bcd_data[27:24] <= bin_bcd_data[27:24] + 3;
                            end
                            add_counter <= 0;
                            current_state <= SHIFT;
                        end
                    endcase
                end
                
            SHIFT:
                begin
                shift_counter   <= shift_counter + 1;
                bin_bcd_data    <= bin_bcd_data << 1;
                
                if(shift_counter == 11)
                    begin
                    shift_counter   <= 0;
                    current_state   <= DONE;
                    end
                else
                    begin
                    current_state   <= ADD;
                    end

                end
 
            
            DONE:
                begin
                output_ready    <= 1;
                current_state   <= IDLE;
                end
            default:
                begin
                current_state <= IDLE;
                end
            
            endcase
            
        end
    assign bcd_d_out    = bin_bcd_data[27:12];
    assign rdy          = output_ready;

endmodule

