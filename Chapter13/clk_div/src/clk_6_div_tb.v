//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : clk_6_divr_tb.v
// FUNCTION        : clk_6_divr.v的测试仿真平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module clk_6_divr_tb;

    //定义激励源
    reg r_clk;
    reg r_reset_n;
    
    
        
    //定义输出信号连线
    wire w_div_clk;
    
    //实例化设计模块，采用端口名称映射方式
    clk_6_div  I_clk_6_div
        (
            .i_reset_n(r_reset_n),
            .i_clk(r_clk),   
            .o_div_clk(w_div_clk)
        );
        
    //产生时钟激励信号
    initial
    begin
        r_clk = 1'b0;    
        forever
           #10 r_clk = ~r_clk;
    end
      
    initial
    begin
            r_reset_n = 1'b0;
        #40 r_reset_n = 1'b1;
    end
endmodule

// END OF clk_6_divr_tb.v FILE ***************************************************



