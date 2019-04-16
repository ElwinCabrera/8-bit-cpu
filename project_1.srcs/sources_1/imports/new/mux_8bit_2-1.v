`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2019 12:35:13 AM
// Design Name: 
// Module Name: mux_8bit_2-1
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


module mux_8bit_2_1(
    output reg [7:0] out,
    input wire [7:0] in_0,
    input wire [7:0] in_1,
    input select
);


always @(*) begin 

    case(select) 
        1'b0: out = in_0;
        1'b1: out = in_1;
        default: out = in_0;
    endcase
end
    

endmodule
