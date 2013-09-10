//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : mux4to1.v
// FUNCTION        : 4-1������ѡ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module mux4to1
    (
        input i_a, //��һ·����
        input i_b, //�ڶ�·���� 
        input i_c, //����·����
        input i_d, //����·����
        
        input [1 : 0] i_sel, //2λ��ѡ���ź�       
        
        output  o_data //һ·����ź�
    );
    
    //��������ź�o_data�Ļ���
    reg  r_data;
    
    assign o_data = r_data; //ͨ��assign������ֵ�����±������
   
    always @(*) //ʹ��always���̵���Ϊ��ʽ�����ȽϷ���
    begin
   	    case(i_sel)
   	        2'b00: r_data = i_a; //ѡ���һ·����
   	        2'b01: r_data = i_b; //ѡ��ڶ�·����
   	        2'b10: r_data = i_c; //ѡ�����·����
   	        2'b11: r_data = i_d; //ѡ�����·����
   	        default: r_data = 1'b0; //����������1��b0
   	    endcase
	end
    
endmodule

// END OF mux4to1.v FILE ***************************************************


