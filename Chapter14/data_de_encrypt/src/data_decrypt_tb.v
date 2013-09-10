//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : data_decrypt_tb.v
// FUNCTION        : 数据解密模块测试平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module data_decrypt_tb();      

    
    reg r_rst_n;
    reg r_clk;
    reg r_data;
    
    wire w_code;    //加密数据输出 
    wire w_data;    //解密数据输出
   
//*********************************PROCESS**************************************
// FUNCTION        :初始化r_rst_n
//******************************************************************************     
    initial
    begin
            r_rst_n = 1'b0;
        #10 r_rst_n = 1'b1; 
    end

//*********************************PROCESS**************************************
// FUNCTION        :初始化r_clk,产生周期为2ns的时钟信号
//******************************************************************************     
    initial
    begin
            r_clk = 1'b0;
        forever
            #1  r_clk = ~r_clk;
    end
//*********************************PROCESS**************************************
// FUNCTION        :初始化r_data，产随机的0、1序列
//******************************************************************************     
    initial
    begin
            r_data = 1'b0;
        forever
            #2  r_data = $random % 2;
    end

//*********************************PROCESS**************************************
// FUNCTION        :实例化加密模块data_encrypt
//******************************************************************************     
    data_encrypt I1_data_encrypt(
                                    .i_rst_n(r_rst_n),
                                    .i_clk(r_clk),
                                    .i_data(r_data),
                                    .o_code(w_code)
                                 );

//*********************************PROCESS**************************************
// FUNCTION        :实例化解密模块data_encrypt
//******************************************************************************     
    data_decrypt I1_data_decrypt(
                                    .i_rst_n(r_rst_n),
                                    .i_clk(r_clk),
                                    .i_code(w_code),    
                                    .o_data(w_data)
                                 );                                 
                                 
    
endmodule
// END OF data_encrypt.v FILE *********************************************************
                 
       
            
    
    