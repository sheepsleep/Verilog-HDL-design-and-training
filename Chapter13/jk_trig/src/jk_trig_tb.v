//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : jk_trig_tb.v
// FUNCTION        : jk_trig.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module jk_trig_tb;

    //���弤��Դ
    reg r_clk;
    reg [1 : 0] r_cnt;
    
    
        
    //��������ź�����
    wire w_q;
    wire w_qb;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    jk_trig  I_jk_trig
        (
            .i_clk(r_clk),   
            .i_j(r_cnt[1]),
            .i_k(r_cnt[0]),
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
        r_cnt = 2'd0; 
        forever
            #20    r_cnt = r_cnt + 2'd1;
    end
endmodule

// END OF jk_trig_tb.v FILE ***************************************************


