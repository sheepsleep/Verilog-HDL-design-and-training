//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : d_trig_tb.v
// FUNCTION        : coder4to10.v的测试仿真平台
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module d_trig_tb;

    //定义激励源
    reg r_clk;
    reg r_clr;
    reg r_enable;
    reg r_d;
    
    
        
    //定义输出信号连线
    wire w_q;
    
    //实例化设计模块，采用端口名称映射方式
    d_trig  I_d_trig
        (
            .i_clk(r_clk), 
            .i_clr(r_clr),
            .i_enable(r_enable),  
            .i_d(r_d),
            .o_q(w_q)
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
            r_clr = 1'b1;    
        #15 r_clr = 1'b0;
    end
    
    initial
    begin
            r_enable = 1'b1;    
        #20 r_enable = 1'b0;
        #20 r_enable = 1'b1;
    end
     
    initial
    begin
            r_d = 1'b0; 
        repeat(10)
        begin
            #2  r_d = 1'b1;      
            #2  r_d = 1'b0; 
            #4  r_d = 1'b1; 
            #4  r_d = 1'b0; 
            #6  r_d = 1'b1; 
            #2  r_d = 1'b1;    
            #2  r_d = 1'b0;      
            #2  r_d = 1'b1; 
            #4  r_d = 1'b0; 
            #4  r_d = 1'b0; 
            #6  r_d = 1'b1; 
            #2  r_d = 1'b1;  
        end       
    end
endmodule

//module d_trig_tb;
//
//    //定义激励源
//    reg r_clk;
//    reg r_d;
//    
//    
//        
//    //定义输出信号连线
//    wire w_q;
//    
//    //实例化设计模块，采用端口名称映射方式
//    d_trig  I_d_trig
//        (
//            .i_clk(r_clk),   
//            .i_d(r_d),
//            .o_q(w_q)
//        );
//        
//    //产生时钟激励信号
//    initial
//    begin
//            r_clk = 1'b0;    
//            forever
//               #10 r_clk = ~r_clk;
//    end
//      
//    initial
//    begin
//            r_d = 1'b0; 
//        repeat(10)
//        begin
//            #2  r_d = 1'b1;      
//            #2  r_d = 1'b0; 
//            #4  r_d = 1'b1; 
//            #4  r_d = 1'b0; 
//            #6  r_d = 1'b1; 
//            #2  r_d = 1'b1;    
//            #2  r_d = 1'b0;      
//            #2  r_d = 1'b1; 
//            #4  r_d = 1'b0; 
//            #4  r_d = 1'b0; 
//            #6  r_d = 1'b1; 
//            #2  r_d = 1'b1;  
//        end       
//    end
//endmodule



// END OF d_trig_tb.v FILE ***************************************************



