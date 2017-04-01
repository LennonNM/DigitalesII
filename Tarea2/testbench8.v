//`include "reg_desp_32.v"

module test_bench;

  wire S_OUT8, CLK8, ENB8, DIR8, S_IN8;
	wire [7:0] Q8, D8;
	wire [1:0] MODO8;

	reg8 registro8(Q8, S_OUT8, CLK8, ENB8, DIR8, S_IN8, MODO8, D8);
  probador8 prueba(Q8, S_OUT8, CLK8, ENB8, DIR8, S_IN8, MODO8, D8);

	initial
	    begin
		    $dumpfile("registro8.vcd");
			$dumpvars;
		end

endmodule
