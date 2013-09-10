//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : crc_three.v
// FUNCTION        : CRC���뷽ʽ��
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module crc_three(
    input [2 : 0] i_data,       //��������
    output [3 : 0] o_crc_code);  //CRC�������

//*********************************PROCESS**************************************
// FUNCTION        :����CRC���뷽ʽ���Ƶ�����
//                  ���һ���Ĵ���ֵ�����״̬������ϱ���
//******************************************************************************     
    assign o_crc_code[3] = i_data[2] ^ i_data[1];
    assign o_crc_code[2] = i_data[1] ^ i_data[0];
    assign o_crc_code[1] = i_data[2] ^ i_data[1] ^ i_data[0];
    assign o_crc_code[0] = i_data[2] ^ i_data[0];
 
endmodule
// END OF crc_three.v FILE *********************************************************
                 
       
            
    
    


