`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2019 08:29:39 PM
// Design Name: 
// Module Name: parsed_instr
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


module parsed_instr(
    output reg [2:0] opcode,
    output reg rs,
    output reg rd_rt,
    output reg [2:0] immediate,
    output reg [4:0] jump_addr_offset,
    
    input [7:0] instruction,
    input clk
    );
    
    
always @(posedge clk) begin
  opcode <= instruction[7:5];
  rs <=  instruction[4];
  rd_rt <= instruction[3];
  immediate <= instruction[2:0];
  jump_addr_offset <= instruction[4:0];
end
endmodule
