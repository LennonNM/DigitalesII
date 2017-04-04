/*Componente: SN74LVC1G14 Single Schmitt-Trigger Inverter
	Costo: Parte SN74LVC1G14DBVRE4 a $0.22, 1000 unidades.
  Tiempos de propagación de la entrada A hacia salida Y de la compuerta
  SN54AHC00, para C_load = 15 pF y Vcc = 5 V ± 0.5 V:
    t_min = 1.2 ns
    t_typ = - ns
    t_max = 5 ns
    segun  la hoja del fabricante, los rangos de tiempos son iguales para paso
    de nivel bajo a alto como de alto a bajo.
  */
  `timescale 1ns/1ps

  //Definicion de los retardos para el inversor
    `define tpdmin_inv 1.2
    //`define tpdtyp_inv Hoja del fabricante no especifica
    `define tpdmax_inv 5

  module NAND (input A, output Y);

    integer cont_inv = 0;

    assign #(`tpdmin_inv:`tpdmax_inv) Y = ~A;

    //Se consume energía en las transiciones de 0 a 1 de la salida
    always @ ( posedge Y ) begin
      cont_inv = cont_inv +1;
    end
