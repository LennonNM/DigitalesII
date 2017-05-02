  `timescale 1ns/1ps
/*Se encarga de comparar las señales de salida Q de los registros desplazables
de 32 bits, para verificar su funcionamiento entre el diseñado por descripcion
estructural respecto al por descripcion conductual.
Se toma en cuenta el retardo de la salida del registro por descripcion estructural
con respecto al flanco positivo del la señal del reloj (48 ns).
Pone el alto ALERTA indicando que no se cumple la equivalencia de operacion.
*/

module verificador (CLK, Qe, Qc, ALERTA);

  input CLK;
  input [31:0] Qe, Qc;
  integer tCLK;
  output reg ALERTA;

  always @ ( posedge CLK ) begin
    #48 tCLK <= 1'b1;
  end

  always @ ( tCLK ) begin
    if (Qe != Qc) begin
      ALERTA <= 1'b1;
      end else begin
      ALERTA <=1'b0;
      end
      tCLK <= 1'b0;
  end

endmodule //
