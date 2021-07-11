`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/07/08 14:55:11
// Design Name: PipelineCPU
// Module Name: ALU
// Project Name: PipelineCPU
// Target Devices: xc7a35tcpg236-1
// Tool Versions: Vivado 2017.3
// Description: The ALU (arithmetic-logic unit) module.
// 
// Dependencies: None
// 
// Revision: None
// Revision 0.01 - File Created
// Additional Comments: None
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU
(
    input wire [31:0] in1,
    input wire [31:0] in2,
    input wire [3:0] ALUOp,
    output reg [31:0] out,
    output wire zero
);

parameter add_op        = 4'h0;     // add
parameter sub_op        = 4'h1;     // sub
parameter and_op        = 4'h3;     // and
parameter or_op         = 4'h4;     // or
parameter xor_op        = 4'h5;     // xor
parameter nor_op        = 4'h6;     // nor
parameter u_cmp_op      = 4'h7;     // unsigned cmp
parameter s_cmp_op      = 4'h8;     // signed cmp
parameter sll_op        = 4'h9;     // sll
parameter srl_op        = 4'hA;     // srl
parameter sra_op        = 4'hB;     // sra
parameter gtz_op        = 4'hC;     // gtz, greater than zero

assign zero = out == 0;

// Signed compare.
wire less_than_31;
wire less_than_signed;
assign less_than_31 = in1[30:0] < in2[30:0];
assign less_than_signed = in1[31] == in2[31] ? less_than_31 :
                            in1[31] ? 1 : 0;

always @(*) begin
    case (ALUOp)
        add_op      : out <= in1 + in2;
        sub_op      : out <= in1 - in2;
        and_op      : out <= in1 & in2;
        or_op       : out <= in1 | in2;
        xor_op      : out <= in1 ^ in2;
        nor_op      : out <= ~(in1 | in2);
        u_cmp_op    : out <= in1 < in2;
        s_cmp_op    : out <= less_than_signed;
        sll_op      : out <= (in2 << in1[4:0]);
        srl_op      : out <= (in2 >> in1[4:0]);
        sra_op      : out <= ({{32{in2[31]}}, in2} >> in1[4:0]);
        gtz_op      : out <= (in1[31] == 0 && in1 != 0);
        default: out <= 0;
    endcase
end

endmodule
