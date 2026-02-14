`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.02.2026 18:54:40
// Design Name: 
// Module Name: eight_bit_wallace_tree_tb
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


module eight_bit_wallace_tree_tb();
    reg [7:0] a;
    reg [7:0] b;
    wire [15:0] z;
    
    
    eight_bit_wallace_tree dut(.a(a) , .b(b) , .z(z));
    
    initial begin
        
        repeat(50) begin
            a=$random() & 8'hff;
            b=$random() & 8'hff;
            #10;
            if (z != a*b) begin
                $display("Error a=%0d b=%0d" , a,b);
                $stop;
            end
        end
        $display("All test cases passed");
        #20 $finish;
    end

     
endmodule
