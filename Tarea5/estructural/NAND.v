/*Componente: SN54AHC00 Quadruple 2-Input Positive-NAND Gates
	Costo: Parte SN74AHC00D a $0.08, 1000 unidades.
  Tiempos de propagación de entradas A, B hacia salida Y de la compuerta
  SN54AHC00, para C_load = 15 pF y Vcc = 5 V ± 0.5 V:
    t_min = 1 ns
    t_typ = 3.7 ns
    t_max = 6.5 ns
    segun  la hoja del fabricante, los rangos de tiempos son iguales para paso
    de nivel bajo a alto como de alto a bajo.
*/
`timescale 1ns/1ps

//Definicion de los retardos para la compuerta NAND
//`define tpdmin_nand 1
//`define tpdtyp_nand 3.7
//`define tpdmax_nand 6.5

module NAND_e (input A, input B, output Y);

  integer cont_nand = 0;

  assign /*#(`tpdmin_nand:`tpdtyp_nand:`tpdmax_nand)*/ #(1:3.7:6.5) Y = ~&{A,B};

  //Se consume energía en las transiciones de 0 a 1 de la salida
  always @ ( posedge Y ) begin
    cont_nand = cont_nand +1;
  end


endmodule
