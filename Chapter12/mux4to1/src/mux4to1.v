//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : mux4to1.v
// FUNCTION        : 4-1的数据选择器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module mux4to1
    (
        input i_a, //第一路数据
        input i_b, //第二路数据 
        input i_c, //第三路数据
        input i_d, //第四路数据
        
        input [1 : 0] i_sel, //2位的选择信号       
        
        output  o_data //一路输出信号
    );
    
    //定义输出信号o_data的缓存
    reg  r_data;
    
    assign o_data = r_data; //通过assign连续赋值语句更新编码输出
   
    always @(*) //使用always进程的行为方式描述比较方便
    begin
   	    case(i_sel)
   	        2'b00: r_data = i_a; //选择第一路数据
   	        2'b01: r_data = i_b; //选择第二路数据
   	        2'b10: r_data = i_c; //选择第三路数据
   	        2'b11: r_data = i_d; //选择第四路数据
   	        default: r_data = 1'b0; //其它情况输出1‘b0
   	    endcase
	end
    
endmodule

// END OF mux4to1.v FILE ***************************************************



