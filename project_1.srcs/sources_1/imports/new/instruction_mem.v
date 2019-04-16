`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2019 02:10:45 AM
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(
    output reg [7:0] instruction,
    input wire [7:0] rd_addr,
    input clk
);

reg [7:0] ram[0:127];

integer i;
initial begin 
    $readmemb("bin_rom.mem", ram);
//    ram[0] = 8'b01101100;
//    ram[1] = 8'b01001100;
//    ram[2] = 8'b10001100;
//    ram[3] = 8'b00001100;
//    ram[4] = 8'b00101100;
//    ram[5] = 8'b10100000;
    
    $display("\nInstruction Memory...");
    $display("read addr: %b",rd_addr);
    for(i=0; i<10; i = i+1) begin
        $display("Instruction %d: %b",i, ram[i]);
    end
end

always @(posedge clk) begin
    instruction <= ram[rd_addr];
end



endmodule
