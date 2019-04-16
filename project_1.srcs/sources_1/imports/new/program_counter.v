`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2019 02:12:22 AM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    output reg [7:0] addr_out,
    //input wire [7:0] addr_in,
    input clk,
    input reset
);

reg [7:0] addr = 8'b00000000;


always @(posedge clk, posedge reset) begin 
    
    if(clk) begin
        addr_out = addr;
        addr = addr +1;
        if(reset) begin 
            addr_out = 8'b00000000;
        end
    
        $display("\nProgram counter...");
    
        $display("PCout %b", addr_out);
        $display("addr_next %b", addr);
        #20;
    end
    
    if(reset) begin
        addr <= 8'b00000000;
        addr_out <= 8'b00000000;
    end
    
    
end
endmodule
