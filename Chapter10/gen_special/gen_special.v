//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : gen_special.v
// FUNCTION        : 产生特定序列的值
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gen_special;  //测试平台不需要端口定义

    reg a;
    
    initial
    begin
            a = 0;
        #10 a = 1;
        #20 a = 0;
        #5  a = 1;
        #15 a = 0;
    end
endmodule

