//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : t_trig_tb.v
// FUNCTION        : t_trig.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module t_trig_tb;

    //���弤��Դ
    reg r_clk;
    reg r_t;
    
    
        
    //��������ź�����
    wire w_q;
    wire w_qb;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    t_trig  I_t_trig
        (
            .i_clk(r_clk),   
            .i_t(r_t),
            .o_q(w_q),
            .o_qb(w_qb)
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
        r_t = 1'b0; 
        forever
            #40 r_t = ~r_t1;
    end
endmodule

// END OF t_trig_tb.v FILE ***************************************************


