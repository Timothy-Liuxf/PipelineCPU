`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Tsinghua University
// Engineer: Timothy-LiuXuefeng
// 
// Create Date: 2021/07/12 01:11:56
// Design Name: PipelineCPU
// Module Name: EX_MEM_Reg
// Project Name: PipelineCPU
// Target Devices: xc7a35tcpg236-1
// Tool Versions: Vivado 2017.3
// Description: EX/MEM Register
// 
// Dependencies: None
// 
// Revision: None
// Revision 0.01 - File Created
// Additional Comments: None
// 
//////////////////////////////////////////////////////////////////////////////////


module EX_MEM_Reg
(
    input wire clk,
    input wire reset,

    input wire          EX_MemRead          ,
    input wire          EX_MemWrite         ,
    input wire [31:0]   EX_Addr             ,
    input wire [31:0]   EX_WriteData        ,
    input wire [4:0]    EX_WriteAddr        ,
    input wire [1:0]    EX_MemtoReg         ,
    input wire          EX_RegWrite         ,
    input wire          EX_MemRead          ,
    input wire          EX_MemWrite         ,
    input wire [31:0]   EX_ALU_out          ,
    input wire [31:0]   EX_PC_Plus_4
);

reg         MemRead     ;
reg         MemWrite    ;
reg [31:0]  Addr        ;
reg [31:0]  WriteData   ;
reg [4:0]   WriteAddr   ;
reg [1:0]   MemtoReg    ;
reg         RegWrite    ;
reg         MemRead     ;
reg         MemWrite    ;
reg [31:0]  ALU_out     ;
reg [31:0]  PC_Plus_4   ;

initial begin
    MemRead     <= 0;
    MemWrite    <= 0;
    Addr        <= 0;
    WriteData   <= 0;
    WriteAddr   <= 0;
    MemtoReg    <= 0;
    RegWrite    <= 0;
    MemRead     <= 0;
    MemWrite    <= 0;
    ALU_out     <= 0;
    PC_Plus_4   <= 0;
end

always @(posedge clk or posedge reset) begin
    if (reset) begin
        MemRead         <= 0;
        MemWrite        <= 0;
        Addr            <= 0;
        WriteData       <= 0;
        WriteAddr       <= 0;
        MemtoReg        <= 0;
        RegWrite        <= 0;
        MemRead         <= 0;
        MemWrite        <= 0;
        ALU_out         <= 0;
        PC_Plus_4       <= 0;
    end
    else begin
        MemRead         <= EX_MemRead   ;
        MemWrite        <= EX_MemWrite  ;
        Addr            <= EX_Addr      ;
        WriteData       <= EX_WriteDat  ;
        WriteAddr       <= EX_WriteAdd  ;
        MemtoReg        <= EX_MemtoReg  ;
        RegWrite        <= EX_RegWrite  ;
        MemRead         <= EX_MemRead   ;
        MemWrite        <= EX_MemWrite  ;
        ALU_out         <= EX_ALU_out   ;
        PC_Plus_4       <= EX_PC_Plus_4 ;
    end
end

endmodule
