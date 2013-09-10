//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : timing_block_assign.v
// FUNCTION        : 时序电路中阻塞赋值应用示例三
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************

module timing_block_assign
        (
            input clk,
            input a, 
            
            output y        
        );
    
    reg temp1;
    reg temp2;
    reg y_r;

    assign y = y_r;
    
    always @(posedge clk)
    begin
        temp1 = a;
        temp2 = temp1;
        y_r = temp2;        
    end    
endmodule
// END OF timing_block_assign.v FILE ***************************************************

    
   