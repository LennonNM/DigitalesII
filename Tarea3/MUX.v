/*Componente: 74AUP1G157 Low-power 2-input multiplexer
	Costo: Parte 74AUP1G157GF a $0.5463, la unidad.
  La Hoja del Fabricante pone solo un tiempo de propagacion para describir el paso
  de la señal desde alguna de las entradas a la salida, para C_load = 15 pF y
  Vcc = 3 V a 3.6 V:
    t_min = 1.p ns
    t_typ = 3.2 ns
    t_max = 4.5 ns
    segun  la hoja del fabricante, los rangos de tiempos son iguales para paso
    de nivel bajo a alto como de alto a bajo.
*/
`timescale 1ns/1ps

//Definicion de los retardos para el Mux
`define tpdmin_nand 1
`define tpdtyp_nand 3.7
`define tpdmax_nand 6.5

module MUX (input S, input I1, input I2, output Y);

  integer cont_mux = 0;

  assign #(`tpdmin_mux:`tpdtyp_mux:`tpdmax_mux) Y = (S) ? I1:I2;

  //Se consume energía en las transiciones de 0 a 1 de la salida
  always @ ( posedge Y ) begin
    cont_mux = cont_mux +1;
  end


endmodule
