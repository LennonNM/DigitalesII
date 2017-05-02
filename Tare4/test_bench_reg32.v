`include "registro32.v"
`include "probador32.v"

module test_bench;

  wire S_OUT, CLK, ENB, DIR, S_IN;
	wire [31:0] Q, D;
	wire [1:0] MODO;

	registro32 registro_32(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);
	probador32 prueba_32(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);

	initial
	    begin
		    $dumpfile("registro.vcd");
			$dumpvars;
		end

endmodule
