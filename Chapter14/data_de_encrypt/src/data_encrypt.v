//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : data_encrypt.v
// FUNCTION        : 数据加密
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module data_encrypt(
    input i_rst_n,
    input i_clk,
    
    input i_data,       //数据输入
    output o_code);      //加密后的编码输出

    
    reg [4 : 0] r_shift;
    
    assign o_code = r_shift[4];
    
//*********************************PROCESS**************************************
// FUNCTION        :根据图14-1的结构进行数据加密
//******************************************************************************     
    always @(negedge i_rst_n, posedge i_clk)
    begin
        if(~i_rst_n)
        begin
            r_shift <= 5'b0;
        end
        else
        begin
            r_shift[3 : 0] <= r_shift[4 : 1];
            r_shift[4] <= r_shift[0] ^ r_shift[2] ^ i_data;
        end
    end
endmodule

// END OF data_encrypt.v FILE *********************************************************
                 
       
            
    
    