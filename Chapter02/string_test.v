//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : string_test.v
// FUNCTION        : �ַ�������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************
module string_test;
    reg [19*8 : 0] a;   //����һ�������洢�ַ���

//*********************************PROCESS**************************************
// FUNCTION        :��ʾ�ַ����Ĵ洢��ʽ
//******************************************************************************      
    initial
    begin
        a = "I love Verilog HDL!";
        $display("a is :%H", a);
    end
endmodule

