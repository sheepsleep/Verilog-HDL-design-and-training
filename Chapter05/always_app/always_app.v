//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : always_app.v
// FUNCTION        : initial初始化语句应用举例
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module always_app(        
    );
    reg clk_one;
    reg clk_two;
    reg [3 : 0] sig_one;
    reg cout;
    
    initial
    begin
        clk_one = 0;
        clk_two = 0;
        sig_one = 0;
        cout = 0;
    end
    
    
    always
        #1 clk_one = ~clk_one;
    
    always @(posedge clk_one)
    begin
        clk_two = ~clk_two;
    end
    
    always @(posedge clk_one)
    begin
        sig_one = sig_one + 1;
    end
            
    always @(sig_one)
    begin
        if(sig_one == 4'b1111)
            cout = 1;
        else
            cout = 0;            
    end
    
endmodule
// END OF always_app.v FILE ***************************************************

    
   
