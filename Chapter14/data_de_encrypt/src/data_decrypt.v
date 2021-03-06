//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : data_decrypt.v
// FUNCTION        : 数据解密
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module data_decrypt(
    input i_rst_n,
    input i_clk,
    
    input i_code,       //加密后的编码输入
    output o_data);      //解密后的数据输出

    
    reg [4 : 0] r_shift;
    
    assign o_data = r_shift[0] ^ r_shift[2] ^ i_code;
    
//*********************************PROCESS**************************************
// FUNCTION        :根据图14-3的结构进行数据解密
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
            r_shift[4] <= i_code;
        end
    end
endmodule

// END OF data_decrypt.v FILE *********************************************************
                 
       
            
    
    