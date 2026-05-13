`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2026 09:57:54 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
input logic [3:0] A,
input logic [3:0] B,
input logic [3:0] op, 
output logic [7:0] Y //15x15=255=11111111 nên 8bit
    );
always_comb begin
case(op)
4'b0000: Y = A + B;
4'b0001: Y = A - B;
4'b0010: Y = A * B;
4'b0011: if(B != 0) begin Y = A / B; end else begin Y = 'x; end   
4'b0100: Y = ~A;
4'b0101: Y = A & B;
4'b0110: Y = A | B;
4'b0111: Y = ~(A | B);
4'b1000: Y = ~(A & B);
4'b1001: Y = A ^ B;
4'b1010: Y = A ~^ B;
default: Y = '0;
endcase
end 
endmodule
