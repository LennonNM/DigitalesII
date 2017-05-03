`include "registro4.v"
`include "probador.v"

module test_bench ();

  wire wCLK, wENB, wOUT, wDIR, wS_IN, wS_OUT;
  wire [1:0] wMODO;
  wire [3:0] wD, wQ;


  probador reg4(.CLK(wCLK), .S_IN(wS_IN), .ENB(wENB), .DIR(wDIR), .MODO(wMODO), .D(wD));
  registro4 reg4v2(.CLK(wCLK), .ENB(wENB), .DIR(wDIR), .S_IN(wS_IN), .MODO(wMODO), .D(wD), .Q(wQ), .S_OUT(wS_OUT));

	initial
	    begin
		    $dumpfile("registro4.vcd");
			$dumpvars;
		end

endmodule
