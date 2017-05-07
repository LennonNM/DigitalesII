/*Componente: SN74LS02 Quadruple 2-Input Positive-NOR Gates
	Costo: Parte SN74LS02D a $0.22, 1000 unidades.
  Tiempos de propagación de entradas A, B hacia salida Y de la compuerta
  SN74LS02D, para C_load = 15 pF y Vcc = 5 V ± 0.5 V:
    t_min = - ns
    t_typ = 10 ns
    t_max = 15 ns
    segun  la hoja del fabricante, los rangos de tiempos son iguales para paso
    de nivel bajo a alto como de alto a bajo.
  */
  `timescale 1ns/1ps

  //Definicion de los retardos para la compuerta NOR
  `define tpdmin_nor 1 //Hoja del fabricante no especifica,
                        //se puso arbitrariamente*/
  `define tpdtyp_nor 10
  `define tpdmax_nor 15

  module NOR_e (input A, input B, output Y);

    integer cont_nor = 0;

    assign /*#(`tpdmin_nor:`tpdtyp_nor:`tpdmax_nor)*/ #(1:10:15) Y = ~|{A,B};

    //Se consume energía en las transiciones de 0 a 1 de la salida
    always @ ( posedge Y ) begin
      cont_nor = cont_nor +1;
    end


  endmodule
