`include "estructural/registro32.v"
`include "cmos_r/reg_32_cmos_r.v"
`include "probador_est.v"
`include "verificador_r.v"

module test_bench ();

  wire wCLK, wENB, wOUT, wDIRe, wDIRc, wS_IN, wS_OUT, wALERTA;
  wire [1:0] wMODO;
  wire [31:0] wD, wQe, wQc;


  probador_comp comp(.CLK(wCLK), .S_IN(wS_IN), .ENB(wENB), .DIRe(wDIRe), .DIRc(wDIRc), .MODO(wMODO), .D(wD));
  registro32 reg32e(.CLK32(wCLK), .ENB32(wENB), .DIR32(wDIRe), .S_IN32(wS_IN), .MODO32(wMODO), .D32(wD), .Q32(wQe), .S_OUT32(wS_OUT));
  reg_desp_32 reg32c(.CLK32(wCLK), .ENB32(wENB), .DIR32(wDIRc), .S_IN32(wS_IN), .MODO32(wMODO), .D32(wD), .Q32(wQc), .S_OUT32(wS_OUT));
  verificador_r ver(.CLK(wCLK), .Qe(wQe), .Qc(wQc), .ALERTA(wALERTA));

	initial
	    begin
		    $dumpfile("registro4.vcd");
			$dumpvars;
		end

endmodule
