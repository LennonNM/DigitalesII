`include "estructural/bloque.v"
`include "estructural/derecha.v"
`include "estructural/izquierda.v"
`include "estructural/MUX.v"

module registro4 (CLK, ENB, DIR, S_IN, MODO, D, Q, S_OUT);

  //Entradas/Salidas generales, para interaccion externa
  input CLK, ENB, DIR, S_IN;
  input [1:0] MODO;
  input [3:0] D;
  output [3:0] Q;
  output reg S_OUT;
  //Cables entradas/salidas generales
  wire wCLK, wENB, wDIR, wS_IN;
  wire [1:0] wMODO;
  wire [3:0] wQ;
  //Cables entradas bloques
  wire wQ0IN, wQ1IN, wQ2IN, wQ3IN; //Conectados a salida IN de los muxes
  wire wD0, wD1, wD2, wD3;
  //Cables salidas bloques
  wire wQ0, wQ1, wQ2, wQ3; //Con estos se observa los bits del estado actual
  //Bypass control flujo en Medio
  wire [1:0] wMODOM;
  assign wMODOM = {wMODO[1],1'b1};

  assign wD0 = D[0];
  assign wD1 = D[1];
  assign wD2 = D[2];
  assign wD3 = D[3];

  assign wQ = {wQ3,wQ2,wQ1,wQ0};
  assign Q = wQ;

  assign wENB = ENB;
  assign wCLK = CLK;
  assign wMODO = MODO;
  assign wDIR = DIR;
  assign wS_IN = S_IN;


  //Bloque mas a la derecha
  bloque Q0(.CLK(wCLK), .IN(wQ0IN), .ENB(wENB), .Qr(wQ0));
  derecha MQ0(.DIR(wDIR), .MODO(wMODO), .Di(wD0), .S_IN(wS_IN), .izq(wQ1), .der(wQ3), .IN(wQ0IN));
  //Bloques del Medio
  bloque Q1(.CLK(wCLK), .IN(wQ1IN), .ENB(wENB), .Qr(wQ1));
  derecha MQ1(.DIR(wDIR), .MODO(wMODOM), .Di(wD1), .S_IN(wS_IN), .izq(wQ2), .der(wQ0), .IN(wQ1IN));
  bloque Q2(.CLK(wCLK), .IN(wQ2IN), .ENB(wENB), .Qr(wQ2));
  derecha MQ2(.DIR(wDIR), .MODO(wMODOM), .Di(wD2), .S_IN(wS_IN), .izq(wQ3), .der(wQ1), .IN(wQ2IN));
  //Bloque mas a la izquierda
  bloque Q3(.CLK(wCLK), .IN(wQ3IN), .ENB(wENB), .Qr(wQ3));
  izquierda MQ3(.DIR(wDIR), .MODO(wMODO), .Di(wD3), .S_IN(wS_IN), .izq(wQ0), .der(wQ2), .IN(wQ3IN));
  //Bit desplazado registro total S_OUT
  MUX MOUT(.S(DIR), .I1(wQ3), .I2(wQ0), .Y(wS_OUT));

always @ ( posedge CLK ) begin
  S_OUT <= wS_OUT;
end
	initial
	    begin
		    $dumpfile("registro4.vcd");
			$dumpvars;
		end

endmodule
