`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2019 12:42:44 AM
// Design Name: 
// Module Name: mux_1bit_2_1
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


module mux_1bit_2_1(
    output reg out,
    input wire in_0,
    input wire in_1,
    input select
);

initial begin 
    out = in_0;
end

always @(*) begin 
    out = select ? in_1 : in_0;
end


endmodule