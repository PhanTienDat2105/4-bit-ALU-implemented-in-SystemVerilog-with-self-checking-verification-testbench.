`timescale 1ns / 1ps



module testALU;
logic [3:0] A;
logic [3:0] B;
logic [3:0] op; 
logic [7:0] Y;
logic [7:0] expected_Y;

ALU dut( 
.A(A), .B(B), .op(op), .Y(Y)
);

class alu;
rand bit A;
rand bit B;
rand bit op;
endclass

alu t;
initial begin
t = new();
repeat(80) begin
t.randomize();
A = t.A;
B = t.B;
op = t.op;
#10;
case(op)
4'b0000: expected_Y = A + B;
4'b0001: expected_Y = A - B;
4'b0010: expected_Y = A * B;
4'b0011: if(B != 0) begin expected_Y = A / B; end else begin expected_Y = 'x; end   
4'b0100: expected_Y = ~A;
4'b0101: expected_Y = A & B;
4'b0110: expected_Y = A | B;
4'b0111: expected_Y = ~(A | B);
4'b1000: expected_Y = ~(A & B);
4'b1001: expected_Y = A ^ B;
4'b1010: expected_Y = A ~^ B;
default: expected_Y = '0;
endcase

assert ( Y == expected_Y)
$display("Yes time = %0t A = %b B = %b op = %b Y = %b expected_Y = %b",$time, A,B,op,Y,expected_Y);
else
$error("No time = %0t A = %b B = %b op = %b Y = %b expected_Y = %b",$time, A,B,op,Y,expected_Y);
end
end
endmodule
