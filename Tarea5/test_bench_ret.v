`include "conductual/reg_desp_32.v"
`include "cmos_r/reg_32_cmos_r.v"
`include "probador_ret.v"
`include "verificador_r.v"
`timescale 1ns/1ps

module test_bench ();

  wire wCLK, wENB, wOUT, wDIR, wS_IN, wS_OUT, wALERTA;
  wire [1:0] wMODO;
  wire [31:0] wD, wQcon, wQgen;


  probador_con comp(.CLK(wCLK), .S_IN(wS_IN), .ENB(wENB), .DIR(wDIR), .MODO(wMODO), .D(wD));
  reg_conductual reg32con(.CLK32(wCLK), .ENB32(wENB), .DIR32(wDIR), .S_IN32(wS_IN), .MODO32(wMODO), .D32(wD), .Q32(wQcon), .S_OUT32(wS_OUT));
  reg_desp_32 reg32gen(.CLK32(wCLK), .ENB32(wENB), .DIR32(wDIR), .S_IN32(wS_IN), .MODO32(wMODO), .D32(wD), .Q32(wQgen), .S_OUT32(wS_OUT));
  verificador_r ver(.CLK(wCLK), .Qe(wQcon), .Qc(wQgen), .ALERTA(wALERTA));

	initial
	    begin
		    $dumpfile("registro.vcd");
			$dumpvars;
		end

endmodule
