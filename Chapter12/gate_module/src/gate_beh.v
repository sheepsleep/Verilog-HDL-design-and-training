//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : gate_beh.v
// FUNCTION        : 门电路建模，用数据流描述实现
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gate_beh
    (
        input i_a, //定义5个输入信号
        input i_b,
        input i_c,
        input i_d,
        input i_e,
        
        output o_y //定义一个输出信号
    );
    
    //定义门电路之间的连线信号
    reg r_and_o;
    reg r_or1_o;    
    reg r_xor_o;
    reg r_y;
    
    assign o_y = r_y;
    
    
    //在always进程中，根据图12-1的电路结构，按输入到输出的顺序
    //用阻塞赋值语句进行建模
    
    always @(*) //组合电路建模采样这种方式描述敏感信号列表，即方便双可避免遗漏敏感信号
    begin
        r_and_o = i_a & i_b; //用阻塞赋值语句对与门进行建模
        
        r_or1_o = i_c | i_d; //用阻塞赋值语句对第一个与门进行建模
        
        r_xor_o = r_and_o ^ r_or1_o; //用阻塞赋值语句对异或门进行建模
        
        r_y = r_xor_o | i_e; ////用阻塞赋值语句对第二个或门进行建模    
	end
    
endmodule

// END OF gate_beh.v FILE ***************************************************



