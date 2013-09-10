//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : crc_code_one.v
// FUNCTION        : CRC编码的第一种方式
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module crc_code_one
    (
        input i_reset_n, //异位复位信号，低电平有效
        input i_clk, //时钟能信号
        input [2 : 0] i_data,
        output [3 : 0] o_crc,
        output o_crc_done    
    );
    
    parameter GPE = 5'b10111;
    //定义输出信号o_data的缓存
    reg [3 : 0] r_crc;
    reg [2 : 0] r_cnt;
    reg [7 : 0] r_crc_shift;
    reg r_crd_done;
    
    assign o_crc = r_crc;
    assign o_crc_done = r_crd_done;
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_crc_shift <= {1'b0, i_data, 4'b0};
            r_cnt <= 3'b0;
            r_crc <= 4'b0;
            r_crd_done <= 1'b0;
        end
        else
        begin
            if(3'd3 == r_cnt)
            begin
                r_crc_shift <= {1'b0, i_data, 4'b0};
                r_cnt <= 3'b0;
                r_crc <= r_crc_shift[6: 3];
                r_crd_done <= 1'b1;
            end
            else
            begin
                r_cnt <= r_cnt + 3'b1;
                r_crd_done <= 1'b0;
               
                
                if(1'b1 == r_crc_shift[6])
                begin
                    r_crc_shift[7 : 3] <= r_crc_shift[6 : 2] ^ GPE;
                    r_crc_shift[2 : 0] <= {r_crc_shift[1 : 0], 1'b0};
                end
                else
                begin
                    r_crc_shift <= {r_crc_shift[6 : 0], 1'b0};
                end
            end                 
        end
	end
	    
endmodule
// END OF crc_code_one.v FILE ***************************************************



