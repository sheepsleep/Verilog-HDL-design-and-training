//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : monitor_task.v
// FUNCTION        : 连续监测任务应用
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module monitor_task();

    reg [7 : 0] r_data;
    reg [15*8 : 0] r_str;
    
    initial
    begin
            r_data = 8'd100;
        #10
            r_data = 8'd150;
        #20    
            r_data = 8'd80;
        #30    
            r_data = 8'd90;
        #40    
            r_data = 8'd66;
    end
    
    initial
    begin
        $display("display: simulation = %d, r_data = %d", $time, r_data);
        $monitor("monitor: simulation = %d, r_data = %d", $time, r_data);
    end
                             
endmodule
// END OF monitor_task.v FILE ***************************************************


  



