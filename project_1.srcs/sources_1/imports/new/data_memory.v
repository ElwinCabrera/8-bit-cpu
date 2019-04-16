`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2019 12:40:24 AM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    input wire [7:0] ram_addr,
    input wire [7:0] write_data,
    input wire mem_wr,
    input wire mem_rd,
    input wire clk,
    output reg [7:0] out_data
    );
    
reg [7:0] ram[0:127];
   
integer i;
initial begin 
    out_data <= 0;
    for(i =0; i<128; i = i + 1 ) begin
        ram[i] = 8'b00000000;
    end
end

always @(posedge clk) begin 
   
    if(mem_wr) begin 
        ram[ram_addr] <= write_data;
    end
    
    if(mem_rd) begin 
        out_data <= ram[ram_addr];
    end
    
end
endmodule
