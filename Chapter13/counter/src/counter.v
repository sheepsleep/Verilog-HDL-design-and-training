//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : counter.v
// FUNCTION        : ��������ʵ��0��9�ļ�������������9ʱ��
//                   ���һ��ʱ�����ڵ����壬����������Ҫ��ʼ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module counter
    (
        input i_reset_n, //��λ��λ�źţ��͵�ƽ��Ч
        input i_clk, //ʱ�����ź�
        
        
        output  o_cout, //�������
        output [3 : 0]  o_cnt //��������ǰֵ���
    );
    
    //��������ź�o_data�Ļ���
    reg [3 : 0] r_cnt;
    
    assign o_cout = (4'd9 == r_cnt)? 1'b1 : 1'b0; //�ã������ʵ�������ź����
    assign o_cnt = r_cnt;
    
    //����JK��������״̬ת������ʵ��JK��������ģ
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_cnt <= 4'd0;
        else
            if(4'd9 == r_cnt)
                r_cnt <= 4'd0;
            else
                r_cnt <= r_cnt + 4'd1;
	end
    
endmodule
// END OF counter.v FILE ***************************************************


