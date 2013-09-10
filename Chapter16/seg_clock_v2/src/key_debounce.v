//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : key_debounce.v
// FUNCTION        : ����ȥ��
//                    _  _   _  _   _  _  
//                   |_||_|_|_||_|_|_||_|
//                   |_||_| |_||_| |_||_| 
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս�����������������캽�մ�ѧ������
// UPDATE          :
//******************************************************************************
`timescale 1ns/1ns

module key_debounce
    (
        input i_reset_n, //��λ��λ�źţ��͵�ƽ��Ч
        input i_clk, //ʱ�����ź�
        input i_key, //����Ϊ0.5s��ʱ�ӣ�������˸��ǰ�ĺ��
        output o_key

        
    );
    
    //��������ź�o_data�Ļ���
    reg r_key;
    reg r_key_1buf, r_key_2buf;
    
    assign o_key = r_key;
    
    always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_key_1buf <= 1'b0;
            r_key_2buf <= 1'b0;
        end
        else
        begin
            r_key_1buf <= i_key;
            r_key_2buf <= r_key_1buf;
        end
	end
	
	always @(posedge i_clk, negedge i_reset_n) 
    begin
        if(1'b0 == i_reset_n)
        begin
            r_key <= 1'b0;
        end
        else
        begin
            if(1'b1 == r_key_1buf ~^ r_key_2buf)
                r_key <= r_key_1buf;
        end
	end
	
    
endmodule
// END OF key_debounce.v FILE ***************************************************


