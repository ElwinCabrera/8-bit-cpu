`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2019 01:05:24 PM
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(
    output reg [7:0] extend_8bit,
    input wire [2:0] immediate_3bit,
    input wire clk
);

always @(posedge clk) begin 
    extend_8bit <= immediate_3bit;
    if(immediate_3bit == 3'bxxx) extend_8bit <= 8'h00;
end

endmodule
