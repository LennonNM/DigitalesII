//`include "MUX.v"

`timescale 1ns/1ps
/*Corresponde a la seleccion del bit de entrada para el bloque de Q0*/
module derecha (input DIR, Di, S_IN, izq, der,
                input [1:0] MODO,
                output IN );

//Declaración de cables de conexion para cada MUX
wire wIN, wDIR, wDi; //Di es el bit de D correspondiente al bloque
wire wMODO1, wMODO0; //Separando cada bit de MODO
//Salidas muxes
wire wM2, wM3, wM4;
//entradas
wire wS_IN, wizq, wder;

assign IN = wIN;
assign wDIR = DIR;
assign wMODO1 = MODO[1];
assign wMODO0 = MODO[0];
assign wDi = Di;
assign wS_IN = S_IN;
assign wder = der;
assign wizq = izq;

MUX mux1(.S(wMODO1), .I1(wDi), .I2(wM2), .Y(wIN)),
    mux2(.S(wMODO0), .I1(wM4), .I2(wM3), .Y(wM2)),
    mux3(.S(wDIR), .I1(wS_IN), .I2(wizq), .Y(wM3)),
    mux4(.S(wDIR), .I1(wder), .I2(wizq), .Y(wM4));

endmodule //
