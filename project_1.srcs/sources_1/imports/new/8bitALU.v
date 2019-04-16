`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 09:25:19 PM
// Design Name: 
// Module Name: 8bitALU
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


module ALU( 
    output reg [8:0] alu_result, 
    input wire [2:0] opcode,
    input wire [7:0] a,
    input wire [7:0] b,
    input wire clk
    
);

always @(posedge clk) begin

    case(opcode)
        3'b000: alu_result <= a + b;
        3'b001: alu_result <= a + b;
        3'b010: alu_result <= a + b;
        3'b011: alu_result <= a + b;  //addi, immidiate value is 1 for now
        3'b100: alu_result <= a - b;
        default: alu_result <= 0;
        
    endcase
    
    $display("\nALU...");
    $display("a: %b", a);
    $display("b: %b", b);
    $display("out: %b", alu_result);

end



endmodule // ALU
