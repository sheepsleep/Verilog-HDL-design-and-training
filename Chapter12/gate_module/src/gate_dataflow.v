//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : gate_dataflow.v
// FUNCTION        : 门电路建模，用数据流描述实现
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module gate_dataflow
    (
        input i_a, //定义5个输入信号
        input i_b,
        input i_c,
        input i_d,
        input i_e,
        
        output o_y //定义一个输出信号
    );
    
    //定义门电路之间的连线信号
    wire w_and_o;
    wire w_or1_o;    
    wire w_xor_o;
    
    //根据图12-1的电路结构，按输入到输出的顺序
    //用连续赋值语句进行建模
    
    assign w_and_o = i_a & i_b; //用连续赋值语句对与门进行建模
    
    assign w_or1_o = i_c | i_d; //用连续赋值语句对第一个与门进行建模
    
    assign w_xor_o = w_and_o ^ w_or1_o; //用连续赋值语句对异或门进行建模
    
    assign o_y = w_xor_o | i_e; //用连续赋值语句对第二个或门进行建模 
   
    
endmodule

// END OF gate_dataflow.v FILE ***************************************************



