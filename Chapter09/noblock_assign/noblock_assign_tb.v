`timescale 1ns/1ns
module noblock_assign_tb();

    reg a;
    reg b;
    reg c;
    reg d;
    wire y;
    
    noblock_assign I1_noblock_assign
        (
            .a(a),
            .b(b),
            .c(c),
            .d(d),
            .y(y)
        );
        
    initial
    begin
            a = 1;
            b = 0;
            c = 0;
            d = 0;            
       #2   a = 1;
            b = 1;
            c = 0;
            d = 0;
       #2   a = 1;
            b = 1;
            c = 1;
            d = 0;
       #2   a = 1;
            b = 0;
            c = 1;
            d = 1;
       #2   a = 0;
            b = 1;
            c = 1;
            d = 0;
    end
    
endmodule
  