`include "estructural/NAND.v"
`include "estructural/INV.v"
`include "estructural/NOR.v"
`include "estructural/FF.v"

/* Descripción del bloque mínimo del registro de 4 bits
Consta de un registro desplazable de 1 bit. La frecuencia máxima de operación
queda definida por la suma de los retardos en las líneas de datos desde las
entradas del bloque hasta le entrada del FF, utilizando los retardos típicos.

Retardos:
  IN - NAND+INV+NOR+INV = 3.7+3.1+10+3.1 = 19.9 ns
  ENB - IN = 19.9 ns
        INV+NAND+INV+NOR+INv = INV+IN = 23 ns
Sin embargo, por el FF la salida Q no se verá hasta 48 ns después del flanco
positivo del reloj. Como este Q se propaga entre los registros como el bit
anterior (OUT), se debe considerar este retardo en la frecuencia de operación.

Para el peor caso: 23 + 48 = 71 ns
Es decir, la distancia mínima entre un flanco positivo del reloj y el siguiente
debe ser mayor a 71 ns
  */

  `timescale 1ns/1ps

  module bloque (input CLK, input IN, input ENB, output Qr);

  //Registro de salida del bit de estado actual
  reg Qr;
  //Cables de las entradas y salidas del registro individual
  wire wCLK, wIN, wENB, wQr;//wQr lleva de Qr a la compuerta NAND2
  //Cables conexiones entre las compuertas y FF
  wire wINV1, wNORA, wINV4O, wINV2, wINV4, wINV3, wINV2O;
  wire wNCLR;

  always @ ( * ) begin
  //Asignacion del cable wQr salida del FF a salida Qr del registro
    Qr <= wQr;
  end

  //Asignacion de cables con entradas/salidas
  assign wNCLR = 1'b1; //Para tener el CLR negado del FF inactivo siempre
  assign wENB = ENB;
  assign wCLK = CLK;
  assign wIN = IN;

  NAND_e nand1(.A(wIN), .B(wENB),.Y(wINV1)),
       nand2(.A(wINV3), .B(wQr), .Y(wINV4));
  NOR_e nor1(.A(wNORA), .B(wINV4O), .Y(wINV2));
  INV_e inv1(.A(wINV1),.Y(wNORA)), inv2(.A(wINV2), .Y(wINV2O)),
      inv3(.A(wENB), .Y(wINV3)), inv4(.A(wINV4), .Y(wINV4O));
  FF_e ff1(.NCLR(wNCLR), .CLK(wCLK), .D(wINV2O), .Q(wQr));

  endmodule //
