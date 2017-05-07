`timescale 1ns/1ps

module BUF(A, Y);
input A;
output Y;
assign Y = A;
endmodule

module NOT(A, Y);
input A;
output reg Y;
always @ ( * ) begin //retardo 3.1 ns
	#3.1 Y = ~A;
end
endmodule

module NAND(A, B, Y);
input A, B;
output reg Y;
always @ ( * ) begin
	#3.7 Y = ~(A & B); //retardo 3.7 ns
end
endmodule

module NOR(A, B, Y);
input A, B;
output reg Y;
always @ ( * ) begin
	#10 Y = ~(A | B); //retardo 10 ns
end
endmodule

module DFF(C, D, Q);
input C, D;
output reg Q;
always @(posedge C)
	#48 Q <= D; //retardo 48 ns
endmodule

module DFFSR(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		Q <= 1'b1;
	else if (R)
		Q <= 1'b0;
	else
		Q <= D;
endmodule
