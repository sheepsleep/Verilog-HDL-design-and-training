//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : file_input_task.v
// FUNCTION        : �ļ���������Ӧ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module file_input_task();

    reg [3 : 0] m_data[15 : 0];
    
    //�����ļ��ľ��
    integer fp_fmem;
    integer i;
    
 
    //��ʼ��r_data
    initial
    begin
            for(i = 0; i < 16; i=i+1)
                m_data[i] = 0;
    end
    
    
    //����źŵ���Ӧ���ļ�
    initial
    begin
        $readmemb("mem.vec",m_data, 0, 7);
        for(i = 0; i < 16; i=i+1)
                $display("m_data[%2d] = %d", i, m_data[i]);
        
    end
                             
endmodule
// END OF file_input_task.v FILE ***************************************************


  




