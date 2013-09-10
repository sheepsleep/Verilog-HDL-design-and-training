//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : crc_three.v
// FUNCTION        : CRC编码方式二
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module crc_three(
    input [2 : 0] i_data,       //数据输入
    output [3 : 0] o_crc_code);  //CRC编码输出

//*********************************PROCESS**************************************
// FUNCTION        :根据CRC编码方式二推导出，
//                  最后一步寄存器值的组合状态进行组合编码
//******************************************************************************     
    assign o_crc_code[3] = i_data[2] ^ i_data[1];
    assign o_crc_code[2] = i_data[1] ^ i_data[0];
    assign o_crc_code[1] = i_data[2] ^ i_data[1] ^ i_data[0];
    assign o_crc_code[0] = i_data[2] ^ i_data[0];
 
endmodule
// END OF crc_three.v FILE *********************************************************
                 
       
            
    
    



