//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : crc_one.v
// FUNCTION        : CRC���뷽ʽһ
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************

module crc_one(
    input i_rst_n,
    input i_clk,
    
    input [2 : 0] i_data,       //��������
    output [3 : 0] o_crc_code,  //CRC�������
    output o_crc_done);      //CRC������ɱ�־����Ϊ���

    parameter GX = 4'b10111;
    
    reg [7 : 0] r_shift;    //
    reg [2 : 0] r_cnt;
    reg [3 : 0] r_crc_code;
    reg r_crc_done;
    
    assign o_crc_code = r_crc_code;
    assign o_crc_done = r_crc_done;
    
//*********************************PROCESS**************************************
// FUNCTION        :����CRC���붨�����CRC����
//******************************************************************************     
    always @(negedge i_rst_n, posedge i_clk)
    begin
        if(~i_rst_n)
        begin
            r_shift <= 8'b0;
            r_cnt <= 3'b0;
            r_crc_code <= 4'b0;
            r_crc_done <= 1'b0;
        end
        else
            if(r_cnt == 3'd3)     //CRC�������
            begin
                r_shift <= {1'b0, i_data, 4'b0};        //����װ������
                r_cnt <= 3'b0;
                r_crc_code <= r_shift[6 : 3];
                r_crc_done <= 1'b1;
            end
            else
            begin
                if(r_shift[6] == 1'b1)                   //���λΪ1��������
                begin   
                    r_shift[7 : 3] <= r_shift[6 : 2] ^ GX;
                    r_shift[2 : 0] <= {r_shift[1 : 0], 1'b0};
                end
                else
                    r_shift <= {r_shift[6 : 0], 1'b0};
                
                r_cnt <= r_cnt + 3'd1;
                r_crc_done <= 1'b0;
            end
    end
endmodule

// END OF crc_one.v FILE *********************************************************
                 
       
            
    
    