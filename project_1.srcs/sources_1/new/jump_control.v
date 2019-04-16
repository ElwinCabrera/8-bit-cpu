`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2019 07:07:45 PM
// Design Name: 
// Module Name: jump_control
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


module jump_control(
    output reg [7:0] jump_pc_out,
    input [7:0] curr_pc,
    input [4:0] jump_offset,
    input clk
    );
 reg dummy =1;
always @(posedge clk) begin 
    case(dummy)
    1: jump_pc_out <= curr_pc + jump_offset;
    endcase
end
endmodule
