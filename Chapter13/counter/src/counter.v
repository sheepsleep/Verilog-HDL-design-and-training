//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : counter.v
// FUNCTION        : 计数器，实现0到9的计数，当计数到9时，
//                   输出一个时钟周期的脉冲，计数清零重要开始计数
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module counter
    (
        input i_reset_n, //异位复位信号，低电平有效
        input i_clk, //时钟能信号
        
        
        output  o_cout, //脉冲输出
        output [3 : 0]  o_cnt //计数器当前值输出
    );
    
    //定义输出信号o_data的缓存
    reg [3 : 0] r_cnt;
    
    assign o_cout = (4'd9 == r_cnt)? 1'b1 : 1'b0; //用？：语句实现脉冲信号输出
    assign o_cnt = r_cnt;
    
    //根据JK触发器的状态转化规则，实现JK触发器建模
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
            r_cnt <= 4'd0;
        else
            if(4'd9 == r_cnt)
                r_cnt <= 4'd0;
            else
                r_cnt <= r_cnt + 4'd1;
	end
    
endmodule
// END OF counter.v FILE ***************************************************



