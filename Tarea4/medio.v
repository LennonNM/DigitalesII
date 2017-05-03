//`include "MUX.v"

`timescale 1ns/1ps
/*Corresponde a la seleccion del bit de entrada para el bloque de Q0*/
module medio (input DIR, izq, der, output IN );

//Declaración de cables de conexion para cada MUX
wire wIN, wDIR;
//entradas
wire wizq, wder;

assign wDIR = DIR;
assign wder = der;
assign wizq = izq;

MUX mux1(.S(wDIR), .I1(wder), .I2(wizq), .Y(wIN));

endmodule //
