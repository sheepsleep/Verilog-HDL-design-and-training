//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : seg_display_tb.v
// FUNCTION        : seg_display.v�Ĳ��Է���ƽ̨
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module seg_display_tb;

    //���弤��Դ
    reg [3 : 0] r_data;
    reg r_dp;
    
    
        
    //��������ź�����
    wire [6 : 0] w_seg;
    wire w_dp;
    
    //ʵ�������ģ�飬���ö˿�����ӳ�䷽ʽ
    seg_display  I_seg_display
        (
            .i_data(r_data), 
            .i_dp(r_dp),           
            .o_seg(w_seg),
            .o_dp(w_dp)
        );
        
    //����С������ʾ�����ź�
    initial
    begin
            r_dp = 1'b0; 
            repeat(8)
            #4  r_dp = ~r_dp;    
    end
    
        //����7������ʾ�����ź�
    initial
    begin
            r_data = 4'd0; 
            repeat(16)
            #2  r_data = r_data + 4'd1;             
    end
      
endmodule
// END OF seg_display_tb.v FILE ***************************************************


