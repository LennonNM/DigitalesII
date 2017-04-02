`include "reg_desp.v"
`include "mux.v"
`include "mux4.v"

module reg8 (Q8, S_OUT8, CLK8, ENB8, DIR8, S_IN8, MODO8, D8);

    input CLK8, ENB8, DIR8, S_IN8;
    input [1:0] MODO8;
    input [7:0] D8;
    output [7:0] Q8;
    output S_OUT8;

    wire wR8SIN, wR8Q0, wR8Q3;
    wire wR1SIN, wR1Q0, wR1Q3;
    wire [7:0] wQ8, wD8;
    wire [1:0] wMODO8;
    wire wS_OUT8, wCLK8, wENB8, wDIR8, wS_IN8;

    assign Q8[7:0] = wQ8[7:0];
    assign S_OUT8 = wS_OUT8;
    assign wCLK8 = CLK8;
    assign wENB8 = ENB8;
    assign wDIR8 = DIR8;
    assign wS_IN8 = S_IN8;
    assign wMODO8 = (MODO8[1])?MODO8:2'b0; /*Inhabilita la lectura de modo
                                            rotacion circular a los registros*/
    assign wD8 = D8;

    assign wR8Q0 = wQ8[0];
    assign wR8Q3 = wQ8[3];
    assign wR1Q0 = wQ8[4];
    assign wR1Q3 = wQ8[7];


    reg_desp reg1(wQ8[7:4], , wCLK8, wENB8, wDIR8, wR1SIN, wMODO8, wD8[7:4]);
    reg_desp reg8(wQ8[3:0], , wCLK8, wENB8, wDIR8, wR8SIN, wMODO8, wD8[3:0]);
    mux4 mux1(wR8Q3, wS_IN8, wR8Q3, wR8Q0,wDIR8, MODO8, wR1SIN);
    mux4 mux8(wS_IN8, wR1Q0, wR1Q3, wR1Q0, wDIR8, MODO8, wR8SIN);
    mux muxOUT(wR1Q3, wR8Q0, wDIR8, wS_OUT8);

  endmodule
