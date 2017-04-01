//`include "reg_desp.v"

module test_bench;


  wire S_OUT, CLK, ENB, DIR, S_IN;
	wire [3:0] Q, D;
	wire [1:0] MODO;

	reg_desp reg4(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);
	probador prueba4(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);

	initial
	    begin
		    $dumpfile("registro4.vcd");
			$dumpvars;
		end

endmodule
