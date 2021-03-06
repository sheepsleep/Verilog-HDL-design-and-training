//*******************************FILE HEAD**************************************
//*********************《Verilog HDL 设计与实战》配套源代码*********************
// FILE NAME       : uart_rx.v
// FUNCTION        : UART数据接收器
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : 《Verilog HDL 设计与实战》————北京航空航天大学出版社
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module uart_rx
    (
        input i_reset_n,
        input i_clk, //这个时钟是uart波特率的16倍
        input i_rx, //uart串行数据输入，低位在先，高位在后
        
        output [7 : 0] o_data, //待发送的8位数据
        output o_data_rdy  //高为uart串行数据接收一帧数据完毕，提示后端可以取数据
                           //低为正在接收数据或是没有数据
    );
    
    reg [8 : 0] r_rx_shift;
    reg [7 : 0] r_data;
    reg r_rx_done;
    
    
    reg r_rx_data_buf;
    reg r_rx_data_falling;
    
    reg [3 : 0] r_16_cnt;//时钟信号的16分频，即为波特率
    reg [3 : 0] r_shift_cnt; //移位计数器，移完11位，即发送完一帧数据，这里不讨论奇偶检验位
    
    reg [1 : 0] r_state;
    parameter IDLE = 2'b00;
    parameter RECEIVE_DATA = 2'b01;
    parameter RECEIVE_DONE = 2'b10;
    
    
    assign o_data = r_data;
    assign o_data_rdy = r_rx_done;
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_data <= 8'b0;
        end
        else
        begin
            if(RECEIVE_DONE == r_state)
                r_data <= r_rx_shift[8 : 1];
        end
    end
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_rx_data_buf <= 1'b0;
            r_rx_data_falling <= 1'b0;
        end
        else
        begin
            r_rx_data_buf <= i_rx;
            r_rx_data_falling <= r_rx_data_buf & (~i_rx);
        end
    end
    
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_state <= IDLE;
            r_rx_shift <= 9'h1ff;
            r_rx_done <= 1'b1;
            r_16_cnt <= 4'b0;
            r_shift_cnt <= 4'b0;
        end
        else
        begin
            case(r_state)
                IDLE:
                    begin
                        r_16_cnt <= 4'b0;
                        r_shift_cnt <= 4'b0;
                                                
                        if(1'b1 == r_rx_data_falling)
                        begin
                            r_state <= RECEIVE_DATA;
                            r_rx_done <= 1'b0;
                        end
                        else
                        begin
                            r_state <= IDLE;
                            r_rx_done <= 1'b0;
                        end
                    end
                RECEIVE_DATA:
                    begin
                        r_rx_done <= 1'b0;
                        if(4'h7 == r_16_cnt)
                        begin
                            r_16_cnt <= 4'b0;
                            if(4'd10 == r_shift_cnt)
                            begin
                                if(1'b1 == i_rx)
                                begin
                                    r_shift_cnt <= 4'b0;
                                    r_state <= RECEIVE_DONE;
                                end
                                else
                                begin
                                    r_shift_cnt <= 4'b0;
                                    r_state <= IDLE;
                                end
                            end
                            else
                            begin
                                r_shift_cnt <= r_shift_cnt + 4'b1;
                                r_state <= RECEIVE_DATA;
                                r_rx_shift <= {i_rx, r_rx_shift[8 : 1]};
                            end
                        end
                        else
                        begin
                            r_16_cnt <= r_16_cnt + 4'b1;
                        end
                    end
                RECEIVE_DONE:
                    begin
                        r_state <= IDLE;
                        r_rx_done <= 1'b1;
                    end 
            endcase
        end
    end
	    
endmodule
// END OF uart_rx.v FILE ***************************************************



