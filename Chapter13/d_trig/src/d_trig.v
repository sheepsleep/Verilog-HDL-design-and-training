//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : d_trig.v
// FUNCTION        : D触发器建模
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module d_trig
    (
        input i_clk, //时钟信号
        input i_clr, //清零信号        
        input i_enable,  //使能信号
        input i_d, //第二路数据 
        
        output  o_q //一路输出信号
    );
    
    //定义输出信号o_data的缓存
    reg  r_q;
    
    assign o_q = r_q; //通过assign连续赋值语句更新编码输出
   
    //对输入信号进行D触发器寄存
    //应用事件控制进行always进程启动
    //多个事件可以用,分开，也可能用or分开，本书推荐使得,分开
    always @(posedge i_clk, posedge i_clr) 
    begin 
        if(1'b1 == i_clr) //异步清零
                    r_q = 1'b0;                        
   	    else if(1'b1 == i_enable) //同步使能
   	        r_q <= i_d; 
	end    
endmodule

//module d_trig
//    (
//        input i_clk, //时钟信号
//        input i_d, //第二路数据 
//        
//        output  o_q //一路输出信号
//    );
//    
//    //定义输出信号o_data的缓存
//    reg  r_q;
//    
//    assign o_q = r_q; //通过assign连续赋值语句更新编码输出
//   
//    //对输入信号进行D触发器寄存
//    //应用事件控制进行always进程启动
//    //posedge i_clk是指i_clk上升沿事件，如果该事件发则启本进程，执行进程内的语句
//    always @(posedge i_clk) 
//    begin                   
//   	    r_q <= i_d; //时序电路建模，采用非阻塞赋值语句
//	end
//    
//endmodule
// END OF d_trig.v FILE ***************************************************



