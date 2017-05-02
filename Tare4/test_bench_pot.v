`include "registro32.v"
`include "probador_pot.v"

module test_bench;

  wire S_OUT, CLK, ENB, DIR, S_IN;
	wire [31:0] Q, D;
	wire [1:0] MODO;

	registro32 registro32pot(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);
	probador_pot prueba_pot(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);

	initial
	    begin
		    $dumpfile("registro.vcd");
			$dumpvars;
		end

endmodule
