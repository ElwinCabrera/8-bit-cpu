`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2019 07:14:45 PM
// Design Name: 
// Module Name: data_path
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


module data_path(
    output jmp, // if the instruction is jump
    output reg_write, // used to specify if we want to write to a register
    output alu_src_mux, // used to choose the immediate value or register value to put in alu
    output mem_read, // used by data memory
    output mem_write, // used by data memory
    output mem_to_reg_mux, // used to select output from alu or data memory
    //output reg reg_dst_mux,    //unused
    output [2:0] alu_opcode,
    
    input clk,
    input rst
 );
 //initial
 //reg [7:0] pc_in =8'hff;
 
 //comming out of pc
 wire [7:0] pc_out ;  
 
 
 
 //comming out of im
 wire [7:0] instruction;
 
 //comming from parsed instructions
 wire [2:0] opcode ;
 wire rs ;
 wire rd_rt ;
 wire [2:0] immediate ;
 wire [4:0] jump_addr_offset ;
 
 //comming from jump control
 wire [7:0] jump_pc_out;
 
 //comming out of 1st mux
 wire [7:0] pc_out_select = 8'hff;
 
//comming out of 2nd mux -- not used
//wire rd_select;

//comming out of sign extend
wire [7:0] immediate_ext;

//comming out of wireister file
wire [7:0] read_data1;
wire [7:0] read_data2;

//comming out of 3rd mux
wire [7:0] alu_b_select;

//comming out of alu
wire [7:0] alu_data_out;

//comming out of data memory
wire [7:0] dm_data_out;

//comming from 4th mux
wire [7:0] data_out_select;
 
 always @(negedge clk) begin
//    if(pc_out == 8'hff) 
//        pc_in = 8'hff;
//     else
//        pc_in = pc_in +1;
        
    
    $display("\nDatapath (inst %b)", instruction);
    $display("jmp_en: %b",jmp);
    $display("reg_write_en: %b",reg_write);
    $display("alu_src_mux_en: %b",alu_src_mux);
    $display("mem_read_en: %b",mem_read);
    $display("mem_write_en: %b",mem_write);
    $display("mem_to_reg_mux_en: %b",mem_to_reg_mux);
    $display("opcode: %b",alu_opcode);
    
 end
 
 program_counter pc_1(
    .addr_out(pc_out),
    //.addr_in(pc_in),
    .clk(clk),
    .reset(rst)
 );
 
 instruction_mem im_1(
    .instruction(instruction),
    .rd_addr(pc_out),
    .clk(clk)
 );
 
 parsed_instr pi_1(
    .opcode(opcode),
    .rs(rs),
    .rd_rt(rd_rt),
    .immediate(immediate),
    .jump_addr_offset(jump_addr_offset),
    
    .instruction(instruction),
    .clk(clk)
);
 
 // mux 1 here 
 
 
// jump_control jc_1(
//    .jump_pc_out(jump_pc_out),
//    .curr_pc(pc_out),
//    .jump_offset(jump_addr_offset),
//    .clk(clk)
//  );
    
 control_unit cu_1(
    .jmp(jmp),       // for jujump control
    .reg_write(reg_write), // if you want to write data to a register in the register module
    .alu_src_mux(alu_src_mux), // choose between immediate value or register value
    .mem_read(mem_read), // data memory -  if we want to read form a memory location
    .mem_write(mem_write), // data memory - if we want to write to a memory location
    .mem_to_reg_mux(mem_to_reg_mux), // choose between alu output and data memory output
    .alu_opcode(alu_opcode), //

    .in_opcode(opcode),
    .clk(clk),
    .reset(rst)
 );
 
 mux_8bit_2_1 mux_2(
    .out(pc_out_select),
    .in_0(pc_out),
    .in_1(jump_pc_out),
    .select(jmp)
);

sign_extend uut(
    .extend_8bit(immediate_ext),
    .immediate_3bit(immediate),
    .clk(clk)
);

registers_2x8 regs_1(
    .reg1_data_out(read_data1), 
    .reg2_data_out(read_data2), 
    .reg_write_en(reg_write), 
    .reg_write_addr(rd_rt), 
    .reg_write_data(data_out_select), 
    .rd_reg_pos1(rs), 
    .rd_reg_pos2(rd_rt), 
    .clk(clk)
);

mux_8bit_2_1 mux_3(
    .out(alu_b_select),
    .in_0(read_data2),
    .in_1(immediate_ext),
    .select(alu_src_mux)
);

ALU alu_1( 
    .alu_result(alu_data_out), 
    .a(read_data1), 
    .b(alu_b_select), 
    .opcode(opcode), 
    .clk(clk) 
 );


data_memory dm_1(
    .ram_addr(alu_data_out),
    .write_data(read_data2),
    .mem_wr(mem_write),
    .mem_rd(mem_read),
    .clk(clk),
    .out_data(dm_data_out)
 );
 
 mux_8bit_2_1 mux_4(
    .out(data_out_select),
    .in_0(alu_data_out),
    .in_1(dm_data_out),
    .select(mem_to_reg_mux)
);


 
 
endmodule
