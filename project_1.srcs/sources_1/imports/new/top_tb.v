`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2019 09:26:15 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb;





reg clk_50mhz;



always begin
    clk_50mhz = 0;
    #10; 
    clk_50mhz = 1;
    #10;
end


/*reg [7:0] a_in;
reg [7:0] b_in;
reg [2:0] op;
wire [8:0] result;

ALU uut( .alu_result(result), 
    .a(a_in), 
    .b(b_in), 
    .opcode(op), 
    .clk(clk_50mhz) 
    );


initial begin  //test AL
    
    op = 3'b010;
    a_in = 8'b00000001;
    b_in = 8'b00000001;
    #20;
    
    op = 3'b011;
    a_in = 8'h2A;
    b_in = 8'h5;
    #20;
    
    op = 3'b100;
    a_in = 8'hB;
    b_in = 8'h5;
    #20;
    
    op = 3'b100;
    a_in = 8'h3;
    b_in = 8'h5;
    #20;
    
    op = 3'b100;
    a_in = 8'h4;
    b_in = 8'h5;
    
end*/


/*wire [7:0] reg_1_data_out;
wire [7:0] reg_2_data_out;
reg wr_enable;
reg [1:0] reg_addr;
reg [7:0] wr_data;
reg pos1;
reg pos2;

registers_2x8 uut(
 .reg1_data_out(reg_1_data_out), 
 .reg2_data_out(reg_2_data_out), 
 .reg_write_en(wr_enable), 
 .reg_write_addr(reg_addr), 
 .reg_write_data(wr_data), 
 .rd_reg_pos1(pos1), 
 .rd_reg_pos2(pos2), 
 .clk(clk_50mhz)
 );


initial begin

    pos1 = 0;
    //#10;
    pos2 = 1;

    wr_data = 8'hEA;
    
    
    reg_addr = 0;
    wr_enable = 1; 
    #20
    
    wr_enable = 0;
    
    //#10;
end*/

/*wire [7:0] ram_out;
reg mem_wr_enable;
reg mem_rd_enable;

reg [7:0] wr_data;
reg [7:0] ram_ad;

data_memory uut(
    .ram_addr(ram_ad),
    .write_data(wr_data),
    .mem_wr(mem_wr_enable),
    .mem_rd(mem_rd_enable),
    .clk(clk_50mhz),
    .out_data(ram_out)
 );
 
initial begin
    wr_data = 8'h52;
    ram_ad = 8'h00;
    mem_wr_enable = 1;
    
    #20;
    mem_wr_enable = 0;
    mem_rd_enable = 1;
    #20;
    mem_rd_enable = 0;
    
    
    wr_data = 8'h33;
    ram_ad = 8'h01;
    mem_wr_enable = 1;
    
    #20;
    mem_wr_enable = 0;
    mem_rd_enable = 1;
    #20;
    mem_rd_enable = 0;
    
end*/



   /* wire [7:0] PCout;
    reg [7:0] PCin = 8'b00000000;
    reg reset;

program_counter uut(
    .addr_out(PCout),
    .in_addr(PCin),
    .clk(clk_50mhz),
    .reset(reset)
);
integer i;
initial begin

    
    for(i =-1; i<20; i = i + 1) begin
        PCin = i;
        #20;
    end
    
end*/

/*   wire [7:0] instruction;
    reg [7:0] rd_addr;

instruction_mem uut(
    .instruction(instruction),
    .rd_addr(rd_addr),
    .clk(clk_50mhz)
);

integer i;
initial begin
    for(i =-1; i<20; i = i + 1) begin
        rd_addr = i;
        #20;
    end
end
*/


/*wire [7:0] out;
reg [7:0] in_0 = 8'hAA;
reg [7:0] in_1 = 8'hBB;
reg  select;



mux_8bit_2_1 uut(
    .out(out),
    .in_0(in_0),
    .in_1(in_1),
    .select(select)
);

initial begin
    #20
    select =1;
    #50
    select =0;

end*/


/*wire [7:0] extend_8bit;
reg [2:0] immediate_3bit= 3'b111;


sign_extend uut(
    .extend_8bit(extend_8bit),
    .immediate_3bit(immediate_3bit),
    .clk(clk_50mhz)
);*/

/*wire [7:0] jmp_pc_out;
reg [7:0] pc_in;
reg [4:0] jmp_offset;

jump_control uut(
    .jump_pc_out(jmp_pc_out),
    .curr_pc(jmp_offset),
    .jump_offset(jmp_offset),
    .clk(clk_50mhz)
    );
    
    
initial begin
    #20
    pc_in = 8'b00000111;
    jmp_offset = 5'b01010;
end*/



/*wire jmp_en;       // for jujump control
wire reg_write_en; //if you want to write data to a register in the register module
wire alu_src_mux_en; // choose between immediate value or register value
wire mem_read_en; // data memory -  if we want to read form a memory location
wire mem_write_en; // data memory - if we want to write to a memory location
wire mem_to_reg_mux_en; // choose between alu output and data memory output
wire [2:0] alu_opcode; //

reg [2:0] in_op;


control_unit uut(

    .jmp(jmp_en),       // for jujump control
    .reg_write(reg_write_en), // if you want to write data to a register in the register module
    .alu_src_mux(alu_src_mux_en), // choose between immediate value or register value
    .mem_read(mem_read_en), // data memory -  if we want to read form a memory location
    .mem_write(mem_write_en), // data memory - if we want to write to a memory location
    .mem_to_reg_mux(mem_to_reg_mux_en), // choose between alu output and data memory output
    .alu_opcode(alu_opcode), //

    .in_opcode(in_op),
    .clk(clk_50mhz)

);


initial begin

    in_op = 3'b000;
    #20;
    
    in_op = 3'b001;
    #20;
    
    in_op = 3'b010;
    #20;
    
    in_op = 3'b011;
    #20;
    
    in_op = 3'b100;
    #20;
    
    in_op = 3'b101;
    #20;
end*/


/*wire [2:0] opcode;
wire rs;
wire rd_rt;
wire [2:0] immediate;
wire [4:0] jump_addr_offset;
reg [7:0] instruction= 8'b01101010;


parsed_instr uut(
    .opcode(opcode),
    .rs(rs),
    .rd_rt(rd_rt),
    .immediate(immediate),
    .jump_addr_offset(jump_addr_offset),
    
    .instruction(instruction),
    .clk(clk_50mhz)
    );*/

//wire jmp_en;       // for jujump control
//wire reg_write_en; //if you want to write data to a register in the register module
//wire alu_src_mux_en; // choose between immediate value or register value
//wire mem_read_en; // data memory -  if we want to read form a memory location
//wire mem_write_en; // data memory - if we want to write to a memory location
//wire mem_to_reg_mux_en; // choose between alu output and data memory output
//wire [2:0] op;

//reg re=0;

//data_path uut(

//    .jmp(jmp_en),       // for jujump control
//    .reg_write(reg_write_en), //if you want to write data to a register in the register module
//    .alu_src_mux(alu_src_mux_en), // choose between immediate value or register value
//    .mem_read(mem_read_en), // data memory -  if we want to read form a memory location
//    .mem_write(mem_write_en), // data memory - if we want to write to a memory location
//    .mem_to_reg_mux(mem_to_reg_mux_en), // choose between alu output and data memory output
//    .alu_opcode(op),

//    .clk(clk_50mhz),
//    .rst(re)

//);


//initial begin
//    re = 0;


//end



endmodule
