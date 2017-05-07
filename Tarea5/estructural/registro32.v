`include "estructural/registro4.v"
//`include "MUX.v"
//`include "derecha.v"
//`include "izquierda.v"

module registro32(Q32, S_OUT32, CLK32, ENB32, DIR32, S_IN32, MODO32, D32);

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
    //IN's de cada registro4
    wire wR1IN, wR2IN, wR3IN, wR4IN, wR5IN;
    wire wR6IN, wR7IN, wR8IN;
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
                                            rotacion circular para los registros
                                            del medio*/
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

    //Control S_OUT
  MUX mOUT(.I1(wR1Q3), .I2(wR8Q0), .S(wDIR32), .Y(wS_OUT32));
   //Inicio registros (Registro1)
	registro4 reg1(.CLK(wCLK32), .ENB(wENB32), .DIR(wDIR32), .S_IN(wR1SIN), .MODO(wMODO32), .D(wD32[31:28]), .Q(wQ32[31:28]));
  izquierda m1(.der(wR2Q3), .izq(wR8Q0), .S_IN(wS_IN32), .DIR(wDIR32), .MODO(MODO32), .IN(wR1SIN));
   //Intermedio (Registros 2 al 7)
  registro4 reg2(.CLK(wCLK32), .ENB(wENB32), .DIR(wDIR32), .S_IN(wR2SIN), .MODO(wMODO32), .D(wD32[27:24]), .Q(wQ32[27:24]));
  MUX m2(.I1(wR3Q3), .I2(wR1Q0), .S(wDIR32), .Y(wR2SIN));
  registro4 reg3(.CLK(wCLK32), .ENB(wENB32), .DIR(wDIR32), .S_IN(wR3SIN),.MODO(wMODO32), .D(wD32[23:20]), .Q(wQ32[23:20]));
  MUX m3(.I1(wR4Q3), .I2(wR2Q0), .S(wDIR32), .Y(wR3SIN));
  registro4 reg4(.CLK(wCLK32), .ENB(wENB32), .DIR(wDIR32), .S_IN(wR4SIN), .MODO(wMODO32), .D(wD32[19:16]), .Q(wQ32[19:16]));
  MUX m4(.I1(wR5Q3), .I2(wR3Q0), .S(wDIR32), .Y(wR4SIN));
  registro4 reg5(.CLK(wCLK32), .ENB(wENB32), .DIR(wDIR32), .S_IN(wR5SIN), .MODO(wMODO32), .D(wD32[15:12]), .Q(wQ32[15:12]));
  MUX m5(.I1(wR6Q3), .I2(wR4Q0), .S(wDIR32), .Y(wR5SIN));
  registro4 reg6(.CLK(wCLK32), .ENB(wENB32), .DIR(wDIR32), .S_IN(wR6SIN), .MODO(wMODO32), .D(wD32[11:8]), .Q(wQ32[11:8]));
  MUX m6(.I1(wR7Q3), .I2(wR5Q0), .S(wDIR32), .Y(wR6SIN));
  registro4 reg7(.CLK(wCLK32), .ENB(wENB32), .DIR(wDIR32), .S_IN(wR7SIN), .MODO(wMODO32), .D(wD32[7:4]), .Q(wQ32[7:4]));
  MUX m7(.I1(wR8Q3), .I2(wR6Q0), .S(wDIR32), .Y(wR7SIN));
  //Final registros (Registro8)
  registro4 reg8(.CLK(wCLK32), .ENB(wENB32), .DIR(wDIR32), .S_IN(wR8SIN), .MODO(wMODO32), .D(wD32[3:0]), .Q(wQ32[3:0]));
  derecha m8(.S_IN(wS_IN32), .izq(wR7Q0), .der(wR1Q3), .DIR(wDIR32), .MODO(MODO32), .IN(wR8SIN));

endmodule
