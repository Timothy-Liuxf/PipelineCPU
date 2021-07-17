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
    ReadAddr[31:2] == 30'h0    ? 32'h20090001 :
    ReadAddr[31:2] == 30'h1    ? 32'h200a0002 :
    ReadAddr[31:2] == 30'h2    ? 32'h08000006 :
    ReadAddr[31:2] == 30'h3    ? 32'h08000005 :
    ReadAddr[31:2] == 30'h4    ? 32'h200b0003 :
    ReadAddr[31:2] == 30'h5    ? 32'h200c0004 :
    ReadAddr[31:2] == 30'h6    ? 32'h200d0005 :
    ReadAddr[31:2] == 30'h7    ? 32'h20040028 :
    ReadAddr[31:2] == 30'h8    ? 32'h00800008 :
    ReadAddr[31:2] == 30'h9    ? 32'h20a50005 :
    ReadAddr[31:2] == 30'hA    ? 32'h20c6000a :
    ReadAddr[31:2] == 30'hB    ? 32'h20ce000a :
    ReadAddr[31:2] == 30'hC    ? 32'h0c00000e :
    ReadAddr[31:2] == 30'hD    ? 32'h21cf000a :
    ReadAddr[31:2] == 30'hE    ? 32'h21ce0005 :
    ReadAddr[31:2] == 30'hF    ? 32'h20080054 :
    ReadAddr[31:2] == 30'h10   ? 32'hac080008 :
    ReadAddr[31:2] == 30'h11   ? 32'h8c090008 :
    ReadAddr[31:2] == 30'h12   ? 32'h0120f809 :
    ReadAddr[31:2] == 30'h13   ? 32'h20040001 :
    ReadAddr[31:2] == 30'h14   ? 32'h20050002 :
    ReadAddr[31:2] == 30'h15   ? 32'h23e60003 :
    ReadAddr[31:2] == 30'h16   ? 32'h00000020 :
    ReadAddr[31:2] == 30'h17   ? 32'h00000020 :
    ReadAddr[31:2] == 30'h19   ? 32'h00000020 :
    ReadAddr[31:2] == 30'h16   ? 32'h08000019 :
    0;

endmodule

