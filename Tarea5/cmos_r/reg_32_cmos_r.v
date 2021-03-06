/* Generated by Yosys 0.7 (git sha1 61f6811, i686-w64-mingw32.static-gcc 4.9.3 -Os) */
`include "cmos_r/cmos_r_cells.v"

`timescale 1ns/1ps

(* src = "mux.v:1" *)
module mux(din_0, din_1, d, out);
  wire _0_;
  wire _1_;
  wire _2_;
  (* src = "mux.v:3" *)
  input d;
  (* src = "mux.v:3" *)
  input din_0;
  (* src = "mux.v:3" *)
  input din_1;
  (* src = "mux.v:4" *)
  output out;
  NOR _3_ (
    .A(d),
    .B(din_0),
    .Y(_0_)
  );
  NOT _4_ (
    .A(d),
    .Y(_1_)
  );
  NOR _5_ (
    .A(_1_),
    .B(din_1),
    .Y(_2_)
  );
  NOR _6_ (
    .A(_2_),
    .B(_0_),
    .Y(out)
  );
endmodule

(* src = "mux4.v:1" *)
module mux4(din_0, din_1, din_2, din_3, d, m, out);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  (* src = "mux4.v:3" *)
  input d;
  (* src = "mux4.v:3" *)
  input din_0;
  (* src = "mux4.v:3" *)
  input din_1;
  (* src = "mux4.v:3" *)
  input din_2;
  (* src = "mux4.v:3" *)
  input din_3;
  (* src = "mux4.v:4" *)
  input [1:0] m;
  (* src = "mux4.v:5" *)
  output out;
  NAND _10_ (
    .A(d),
    .B(din_3),
    .Y(_08_)
  );
  NOT _11_ (
    .A(d),
    .Y(_09_)
  );
  NAND _12_ (
    .A(_09_),
    .B(din_2),
    .Y(_00_)
  );
  NAND _13_ (
    .A(_00_),
    .B(_08_),
    .Y(_01_)
  );
  NAND _14_ (
    .A(_01_),
    .B(m[0]),
    .Y(_02_)
  );
  NOT _15_ (
    .A(m[0]),
    .Y(_03_)
  );
  NAND _16_ (
    .A(din_1),
    .B(d),
    .Y(_04_)
  );
  NAND _17_ (
    .A(din_0),
    .B(_09_),
    .Y(_05_)
  );
  NAND _18_ (
    .A(_05_),
    .B(_04_),
    .Y(_06_)
  );
  NAND _19_ (
    .A(_06_),
    .B(_03_),
    .Y(_07_)
  );
  NAND _20_ (
    .A(_07_),
    .B(_02_),
    .Y(out)
  );
endmodule

