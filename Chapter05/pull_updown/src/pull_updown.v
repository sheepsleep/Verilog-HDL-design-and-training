//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : pull_updown.v
// FUNCTION        : �������ŵ�·ԭ��ģ���ʵ����������
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module pull_updown(
    output d_up,
    output d_down
    );
    
    //ʵ������������ģ��
    pullup U1_pullup(d_up);

    //ʵ��������ģ��
    pulldown U1_pulldown(d_down);

endmodule
// END OF pull_updown.v FILE ***************************************************

    
   