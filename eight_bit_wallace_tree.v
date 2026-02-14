`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2026 16:18:30
// Design Name: 
// Module Name: eight_bit_wallace_tree
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module eight_bit_wallace_tree(
                              input [7:0]a , b,
                              output [15:0]z
                              );
      
      wire [7:0] pp [7:0];
      
      //generation of pratial products
      genvar i;
      generate
        for(i=0 ;i<=7 ;i=i+1) begin
           assign  pp[i]=a & {8{b[i]}};
        end
      endgenerate
      
      //stage1
      half_adder HA1(.a(pp[0][1]) , .b(pp[1][0]) , .s(s1) , .cout(c1));
      
      full_adder FA1(.a(pp[0][2]) , .b(pp[1][1]) , .cin(pp[2][0]) , .s(s2) , .cout(c2));
      
      full_adder FA2(.a(pp[0][3]) , .b(pp[1][2]) , .cin(pp[2][1]) , .s(s3) , .cout(c3));
      
      full_adder FA3(.a(pp[0][4]) , .b(pp[1][3]) , .cin(pp[2][2]) , .s(s4) , .cout(c4));
      half_adder HA2(.a(pp[3][1]) , .b(pp[4][0]) , .s(s5) , .cout(c5));
      
      full_adder FA4(.a(pp[0][5]) , .b(pp[1][4]) , .cin(pp[2][3]) , .s(s6) , .cout(c6));
      full_adder FA5(.a(pp[3][2]) , .b(pp[4][1]) , .cin(pp[5][0]) , .s(s7) , .cout(c7));
      
      full_adder FA6(.a(pp[0][6]) , .b(pp[1][5]) , .cin(pp[2][4]) , .s(s8) , .cout(c8));
      full_adder FA7(.a(pp[3][3]) , .b(pp[4][2]) , .cin(pp[5][1]) , .s(s9) , .cout(c9));
      
      full_adder FA8(.a(pp[0][7]) , .b(pp[1][6]) , .cin(pp[2][5]) , .s(s10) , .cout(c10));
      full_adder FA9(.a(pp[3][4]) , .b(pp[4][3]) , .cin(pp[5][2]) , .s(s11) , .cout(c11));
      
      half_adder HA3(.a(pp[1][7]) , .b(pp[2][6]) , .s(s12) , .cout(c12));
      full_adder FA10(.a(pp[3][5]) , .b(pp[4][4]) , .cin(pp[5][3]) , .s(s13) , .cout(c13));
      
      full_adder FA11(.a(pp[3][6]) , .b(pp[4][5]) , .cin(pp[5][4]) , .s(s14) , .cout(c14));
      
      full_adder FA12(.a(pp[3][7]) , .b(pp[4][6]) , .cin(pp[5][5]) , .s(s15) , .cout(c15));
      
      half_adder HA4(.a(pp[4][7]) , .b(pp[5][6]) , .s(s16) , .cout(c16));
      
      //stage2
      half_adder HA5(.a(c1) , .b(s2) , .s(s17) , .cout(c17));
      
      full_adder FA13(.a(c2) , .b(s3) , .cin(pp[3][0]) , .s(s18) , .cout(c18));
      
      full_adder FA14(.a(c3) , .b(s4) , .cin(s5) , .s(s19) , .cout(c19));
      
      full_adder FA15(.a(c4) , .b(s6) , .cin(c5) , .s(s20) , .cout(c20));
      
      full_adder FA16(.a(c6) , .b(s8) , .cin(c7) , .s(s21) , .cout(c21));
      half_adder HA6(.a(s9) , .b(pp[6][0]) , .s(s22) , .cout(c22));
      
      full_adder FA17(.a(c8) , .b(s10) , .cin(c9) , .s(s23) , .cout(c23));
      full_adder FA18(.a(s11) , .b(pp[6][1]) , .cin(pp[7][0]) , .s(s24) , .cout(c24));
      
      full_adder FA19(.a(c10) , .b(s12) , .cin(c11) , .s(s25) , .cout(c25));
      full_adder FA20(.a(s13) , .b(pp[6][2]) , .cin(pp[7][1]) , .s(s26) , .cout(c26));
      
      full_adder FA21(.a(pp[2][7]) , .b(c12) , .cin(c13) , .s(s27) , .cout(c27));
      full_adder FA22(.a(s14) , .b(pp[6][3]) , .cin(pp[7][2]) , .s(s28) , .cout(c28));
      
      full_adder FA23(.a(s15) , .b(pp[6][4]) , .cin(pp[7][3]) , .s(s29) , .cout(c29));
      
      full_adder FA24(.a(s16) , .b(pp[6][5]) , .cin(pp[7][4]) , .s(s30) , .cout(c30));
      
      full_adder FA25(.a(pp[5][7]) , .b(pp[6][6]) , .cin(pp[7][5]) , .s(s31) , .cout(c31));
      
      half_adder HA7(.a(pp[6][7]) , .b(pp[7][6]) , .s(s32) , .cout(c32));
      
      //stage3
      half_adder HA8(.a(c17) , .b(s18) , .s(s33) , .cout(c33));
      
      half_adder HA9(.a(c18) , .b(s19) , .s(s34) , .cout(c34));
      
      full_adder FA26(.a(c19) , .b(s20) , .cin(s7) , .s(s35) , .cout(c35));
      
      full_adder FA27(.a(c20) , .b(s21) , .cin(s22) , .s(s36) , .cout(c36));
      
      full_adder FA28(.a(c21) , .b(s23) , .cin(c22) , .s(s37) , .cout(c37));
      
      full_adder FA29(.a(c23) , .b(s25) , .cin(c24) , .s(s38) , .cout(c38));
      
      full_adder FA30(.a(c25) , .b(s27) , .cin(c26) , .s(s39) , .cout(c39));
      
      full_adder FA31(.a(c14) , .b(c27) , .cin(s29) , .s(s40) , .cout(c40));
      
      half_adder HA10(.a(c15) , .b(c29) , .s(s41) , .cout(c41));
      
      half_adder HA11(.a(c16) , .b(c30) , .s(s42) , .cout(c42));
      
      
      //stage4
      
      half_adder HA12(.a(c33) , .b(s34) , .s(s43) , .cout(c43));
      
      half_adder HA13(.a(c34) , .b(s35) , .s(s44) , .cout(c44));
      
      half_adder HA14(.a(c35) , .b(s36) , .s(s45) , .cout(c45));
      
      full_adder FA32(.a(c36) , .b(s37) , .cin(s24) , .s(s46) , .cout(c46));
      
      full_adder FA33(.a(c37) , .b(s38) , .cin(s26) , .s(s47) , .cout(c47));
      
      full_adder FA34(.a(c38) , .b(s39) , .cin(s28) , .s(s48) , .cout(c48));
      
      full_adder FA35(.a(c39) , .b(s40) , .cin(c28) , .s(s49) , .cout(c49));
      
      full_adder FA36(.a(c40) , .b(s41) , .cin(s30) , .s(s50) , .cout(c50));
      
      full_adder FA37(.a(c41) , .b(s42) , .cin(s31) , .s(s51) , .cout(c51));
      
      full_adder FA38(.a(c42) , .b(c31) , .cin(s32) , .s(s52) , .cout(c52));
      
      half_adder HA15(.a(c32) , .b(pp[7][7]) , .s(s53) , .cout(c53));
      
      //stage5 ripple carry adder
      half_adder HA16(.a(c43) , .b(s44) , .s(s54) , .cout(c54));
      
      full_adder FA39(.a(c44) , .b(s45) , .cin(c54) , .s(s55) , .cout(c55));
      full_adder FA40(.a(c45) , .b(s46) , .cin(c55) , .s(s56) , .cout(c56));
      full_adder FA41(.a(c46) , .b(s47) , .cin(c56) , .s(s57) , .cout(c57));
      full_adder FA42(.a(c47) , .b(s48) , .cin(c57) , .s(s58) , .cout(c58));
      full_adder FA43(.a(c48) , .b(s49) , .cin(c58) , .s(s59) , .cout(c59));
      full_adder FA44(.a(c49) , .b(s50) , .cin(c59) , .s(s60) , .cout(c60));
      full_adder FA45(.a(c50) , .b(s51) , .cin(c60) , .s(s61) , .cout(c61));
      full_adder FA46(.a(c51) , .b(s52) , .cin(c61) , .s(s62) , .cout(c62));
      full_adder FA47(.a(c52) , .b(s53) , .cin(c62) , .s(s63) , .cout(c63));
      
      half_adder HA17(.a(c53) , .b(c63) , .s(s64) , .cout(c64));
      
      //final result 
      assign z[0]= pp[0][0];
      assign z[1]= s1;
      assign z[2]= s17;
      assign z[3]= s33;
      assign z[4]= s43;
      assign z[5]= s54;
      assign z[6]= s55;
      assign z[7]= s56;
      assign z[8]= s57;
      assign z[9]= s58;
      assign z[10]= s59;
      assign z[11]= s60;
      assign z[12]= s61;
      assign z[13]= s62;
      assign z[14]= s63;
      assign z[15]= s64;
endmodule
