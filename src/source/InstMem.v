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
    ReadAddr[31:2] == 30'h0    ? 32'h20080002 :
    ReadAddr[31:2] == 30'h1    ? 32'h20090001 :
    ReadAddr[31:2] == 30'h2    ? 32'h200a0004 :
    ReadAddr[31:2] == 30'h3    ? 32'h01095820 :
    ReadAddr[31:2] == 30'h4    ? 32'h014b6020 :
    ReadAddr[31:2] == 30'h5    ? 32'h018b6822 :
    ReadAddr[31:2] == 30'h6    ? 32'h01ad6820 :
    ReadAddr[31:2] == 30'h7    ? 32'h01ac7022 :
    ReadAddr[31:2] == 30'h8    ? 32'hac080000 :
    ReadAddr[31:2] == 30'h9    ? 32'h8c0f0000 :
    ReadAddr[31:2] == 30'hA    ? 32'h01e82020 :
    ReadAddr[31:2] == 30'hB    ? 32'h008f2822 :
    ReadAddr[31:2] == 30'hC    ? 32'hac090004 :
    ReadAddr[31:2] == 30'hD    ? 32'h8c0a0004 :
    ReadAddr[31:2] == 30'hE    ? 32'h8c0b0004 :
    ReadAddr[31:2] == 30'hF    ? 32'h014b6020 :
    ReadAddr[31:2] == 30'h10   ? 32'h218d0004 :
    ReadAddr[31:2] == 30'h11   ? 32'h8c0e0000 :
    ReadAddr[31:2] == 30'h12   ? 32'h012d4020 :
    ReadAddr[31:2] == 30'h13   ? 32'h00000020 :
    ReadAddr[31:2] == 30'h14   ? 32'h00000020 :
    ReadAddr[31:2] == 30'h15   ? 32'h00000020 :
    ReadAddr[31:2] == 30'h16   ? 32'h08000016 :
    0;

endmodule
