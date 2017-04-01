`include "reg_desp.v"
`include "mux.v"

module reg_desp_32(Q32, S_OUT32, CLK32, ENB32, DIR32, S_IN32, MODO32, D32);

	//Declarando entradas y salidas
    input CLK32, ENB32, DIR32, S_IN32;
    input [1:0] MODO32;
    input [31:0] D32;
    output [31:0] Q32;
    output S_OUT32;
  //Declarando cables internos
    //Q's
    wire wR1Q0, wR1Q3, wR2Q0, wR2Q3, wR3Q0, wR3Q3, wR4Q0;
    wire wR4Q3, wR5Q0, wR5Q3, wR6Q0, wR6Q3, wR7Q0, wR7Q3;
    wire wR8Q0, wR8Q3;
    //S_IN's
    wire wR1SIN, wR2SIN, wR3SIN, wR4SIN, wR5SIN;
    wire wR6SIN, wR7SIN, wR8SIN;
    //Parametros registro 32 b
    wire wS_OUT32, wCLK32, wENB32, wDIR32, wS_IN32;
    wire [31:0] wQ32, wD32;
    wire [1:0] wMODO32;

  //Asignacion de los Cables
    //Salidas
    assign Q32[31:0] = wQ32[31:0];
    assign S_OUT32 = wS_OUT32;
    //Entradas
    assign wCLK32 = CLK32;
    assign wENB32 = ENB32;
    assign wDIR32 = DIR32;
    assign wS_IN32 = S_IN32;
    assign wMODO32 = MODO32;
    assign wD32 = D32;
    //Cables transferencia datos
    assign wR8Q0 = wQ8[0];
    assign wR8Q3 = wQ8[3];
    assign wR7Q0 = wQ8[4];
    assign wR7Q3 = wQ8[7];
    assign wR6Q0 = wQ8[8];
    assign wR6Q3 = wQ8[11];
    assign wR5Q0 = wQ8[12];
    assign wR5Q3 = wQ8[15];
    assign wR4Q0 = wQ8[16];
    assign wR4Q3 = wQ8[19];
    assign wR3Q0 = wQ8[20];
    assign wR3Q3 = wQ8[23];
    assign wR2Q0 = wQ8[24];
    assign wR2Q3 = wQ8[27];
    assign wR1Q0 = wQ8[28];
    assign wR1Q3 = wQ8[31];

 //Inicio registros (Registro1)
  mux mOUT(wR1Q3, wR8Q0, wDIR32, wS_OUT32);
	reg_desp reg1(wQ32[31:28], /*vacio*/, wCLK32, wENB32, wDIR32, wR1SIN, wMODO32, wD32[31:28]);
 //Intermedio (Registros 2 al 7)
  mux m1(wR2Q3, wS_IN32, wDIR32, wR1SIN);
  reg_desp reg2(wQ32[27:24], /*vacio*/, wCLK32, wENB32, wDIR32, wR2SIN, wMODO32, wD32[27:24]);
  mux m2(wR3Q3, wR1Q0, wDIR32, wR2SIN);
  reg_desp reg3(wQ32[23:20], /*vacio*/, wCLK32, wENB32, wDIR32, wR2SIN, wMODO32, wD32[23:20]);
  mux m3(wR4Q3, wR2Q0, wDIR32, wR3SIN);
  reg_desp reg4(wQ32[19:16], /*vacio*/, wCLK32, wENB32, wDIR32, wR2SIN, wMODO32, wD32[19:16]);
  mux m4(wR5Q3, wR3Q0, wDIR32, wR4SIN);
  reg_desp reg5(wQ32[15:12], /*vacio*/, wCLK32, wENB32, wDIR32, wR2SIN, wMODO32, wD32[15:12]);
  mux m5(wR6Q3, wR4Q0, wDIR32, wR5SIN);
  reg_desp reg6(wQ32[11:8], /*vacio*/, wCLK32, wENB32, wDIR32, wR2SIN, wMODO32, wD32[11:8]);
  mux m6(wR7Q3, wR5Q0, wDIR32, wR6SIN);
  reg_desp reg7(wQ32[7:4], /*vacio*/, wCLK32, wENB32, wDIR32, wR2SIN, wMODO32, wD32[7:4]);
  mux m7(wR8Q3, wR6Q0, wDIR32, wR7SIN);
  //Final registros (Registro8)
  reg_desp reg8(wQ32[3:0], /*vacio*/, wCLK32, wENB32, wDIR32, wR8SIN, wMODO32, wD32[3:0]);
  mux m8(wS_IN32, wR7Q0, wDIR32, wR8SIN);

endmodule
