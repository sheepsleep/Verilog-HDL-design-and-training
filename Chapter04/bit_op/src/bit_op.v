//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : bit_op.v
// FUNCTION        : λ���������Ӧ�þ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module bit_op
    (
        input [7 : 0] i_a,
        input [7 : 0] i_b,
        
        output [7 : 0] o_bits_not,
        output [7 : 0] o_bits_and,
        output [7 : 0] o_bits_or,
        output [7 : 0] o_bits_xor,
        output [7 : 0] o_bits_xnor,
        
        output o_bit_not,
        output o_bit_and,
        output o_bit_or,
        output  o_bit_xor,
        output o_bit_xnor
                
    );
    
    //һλ��λ����������
    assign o_bit_not = ~i_a[0];
    assign o_bit_and = i_a[0] & i_b[0];
    assign o_bit_or = i_a[0] | i_b[0];
    assign o_bit_xor = i_a[0] ^ i_b[0];
    assign o_bit_xnor = i_a[0] ^~ i_b[0];
    
    //��λ���˲�������
    assign o_bits_not = ~i_a;
    assign o_bits_and = i_a & i_b;
    assign o_bits_or = i_a | i_b;
    assign o_bits_xor = i_a ^ i_b;
    assign o_bits_xnor = i_a ^~ i_b;
                          
     
endmodule
// END OF bit_op.v FILE ***************************************************



