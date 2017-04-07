`include "NAND.v"
`include "INV.v"
`include "NOR.v"
`include "MUX.v"
`include "FF.v"
`include "probador.v"
`include "vigilador.v"

module test_bench ();

  //Entradas compuertas logicas
  wire wA, wB;
  //MUX
  wire wS, wI1, wI2, Y_MUX;
  //FF
  wire wNCLR, wCLK, wD, wQ;
  //Salidas compuertas
  wire wNAND, wNOR, wINV;
  //Alarma
  wire wAlarm;

  NAND nand1(.A(wA), .B(wB), .Y(wNAND));
  NOR nor1(.A(wA), .B(wB), .Y(wNOR));
  INV inv1(.A(wA), .Y(wINV));
  MUX mux1(.S(wS), .I1(wI1), .I2(wI2), .Y(Y_MUX));
  FF ff1(.NCLR(wNCLR), .CLK(wCLK), .D(wD), .Q(wQ));
	probador libreria(.A(wA), .B(wB), .S(wS), .I1(wI1), .I2(wI2), .NCLR(wNCLR), .CLK(wCLK), .D(wD));
  vigilador prueba(.CLK(wCLK), .D_FF(wD), .Alarm(wAlarm));

	initial
	    begin
		    $dumpfile("libreria.vcd");
			$dumpvars;
		end

endmodule
