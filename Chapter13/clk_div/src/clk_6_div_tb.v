//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : clk_6_divr_tb.v
// FUNCTION        : clk_6_divr.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module clk_6_divr_tb;

    //���弤��Դ
    reg r_clk;
    reg r_reset_n;
    
    
        
    //��������ź�����
    wire w_div_clk;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    clk_6_div  I_clk_6_div
        (
            .i_reset_n(r_reset_n),
            .i_clk(r_clk),   
            .o_div_clk(w_div_clk)
        );
        
    //����ʱ�Ӽ����ź�
    initial
    begin
        r_clk = 1'b0;    
        forever
           #10 r_clk = ~r_clk;
    end
      
    initial
    begin
            r_reset_n = 1'b0;
        #40 r_reset_n = 1'b1;
    end
endmodule

// END OF clk_6_divr_tb.v FILE ***************************************************