(* src = "reg_desp_r.v:3" *)
module reg_desp(Q, S_OUT, CLK, ENB, DIR, S_IN, MODO, D);
  (* src = "reg_desp_r.v:27" *)
  wire [3:0] _00_;
  (* src = "reg_desp_r.v:27" *)
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _30_;
  wire _31_;
  wire _32_;
  wire _33_;
  wire _34_;
  wire _35_;
  wire _36_;
  wire _37_;
  wire _38_;
  wire _39_;
  wire _40_;
  wire _41_;
  wire _42_;
  wire _43_;
  wire _44_;
  (* src = "reg_desp_r.v:5" *)
  input CLK;
  (* src = "reg_desp_r.v:7" *)
  input [3:0] D;
  (* src = "reg_desp_r.v:5" *)
  input DIR;
  (* src = "reg_desp_r.v:5" *)
  input ENB;
  (* src = "reg_desp_r.v:6" *)
  input [1:0] MODO;
  (* init = 4'b0000 *)
  (* src = "reg_desp_r.v:8" *)
  output [3:0] Q;
  (* src = "reg_desp_r.v:5" *)
  input S_IN;
  (* src = "reg_desp_r.v:9" *)
  output S_OUT;
  NAND _45_ (
    .A(D[0]),
    .B(MODO[1]),
    .Y(_02_)
  );
  NOR _46_ (
    .A(MODO[0]),
    .B(MODO[1]),
    .Y(_03_)
  );
  NOT _47_ (
    .A(_03_),
    .Y(_04_)
  );
  NOT _48_ (
    .A(Q[1]),
    .Y(_05_)
  );
  NOT _49_ (
    .A(DIR),
    .Y(_06_)
  );
  NOR _50_ (
    .A(_06_),
    .B(_05_),
    .Y(_07_)
  );
  NOT _51_ (
    .A(S_IN),
    .Y(_08_)
  );
  NOR _52_ (
    .A(DIR),
    .B(_08_),
    .Y(_09_)
  );
  NOR _53_ (
    .A(_09_),
    .B(_07_),
    .Y(_10_)
  );
  NOR _54_ (
    .A(_10_),
    .B(_04_),
    .Y(_11_)
  );
  NOT _55_ (
    .A(MODO[1]),
    .Y(_12_)
  );
  NAND _56_ (
    .A(MODO[0]),
    .B(_12_),
    .Y(_13_)
  );
  NOT _57_ (
    .A(Q[3]),
    .Y(_14_)
  );
  NOR _58_ (
    .A(_14_),
    .B(DIR),
    .Y(_15_)
  );
  NOR _59_ (
    .A(_15_),
    .B(_07_),
    .Y(_16_)
  );
  NOR _60_ (
    .A(_16_),
    .B(_13_),
    .Y(_17_)
  );
  NOR _61_ (
    .A(_17_),
    .B(_11_),
    .Y(_18_)
  );
  NAND _62_ (
    .A(_18_),
    .B(_02_),
    .Y(_00_[0])
  );
  NAND _63_ (
    .A(Q[2]),
    .B(DIR),
    .Y(_19_)
  );
  NAND _64_ (
    .A(Q[0]),
    .B(_06_),
    .Y(_20_)
  );
  NAND _65_ (
    .A(_20_),
    .B(_19_),
    .Y(_21_)
  );
  NAND _66_ (
    .A(_21_),
    .B(_12_),
    .Y(_22_)
  );
  NAND _67_ (
    .A(D[1]),
    .B(MODO[1]),
    .Y(_23_)
  );
  NAND _68_ (
    .A(_23_),
    .B(_22_),
    .Y(_00_[1])
  );
  NAND _69_ (
    .A(Q[3]),
    .B(DIR),
    .Y(_24_)
  );
  NAND _70_ (
    .A(_06_),
    .B(Q[1]),
    .Y(_25_)
  );
  NAND _71_ (
    .A(_25_),
    .B(_24_),
    .Y(_26_)
  );
  NAND _72_ (
    .A(_26_),
    .B(_12_),
    .Y(_27_)
  );
  NAND _73_ (
    .A(D[2]),
    .B(MODO[1]),
    .Y(_28_)
  );
  NAND _74_ (
    .A(_28_),
    .B(_27_),
    .Y(_00_[2])
  );
  NAND _75_ (
    .A(D[3]),
    .B(MODO[1]),
    .Y(_29_)
  );
  NOT _76_ (
    .A(Q[2]),
    .Y(_30_)
  );
  NOR _77_ (
    .A(_30_),
    .B(DIR),
    .Y(_31_)
  );
  NOR _78_ (
    .A(_06_),
    .B(_08_),
    .Y(_32_)
  );
  NOR _79_ (
    .A(_32_),
    .B(_31_),
    .Y(_33_)
  );
  NOR _80_ (
    .A(_33_),
    .B(_04_),
    .Y(_34_)
  );
  NOT _81_ (
    .A(Q[0]),
    .Y(_35_)
  );
  NOR _82_ (
    .A(_35_),
    .B(_06_),
    .Y(_36_)
  );
  NOR _83_ (
    .A(_36_),
    .B(_31_),
    .Y(_37_)
  );
  NOR _84_ (
    .A(_37_),
    .B(_13_),
    .Y(_38_)
  );
  NOR _85_ (
    .A(_38_),
    .B(_34_),
    .Y(_39_)
  );
  NAND _86_ (
    .A(_39_),
    .B(_29_),
    .Y(_00_[3])
  );
  NAND _87_ (
    .A(Q[3]),
    .B(_06_),
    .Y(_40_)
  );
  NAND _88_ (
    .A(Q[0]),
    .B(DIR),
    .Y(_41_)
  );
  NAND _89_ (
    .A(_41_),
    .B(_40_),
    .Y(_42_)
  );
  NAND _90_ (
    .A(_42_),
    .B(_03_),
    .Y(_43_)
  );
  NAND _91_ (
    .A(_04_),
    .B(S_OUT),
    .Y(_44_)
  );
  NAND _92_ (
    .A(_44_),
    .B(_43_),
    .Y(_01_)
  );
  DFF _93_ (
    .C(CLK),
    .D(_00_[0]),
    .Q(Q[0])
  );
  DFF _94_ (
    .C(CLK),
    .D(_00_[1]),
    .Q(Q[1])
  );
  DFF _95_ (
    .C(CLK),
    .D(_00_[2]),
    .Q(Q[2])
  );
  DFF _96_ (
    .C(CLK),
    .D(_00_[3]),
    .Q(Q[3])
  );
  DFF _97_ (
    .C(CLK),
    .D(_01_),
    .Q(S_OUT)
  );
endmodule

(* src = "reg_desp_32_r.v:7" *)
module reg_desp_32(Q32, S_OUT32, CLK32, ENB32, DIR32, S_IN32, MODO32, D32);
  (* src = "reg_desp_32_r.v:10" *)
  input CLK32;
  (* src = "reg_desp_32_r.v:12" *)
  input [31:0] D32;
  (* src = "reg_desp_32_r.v:10" *)
  input DIR32;
  (* src = "reg_desp_32_r.v:10" *)
  input ENB32;
  (* src = "reg_desp_32_r.v:11" *)
  input [1:0] MODO32;
  (* src = "reg_desp_32_r.v:13" *)
  output [31:0] Q32;
  (* src = "reg_desp_32_r.v:10" *)
  input S_IN32;
  (* src = "reg_desp_32_r.v:14" *)
  output S_OUT32;
  (* src = "reg_desp_32_r.v:24" *)
  (* unused_bits = "0" *)
  wire wCLK32;
  (* src = "reg_desp_32_r.v:25" *)
  (* unused_bits = "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31" *)
  wire [31:0] wD32;
  (* src = "reg_desp_32_r.v:24" *)
  (* unused_bits = "0" *)
  wire wDIR32;
  (* src = "reg_desp_32_r.v:24" *)
  (* unused_bits = "0" *)
  wire wENB32;
  (* src = "reg_desp_32_r.v:25" *)
  wire [31:0] wQ32;
  (* src = "reg_desp_32_r.v:17" *)
  wire wR1Q0;
  (* src = "reg_desp_32_r.v:17" *)
  wire wR1Q3;
  (* src = "reg_desp_32_r.v:17" *)
  wire wR2Q0;
  (* src = "reg_desp_32_r.v:17" *)
  wire wR2Q3;
  (* src = "reg_desp_32_r.v:17" *)
  wire wR3Q0;
  (* src = "reg_desp_32_r.v:17" *)
  wire wR3Q3;
  (* src = "reg_desp_32_r.v:17" *)
  wire wR4Q0;
  (* src = "reg_desp_32_r.v:18" *)
  wire wR4Q3;
  (* src = "reg_desp_32_r.v:18" *)
  wire wR5Q0;
  (* src = "reg_desp_32_r.v:18" *)
  wire wR5Q3;
  (* src = "reg_desp_32_r.v:18" *)
  wire wR6Q0;
  (* src = "reg_desp_32_r.v:18" *)
  wire wR6Q3;
  (* src = "reg_desp_32_r.v:18" *)
  wire wR7Q0;
  (* src = "reg_desp_32_r.v:18" *)
  wire wR7Q3;
  (* src = "reg_desp_32_r.v:19" *)
  wire wR8Q0;
  (* src = "reg_desp_32_r.v:19" *)
  wire wR8Q3;
  (* src = "reg_desp_32_r.v:24" *)
  (* unused_bits = "0" *)
  wire wS_IN32;
  (* src = "reg_desp_32_r.v:24" *)
  wire wS_OUT32;
  assign wCLK32 = CLK32;
  assign wD32 = D32;
  assign wDIR32 = DIR32;
  assign wENB32 = ENB32;
  assign wQ32 = Q32;
  assign wR1Q0 = Q32[28];
  assign wR1Q3 = Q32[31];
  assign wR2Q0 = Q32[24];
  assign wR2Q3 = Q32[27];
  assign wR3Q0 = Q32[20];
  assign wR3Q3 = Q32[23];
  assign wR4Q0 = Q32[16];
  assign wR4Q3 = Q32[19];
  assign wR5Q0 = Q32[12];
  assign wR5Q3 = Q32[15];
  assign wR6Q0 = Q32[8];
  assign wR6Q3 = Q32[11];
  assign wR7Q0 = Q32[4];
  assign wR7Q3 = Q32[7];
  assign wR8Q0 = Q32[0];
  assign wR8Q3 = Q32[3];
  assign wS_IN32 = S_IN32;
  assign wS_OUT32 = S_OUT32;
endmodule
