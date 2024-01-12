`timescale 1ns / 1ps


module Divd(n,d,q);
    input [7:0] d,n;
    output [7:0] q;
    wire [8:0] r[7:0];
    wire [7:0] brw;
    
    assign q=brw;
    cs_block s0({4'b0,n[7:3]},d,brw[7],r[7]);
    cs_block s1({r[7],n[2]},d,brw[6],r[6]);
    cs_block s2({r[6],n[1]},d,brw[5],r[5]);
    cs_block s3({r[5],n[0]},d,brw[4],r[4]);
    cs_block s4({r[4],1'b0},d,brw[3],r[3]);
    cs_block s5({r[3],1'b0},d,brw[2],r[2]);
    cs_block s6({r[2],1'b0},d,brw[1],r[1]);
    cs_block s7({r[1],1'b0},d,brw[0],r[0]);
endmodule

module cs_block(n,d,q,r);
    input [8:0] n;
    input [7:0] d;
    output q;
    output [8:0] r;
    wire [8:0] b;
    assign q=~b[8];
    
    Cond_sub cs0(n[0],d[0],0,b[7],b[0],r[0]);
    Cond_sub cs1(n[1],d[1],b[0],b[7],b[1],r[1]);
    Cond_sub cs2(n[2],d[2],b[1],b[7],b[2],r[2]);
    Cond_sub cs3(n[3],d[3],b[2],b[7],b[3],r[3]);
    Cond_sub cs4(n[4],d[4],b[3],b[7],b[4],r[4]);
    Cond_sub cs5(n[5],d[5],b[4],b[7],b[5],r[5]);
    Cond_sub cs6(n[6],d[6],b[5],b[7],b[6],r[6]);
    Cond_sub cs7(n[7],d[7],b[6],b[7],b[7],r[7]);
    Cond_sub cs8(n[8],0,b[7],b[8],b[8],r[8]);
    
endmodule