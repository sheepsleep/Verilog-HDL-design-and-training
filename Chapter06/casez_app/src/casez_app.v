//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : casez_app.v
// FUNCTION        : casez����ѡ�����Ӧ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module casez_app( 
    
    );    

    reg [3 : 0] sel;
    reg [3 : 0] data;
    
    initial 
    begin
            sel = 4'b0000;
        #1  sel = 4'b1000;
        #1  sel = 4'b0100;
        #1  sel = 4'b0010;
        #1  sel = 4'b0001;
        #1  sel = 4'b11zz;
    end
    
    always @(sel)
    begin
        casez(sel)
            4'b0000: data = 4'b0000; //��sel = 4'b0000ִ��
            4'b1zzz: data = 4'b0001; //��sel = 4'b1000ִ�У����Է�֧�����λ��ֵ
            4'b01zz: data = 4'b0010; //��sel = 4'b0100ִ�У����Է�֧�����λ��ֵ
            4'b001z: data = 4'b0011; //��sel = 4'b0010ִ�У����Է�֧���һλ��ֵ
            4'bzzz1: data = 4'b0100; //��sel = 4'b0001ִ�У����Է�֧�����λ��ֵ
            4'b11zz: data = 4'b0101; //��sel = 4'b1100ִ�У����������������λ��ֵ
            default: data = 4'b0110; //��sel��������ֵʱִ��
        endcasez
    end
          
endmodule
// END OF casez_app.v FILE ***************************************************

  