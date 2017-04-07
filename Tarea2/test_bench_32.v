`include "reg_desp_32.v"
`include "probador_32.v"

module test_bench;

  wire S_OUT, CLK, ENB, DIR, S_IN;
	wire [31:0] Q, D;
	wire [1:0] MODO;

	reg_desp_32 reg32(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);
	probador_32 prueba4(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);

	initial
	    begin
		    $dumpfile("registro32.vcd");
			$dumpvars;
		end

endmodule
