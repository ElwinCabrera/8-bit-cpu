`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2019 01:27:39 PM
// Design Name: 
// Module Name: control_unit
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


module control_unit(
    output reg jmp, // if the instruction is jump
    output reg reg_write, // used to specify if we want to write to a register
    output reg alu_src_mux, // used to choose the immediate value or register value to put in alu
    output reg mem_read, // used by data memory
    output reg mem_write, // used by data memory
    output reg mem_to_reg_mux, // used to select output from alu or data memory
    //output reg reg_dst_mux,    //unused
    output reg [2:0] alu_opcode,
    
    input wire [2:0] in_opcode,
    input wire clk,
    input reset
);

always @(posedge clk, posedge reset) begin
    if(clk) begin 
        case(in_opcode) 
            3'b000:    // lw: ex lw R0, R1, #0 , i-type: 7-5 = opcode, 4 = Rd, 3 = Rs, 2-0 = immediate 
            begin
                jmp <= 1'b0;             // if the instruction is jump
                reg_write <= 1'b1;       // used to specify if we want to write to a register
                alu_src_mux <= 1'b1;     // used to choose the immediate value or register value to put in alu
                mem_read <= 1'b1;        // used by data memory
                mem_write <= 1'b0;       // used by data memory
                mem_to_reg_mux <= 1'b1;  // used to select output from alu or data memory
                //reg_dst_mux <= 1'b0;     //unused
                alu_opcode <= 3'b000;
            
            end
        
            3'b001:  //sw: ex sw R0, R1, #0 , i-type: 7-5 = opcode, 4 = Rd, 3 = Rs, 2-0 = immediate
            begin
                jmp <= 1'b0;             // if the instruction is jump
                reg_write <= 1'b0;       // used to specify if we want to write to a register
                alu_src_mux <= 1'b1;     // used to choose the immediate value or register value to put in alu
                mem_read <= 1'b0;        // used by data memory
                mem_write <= 1'b1;       // used by data memory
                mem_to_reg_mux <= 1'b0;  // used to select output from alu or data memory
                //reg_dst_mux <= 1'b0;     //unused
                alu_opcode <= 3'b001;
            end
        
            3'b010:  //add: ex add R0, R1 , R-type: 7-5 = opcode, 4 = Rt/Rd, 3 = Rs, 2-0 = unused
            begin
                jmp <= 1'b0;             // if the instruction is jump
                reg_write <= 1'b1;       // used to specify if we want to write to a register
                alu_src_mux <= 1'b0;     // used to choose the immediate value or register value to put in alu
                mem_read <= 1'b0;        // used by data memory
                mem_write <= 1'b0;       // used by data memory
                mem_to_reg_mux <= 1'b0;  // used to select output from alu or data memory
                //reg_dst_mux <= 1'b0;     //unused
                alu_opcode <= 3'b010;
            end
        
            3'b011: // addi: ex addi R0, R1, #0 , i-type: 7-5 = opcode, 4 = Rd, 3 = Rs, 2-0 = immediate
            begin
                jmp <= 1'b0;             // if the instruction is jump
                reg_write <= 1'b1;       // used to specify if we want to write to a register
                alu_src_mux <= 1'b1;     // used to choose the immediate value or register value to put in alu
                mem_read <= 1'b0;        // used by data memory
                mem_write <= 1'b0;       // used by data memory
                mem_to_reg_mux <= 1'b0;  // used to select output from alu or data memory
                //reg_dst_mux <= 1'b0;     //unused
                alu_opcode <= 3'b011;
            end
        
        
            3'b100:  // sub: ex sub R0, R1 , R-type: 7-5 = opcode, 4 = Rt/Rd, 3 = Rs, 2-0 = unused
            begin
                jmp <= 1'b0;             // if the instruction is jump
                reg_write <= 1'b1;       // used to specify if we want to write to a register
                alu_src_mux <= 1'b0;     // used to choose the immediate value or register value to put in alu
                mem_read <= 1'b0;        // used by data memory
                mem_write <= 1'b0;       // used by data memory
                mem_to_reg_mux <= 1'b0;  // used to select output from alu or data memory
                //reg_dst_mux <= 1'b0;     //unused
                alu_opcode <= 3'b100;
            end
        
            3'b101:  // jmp: ex jmp ADDR , j-type: 7-5 = opcode, 4-0 = address offset
            begin
                jmp <= 1'b1;             // if the instruction is jump
                reg_write <= 1'b0;       // used to specify if we want to write to a register
                alu_src_mux <= 1'b0;     // used to choose the immediate value or register value to put in alu
                mem_read <= 1'b0;        // used by data memory
                mem_write <= 1'b0;       // used by data memory
                mem_to_reg_mux <= 1'b0;  // used to select output from alu or data memory
                //reg_dst_mux <= 1'b0;     //unused
                alu_opcode <= 3'b101;
            end
        
            default:
            begin
                jmp <= 1'b0;             // if the instruction is jump
                reg_write <= 1'b0;       // used to specify if we want to write to a register
                alu_src_mux <= 1'b0;     // used to choose the immediate value or register value to put in alu
                mem_read <= 1'b0;        // used by data memory
                mem_write <= 1'b0;       // used by data memory
                mem_to_reg_mux <= 1'b0;  // used to select output from alu or data memory
                //reg_dst_mux <= 1'b0;     //unused
                alu_opcode <= 3'b000;
            end
        
 
        
        endcase
    end
    
    if(reset) begin
            jmp <= 1'b0;             // if the instruction is jump
            reg_write <= 1'b0;       // used to specify if we want to write to a register
            alu_src_mux <= 1'b0;     // used to choose the immediate value or register value to put in alu
            mem_read <= 1'b0;        // used by data memory
            mem_write <= 1'b0;       // used by data memory
            mem_to_reg_mux <= 1'b0;  // used to select output from alu or data memory
            //reg_dst_mux <= 1'b0;     //unused
            alu_opcode <= 3'b000;
    end
    
   /* $display("\nControl Unit (%b)",in_opcode);
    $display("jmp: %b",jmp);
    $display("reg_write: %b",reg_write);
    $display("alu_src_mux: %b",alu_src_mux);
    $display("mem_read: %b",mem_read);
    $display("mem_write: %b",mem_write);
    $display("mem_to_reg_mux: %b",mem_to_reg_mux);
    $display("alu_opcode: %b",alu_opcode);*/
end
endmodule
