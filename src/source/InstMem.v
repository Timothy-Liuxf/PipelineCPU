`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Tsinghua University
// Engineer: Timothy-LiuXuefeng
// 
// Create Date: 2021/07/08 20:45:55
// Design Name: PipelineCPU
// Module Name: InstMem
// Project Name: PipelineCPU
// Target Devices: xc7a35tcpg236-1
// Tool Versions: Vivado 2017.3
// Description: The memory to save instructions
// 
// Dependencies: None
// 
// Revision: None
// Revision 0.01 - File Created
// Additional Comments: None
// 
//////////////////////////////////////////////////////////////////////////////////


module InstMem
(
    input wire [31:0] ReadAddr,
    output wire [31:0] ReadInst
);

assign ReadInst = 
    ReadAddr[31:2] == 30'h0   ? 32'h20080002 :   // addi $t0, $zero, 2
    ReadAddr[31:2] == 30'h1   ? 32'h20090001 :   // addi $t1, $zero, 1
    ReadAddr[31:2] == 30'h2   ? 32'h200a0004 :   // addi $t2, $zero, 4
    ReadAddr[31:2] == 30'h3   ? 32'h200b0003 :   // addi $t3, $zero, 3
    ReadAddr[31:2] == 30'h4   ? 32'h200c0008 :   // addi $t4, $zero, 8
    ReadAddr[31:2] == 30'h5   ? 32'h01096820 :   // add $t5, $t0, $t1   # $t5 = 3
    ReadAddr[31:2] == 30'h6   ? 32'h014b7022 :   // sub $t6, $t2, $t3   # $t6 = 1
    ReadAddr[31:2] == 30'h7   ? 32'h00084080 :   // sll $t0, $t0, 2     # $t2 = 8
    ReadAddr[31:2] == 30'h8   ? 32'h214cfffc :   // addi $t4, $t2, -4
    ReadAddr[31:2] == 30'h9   ? 32'hac090004 :   // sw $t1, 4($zero)
    ReadAddr[31:2] == 30'hA   ? 32'h8c0d0004 :   // lw $t5, 4($zero)
    ReadAddr[31:2] == 30'hB   ? 32'h00000020 :   // add $zero, $zero, $zero
    ReadAddr[31:2] == 30'hC   ? 32'h00000020 :   // 
    ReadAddr[31:2] == 30'hD   ? 32'h00000020 :   // 
    ReadAddr[31:2] == 30'hE   ? 32'h100dfff1 :   // 
    ReadAddr[31:2] == 30'hF   ? 32'h00000020 :   // 
    ReadAddr[31:2] == 30'h10  ? 32'h1400ffef :   // 
    ReadAddr[31:2] == 30'h11  ? 32'h00000020 :   // 
    ReadAddr[31:2] == 30'h12  ? 32'h00000020 :   // 
    ReadAddr[31:2] == 30'h13  ? 32'h00000020 :   // 
    ReadAddr[31:2] == 30'h14  ? 32'h08000014 :   // 

    0;

endmodule
