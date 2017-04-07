/* Se encarga de verificar cuando la señal de entrada al FF viola los
tiempos de setup o hold.

Tiempo de set-up a Vcc = 4.5 V, tanto para Data como para ~CLR
  tsu = 30 ns
Tiempo en hold para Vcc = 4.5 V
  th = 0 ns

El FF actúa justo en el flanco positivo del CLK y debe mantener la señal estable
duranto t_hold, como en este caso t_hold = 0 s, no es necesario revosarñe.
La señal de entrada al FF debe mantenerse estable un t_Setup antes del flanco
positivo de CLK, si cambia duarante t_setup antes del flanco positivo de CLK, se
comete una violación:
  t_CLK - t_Evento > t_SetUp = 30 ns
*/

`timescale 1ns/1ps

module vigilador(input CLK, input D_FF, output Alarm);

reg Alarm;
integer tCLK, tD;
wire [31:0] wW;
assign wW = tCLK - tD;

//Verificacion del tiempo set-up
always @ ( posedge CLK ) begin
  tCLK <= $realtime;
  if((tCLK - tD) < 32'd30) begin
    Alarm <= 1'b1;
  end else begin
    Alarm <= 1'b0;
  end
end

always @ ( D_FF ) begin
  tD <= $realtime;
end

endmodule
