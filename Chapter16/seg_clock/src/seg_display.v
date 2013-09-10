//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : seg_display.v
// FUNCTION        : 数码管的编码码控制器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航天航空大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module seg_display
    (
        input [3: 0]i_data, //定义10位的数据输入 
        input i_dp,       
        
        output [6 : 0] o_seg, //定义7位的编码输出,高到低分别代表A、B、C、D、E、F、G
        output o_dp
    );
    
    //定义输出信号o_code的缓存
    reg [6 :0] r_seg;
    
    assign o_dp = i_dp; //小数点显示不需要编码，直接输出就可以
    
    assign o_seg = r_seg; //通过assign连续赋值语句更新编码输出
    
   
    always @(*) //使用always进程的行为方式描述比较方便
    begin
   	    case(i_data)
   	        4'b0000: r_seg = 8'hc0; //显示字符0
   	        4'b0001: r_seg = 8'hf9; //显示字符1
   	        4'b0010: r_seg = 8'ha4; //显示字符2
   	        4'b0011: r_seg = 8'hb0; //显示字符3
   	        4'b0100: r_seg = 8'h99; //显示字符4
   	        4'b0101: r_seg = 8'h92; //显示字符5
   	        4'b0110: r_seg = 8'h82; //显示字符6
   	        4'b0111: r_seg = 8'hf8; //显示字符7
   	        4'b1000: r_seg = 8'h80; //显示字符8
   	        4'b1001: r_seg = 8'h90; //显示字符9
   	        4'b1010: r_seg = 8'hbf; //显示字符-
   	        
   	        default: r_seg = 8'hff; //全都不发光
   	    endcase
	end
    
endmodule

// END OF seg_display.v FILE ***************************************************



