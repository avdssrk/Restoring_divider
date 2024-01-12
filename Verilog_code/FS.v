`timescale 1ns / 1ps

module FS(n,d,bin,diff,brw);
    input d,n,bin;
    output diff,brw;
    
    assign diff=d^n^bin;
    assign brw=((~n)&bin) |((~n)&d) |(d&bin);
    
endmodule
