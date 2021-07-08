`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Tsinghua University
// Engineer: Timothy-LiuXuefeng
// 
// Create Date: 2021/07/08 14:15:12
// Design Name: PipelineCPU
// Module Name: PC
// Project Name: PipelineCPU
// Target Devices: xc7a35tcpg236-1
// Tool Versions: Vivado 2017.3
// Description: Program counter register.
// 
// Dependencies: None
// 
// Revision: None
// Revision 0.01 - File Created
// Additional Comments: None
// 
//////////////////////////////////////////////////////////////////////////////////


module PC
(
    input wire clk,
    input wire reset,
    input wire PC_i,
    output reg PC_o
);

initial begin
    PC_o <= 0;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        PC_o <= 0;
    end
    else begin
        PC_o <= PC_i;
    end
end

endmodule
