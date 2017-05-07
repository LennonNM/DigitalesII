`include "conductual/reg_con.v"
`include "conductual/mux.v"
`include "conductual/mux4.v"

module reg_conductual(Q32, S_OUT32, CLK32, ENB32, DIR32, S_IN32, MODO32, D32);

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
    //assign wMODO32 = MODO32;
    assign wMODO32 = (MODO32[1])?MODO32:2'b0; /*Inhabilita la lectura de modo
                                            rotacion circular a los registros*/
    assign wD32 = D32;
    //Cables transferencia datos
    assign wR8Q0 = wQ32[0];
    assign wR8Q3 = wQ32[3];
    assign wR7Q0 = wQ32[4];
    assign wR7Q3 = wQ32[7];
    assign wR6Q0 = wQ32[8];
    assign wR6Q3 = wQ32[11];
    assign wR5Q0 = wQ32[12];
    assign wR5Q3 = wQ32[15];
    assign wR4Q0 = wQ32[16];
    assign wR4Q3 = wQ32[19];
    assign wR3Q0 = wQ32[20];
    assign wR3Q3 = wQ32[23];
    assign wR2Q0 = wQ32[24];
    assign wR2Q3 = wQ32[27];
    assign wR1Q0 = wQ32[28];
    assign wR1Q3 = wQ32[31];

 //Inicio registros (Registro1)
  mux_con mOUT(wR1Q3, wR8Q0, wDIR32, wS_OUT32);
	reg_con reg1(wQ32[31:28], , wCLK32, wENB32, wDIR32, wR1SIN, wMODO32, wD32[31:28]);
 //Intermedio (Registros 2 al 7)
  mux4_con m1(wR2Q3, wS_IN32, wR2Q3, wR8Q0, wDIR32, MODO32, wR1SIN);
  reg_con reg2(wQ32[27:24], , wCLK32, wENB32, wDIR32, wR2SIN, wMODO32, wD32[27:24]);
  mux_con m2(wR3Q3, wR1Q0, wDIR32, wR2SIN);
  reg_con reg3(wQ32[23:20], , wCLK32, wENB32, wDIR32, wR3SIN, wMODO32, wD32[23:20]);
  mux_con m3(wR4Q3, wR2Q0, wDIR32, wR3SIN);
  reg_con reg4(wQ32[19:16], , wCLK32, wENB32, wDIR32, wR4SIN, wMODO32, wD32[19:16]);
  mux_con m4(wR5Q3, wR3Q0, wDIR32, wR4SIN);
  reg_con reg5(wQ32[15:12], , wCLK32, wENB32, wDIR32, wR5SIN, wMODO32, wD32[15:12]);
  mux_con m5(wR6Q3, wR4Q0, wDIR32, wR5SIN);
  reg_con reg6(wQ32[11:8], , wCLK32, wENB32, wDIR32, wR6SIN, wMODO32, wD32[11:8]);
  mux_con m6(wR7Q3, wR5Q0, wDIR32, wR6SIN);
  reg_con reg7(wQ32[7:4], , wCLK32, wENB32, wDIR32, wR7SIN, wMODO32, wD32[7:4]);
  mux_con m7(wR8Q3, wR6Q0, wDIR32, wR7SIN);
  //Final registros (Registro8)
  reg_con reg8(wQ32[3:0], , wCLK32, wENB32, wDIR32, wR8SIN, wMODO32, wD32[3:0]);
  mux4_con m8(wS_IN32, wR7Q0, wR1Q3, wR7Q0, wDIR32, MODO32, wR8SIN);

endmodule
