//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : d_trig.v
// FUNCTION        : D��������ģ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module d_trig
    (
        input i_clk, //ʱ���ź�
        input i_clr, //�����ź�        
        input i_enable,  //ʹ���ź�
        input i_d, //�ڶ�·���� 
        
        output  o_q //һ·����ź�
    );
    
    //��������ź�o_data�Ļ���
    reg  r_q;
    
    assign o_q = r_q; //ͨ��assign������ֵ�����±������
   
    //�������źŽ���D�������Ĵ�
    //Ӧ���¼����ƽ���always��������
    //����¼�������,�ֿ���Ҳ������or�ֿ��������Ƽ�ʹ��,�ֿ�
    always @(posedge i_clk, posedge i_clr) 
    begin 
        if(1'b1 == i_clr) //�첽����
                    r_q = 1'b0;                        
   	    else if(1'b1 == i_enable) //ͬ��ʹ��
   	        r_q <= i_d; 
	end    
endmodule

//module d_trig
//    (
//        input i_clk, //ʱ���ź�
//        input i_d, //�ڶ�·���� 
//        
//        output  o_q //һ·����ź�
//    );
//    
//    //��������ź�o_data�Ļ���
//    reg  r_q;
//    
//    assign o_q = r_q; //ͨ��assign������ֵ�����±������
//   
//    //�������źŽ���D�������Ĵ�
//    //Ӧ���¼����ƽ���always��������
//    //posedge i_clk��ָi_clk�������¼���������¼������������̣�ִ�н����ڵ����
//    always @(posedge i_clk) 
//    begin                   
//   	    r_q <= i_d; //ʱ���·��ģ�����÷�������ֵ���
//	end
//    
//endmodule
// END OF d_trig.v FILE ***************************************************


