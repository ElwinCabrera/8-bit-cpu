`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2019 04:11:46 PM
// Design Name: 
// Module Name: registers_2x8
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


module registers_2x8(

    output reg [7:0] reg1_data_out,
    output reg [7:0] reg2_data_out,
    
    
    input wire reg_write_en,
    input wire [1:0] reg_write_addr,
    input wire [7:0] reg_write_data,
    
    input  wire rd_reg_pos1,
    input  wire rd_reg_pos2,
    
    input wire clk
);

    reg [7:0] r0= 0;
    reg [7:0] r1=0;
    
    always @(*) begin
        case(rd_reg_pos1) // becuse you can have example: add ro, r1 or add r1, r0 
            1'b0: reg1_data_out = r0;
            1'b1: reg1_data_out = r1;
            default: reg1_data_out = 8'hFF;
        endcase    
    end
    
    always @(*) begin
        case(rd_reg_pos2) // becuse you can have example: 'add R0, R1' or 'add R1, R0' 
            1'b0: reg2_data_out = r0;
            1'b1: reg2_data_out = r1;
            default: reg2_data_out = 8'hFF;
        endcase    
    end 
    
    always @(posedge clk) begin
        if(reg_write_en) begin
            case(reg_write_addr)
                2'b00: r0 <= reg_write_data;
                2'b01: r1 <= reg_write_data;
            endcase
        end
    end 
    
endmodule
