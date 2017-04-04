/*Componente: Sn54HC273 Octal D-Type Flip-Flops With Clear
	Costo: Parte SN54HC273J a $5.96, 100 unidades.
  La Hoja del Fabricante pone solo un tiempo de propagacion para describir el paso
  de la señal tanto de ~CLR como de CLK hacia alguna salida, para C_load = 50 pF
  y Vcc = 4.5 V:
    t_min y t_typ no se mencionan
    t_max = 48 ns
    segun  la hoja del fabricante, los rangos de tiempos son iguales para paso
    de nivel bajo a alto como de alto a bajo.

  Tiempo de set-up a Vcc = 4.5 V, tanto para Data como para ~CLR
    tsu = 30 ns
  Tiempo en hold para Vcc = 4.5 V
    th = 0 ns
  */
  `timescale 1ns/1ps

  //Definicion de los retardos para el Mux
  //`define tpdmin_ff No se mencionan
  //`define tpdtyp_ff
  `define tpdmax_ff 48

  module MUX (input NCLR, input CLK, input D, output Q);

    integer cont_ff = 0;
    reg Q0, Q;

    always @ ( * ) begin
            if (NCLR == 1'b0) begin //~CLR asincrono
              Q <= 1'b0;
            end
            else begin
              if (CLK == 1'b0) begin
                Q <= Q0;
              end
            end
    end
    always @ ( posedge CLK ) begin
          Q <= D;
    end

    //Se consume energía en las transiciones de 0 a 1 de la salida
    always @ ( posedge Q ) begin
      cont_ff = cont_ff +1;
    end


  endmodule
