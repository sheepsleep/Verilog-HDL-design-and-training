//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : multi_output_gate.v
// FUNCTION        : �������ŵ�·ԭ��ģ���ʵ����������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������պ����ѧ������
// UPDATE          :
//******************************************************************************

module multi_output_gate(
    input din,
    
    output d_not_one,
    output d_not_two,
    output d_not_three,
    output d_buf_one,
    output d_buf_two,
    output d_buf_three
    );
    
    //ʵ����ԭ����������ģ��
    not U1_and(d_not_one, d_not_two,d_not_three, din);

    //ʵ����ԭ������������ģ��    
    buf U2_buf(d_buf_one, d_buf_two, d_buf_three, din);
endmodule
// END OF multi_output_gate.v FILE *********************************************

    
   