//*******************************FILE HEAD**************************************
//*********************��Verilog HDL �����ʵս������Դ����*********************
// FILE NAME       : data_select.v
// FUNCTION        : ������������ѡ����
// AUTHOR          : 
// DATE & REVISION : 
// COMPANY         : ��Verilog HDL �����ʵս��
// UPDATE          :
//******************************************************************************


module data_select
    #(
        parameter DATA_WIDTH = 4     
    )
    (
        input [DATA_WIDTH-1 : 0] data_one,
        input [DATA_WIDTH-1 : 0] data_two,
        input sel,
        
        output [DATA_WIDTH-1 : 0] data_out
    );
    
    assign data_out = sel? data_two : data_one;
    
endmodule
// END OF data_select.v FILE ***************************************************

    
   