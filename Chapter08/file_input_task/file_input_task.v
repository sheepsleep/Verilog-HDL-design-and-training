//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : file_input_task.v
// FUNCTION        : 文件输入任务应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module file_input_task();

    reg [3 : 0] m_data[15 : 0];
    
    //定义文件的句柄
    integer fp_fmem;
    integer i;
    
 
    //初始化r_data
    initial
    begin
            for(i = 0; i < 16; i=i+1)
                m_data[i] = 0;
    end
    
    
    //输出信号到相应的文件
    initial
    begin
        $readmemb("mem.vec",m_data, 0, 7);
        for(i = 0; i < 16; i=i+1)
                $display("m_data[%2d] = %d", i, m_data[i]);
        
    end
                             
endmodule
// END OF file_input_task.v FILE ***************************************************


  





