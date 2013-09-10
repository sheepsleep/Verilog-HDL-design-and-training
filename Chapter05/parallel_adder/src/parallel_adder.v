//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : parallel_adder.v
// FUNCTION        : ʵ���������еļӷ���
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module parallel_adder(
    input [7 : 0] da_one,
    input [7 : 0] db_one,
    input [7 : 0] da_two,
    input [7 : 0] db_two,
    input [7 : 0] da_three,
    input [7 : 0] db_three,
    
    output [7 : 0] sum_one,
    output [7 : 0] sum_two,
    output [7 : 0] sum_three
    );

//ʵ�ֵ�һ���ӷ�������    
    assign sum_one = da_one + db_one;

//ʵ�ֵڶ����ӷ�������    
    assign sum_two = da_two + db_two;

//ʵ�ֵ������ӷ�������   
    assign sum_three = da_three + db_three;

endmodule

// END OF parallel_adder.v FILE *********************************************************     