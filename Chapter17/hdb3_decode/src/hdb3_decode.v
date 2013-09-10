//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : hdb3_decode.v
// FUNCTION        : HDB3译码模块
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module hdb3_decode
    (
        input i_rst_n, //异位复位信号，低电平有效
        input i_clk, //时钟能信号
        
        input [1 : 0] i_hdb3_code,
        output o_data   
    );
    
    //定义输出信号o_data的缓存
    reg [4 : 0] r_hdb3_plus;
    reg [4 : 0] r_hdb3_minus;

    
    assign o_data = (1'b1 == r_hdb3_minus[4] || 1'b1 == r_hdb3_plus[4])? 1'b1 : 1'b0;
    
    always @(posedge i_clk, negedge i_rst_n) 
    begin
        if(1'b0 == i_rst_n)
        begin
            r_hdb3_plus <= 5'b00000;
            r_hdb3_minus <= 5'b00000;
        end
        else
        begin
            if(1'b1 == i_hdb3_code[1] && 4'b1000 == r_hdb3_plus[3 : 0] && 4'b0000 == r_hdb3_minus[3 : 0])
            begin
                r_hdb3_plus <= {r_hdb3_plus[3], 4'b0000};
                r_hdb3_minus <= {r_hdb3_minus[3 : 0], i_hdb3_code[0]};
            end
            else if(1'b1 == i_hdb3_code[0] && 4'b1000 == r_hdb3_minus[3 : 0] && 4'b0000 == r_hdb3_plus[3 : 0])
            begin
                r_hdb3_minus <= {r_hdb3_minus[3], 4'b0000};
                r_hdb3_plus <= {r_hdb3_plus[3 : 0], i_hdb3_code[1]};
            end
            else if(1'b1 == i_hdb3_code[1] && 3'b100 == r_hdb3_plus[2 : 0] && 3'b000 == r_hdb3_minus[2 : 0])
            begin
                r_hdb3_plus <= {r_hdb3_plus[3], 4'b0000};
                r_hdb3_minus <= {r_hdb3_minus[3 : 0], i_hdb3_code[0]};
            end
            else if(1'b1 == i_hdb3_code[0] && 3'b100 == r_hdb3_minus[2 : 0] && 3'b000 == r_hdb3_plus[2 : 0])
            begin
                r_hdb3_minus <= {r_hdb3_minus[3], 4'b0000};
                r_hdb3_plus <= {r_hdb3_plus[3 : 0], i_hdb3_code[1]};
            end
            else
            begin
                r_hdb3_plus <= {r_hdb3_plus[3 : 0], i_hdb3_code[1]};
                r_hdb3_minus <= {r_hdb3_minus[3 : 0], i_hdb3_code[0]};
            end               
        end
	end
	    
endmodule
// END OF hdb3_decode.v FILE ***************************************************



