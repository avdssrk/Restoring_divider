`timescale 1ns / 1ps


module Cond_sub(n,d,bin,sel,bout,diff);
    input n,d,bin,sel;
    output bout,diff;
    wire temp;
    
    FS sub(n,d,bin,temp,bout);
    assign diff = sel?n:temp;
    
endmodule
