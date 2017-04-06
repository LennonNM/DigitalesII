`include "NAND.v"
`include "INV.v"
`include "NOR.v"
`include "MUX.v"
`include "FF.v"

module test_bench;

  //NAND
  wire A_NAND, B_NAND, Y_NAND;
  //NOR
  wire A_NOR, B_NOR, Y_NOR;
  //INV
  wire A_INV, Y_INV;
  //MUX
  wire wS, wI1, wI2, Y_MUX;
  //FF
  wire wNCLR, wCLK, wD, wQ;

  NAND nand1(.A(A_NAND), .B(B_NAND), .Y(Y_NAND));
  NOR nor1(.A(A_NOR), .B(B_NOR), .Y(Y_NOR));
  INV inv1(.A(A_INV), .Y(Y_INV));
  MUX mux1(.S(wS), .I1(wI1), .I2(wI2), .Y(Y_MUX));
  FF ff1(.NCLR(wNCLR), .CLK(wCLK), .D(wD), .Q(wQ));
	probador libreria();

	initial
	    begin
		    $dumpfile("libreria.vcd");
			$dumpvars;
		end

endmodule
