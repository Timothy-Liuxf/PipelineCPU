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
    ReadAddr[10:2] == 9'h0    ? 32'h08100001 :
    ReadAddr[10:2] == 9'h1    ? 32'h20080005 :
    ReadAddr[10:2] == 9'h2    ? 32'h20090005 :
    ReadAddr[10:2] == 9'h3    ? 32'h11080001 :
    ReadAddr[10:2] == 9'h4    ? 32'h200a000a :
    ReadAddr[10:2] == 9'h5    ? 32'h212b0005 :
    ReadAddr[10:2] == 9'h6    ? 32'h1169fffe :
    ReadAddr[10:2] == 9'h7    ? 32'h010b5820 :
    ReadAddr[10:2] == 9'h8    ? 32'h000b6022 :
    ReadAddr[10:2] == 9'h9    ? 32'h19800001 :
    ReadAddr[10:2] == 9'hA    ? 32'h2004000a :
    ReadAddr[10:2] == 9'hB    ? 32'h18000001 :
    ReadAddr[10:2] == 9'hC    ? 32'h20050014 :
    ReadAddr[10:2] == 9'hD    ? 32'h1960ffff :
    ReadAddr[10:2] == 9'hE    ? 32'h01054020 :
    ReadAddr[10:2] == 9'hF    ? 32'h0400fffd :
    ReadAddr[10:2] == 9'h10   ? 32'h01084020 :
    ReadAddr[10:2] == 9'h11   ? 32'h0500fffb :
    ReadAddr[10:2] == 9'h12   ? 32'h01094820 :
    ReadAddr[10:2] == 9'h13   ? 32'h05800001 :
    ReadAddr[10:2] == 9'h14   ? 32'h01294820 :
    ReadAddr[10:2] == 9'h15   ? 32'h1d20ffff :
    ReadAddr[10:2] == 9'h16   ? 32'h08100005 :
    0;

endmodule

