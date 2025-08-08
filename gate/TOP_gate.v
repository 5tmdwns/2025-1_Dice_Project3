/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP4
// Date      : Wed Jun 18 22:00:28 2025
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_DIGITALCLOCK_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DIGITALCLOCK_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DIGITALCLOCK_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_DIGITALCLOCK_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module DIGITALCLOCK ( SECOND, MINUTE, HOUR, DATE, RSTN, CLK100, SW1, KEY1, 
        KEY2, KEY3, tick );
  output [5:0] SECOND;
  output [5:0] MINUTE;
  output [4:0] HOUR;
  output [4:0] DATE;
  input RSTN, CLK100, SW1, KEY1, KEY2, KEY3, tick;
  wire   N43, N44, N45, N46, N47, N58, N59, N60, N61, N62, N72, N73, N74, N75,
         N76, N83, N87, N88, N89, N90, N105, N106, N107, N108, N109, N110,
         N120, N121, N122, N123, N124, N125, N136, N137, N138, N139, N149,
         N150, N151, N152, N247, N248, N249, N250, N251, N253, N254, N255,
         N256, N257, N258, N259, N260, N261, N262, N263, N264, N265, N266,
         N267, N268, N269, N270, N271, N272, N273, net950, net951, net956,
         net961, net966, n61, n62, N285, N284, N283, N282, N281,
         \r455/carry[4] , \r455/carry[3] , \r455/carry[2] , \r453/carry[5] ,
         \r453/carry[4] , \r453/carry[3] , \r453/carry[2] , \r451/carry[5] ,
         \r451/carry[4] , \r451/carry[3] , \r451/carry[2] , \r469/carry[4] ,
         \r469/carry[3] , \r469/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58;
  wire   [1:0] sel_field;

  SNPS_CLOCK_GATE_HIGH_DIGITALCLOCK_0 clk_gate_DATE_reg ( .CLK(CLK100), .EN(
        N253), .ENCLK(net950), .TE(net951) );
  SNPS_CLOCK_GATE_HIGH_DIGITALCLOCK_3 clk_gate_MINUTE_reg ( .CLK(CLK100), .EN(
        N267), .ENCLK(net956), .TE(net951) );
  SNPS_CLOCK_GATE_HIGH_DIGITALCLOCK_2 clk_gate_HOUR_reg ( .CLK(CLK100), .EN(
        N273), .ENCLK(net961), .TE(net951) );
  SNPS_CLOCK_GATE_HIGH_DIGITALCLOCK_1 clk_gate_SECOND_reg ( .CLK(CLK100), .EN(
        N260), .ENCLK(net966), .TE(net951) );
  SAEDRVT14_FDPRBQ_V2LP_1 \sel_field_reg[1]  ( .D(n61), .CK(CLK100), .RD(RSTN), 
        .Q(sel_field[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \sel_field_reg[0]  ( .D(n62), .CK(CLK100), .RD(RSTN), 
        .Q(sel_field[0]) );
  SAEDRVT14_FDPSBQ_1 \DATE_reg[0]  ( .D(N247), .CK(net950), .SD(RSTN), .Q(
        DATE[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[0]  ( .D(N254), .CK(net966), .RD(RSTN), 
        .Q(SECOND[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[0]  ( .D(N261), .CK(net956), .RD(RSTN), 
        .Q(MINUTE[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[0]  ( .D(N268), .CK(net961), .RD(RSTN), 
        .Q(HOUR[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[1]  ( .D(N255), .CK(net966), .RD(RSTN), 
        .Q(SECOND[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[1]  ( .D(N262), .CK(net956), .RD(RSTN), 
        .Q(MINUTE[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \DATE_reg[1]  ( .D(N248), .CK(net950), .RD(RSTN), 
        .Q(DATE[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[1]  ( .D(N269), .CK(net961), .RD(RSTN), 
        .Q(HOUR[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \DATE_reg[4]  ( .D(N251), .CK(net950), .RD(RSTN), 
        .Q(DATE[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[4]  ( .D(N272), .CK(net961), .RD(RSTN), 
        .Q(HOUR[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \DATE_reg[2]  ( .D(N249), .CK(net950), .RD(RSTN), 
        .Q(DATE[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[2]  ( .D(N270), .CK(net961), .RD(RSTN), 
        .Q(HOUR[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \DATE_reg[3]  ( .D(N250), .CK(net950), .RD(RSTN), 
        .Q(DATE[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[3]  ( .D(N271), .CK(net961), .RD(RSTN), 
        .Q(HOUR[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[2]  ( .D(N256), .CK(net966), .RD(RSTN), 
        .Q(SECOND[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[2]  ( .D(N263), .CK(net956), .RD(RSTN), 
        .Q(MINUTE[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[5]  ( .D(N259), .CK(net966), .RD(RSTN), 
        .Q(SECOND[5]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[5]  ( .D(N266), .CK(net956), .RD(RSTN), 
        .Q(MINUTE[5]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[3]  ( .D(N257), .CK(net966), .RD(RSTN), 
        .Q(SECOND[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[3]  ( .D(N264), .CK(net956), .RD(RSTN), 
        .Q(MINUTE[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[4]  ( .D(N258), .CK(net966), .RD(RSTN), 
        .Q(SECOND[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[4]  ( .D(N265), .CK(net956), .RD(RSTN), 
        .Q(MINUTE[4]) );
  SAEDRVT14_TIE0_V1_2 U3 ( .X(net951) );
  SAEDRVT14_INV_S_1 U4 ( .A(n8), .X(n10) );
  SAEDRVT14_INV_S_1 U5 ( .A(n3), .X(n5) );
  SAEDRVT14_ADDH_0P5 U6 ( .A(N282), .B(N281), .CO(\r469/carry[2] ), .S(N87) );
  SAEDRVT14_ADDH_0P5 U7 ( .A(N283), .B(\r469/carry[2] ), .CO(\r469/carry[3] ), 
        .S(N88) );
  SAEDRVT14_ADDH_0P5 U8 ( .A(N284), .B(\r469/carry[3] ), .CO(\r469/carry[4] ), 
        .S(N89) );
  SAEDRVT14_INV_S_1 U9 ( .A(MINUTE[0]), .X(N120) );
  SAEDRVT14_INV_S_1 U10 ( .A(SECOND[0]), .X(N105) );
  SAEDRVT14_ADDH_0P5 U11 ( .A(MINUTE[1]), .B(MINUTE[0]), .CO(\r453/carry[2] ), 
        .S(N58) );
  SAEDRVT14_ADDH_0P5 U12 ( .A(SECOND[1]), .B(SECOND[0]), .CO(\r451/carry[2] ), 
        .S(N43) );
  SAEDRVT14_ADDH_0P5 U13 ( .A(MINUTE[2]), .B(\r453/carry[2] ), .CO(
        \r453/carry[3] ), .S(N59) );
  SAEDRVT14_ADDH_0P5 U14 ( .A(SECOND[2]), .B(\r451/carry[2] ), .CO(
        \r451/carry[3] ), .S(N44) );
  SAEDRVT14_ADDH_0P5 U15 ( .A(MINUTE[3]), .B(\r453/carry[3] ), .CO(
        \r453/carry[4] ), .S(N60) );
  SAEDRVT14_ADDH_0P5 U16 ( .A(SECOND[3]), .B(\r451/carry[3] ), .CO(
        \r451/carry[4] ), .S(N45) );
  SAEDRVT14_ADDH_0P5 U17 ( .A(MINUTE[4]), .B(\r453/carry[4] ), .CO(
        \r453/carry[5] ), .S(N61) );
  SAEDRVT14_ADDH_0P5 U18 ( .A(SECOND[4]), .B(\r451/carry[4] ), .CO(
        \r451/carry[5] ), .S(N46) );
  SAEDRVT14_OR2_1 U19 ( .A1(n41), .A2(KEY2), .X(n33) );
  SAEDRVT14_INV_S_1 U20 ( .A(HOUR[0]), .X(N72) );
  SAEDRVT14_ADDH_0P5 U21 ( .A(HOUR[2]), .B(\r455/carry[2] ), .CO(
        \r455/carry[3] ), .S(N74) );
  SAEDRVT14_ADDH_0P5 U22 ( .A(HOUR[1]), .B(HOUR[0]), .CO(\r455/carry[2] ), .S(
        N73) );
  SAEDRVT14_ADDH_0P5 U23 ( .A(HOUR[3]), .B(\r455/carry[3] ), .CO(
        \r455/carry[4] ), .S(N75) );
  SAEDRVT14_MUX2_MM_0P5 U24 ( .D0(DATE[0]), .D1(N281), .S(n33), .X(n57) );
  SAEDRVT14_INV_S_1 U25 ( .A(HOUR[2]), .X(n14) );
  SAEDRVT14_AN2_1 U26 ( .A1(DATE[0]), .A2(N83), .X(N281) );
  SAEDRVT14_AN2_1 U27 ( .A1(DATE[1]), .A2(N83), .X(N282) );
  SAEDRVT14_AN2_1 U28 ( .A1(DATE[2]), .A2(N83), .X(N283) );
  SAEDRVT14_AN2_1 U29 ( .A1(DATE[3]), .A2(N83), .X(N284) );
  SAEDRVT14_AN2_1 U30 ( .A1(N83), .A2(DATE[4]), .X(N285) );
  SAEDRVT14_EO2_V1_0P75 U31 ( .A1(\r469/carry[4] ), .A2(N285), .X(N90) );
  SAEDRVT14_EO2_V1_0P75 U32 ( .A1(\r451/carry[5] ), .A2(SECOND[5]), .X(N47) );
  SAEDRVT14_EO2_V1_0P75 U33 ( .A1(\r453/carry[5] ), .A2(MINUTE[5]), .X(N62) );
  SAEDRVT14_EO2_V1_0P75 U34 ( .A1(\r455/carry[4] ), .A2(HOUR[4]), .X(N76) );
  SAEDRVT14_ND2B_U_0P5 U35 ( .A(SECOND[1]), .B(N105), .X(n1) );
  SAEDRVT14_AO21B_0P5 U36 ( .A1(SECOND[0]), .A2(SECOND[1]), .B(n1), .X(N106)
         );
  SAEDRVT14_OR2_0P5 U37 ( .A1(n1), .A2(SECOND[2]), .X(n2) );
  SAEDRVT14_AO21B_0P5 U38 ( .A1(n1), .A2(SECOND[2]), .B(n2), .X(N107) );
  SAEDRVT14_NR2_1 U39 ( .A1(n2), .A2(SECOND[3]), .X(n3) );
  SAEDRVT14_AO21_1 U40 ( .A1(n2), .A2(SECOND[3]), .B(n3), .X(N108) );
  SAEDRVT14_EO2_V1_0P75 U41 ( .A1(SECOND[4]), .A2(n3), .X(N109) );
  SAEDRVT14_NR2_1 U42 ( .A1(SECOND[4]), .A2(n5), .X(n4) );
  SAEDRVT14_EO2_V1_0P75 U43 ( .A1(SECOND[5]), .A2(n4), .X(N110) );
  SAEDRVT14_ND2B_U_0P5 U44 ( .A(MINUTE[1]), .B(N120), .X(n6) );
  SAEDRVT14_AO21B_0P5 U45 ( .A1(MINUTE[0]), .A2(MINUTE[1]), .B(n6), .X(N121)
         );
  SAEDRVT14_OR2_0P5 U46 ( .A1(n6), .A2(MINUTE[2]), .X(n7) );
  SAEDRVT14_AO21B_0P5 U47 ( .A1(n6), .A2(MINUTE[2]), .B(n7), .X(N122) );
  SAEDRVT14_NR2_1 U48 ( .A1(n7), .A2(MINUTE[3]), .X(n8) );
  SAEDRVT14_AO21_1 U49 ( .A1(n7), .A2(MINUTE[3]), .B(n8), .X(N123) );
  SAEDRVT14_EO2_V1_0P75 U50 ( .A1(MINUTE[4]), .A2(n8), .X(N124) );
  SAEDRVT14_NR2_1 U51 ( .A1(MINUTE[4]), .A2(n10), .X(n9) );
  SAEDRVT14_EO2_V1_0P75 U52 ( .A1(MINUTE[5]), .A2(n9), .X(N125) );
  SAEDRVT14_NR2_1 U53 ( .A1(HOUR[1]), .A2(HOUR[0]), .X(n11) );
  SAEDRVT14_AO21_1 U54 ( .A1(HOUR[0]), .A2(HOUR[1]), .B(n11), .X(N136) );
  SAEDRVT14_ND2_CDC_0P5 U55 ( .A1(n11), .A2(n14), .X(n12) );
  SAEDRVT14_OAI21_0P5 U56 ( .A1(n11), .A2(n14), .B(n12), .X(N137) );
  SAEDRVT14_EN2_1 U57 ( .A1(HOUR[3]), .A2(n12), .X(N138) );
  SAEDRVT14_NR2_1 U58 ( .A1(HOUR[3]), .A2(n12), .X(n13) );
  SAEDRVT14_EO2_V1_0P75 U59 ( .A1(HOUR[4]), .A2(n13), .X(N139) );
  SAEDRVT14_NR2_1 U60 ( .A1(DATE[1]), .A2(DATE[0]), .X(n15) );
  SAEDRVT14_AO21_1 U61 ( .A1(DATE[0]), .A2(DATE[1]), .B(n15), .X(N149) );
  SAEDRVT14_ND2_CDC_0P5 U62 ( .A1(n15), .A2(n23), .X(n16) );
  SAEDRVT14_OAI21_0P5 U63 ( .A1(n15), .A2(n23), .B(n16), .X(N150) );
  SAEDRVT14_EN2_1 U64 ( .A1(DATE[3]), .A2(n16), .X(N151) );
  SAEDRVT14_NR2_1 U65 ( .A1(DATE[3]), .A2(n16), .X(n17) );
  SAEDRVT14_EO2_V1_0P75 U66 ( .A1(DATE[4]), .A2(n17), .X(N152) );
  SAEDRVT14_EO2_V1_0P75 U67 ( .A1(n18), .A2(n19), .X(n62) );
  SAEDRVT14_EO2_V1_0P75 U68 ( .A1(sel_field[1]), .A2(n20), .X(n61) );
  SAEDRVT14_NR2_1 U69 ( .A1(n18), .A2(n19), .X(n20) );
  SAEDRVT14_ND2_CDC_0P5 U70 ( .A1(SW1), .A2(KEY3), .X(n19) );
  SAEDRVT14_OR4_1 U71 ( .A1(n21), .A2(n22), .A3(n23), .A4(n24), .X(N83) );
  SAEDRVT14_ND2_CDC_0P5 U72 ( .A1(DATE[1]), .A2(DATE[0]), .X(n24) );
  SAEDRVT14_INV_0P5 U73 ( .A(DATE[2]), .X(n23) );
  SAEDRVT14_OAI32_0P5 U74 ( .A1(n25), .A2(sel_field[0]), .A3(n26), .B1(n27), 
        .B2(n28), .X(N273) );
  SAEDRVT14_AO221_0P5 U75 ( .A1(N76), .A2(n29), .B1(N139), .B2(n30), .C(n31), 
        .X(N272) );
  SAEDRVT14_AO32_1 U76 ( .A1(n30), .A2(n32), .A3(N138), .B1(N75), .B2(n29), 
        .X(N271) );
  SAEDRVT14_AO221_0P5 U77 ( .A1(N74), .A2(n29), .B1(N137), .B2(n30), .C(n31), 
        .X(N270) );
  SAEDRVT14_AO221_0P5 U78 ( .A1(N73), .A2(n29), .B1(N136), .B2(n30), .C(n31), 
        .X(N269) );
  SAEDRVT14_AO221_0P5 U79 ( .A1(N72), .A2(n29), .B1(N72), .B2(n30), .C(n31), 
        .X(N268) );
  SAEDRVT14_NR2_1 U80 ( .A1(n33), .A2(n32), .X(n31) );
  SAEDRVT14_OR4_1 U81 ( .A1(HOUR[1]), .A2(HOUR[0]), .A3(HOUR[2]), .A4(n34), 
        .X(n32) );
  SAEDRVT14_OR2_0P5 U82 ( .A1(HOUR[3]), .A2(HOUR[4]), .X(n34) );
  SAEDRVT14_AN2_1 U83 ( .A1(n35), .A2(n33), .X(n29) );
  SAEDRVT14_OAI31_0P5 U84 ( .A1(n26), .A2(sel_field[1]), .A3(n18), .B(n27), 
        .X(N267) );
  SAEDRVT14_AO221_0P5 U85 ( .A1(N62), .A2(n36), .B1(N125), .B2(n30), .C(n37), 
        .X(N266) );
  SAEDRVT14_AO221_0P5 U86 ( .A1(N61), .A2(n36), .B1(N124), .B2(n30), .C(n37), 
        .X(N265) );
  SAEDRVT14_AO221_0P5 U87 ( .A1(N60), .A2(n36), .B1(N123), .B2(n30), .C(n37), 
        .X(N264) );
  SAEDRVT14_AO32_1 U88 ( .A1(n30), .A2(n38), .A3(N122), .B1(N59), .B2(n36), 
        .X(N263) );
  SAEDRVT14_AO221_0P5 U89 ( .A1(N58), .A2(n36), .B1(N121), .B2(n30), .C(n37), 
        .X(N262) );
  SAEDRVT14_AO221_0P5 U90 ( .A1(N120), .A2(n36), .B1(N120), .B2(n30), .C(n37), 
        .X(N261) );
  SAEDRVT14_NR2_1 U91 ( .A1(n38), .A2(n33), .X(n37) );
  SAEDRVT14_OR4_1 U92 ( .A1(MINUTE[2]), .A2(MINUTE[1]), .A3(MINUTE[0]), .A4(
        n39), .X(n38) );
  SAEDRVT14_OR3_0P5 U93 ( .A1(MINUTE[5]), .A2(MINUTE[4]), .A3(MINUTE[3]), .X(
        n39) );
  SAEDRVT14_AN2_1 U94 ( .A1(n28), .A2(n33), .X(n36) );
  SAEDRVT14_AO32_1 U95 ( .A1(n18), .A2(n25), .A3(n40), .B1(tick), .B2(n41), 
        .X(N260) );
  SAEDRVT14_INV_0P5 U96 ( .A(n26), .X(n40) );
  SAEDRVT14_AO221_0P5 U97 ( .A1(N47), .A2(n42), .B1(N110), .B2(n30), .C(n43), 
        .X(N259) );
  SAEDRVT14_AO221_0P5 U98 ( .A1(N46), .A2(n42), .B1(N109), .B2(n30), .C(n43), 
        .X(N258) );
  SAEDRVT14_AO221_0P5 U99 ( .A1(N45), .A2(n42), .B1(N108), .B2(n30), .C(n43), 
        .X(N257) );
  SAEDRVT14_AO32_1 U100 ( .A1(n30), .A2(n44), .A3(N107), .B1(N44), .B2(n42), 
        .X(N256) );
  SAEDRVT14_AO221_0P5 U101 ( .A1(N43), .A2(n42), .B1(N106), .B2(n30), .C(n43), 
        .X(N255) );
  SAEDRVT14_AO221_0P5 U102 ( .A1(N105), .A2(n42), .B1(N105), .B2(n30), .C(n43), 
        .X(N254) );
  SAEDRVT14_NR2_1 U103 ( .A1(n44), .A2(n33), .X(n43) );
  SAEDRVT14_OR4_1 U104 ( .A1(SECOND[2]), .A2(SECOND[1]), .A3(SECOND[0]), .A4(
        n45), .X(n44) );
  SAEDRVT14_OR3_0P5 U105 ( .A1(SECOND[5]), .A2(SECOND[4]), .A3(SECOND[3]), .X(
        n45) );
  SAEDRVT14_INV_0P5 U106 ( .A(n33), .X(n30) );
  SAEDRVT14_AN2B_MM_1 U107 ( .B(n33), .A(n46), .X(n42) );
  SAEDRVT14_OAI33_0P5 U108 ( .A1(n25), .A2(n18), .A3(n26), .B1(n27), .B2(n28), 
        .B3(n35), .X(N253) );
  SAEDRVT14_OAI21_0P5 U109 ( .A1(HOUR[3]), .A2(n47), .B(HOUR[4]), .X(n35) );
  SAEDRVT14_AN3_0P5 U110 ( .A1(HOUR[1]), .A2(HOUR[0]), .A3(HOUR[2]), .X(n47)
         );
  SAEDRVT14_INV_0P5 U111 ( .A(n48), .X(n28) );
  SAEDRVT14_AN4_0P5 U112 ( .A1(MINUTE[4]), .A2(MINUTE[5]), .A3(n49), .A4(
        MINUTE[3]), .X(n48) );
  SAEDRVT14_AO21_1 U113 ( .A1(MINUTE[1]), .A2(MINUTE[0]), .B(MINUTE[2]), .X(
        n49) );
  SAEDRVT14_ND3_0P5 U114 ( .A1(n41), .A2(n46), .A3(tick), .X(n27) );
  SAEDRVT14_AN4_0P5 U115 ( .A1(SECOND[4]), .A2(SECOND[5]), .A3(n50), .A4(
        SECOND[3]), .X(n46) );
  SAEDRVT14_AO21_1 U116 ( .A1(SECOND[1]), .A2(SECOND[0]), .B(SECOND[2]), .X(
        n50) );
  SAEDRVT14_OAI211_0P5 U117 ( .A1(KEY1), .A2(KEY2), .B1(n51), .B2(SW1), .X(n26) );
  SAEDRVT14_INV_0P5 U118 ( .A(KEY3), .X(n51) );
  SAEDRVT14_INV_0P5 U119 ( .A(sel_field[0]), .X(n18) );
  SAEDRVT14_INV_0P5 U120 ( .A(sel_field[1]), .X(n25) );
  SAEDRVT14_ND2_CDC_0P5 U121 ( .A1(n52), .A2(n53), .X(N251) );
  SAEDRVT14_MUXI2_U_0P5 U122 ( .D0(N152), .D1(N90), .S(n33), .X(n52) );
  SAEDRVT14_ND2_CDC_0P5 U123 ( .A1(n54), .A2(n53), .X(N250) );
  SAEDRVT14_MUXI2_U_0P5 U124 ( .D0(N151), .D1(N89), .S(n33), .X(n54) );
  SAEDRVT14_ND2_CDC_0P5 U125 ( .A1(n55), .A2(n53), .X(N249) );
  SAEDRVT14_MUXI2_U_0P5 U126 ( .D0(N150), .D1(N88), .S(n33), .X(n55) );
  SAEDRVT14_ND2_CDC_0P5 U127 ( .A1(n56), .A2(n53), .X(N248) );
  SAEDRVT14_MUXI2_U_0P5 U128 ( .D0(N149), .D1(N87), .S(n33), .X(n56) );
  SAEDRVT14_ND2_CDC_0P5 U129 ( .A1(n57), .A2(n53), .X(N247) );
  SAEDRVT14_OR4_1 U130 ( .A1(DATE[1]), .A2(n33), .A3(DATE[2]), .A4(n58), .X(
        n53) );
  SAEDRVT14_ND2_CDC_0P5 U131 ( .A1(n21), .A2(n22), .X(n58) );
  SAEDRVT14_INV_0P5 U132 ( .A(DATE[4]), .X(n22) );
  SAEDRVT14_INV_0P5 U133 ( .A(DATE[3]), .X(n21) );
  SAEDRVT14_INV_0P5 U134 ( .A(SW1), .X(n41) );
endmodule


module SNPS_CLOCK_GATE_HIGH_STOPWATCH_0 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_STOPWATCH_3 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_STOPWATCH_2 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_STOPWATCH_1 ( CLK, EN, ENCLK, TE );
  input CLK, EN, TE;
  output ENCLK;


  SAEDRVT14_CKGTPLT_V5_1 latch ( .CK(CLK), .EN(EN), .SE(TE), .Q(ENCLK) );
endmodule


module STOPWATCH ( SECOND, MINUTE, HOUR, DATE, RSTN, CLK100, KEY3, SW2, tick, 
        prev_SW2 );
  output [5:0] SECOND;
  output [5:0] MINUTE;
  output [4:0] HOUR;
  output [4:0] DATE;
  input RSTN, CLK100, KEY3, SW2, tick, prev_SW2;
  wire   running, N18, N20, N21, N22, N23, N24, N25, N27, N29, N30, N31, N32,
         N33, N34, N36, N38, N39, N40, N41, N42, N44, N84, N85, N86, N87, N88,
         N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101,
         N102, N103, N104, N105, N106, N107, N108, N109, N112, net917, net918,
         net923, net928, net933, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         N118, N117, N116, N115, N114, \add_28_S2_C51_S2/carry[4] ,
         \add_28_S2_C51_S2/carry[3] , \add_28_S2_C51_S2/carry[2] ,
         \add_25_S2_C51_S2/carry[5] , \add_25_S2_C51_S2/carry[4] ,
         \add_25_S2_C51_S2/carry[3] , \add_25_S2_C51_S2/carry[2] ,
         \add_22_S2_C51_S2/carry[5] , \add_22_S2_C51_S2/carry[4] ,
         \add_22_S2_C51_S2/carry[3] , \add_22_S2_C51_S2/carry[2] ,
         \add_31_S2_C51_S2_aco/carry[4] , \add_31_S2_C51_S2_aco/carry[3] ,
         \add_31_S2_C51_S2_aco/carry[2] , n1, n2, n3, n4;

  SAEDRVT14_AN2B_MM_1 U39 ( .B(n17), .A(n18), .X(n25) );
  SNPS_CLOCK_GATE_HIGH_STOPWATCH_0 clk_gate_SECOND_reg ( .CLK(CLK100), .EN(N90), .ENCLK(net917), .TE(net918) );
  SNPS_CLOCK_GATE_HIGH_STOPWATCH_3 clk_gate_MINUTE_reg ( .CLK(CLK100), .EN(N97), .ENCLK(net923), .TE(net918) );
  SNPS_CLOCK_GATE_HIGH_STOPWATCH_2 clk_gate_DATE_reg ( .CLK(CLK100), .EN(N109), 
        .ENCLK(net928), .TE(net918) );
  SNPS_CLOCK_GATE_HIGH_STOPWATCH_1 clk_gate_HOUR_reg ( .CLK(CLK100), .EN(N103), 
        .ENCLK(net933), .TE(net918) );
  SAEDRVT14_FDPRBQ_V2LP_1 running_reg ( .D(n25), .CK(CLK100), .RD(RSTN), .Q(
        running) );
  SAEDRVT14_FDPSBQ_1 \DATE_reg[0]  ( .D(N104), .CK(net928), .SD(RSTN), .Q(
        DATE[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[0]  ( .D(N98), .CK(net933), .RD(RSTN), .Q(
        HOUR[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[0]  ( .D(N84), .CK(net917), .RD(RSTN), 
        .Q(SECOND[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[0]  ( .D(N91), .CK(net923), .RD(RSTN), 
        .Q(MINUTE[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[1]  ( .D(N85), .CK(net917), .RD(RSTN), 
        .Q(SECOND[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[1]  ( .D(N92), .CK(net923), .RD(RSTN), 
        .Q(MINUTE[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \DATE_reg[1]  ( .D(N105), .CK(net928), .RD(RSTN), 
        .Q(DATE[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[1]  ( .D(N99), .CK(net933), .RD(RSTN), .Q(
        HOUR[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \DATE_reg[4]  ( .D(N108), .CK(net928), .RD(RSTN), 
        .Q(DATE[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[4]  ( .D(N102), .CK(net933), .RD(RSTN), 
        .Q(HOUR[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \DATE_reg[2]  ( .D(N106), .CK(net928), .RD(RSTN), 
        .Q(DATE[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[2]  ( .D(N100), .CK(net933), .RD(RSTN), 
        .Q(HOUR[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \DATE_reg[3]  ( .D(N107), .CK(net928), .RD(RSTN), 
        .Q(DATE[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \HOUR_reg[3]  ( .D(N101), .CK(net933), .RD(RSTN), 
        .Q(HOUR[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[2]  ( .D(N86), .CK(net917), .RD(RSTN), 
        .Q(SECOND[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[2]  ( .D(N93), .CK(net923), .RD(RSTN), 
        .Q(MINUTE[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[5]  ( .D(N89), .CK(net917), .RD(RSTN), 
        .Q(SECOND[5]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[5]  ( .D(N96), .CK(net923), .RD(RSTN), 
        .Q(MINUTE[5]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[3]  ( .D(N87), .CK(net917), .RD(RSTN), 
        .Q(SECOND[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[3]  ( .D(N94), .CK(net923), .RD(RSTN), 
        .Q(MINUTE[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SECOND_reg[4]  ( .D(N88), .CK(net917), .RD(RSTN), 
        .Q(SECOND[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \MINUTE_reg[4]  ( .D(N95), .CK(net923), .RD(RSTN), 
        .Q(MINUTE[4]) );
  SAEDRVT14_TIE0_V1_2 U3 ( .X(net918) );
  SAEDRVT14_OAI21_0P75 U4 ( .A1(N36), .A2(n24), .B(n17), .X(N109) );
  SAEDRVT14_OR3_1 U5 ( .A1(N27), .A2(N18), .A3(n21), .X(n24) );
  SAEDRVT14_ND2_CDC_0P5 U6 ( .A1(n17), .A2(n24), .X(N103) );
  SAEDRVT14_INV_S_1 U7 ( .A(N114), .X(N104) );
  SAEDRVT14_OAI21_0P75 U8 ( .A1(N18), .A2(n21), .B(n17), .X(N97) );
  SAEDRVT14_AN2_MM_1 U9 ( .A1(N27), .A2(n17), .X(n22) );
  SAEDRVT14_AN2_MM_1 U10 ( .A1(N18), .A2(n17), .X(n23) );
  SAEDRVT14_AN2_MM_1 U11 ( .A1(N30), .A2(n22), .X(N92) );
  SAEDRVT14_AN2_MM_1 U12 ( .A1(N31), .A2(n22), .X(N93) );
  SAEDRVT14_AN2_MM_1 U13 ( .A1(N32), .A2(n22), .X(N94) );
  SAEDRVT14_AN2_MM_1 U14 ( .A1(N33), .A2(n22), .X(N95) );
  SAEDRVT14_AN2_MM_1 U15 ( .A1(N21), .A2(n23), .X(N85) );
  SAEDRVT14_AN2_MM_1 U16 ( .A1(N22), .A2(n23), .X(N86) );
  SAEDRVT14_AN2_MM_1 U17 ( .A1(N23), .A2(n23), .X(N87) );
  SAEDRVT14_AN2_MM_1 U18 ( .A1(N24), .A2(n23), .X(N88) );
  SAEDRVT14_AN2_MM_1 U19 ( .A1(N36), .A2(n17), .X(n20) );
  SAEDRVT14_AN2_MM_1 U20 ( .A1(N40), .A2(n20), .X(N100) );
  SAEDRVT14_AN2_MM_1 U21 ( .A1(N41), .A2(n20), .X(N101) );
  SAEDRVT14_AN2_MM_1 U22 ( .A1(N39), .A2(n20), .X(N99) );
  SAEDRVT14_ND2_CDC_0P5 U23 ( .A1(n17), .A2(n21), .X(N90) );
  SAEDRVT14_ND2B_U_0P5 U24 ( .A(SW2), .B(prev_SW2), .X(n17) );
  SAEDRVT14_AN2_MM_1 U25 ( .A1(N44), .A2(n17), .X(N112) );
  SAEDRVT14_ADDH_0P5 U26 ( .A(N115), .B(N114), .CO(
        \add_31_S2_C51_S2_aco/carry[2] ), .S(N105) );
  SAEDRVT14_ADDH_0P5 U27 ( .A(N116), .B(\add_31_S2_C51_S2_aco/carry[2] ), .CO(
        \add_31_S2_C51_S2_aco/carry[3] ), .S(N106) );
  SAEDRVT14_ADDH_0P5 U28 ( .A(N117), .B(\add_31_S2_C51_S2_aco/carry[3] ), .CO(
        \add_31_S2_C51_S2_aco/carry[4] ), .S(N107) );
  SAEDRVT14_ND3_0P5 U29 ( .A1(running), .A2(SW2), .A3(tick), .X(n21) );
  SAEDRVT14_AN2_MM_1 U30 ( .A1(N34), .A2(n22), .X(N96) );
  SAEDRVT14_AN2_MM_1 U31 ( .A1(N25), .A2(n23), .X(N89) );
  SAEDRVT14_AN2_MM_1 U32 ( .A1(N29), .A2(n22), .X(N91) );
  SAEDRVT14_INV_S_1 U33 ( .A(MINUTE[0]), .X(N29) );
  SAEDRVT14_AN2_MM_1 U34 ( .A1(N20), .A2(n23), .X(N84) );
  SAEDRVT14_INV_S_1 U35 ( .A(SECOND[0]), .X(N20) );
  SAEDRVT14_AN2_MM_1 U36 ( .A1(N42), .A2(n20), .X(N102) );
  SAEDRVT14_AN2_MM_1 U37 ( .A1(N38), .A2(n20), .X(N98) );
  SAEDRVT14_INV_S_1 U38 ( .A(HOUR[0]), .X(N38) );
  SAEDRVT14_EO2_V1_0P75 U40 ( .A1(n19), .A2(running), .X(n18) );
  SAEDRVT14_ND2_CDC_0P5 U41 ( .A1(SW2), .A2(KEY3), .X(n19) );
  SAEDRVT14_ADDH_0P5 U42 ( .A(MINUTE[3]), .B(\add_25_S2_C51_S2/carry[3] ), 
        .CO(\add_25_S2_C51_S2/carry[4] ), .S(N32) );
  SAEDRVT14_ADDH_0P5 U43 ( .A(SECOND[3]), .B(\add_22_S2_C51_S2/carry[3] ), 
        .CO(\add_22_S2_C51_S2/carry[4] ), .S(N23) );
  SAEDRVT14_ADDH_0P5 U44 ( .A(MINUTE[1]), .B(MINUTE[0]), .CO(
        \add_25_S2_C51_S2/carry[2] ), .S(N30) );
  SAEDRVT14_ADDH_0P5 U45 ( .A(SECOND[1]), .B(SECOND[0]), .CO(
        \add_22_S2_C51_S2/carry[2] ), .S(N21) );
  SAEDRVT14_ADDH_0P5 U46 ( .A(MINUTE[2]), .B(\add_25_S2_C51_S2/carry[2] ), 
        .CO(\add_25_S2_C51_S2/carry[3] ), .S(N31) );
  SAEDRVT14_ADDH_0P5 U47 ( .A(SECOND[2]), .B(\add_22_S2_C51_S2/carry[2] ), 
        .CO(\add_22_S2_C51_S2/carry[3] ), .S(N22) );
  SAEDRVT14_ADDH_0P5 U48 ( .A(MINUTE[4]), .B(\add_25_S2_C51_S2/carry[4] ), 
        .CO(\add_25_S2_C51_S2/carry[5] ), .S(N33) );
  SAEDRVT14_ADDH_0P5 U49 ( .A(SECOND[4]), .B(\add_22_S2_C51_S2/carry[4] ), 
        .CO(\add_22_S2_C51_S2/carry[5] ), .S(N24) );
  SAEDRVT14_ADDH_0P5 U50 ( .A(HOUR[1]), .B(HOUR[0]), .CO(
        \add_28_S2_C51_S2/carry[2] ), .S(N39) );
  SAEDRVT14_ADDH_0P5 U51 ( .A(HOUR[2]), .B(\add_28_S2_C51_S2/carry[2] ), .CO(
        \add_28_S2_C51_S2/carry[3] ), .S(N40) );
  SAEDRVT14_ADDH_0P5 U52 ( .A(HOUR[3]), .B(\add_28_S2_C51_S2/carry[3] ), .CO(
        \add_28_S2_C51_S2/carry[4] ), .S(N41) );
  SAEDRVT14_AN2_1 U53 ( .A1(DATE[0]), .A2(N112), .X(N114) );
  SAEDRVT14_AN2_1 U54 ( .A1(DATE[1]), .A2(N112), .X(N115) );
  SAEDRVT14_AN2_1 U55 ( .A1(DATE[2]), .A2(N112), .X(N116) );
  SAEDRVT14_AN2_1 U56 ( .A1(DATE[3]), .A2(N112), .X(N117) );
  SAEDRVT14_AN2_1 U57 ( .A1(N112), .A2(DATE[4]), .X(N118) );
  SAEDRVT14_EO2_V1_0P75 U58 ( .A1(\add_31_S2_C51_S2_aco/carry[4] ), .A2(N118), 
        .X(N108) );
  SAEDRVT14_EO2_V1_0P75 U59 ( .A1(\add_22_S2_C51_S2/carry[5] ), .A2(SECOND[5]), 
        .X(N25) );
  SAEDRVT14_EO2_V1_0P75 U60 ( .A1(\add_25_S2_C51_S2/carry[5] ), .A2(MINUTE[5]), 
        .X(N34) );
  SAEDRVT14_EO2_V1_0P75 U61 ( .A1(\add_28_S2_C51_S2/carry[4] ), .A2(HOUR[4]), 
        .X(N42) );
  SAEDRVT14_AO32_1 U62 ( .A1(SECOND[1]), .A2(SECOND[0]), .A3(SECOND[3]), .B1(
        SECOND[2]), .B2(SECOND[3]), .X(n1) );
  SAEDRVT14_ND3_0P5 U63 ( .A1(SECOND[4]), .A2(n1), .A3(SECOND[5]), .X(N18) );
  SAEDRVT14_AO32_1 U64 ( .A1(MINUTE[1]), .A2(MINUTE[0]), .A3(MINUTE[3]), .B1(
        MINUTE[2]), .B2(MINUTE[3]), .X(n2) );
  SAEDRVT14_ND3_0P5 U65 ( .A1(MINUTE[4]), .A2(n2), .A3(MINUTE[5]), .X(N27) );
  SAEDRVT14_AN3_0P5 U66 ( .A1(HOUR[1]), .A2(HOUR[0]), .A3(HOUR[2]), .X(n3) );
  SAEDRVT14_OAI21_0P5 U67 ( .A1(n3), .A2(HOUR[3]), .B(HOUR[4]), .X(N36) );
  SAEDRVT14_AN3_0P5 U68 ( .A1(DATE[1]), .A2(DATE[0]), .A3(DATE[2]), .X(n4) );
  SAEDRVT14_ND3_0P5 U69 ( .A1(DATE[4]), .A2(DATE[3]), .A3(n4), .X(N44) );
endmodule


module TOP_DW01_inc_0_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  SAEDRVT14_ADDH_0P5 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  SAEDRVT14_ADDH_0P5 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  SAEDRVT14_ADDH_0P5 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  SAEDRVT14_ADDH_0P5 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  SAEDRVT14_ADDH_0P5 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  SAEDRVT14_INV_S_1 U1 ( .A(A[0]), .X(SUM[0]) );
  SAEDRVT14_EO2_V1_0P75 U2 ( .A1(carry[6]), .A2(A[6]), .X(SUM[6]) );
endmodule


module TOP ( SEG7_0, SEG7_1, SEG7_2, SEG7_3, SEG7_4, SEG7_5, SEG7_6, SEG7_7, 
        CLK1K, KEY1, KEY2, KEY3, RSTN, SW1, SW2, SW3 );
  output [6:0] SEG7_0;
  output [6:0] SEG7_1;
  output [6:0] SEG7_2;
  output [6:0] SEG7_3;
  output [6:0] SEG7_4;
  output [6:0] SEG7_5;
  output [6:0] SEG7_6;
  output [6:0] SEG7_7;
  input CLK1K, KEY1, KEY2, KEY3, RSTN, SW1, SW2, SW3;
  wire   SW1_DB, SW2_DB, SW3_DB, CLK100, N14, N20, N21, N22, N23, N24, N25,
         N26, N27, N28, N29, N30, N31, N32, N33, KEY1_DB, KEY2_DB, KEY3_DB,
         \seg_hour1[1] , \seg_date1[1] , n10, \gen_clock/n5 , \gen_clock/n3 ,
         \gen_clock/n1 , \gen_clock/N10 , \gen_clock/N9 , \gen_clock/N8 ,
         \gen_clock/N4 , \db_key1/N1 , \db_key1/prev , \db_key1/curr ,
         \bcd_sec/n15 , \bcd_sec/n14 , \bcd_sec/n13 , \bcd_sec/n12 ,
         \bcd_sec/n11 , \bcd_sec/n10 , \bcd_sec/n9 , \bcd_sec/n8 ,
         \bcd_sec/n7 , \bcd_sec/n6 , \bcd_sec/n5 , \bcd_sec/n4 ,
         \bcd_hour/n10 , \bcd_hour/n9 , \bcd_hour/n8 , \bcd_hour/n7 ,
         \bcd_hour/n6 , \bcd_hour/n5 , \bcd_hour/n4 , \bcd_hour/n3 ,
         \bcd_hour/n2 , \d0/n7 , \d0/n6 , \d0/n5 , \d0/n4 , \d1/n6 , \d1/n5 ,
         \d1/n4 , \db_key3/N1 , \db_key3/prev , \db_key3/curr , \db_key2/N1 ,
         \db_key2/prev , \db_key2/curr , \SEG7_5[1] , n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89;
  wire   [2:0] SW1_shift;
  wire   [2:0] SW2_shift;
  wire   [6:0] global_cnt;
  wire   [5:0] MAIN_SEC;
  wire   [5:0] MAIN_MIN;
  wire   [4:0] MAIN_HOUR;
  wire   [4:0] MAIN_DATE;
  wire   [5:0] SUB_SEC;
  wire   [5:0] SUB_MIN;
  wire   [4:0] SUB_HOUR;
  wire   [4:0] SUB_DATE;
  wire   [5:0] selected_SEC;
  wire   [5:0] selected_MIN;
  wire   [4:0] selected_HOUR;
  wire   [4:0] selected_DATE;
  wire   [2:0] seg_sec1;
  wire   [3:0] seg_sec0;
  wire   [2:0] seg_min1;
  wire   [3:0] seg_min0;
  wire   [3:0] seg_hour0;
  wire   [3:0] seg_date0;
  wire   [2:0] \gen_clock/CNT ;
  assign SEG7_1[0] = SEG7_1[3];
  assign SEG7_3[0] = SEG7_3[3];
  assign SEG7_5[0] = SEG7_5[3];
  assign SEG7_7[0] = SEG7_7[3];
  assign SEG7_7[1] = \SEG7_5[1] ;
  assign SEG7_5[1] = \SEG7_5[1] ;

  DIGITALCLOCK mainclock ( .SECOND(MAIN_SEC), .MINUTE(MAIN_MIN), .HOUR(
        MAIN_HOUR), .DATE(MAIN_DATE), .RSTN(RSTN), .CLK100(CLK100), .SW1(
        SW1_DB), .KEY1(KEY1_DB), .KEY2(KEY2_DB), .KEY3(KEY3_DB), .tick(n89) );
  STOPWATCH stopwatch ( .SECOND(SUB_SEC), .MINUTE(SUB_MIN), .HOUR(SUB_HOUR), 
        .DATE(SUB_DATE), .RSTN(RSTN), .CLK100(CLK100), .KEY3(KEY3_DB), .SW2(
        n24), .tick(n89), .prev_SW2(SW2_shift[2]) );
  TOP_DW01_inc_0_DW01_inc_2 add_87 ( .A(global_cnt), .SUM({N26, N25, N24, N23, 
        N22, N21, N20}) );
  SAEDRVT14_ND2B_U_0P5 \gen_clock/U5  ( .A(\gen_clock/CNT [0]), .B(
        \gen_clock/n3 ), .X(\gen_clock/n1 ) );
  SAEDRVT14_AN2B_MM_1 \db_key1/U3  ( .B(\db_key1/curr ), .A(\db_key1/prev ), 
        .X(\db_key1/N1 ) );
  SAEDRVT14_OA21_1 \bcd_hour/U13  ( .A1(selected_HOUR[2]), .A2(\bcd_hour/n10 ), 
        .B(selected_HOUR[3]), .X(\bcd_hour/n3 ) );
  SAEDRVT14_AO21B_0P5 \bcd_hour/U12  ( .A1(\bcd_hour/n6 ), .A2(\bcd_hour/n5 ), 
        .B(\bcd_hour/n7 ), .X(\bcd_hour/n2 ) );
  SAEDRVT14_ND2B_U_0P5 \bcd_hour/U11  ( .A(\bcd_hour/n2 ), .B(\bcd_hour/n8 ), 
        .X(SEG7_5[4]) );
  SAEDRVT14_AO32_1 \d0/U14  ( .A1(seg_sec0[1]), .A2(n82), .A3(seg_sec0[2]), 
        .B1(\d0/n7 ), .B2(seg_sec0[0]), .X(SEG7_0[1]) );
  SAEDRVT14_ND2B_U_0P5 \d0/U13  ( .A(SEG7_0[0]), .B(\d0/n4 ), .X(SEG7_0[3]) );
  SAEDRVT14_AN2B_MM_1 \db_key3/U3  ( .B(\db_key3/curr ), .A(\db_key3/prev ), 
        .X(\db_key3/N1 ) );
  SAEDRVT14_AN2B_MM_1 \db_key2/U3  ( .B(\db_key2/curr ), .A(\db_key2/prev ), 
        .X(\db_key2/N1 ) );
  SAEDRVT14_AO32_1 \d6/U14  ( .A1(seg_date0[1]), .A2(n68), .A3(seg_date0[2]), 
        .B1(n67), .B2(seg_date0[0]), .X(SEG7_6[1]) );
  SAEDRVT14_ND2B_U_0P5 \d6/U13  ( .A(SEG7_6[0]), .B(n64), .X(SEG7_6[3]) );
  SAEDRVT14_AO32_1 \d4/U14  ( .A1(seg_hour0[1]), .A2(n63), .A3(seg_hour0[2]), 
        .B1(n60), .B2(seg_hour0[0]), .X(SEG7_4[1]) );
  SAEDRVT14_ND2B_U_0P5 \d4/U13  ( .A(SEG7_4[0]), .B(n57), .X(SEG7_4[3]) );
  SAEDRVT14_AO32_1 \d2/U14  ( .A1(seg_min0[1]), .A2(n56), .A3(seg_min0[2]), 
        .B1(n53), .B2(seg_min0[0]), .X(SEG7_2[1]) );
  SAEDRVT14_ND2B_U_0P5 \d2/U13  ( .A(SEG7_2[0]), .B(n50), .X(SEG7_2[3]) );
  SAEDRVT14_OA21_1 \bcd_date/U13  ( .A1(selected_DATE[2]), .A2(n35), .B(
        selected_DATE[3]), .X(n28) );
  SAEDRVT14_AO21B_0P5 \bcd_date/U12  ( .A1(n31), .A2(n30), .B(n32), .X(n27) );
  SAEDRVT14_ND2B_U_0P5 \bcd_date/U11  ( .A(n27), .B(n33), .X(SEG7_7[4]) );
  SAEDRVT14_FDPSBQ_1 \db_key1/curr_reg  ( .D(KEY1), .CK(CLK100), .SD(RSTN), 
        .Q(\db_key1/curr ) );
  SAEDRVT14_FDPSBQ_1 \db_key3/curr_reg  ( .D(KEY3), .CK(CLK100), .SD(RSTN), 
        .Q(\db_key3/curr ) );
  SAEDRVT14_FDPSBQ_1 \db_key2/curr_reg  ( .D(KEY2), .CK(CLK100), .SD(RSTN), 
        .Q(\db_key2/curr ) );
  SAEDRVT14_FDPSBQ_1 \db_key1/prev_reg  ( .D(\db_key1/curr ), .CK(CLK100), 
        .SD(RSTN), .Q(\db_key1/prev ) );
  SAEDRVT14_FDPSBQ_1 \db_key3/prev_reg  ( .D(\db_key3/curr ), .CK(CLK100), 
        .SD(RSTN), .Q(\db_key3/prev ) );
  SAEDRVT14_FDPSBQ_1 \db_key2/prev_reg  ( .D(\db_key2/curr ), .CK(CLK100), 
        .SD(RSTN), .Q(\db_key2/prev ) );
  SAEDRVT14_FDPRBQ_V2LP_1 \db_key1/DB_reg  ( .D(\db_key1/N1 ), .CK(CLK100), 
        .RD(RSTN), .Q(KEY1_DB) );
  SAEDRVT14_FDPRBQ_V2LP_1 \db_key3/DB_reg  ( .D(\db_key3/N1 ), .CK(CLK100), 
        .RD(RSTN), .Q(KEY3_DB) );
  SAEDRVT14_FDPRBQ_V2LP_1 \db_key2/DB_reg  ( .D(\db_key2/N1 ), .CK(CLK100), 
        .RD(RSTN), .Q(KEY2_DB) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SW1_shift_reg[1]  ( .D(SW1_shift[0]), .CK(CLK100), 
        .RD(RSTN), .Q(SW1_shift[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SW1_shift_reg[2]  ( .D(SW1_shift[1]), .CK(CLK100), 
        .RD(RSTN), .Q(SW1_shift[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SW1_shift_reg[0]  ( .D(SW1), .CK(CLK100), .RD(RSTN), 
        .Q(SW1_shift[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 SW3_shift_reg ( .D(SW3), .CK(CLK100), .RD(RSTN), .Q(
        SW3_DB) );
  SAEDRVT14_FDPRBQ_V2LP_1 \global_cnt_reg[5]  ( .D(N32), .CK(CLK100), .RD(RSTN), .Q(global_cnt[5]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \global_cnt_reg[6]  ( .D(N33), .CK(CLK100), .RD(RSTN), .Q(global_cnt[6]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \global_cnt_reg[2]  ( .D(N29), .CK(CLK100), .RD(RSTN), .Q(global_cnt[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \global_cnt_reg[3]  ( .D(N30), .CK(CLK100), .RD(RSTN), .Q(global_cnt[3]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \global_cnt_reg[4]  ( .D(N31), .CK(CLK100), .RD(RSTN), .Q(global_cnt[4]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \global_cnt_reg[1]  ( .D(N28), .CK(CLK100), .RD(RSTN), .Q(global_cnt[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \global_cnt_reg[0]  ( .D(N27), .CK(CLK100), .RD(RSTN), .Q(global_cnt[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SW2_shift_reg[1]  ( .D(SW2_shift[0]), .CK(CLK100), 
        .RD(RSTN), .Q(SW2_shift[1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SW2_shift_reg[0]  ( .D(SW2), .CK(CLK100), .RD(RSTN), 
        .Q(SW2_shift[0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \SW2_shift_reg[2]  ( .D(SW2_shift[1]), .CK(CLK100), 
        .RD(RSTN), .Q(SW2_shift[2]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \gen_clock/CLK100_reg  ( .D(n12), .CK(CLK1K), .RD(
        RSTN), .Q(CLK100) );
  SAEDRVT14_FDPRBQ_V2LP_1 \gen_clock/CNT_reg[0]  ( .D(\gen_clock/N8 ), .CK(
        CLK1K), .RD(RSTN), .Q(\gen_clock/CNT [0]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \gen_clock/CNT_reg[1]  ( .D(\gen_clock/N9 ), .CK(
        CLK1K), .RD(RSTN), .Q(\gen_clock/CNT [1]) );
  SAEDRVT14_FDPRBQ_V2LP_1 \gen_clock/CNT_reg[2]  ( .D(\gen_clock/N10 ), .CK(
        CLK1K), .RD(RSTN), .Q(\gen_clock/CNT [2]) );
  SAEDRVT14_INV_S_1 \gen_clock/I_3  ( .A(CLK100), .X(\gen_clock/N4 ) );
  SAEDRVT14_AO22_1 \gen_clock/U3  ( .A1(CLK100), .A2(\gen_clock/n1 ), .B1(
        \gen_clock/N4 ), .B2(n86), .X(\gen_clock/n5 ) );
  SAEDRVT14_TIE0_V1_2 U40 ( .X(\SEG7_5[1] ) );
  SAEDRVT14_DEL_R2V3_2 U41 ( .A(n15), .X(n12) );
  SAEDRVT14_DEL_R2V3_1 U42 ( .A(\gen_clock/n5 ), .X(n13) );
  SAEDRVT14_INV_S_20 U43 ( .A(n14), .X(n15) );
  SAEDRVT14_INV_S_20 U44 ( .A(n17), .X(n14) );
  SAEDRVT14_INV_S_20 U45 ( .A(n16), .X(n17) );
  SAEDRVT14_INV_S_20 U46 ( .A(n19), .X(n16) );
  SAEDRVT14_INV_S_20 U47 ( .A(n18), .X(n19) );
  SAEDRVT14_INV_S_20 U48 ( .A(n13), .X(n18) );
  SAEDRVT14_AO32_4 U49 ( .A1(\gen_clock/CNT [1]), .A2(n85), .A3(
        \gen_clock/CNT [0]), .B1(\gen_clock/CNT [2]), .B2(\gen_clock/N9 ), .X(
        \gen_clock/N10 ) );
  SAEDRVT14_ND2_CDC_0P5 U50 ( .A1(n76), .A2(SEG7_7[6]), .X(SEG7_7[5]) );
  SAEDRVT14_ND2_CDC_0P5 U51 ( .A1(n77), .A2(SEG7_5[6]), .X(SEG7_5[5]) );
  SAEDRVT14_INV_S_1 U52 ( .A(seg_min0[2]), .X(n54) );
  SAEDRVT14_INV_S_1 U53 ( .A(seg_sec0[2]), .X(n80) );
  SAEDRVT14_INV_S_1 U54 ( .A(n53), .X(n55) );
  SAEDRVT14_INV_S_1 U55 ( .A(\d0/n7 ), .X(n81) );
  SAEDRVT14_EO2_V1_0P75 U56 ( .A1(seg_min1[2]), .A2(n20), .X(n73) );
  SAEDRVT14_EO2_V1_0P75 U57 ( .A1(seg_sec1[2]), .A2(n21), .X(\d1/n6 ) );
  SAEDRVT14_AN2_MM_1 U58 ( .A1(n36), .A2(n43), .X(n20) );
  SAEDRVT14_AN2_MM_1 U59 ( .A1(\bcd_sec/n4 ), .A2(\bcd_sec/n11 ), .X(n21) );
  SAEDRVT14_EO2_V1_0P75 U60 ( .A1(n36), .A2(n37), .X(seg_min0[3]) );
  SAEDRVT14_EO2_V1_0P75 U61 ( .A1(\bcd_sec/n4 ), .A2(\bcd_sec/n5 ), .X(
        seg_sec0[3]) );
  SAEDRVT14_NR2_MM_1 U62 ( .A1(n72), .A2(n75), .X(SEG7_3[1]) );
  SAEDRVT14_NR2_MM_1 U63 ( .A1(\d1/n5 ), .A2(n79), .X(SEG7_1[1]) );
  SAEDRVT14_INV_S_1 U64 ( .A(seg_date0[2]), .X(n69) );
  SAEDRVT14_INV_S_1 U65 ( .A(seg_hour0[2]), .X(n61) );
  SAEDRVT14_INV_S_1 U66 ( .A(n67), .X(n70) );
  SAEDRVT14_INV_S_1 U67 ( .A(n60), .X(n62) );
  SAEDRVT14_INV_S_1 U68 ( .A(SEG7_7[4]), .X(n76) );
  SAEDRVT14_INV_S_1 U69 ( .A(SEG7_5[4]), .X(n77) );
  SAEDRVT14_NR2_MM_1 U70 ( .A1(n76), .A2(\seg_date1[1] ), .X(SEG7_7[3]) );
  SAEDRVT14_NR2_MM_1 U71 ( .A1(n77), .A2(\seg_hour1[1] ), .X(SEG7_5[3]) );
  SAEDRVT14_NR2_MM_1 U72 ( .A1(SEG7_7[4]), .A2(SEG7_7[6]), .X(SEG7_7[2]) );
  SAEDRVT14_NR2_MM_1 U73 ( .A1(SEG7_5[4]), .A2(SEG7_5[6]), .X(SEG7_5[2]) );
  SAEDRVT14_INV_S_1 U74 ( .A(seg_min1[2]), .X(n75) );
  SAEDRVT14_INV_S_1 U75 ( .A(seg_sec1[2]), .X(n79) );
  SAEDRVT14_INV_S_1 U76 ( .A(\seg_date1[1] ), .X(SEG7_7[6]) );
  SAEDRVT14_INV_S_1 U77 ( .A(\seg_hour1[1] ), .X(SEG7_5[6]) );
  SAEDRVT14_EO2_V1_0P75 U78 ( .A1(n46), .A2(n47), .X(n37) );
  SAEDRVT14_AN2_MM_1 U79 ( .A1(n48), .A2(seg_min1[1]), .X(n47) );
  SAEDRVT14_EO2_V1_0P75 U80 ( .A1(\bcd_sec/n14 ), .A2(\bcd_sec/n15 ), .X(
        \bcd_sec/n5 ) );
  SAEDRVT14_AN2_MM_1 U81 ( .A1(n83), .A2(seg_sec1[1]), .X(\bcd_sec/n15 ) );
  SAEDRVT14_EN2_1 U82 ( .A1(n38), .A2(n39), .X(seg_min0[2]) );
  SAEDRVT14_ND2_CDC_0P5 U83 ( .A1(n40), .A2(n41), .X(n38) );
  SAEDRVT14_EN2_1 U84 ( .A1(\bcd_sec/n6 ), .A2(\bcd_sec/n7 ), .X(seg_sec0[2])
         );
  SAEDRVT14_ND2_CDC_0P5 U85 ( .A1(\bcd_sec/n8 ), .A2(\bcd_sec/n9 ), .X(
        \bcd_sec/n6 ) );
  SAEDRVT14_NR2_MM_1 U86 ( .A1(n54), .A2(seg_min0[1]), .X(n53) );
  SAEDRVT14_NR2_MM_1 U87 ( .A1(n80), .A2(seg_sec0[1]), .X(\d0/n7 ) );
  SAEDRVT14_INV_S_1 U88 ( .A(n24), .X(n26) );
  SAEDRVT14_AOI21_0P5 U89 ( .A1(n40), .A2(n39), .B(n49), .X(n36) );
  SAEDRVT14_INV_S_1 U90 ( .A(n41), .X(n49) );
  SAEDRVT14_AOI21_0P5 U91 ( .A1(\bcd_sec/n8 ), .A2(\bcd_sec/n7 ), .B(n84), .X(
        \bcd_sec/n4 ) );
  SAEDRVT14_INV_S_1 U92 ( .A(\bcd_sec/n9 ), .X(n84) );
  SAEDRVT14_AN3_0P75 U93 ( .A1(seg_min1[1]), .A2(n20), .A3(n73), .X(SEG7_3[2])
         );
  SAEDRVT14_AN3_0P75 U94 ( .A1(seg_sec1[1]), .A2(n21), .A3(\d1/n6 ), .X(
        SEG7_1[2]) );
  SAEDRVT14_NR2_MM_1 U95 ( .A1(n73), .A2(seg_min1[1]), .X(SEG7_3[3]) );
  SAEDRVT14_NR2_MM_1 U96 ( .A1(\d1/n6 ), .A2(seg_sec1[1]), .X(SEG7_1[3]) );
  SAEDRVT14_EO2_V1_0P75 U97 ( .A1(n20), .A2(seg_min1[1]), .X(n72) );
  SAEDRVT14_EO2_V1_0P75 U98 ( .A1(n21), .A2(seg_sec1[1]), .X(\d1/n5 ) );
  SAEDRVT14_OAI22_1 U99 ( .A1(seg_min1[2]), .A2(n72), .B1(n74), .B2(n20), .X(
        SEG7_3[5]) );
  SAEDRVT14_INV_S_1 U100 ( .A(seg_min1[1]), .X(n74) );
  SAEDRVT14_OAI22_1 U101 ( .A1(seg_sec1[2]), .A2(\d1/n5 ), .B1(n78), .B2(n21), 
        .X(SEG7_1[5]) );
  SAEDRVT14_INV_S_1 U102 ( .A(seg_sec1[1]), .X(n78) );
  SAEDRVT14_OR3_1 U103 ( .A1(seg_min0[3]), .A2(seg_min0[2]), .A3(n56), .X(n51)
         );
  SAEDRVT14_OR3_1 U104 ( .A1(seg_sec0[3]), .A2(seg_sec0[2]), .A3(n82), .X(
        \d0/n5 ) );
  SAEDRVT14_ND2_CDC_0P5 U105 ( .A1(n56), .A2(n55), .X(SEG7_2[4]) );
  SAEDRVT14_ND2_CDC_0P5 U106 ( .A1(n82), .A2(n81), .X(SEG7_0[4]) );
  SAEDRVT14_EO2_V1_0P75 U107 ( .A1(n45), .A2(seg_min1[1]), .X(n43) );
  SAEDRVT14_EO2_V1_0P75 U108 ( .A1(\bcd_sec/n13 ), .A2(seg_sec1[1]), .X(
        \bcd_sec/n11 ) );
  SAEDRVT14_OAI21_0P75 U109 ( .A1(seg_min1[1]), .A2(n75), .B(n20), .X(
        SEG7_3[4]) );
  SAEDRVT14_OAI21_0P75 U110 ( .A1(seg_sec1[1]), .A2(n79), .B(n21), .X(
        SEG7_1[4]) );
  SAEDRVT14_AOI21_0P5 U111 ( .A1(seg_min1[1]), .A2(n20), .B(n71), .X(SEG7_3[6]) );
  SAEDRVT14_EO2_V1_0P75 U112 ( .A1(seg_min1[2]), .A2(seg_min1[1]), .X(n71) );
  SAEDRVT14_AOI21_0P5 U113 ( .A1(seg_sec1[1]), .A2(n21), .B(\d1/n4 ), .X(
        SEG7_1[6]) );
  SAEDRVT14_EO2_V1_0P75 U114 ( .A1(seg_sec1[2]), .A2(seg_sec1[1]), .X(\d1/n4 )
         );
  SAEDRVT14_AN3_0P75 U115 ( .A1(n56), .A2(n54), .A3(seg_min0[1]), .X(SEG7_2[2]) );
  SAEDRVT14_AN3_0P75 U116 ( .A1(n82), .A2(n80), .A3(seg_sec0[1]), .X(SEG7_0[2]) );
  SAEDRVT14_OAI31_1 U117 ( .A1(seg_min0[1]), .A2(seg_min0[3]), .A3(seg_min0[2]), .B(n50), .X(SEG7_2[6]) );
  SAEDRVT14_OAI31_1 U118 ( .A1(seg_sec0[1]), .A2(seg_sec0[3]), .A3(seg_sec0[2]), .B(\d0/n4 ), .X(SEG7_0[6]) );
  SAEDRVT14_EN2_1 U119 ( .A1(\bcd_hour/n4 ), .A2(\bcd_hour/n5 ), .X(
        seg_hour0[2]) );
  SAEDRVT14_ND2_CDC_0P5 U120 ( .A1(\bcd_hour/n6 ), .A2(\bcd_hour/n7 ), .X(
        \bcd_hour/n4 ) );
  SAEDRVT14_NR2_MM_1 U121 ( .A1(n69), .A2(seg_date0[1]), .X(n67) );
  SAEDRVT14_NR2_MM_1 U122 ( .A1(n61), .A2(seg_hour0[1]), .X(n60) );
  SAEDRVT14_INV_S_1 U123 ( .A(n35), .X(\seg_date1[1] ) );
  SAEDRVT14_INV_S_1 U124 ( .A(\bcd_hour/n10 ), .X(\seg_hour1[1] ) );
  SAEDRVT14_EN2_1 U125 ( .A1(n29), .A2(n30), .X(seg_date0[2]) );
  SAEDRVT14_ND2_CDC_0P5 U126 ( .A1(n31), .A2(n32), .X(n29) );
  SAEDRVT14_INV_S_1 U127 ( .A(n24), .X(n25) );
  SAEDRVT14_ND2_CDC_0P5 U128 ( .A1(n68), .A2(n70), .X(SEG7_6[4]) );
  SAEDRVT14_ND2_CDC_0P5 U129 ( .A1(n63), .A2(n62), .X(SEG7_4[4]) );
  SAEDRVT14_OR3_1 U130 ( .A1(seg_date0[3]), .A2(seg_date0[2]), .A3(n68), .X(
        n65) );
  SAEDRVT14_OR3_1 U131 ( .A1(seg_hour0[3]), .A2(seg_hour0[2]), .A3(n63), .X(
        n58) );
  SAEDRVT14_EO2_V1_0P75 U132 ( .A1(n27), .A2(n28), .X(seg_date0[3]) );
  SAEDRVT14_EO2_V1_0P75 U133 ( .A1(\bcd_hour/n2 ), .A2(\bcd_hour/n3 ), .X(
        seg_hour0[3]) );
  SAEDRVT14_OAI31_1 U134 ( .A1(seg_date0[1]), .A2(seg_date0[3]), .A3(
        seg_date0[2]), .B(n64), .X(SEG7_6[6]) );
  SAEDRVT14_OAI31_1 U135 ( .A1(seg_hour0[1]), .A2(seg_hour0[3]), .A3(
        seg_hour0[2]), .B(n57), .X(SEG7_4[6]) );
  SAEDRVT14_AN3_0P75 U136 ( .A1(n68), .A2(n69), .A3(seg_date0[1]), .X(
        SEG7_6[2]) );
  SAEDRVT14_AN3_0P75 U137 ( .A1(n63), .A2(n61), .A3(seg_hour0[1]), .X(
        SEG7_4[2]) );
  SAEDRVT14_INV_S_1 U138 ( .A(n42), .X(seg_min1[2]) );
  SAEDRVT14_INV_S_1 U139 ( .A(\bcd_sec/n10 ), .X(seg_sec1[2]) );
  SAEDRVT14_OAI22_1 U140 ( .A1(seg_min0[1]), .A2(n51), .B1(seg_min0[0]), .B2(
        n55), .X(SEG7_2[0]) );
  SAEDRVT14_OAI22_1 U141 ( .A1(seg_sec0[1]), .A2(\d0/n5 ), .B1(seg_sec0[0]), 
        .B2(n81), .X(SEG7_0[0]) );
  SAEDRVT14_OAI21_0P75 U142 ( .A1(n44), .A2(n37), .B(n43), .X(n40) );
  SAEDRVT14_NR2_MM_1 U143 ( .A1(selected_MIN[1]), .A2(n39), .X(n44) );
  SAEDRVT14_OAI21_0P75 U144 ( .A1(\bcd_sec/n12 ), .A2(\bcd_sec/n5 ), .B(
        \bcd_sec/n11 ), .X(\bcd_sec/n8 ) );
  SAEDRVT14_NR2_MM_1 U145 ( .A1(selected_SEC[1]), .A2(\bcd_sec/n7 ), .X(
        \bcd_sec/n12 ) );
  SAEDRVT14_EO2_V1_0P75 U146 ( .A1(n42), .A2(selected_MIN[3]), .X(n46) );
  SAEDRVT14_EO2_V1_0P75 U147 ( .A1(\bcd_sec/n10 ), .A2(selected_SEC[3]), .X(
        \bcd_sec/n14 ) );
  SAEDRVT14_OAI21_0P75 U148 ( .A1(selected_MIN[3]), .A2(selected_MIN[4]), .B(
        selected_MIN[5]), .X(n42) );
  SAEDRVT14_OAI21_0P75 U149 ( .A1(selected_SEC[3]), .A2(selected_SEC[4]), .B(
        selected_SEC[5]), .X(\bcd_sec/n10 ) );
  SAEDRVT14_ND2_CDC_0P5 U150 ( .A1(selected_MIN[1]), .A2(n40), .X(n41) );
  SAEDRVT14_ND2_CDC_0P5 U151 ( .A1(selected_SEC[1]), .A2(\bcd_sec/n8 ), .X(
        \bcd_sec/n9 ) );
  SAEDRVT14_BUF_ECO_1 U152 ( .A(SW2_DB), .X(n24) );
  SAEDRVT14_AO21_1 U153 ( .A1(n42), .A2(selected_MIN[5]), .B(n22), .X(
        seg_min1[1]) );
  SAEDRVT14_AOI21_0P5 U154 ( .A1(n48), .A2(n46), .B(n45), .X(n22) );
  SAEDRVT14_AO21_1 U155 ( .A1(\bcd_sec/n10 ), .A2(selected_SEC[5]), .B(n23), 
        .X(seg_sec1[1]) );
  SAEDRVT14_AOI21_0P5 U156 ( .A1(n83), .A2(\bcd_sec/n14 ), .B(\bcd_sec/n13 ), 
        .X(n23) );
  SAEDRVT14_OAI21_0P75 U157 ( .A1(selected_MIN[3]), .A2(n42), .B(
        selected_MIN[4]), .X(n45) );
  SAEDRVT14_OAI21_0P75 U158 ( .A1(selected_SEC[3]), .A2(\bcd_sec/n10 ), .B(
        selected_SEC[4]), .X(\bcd_sec/n13 ) );
  SAEDRVT14_EO2_V1_0P75 U159 ( .A1(selected_MIN[2]), .A2(seg_min1[1]), .X(n39)
         );
  SAEDRVT14_EO2_V1_0P75 U160 ( .A1(selected_SEC[2]), .A2(seg_sec1[1]), .X(
        \bcd_sec/n7 ) );
  SAEDRVT14_ND2_CDC_0P5 U161 ( .A1(n51), .A2(n52), .X(SEG7_2[5]) );
  SAEDRVT14_OAI21_0P75 U162 ( .A1(seg_min0[0]), .A2(n54), .B(seg_min0[1]), .X(
        n52) );
  SAEDRVT14_ND2_CDC_0P5 U163 ( .A1(\d0/n5 ), .A2(\d0/n6 ), .X(SEG7_0[5]) );
  SAEDRVT14_OAI21_0P75 U164 ( .A1(seg_sec0[0]), .A2(n80), .B(seg_sec0[1]), .X(
        \d0/n6 ) );
  SAEDRVT14_EO2_V1_0P75 U165 ( .A1(n40), .A2(selected_MIN[1]), .X(seg_min0[1])
         );
  SAEDRVT14_EO2_V1_0P75 U166 ( .A1(\bcd_sec/n8 ), .A2(selected_SEC[1]), .X(
        seg_sec0[1]) );
  SAEDRVT14_ND3_0P5 U167 ( .A1(seg_min0[0]), .A2(seg_min0[1]), .A3(seg_min0[2]), .X(n50) );
  SAEDRVT14_ND3_0P5 U168 ( .A1(seg_sec0[0]), .A2(seg_sec0[1]), .A3(seg_sec0[2]), .X(\d0/n4 ) );
  SAEDRVT14_INV_S_1 U169 ( .A(selected_MIN[2]), .X(n48) );
  SAEDRVT14_INV_S_1 U170 ( .A(selected_SEC[2]), .X(n83) );
  SAEDRVT14_EO2_V1_0P75 U171 ( .A1(\seg_date1[1] ), .A2(selected_DATE[2]), .X(
        n30) );
  SAEDRVT14_EO2_V1_0P75 U172 ( .A1(\seg_hour1[1] ), .A2(selected_HOUR[2]), .X(
        \bcd_hour/n5 ) );
  SAEDRVT14_OAI22_1 U173 ( .A1(seg_date0[1]), .A2(n65), .B1(seg_date0[0]), 
        .B2(n70), .X(SEG7_6[0]) );
  SAEDRVT14_OAI22_1 U174 ( .A1(seg_hour0[1]), .A2(n58), .B1(seg_hour0[0]), 
        .B2(n62), .X(SEG7_4[0]) );
  SAEDRVT14_ND2_CDC_0P5 U175 ( .A1(\bcd_hour/n8 ), .A2(\bcd_hour/n9 ), .X(
        \bcd_hour/n6 ) );
  SAEDRVT14_OAI21_0P75 U176 ( .A1(selected_HOUR[1]), .A2(\bcd_hour/n5 ), .B(
        \bcd_hour/n3 ), .X(\bcd_hour/n9 ) );
  SAEDRVT14_OAI21_0P75 U177 ( .A1(selected_DATE[2]), .A2(selected_DATE[3]), 
        .B(selected_DATE[4]), .X(n35) );
  SAEDRVT14_OAI21_0P75 U178 ( .A1(selected_HOUR[2]), .A2(selected_HOUR[3]), 
        .B(selected_HOUR[4]), .X(\bcd_hour/n10 ) );
  SAEDRVT14_ND2_CDC_0P5 U179 ( .A1(n33), .A2(n34), .X(n31) );
  SAEDRVT14_OAI21_0P75 U180 ( .A1(selected_DATE[1]), .A2(n30), .B(n28), .X(n34) );
  SAEDRVT14_ND2_CDC_0P5 U181 ( .A1(selected_HOUR[1]), .A2(\bcd_hour/n6 ), .X(
        \bcd_hour/n7 ) );
  SAEDRVT14_ND2_CDC_0P5 U182 ( .A1(selected_DATE[1]), .A2(n31), .X(n32) );
  SAEDRVT14_ND2_CDC_0P5 U183 ( .A1(n65), .A2(n66), .X(SEG7_6[5]) );
  SAEDRVT14_OAI21_0P75 U184 ( .A1(seg_date0[0]), .A2(n69), .B(seg_date0[1]), 
        .X(n66) );
  SAEDRVT14_ND2_CDC_0P5 U185 ( .A1(n58), .A2(n59), .X(SEG7_4[5]) );
  SAEDRVT14_OAI21_0P75 U186 ( .A1(seg_hour0[0]), .A2(n61), .B(seg_hour0[1]), 
        .X(n59) );
  SAEDRVT14_EO2_V1_0P75 U187 ( .A1(n31), .A2(selected_DATE[1]), .X(
        seg_date0[1]) );
  SAEDRVT14_EO2_V1_0P75 U188 ( .A1(\bcd_hour/n6 ), .A2(selected_HOUR[1]), .X(
        seg_hour0[1]) );
  SAEDRVT14_ND3_0P5 U189 ( .A1(seg_date0[0]), .A2(seg_date0[1]), .A3(
        seg_date0[2]), .X(n64) );
  SAEDRVT14_ND3_0P5 U190 ( .A1(seg_hour0[0]), .A2(seg_hour0[1]), .A3(
        seg_hour0[2]), .X(n57) );
  SAEDRVT14_ND2_CDC_0P5 U191 ( .A1(selected_DATE[4]), .A2(n35), .X(n33) );
  SAEDRVT14_ND2_CDC_0P5 U192 ( .A1(selected_HOUR[4]), .A2(\bcd_hour/n10 ), .X(
        \bcd_hour/n8 ) );
  SAEDRVT14_INV_S_1 U193 ( .A(seg_hour0[0]), .X(n63) );
  SAEDRVT14_INV_S_1 U194 ( .A(seg_min0[0]), .X(n56) );
  SAEDRVT14_INV_S_1 U195 ( .A(seg_date0[0]), .X(n68) );
  SAEDRVT14_INV_S_1 U196 ( .A(seg_sec0[0]), .X(n82) );
  SAEDRVT14_INV_S_1 U197 ( .A(n10), .X(n89) );
  SAEDRVT14_AN2_MM_1 U198 ( .A1(N25), .A2(n10), .X(N32) );
  SAEDRVT14_AN2_MM_1 U199 ( .A1(N21), .A2(n10), .X(N28) );
  SAEDRVT14_AN2_MM_1 U200 ( .A1(N22), .A2(n10), .X(N29) );
  SAEDRVT14_AN2_MM_1 U201 ( .A1(N23), .A2(n10), .X(N30) );
  SAEDRVT14_AN2_MM_1 U202 ( .A1(N24), .A2(n10), .X(N31) );
  SAEDRVT14_NR2_MM_1 U203 ( .A1(n85), .A2(\gen_clock/CNT [1]), .X(
        \gen_clock/n3 ) );
  SAEDRVT14_INV_S_1 U204 ( .A(\gen_clock/n1 ), .X(n86) );
  SAEDRVT14_INV_S_1 U205 ( .A(\gen_clock/CNT [2]), .X(n85) );
  SAEDRVT14_EO2_V1_0P75 U206 ( .A1(\gen_clock/CNT [1]), .A2(\gen_clock/CNT [0]), .X(\gen_clock/N9 ) );
  SAEDRVT14_NR2_MM_1 U207 ( .A1(\gen_clock/CNT [0]), .A2(\gen_clock/n3 ), .X(
        \gen_clock/N8 ) );
  SAEDRVT14_AO22_1 U208 ( .A1(SUB_MIN[4]), .A2(SW2_DB), .B1(MAIN_MIN[4]), .B2(
        n26), .X(selected_MIN[4]) );
  SAEDRVT14_AO22_1 U209 ( .A1(SUB_SEC[4]), .A2(SW2_DB), .B1(MAIN_SEC[4]), .B2(
        n26), .X(selected_SEC[4]) );
  SAEDRVT14_AN3_0P75 U210 ( .A1(SW2_shift[1]), .A2(SW2_shift[0]), .A3(
        SW2_shift[2]), .X(SW2_DB) );
  SAEDRVT14_AO22_1 U211 ( .A1(SUB_MIN[3]), .A2(n24), .B1(MAIN_MIN[3]), .B2(n26), .X(selected_MIN[3]) );
  SAEDRVT14_AO22_1 U212 ( .A1(SUB_SEC[3]), .A2(SW2_DB), .B1(MAIN_SEC[3]), .B2(
        n26), .X(selected_SEC[3]) );
  SAEDRVT14_AO22_1 U213 ( .A1(SUB_MIN[5]), .A2(SW2_DB), .B1(MAIN_MIN[5]), .B2(
        n26), .X(selected_MIN[5]) );
  SAEDRVT14_AO22_1 U214 ( .A1(SUB_SEC[5]), .A2(n24), .B1(MAIN_SEC[5]), .B2(n26), .X(selected_SEC[5]) );
  SAEDRVT14_AO22_1 U215 ( .A1(SUB_MIN[2]), .A2(SW2_DB), .B1(MAIN_MIN[2]), .B2(
        n26), .X(selected_MIN[2]) );
  SAEDRVT14_AO22_1 U216 ( .A1(SUB_SEC[2]), .A2(SW2_DB), .B1(MAIN_SEC[2]), .B2(
        n26), .X(selected_SEC[2]) );
  SAEDRVT14_AO22_1 U217 ( .A1(SUB_HOUR[3]), .A2(SW2_DB), .B1(MAIN_HOUR[3]), 
        .B2(n25), .X(selected_HOUR[3]) );
  SAEDRVT14_AO22_1 U218 ( .A1(SUB_DATE[3]), .A2(SW2_DB), .B1(MAIN_DATE[3]), 
        .B2(n25), .X(selected_DATE[3]) );
  SAEDRVT14_AO22_1 U219 ( .A1(SUB_HOUR[2]), .A2(SW2_DB), .B1(MAIN_HOUR[2]), 
        .B2(n25), .X(selected_HOUR[2]) );
  SAEDRVT14_AO22_1 U220 ( .A1(SUB_DATE[2]), .A2(n24), .B1(MAIN_DATE[2]), .B2(
        n25), .X(selected_DATE[2]) );
  SAEDRVT14_AO22_1 U221 ( .A1(SUB_DATE[4]), .A2(n24), .B1(MAIN_DATE[4]), .B2(
        n25), .X(selected_DATE[4]) );
  SAEDRVT14_AO22_1 U222 ( .A1(SUB_HOUR[4]), .A2(SW2_DB), .B1(MAIN_HOUR[4]), 
        .B2(n25), .X(selected_HOUR[4]) );
  SAEDRVT14_AO22_1 U223 ( .A1(SUB_HOUR[1]), .A2(SW2_DB), .B1(MAIN_HOUR[1]), 
        .B2(n25), .X(selected_HOUR[1]) );
  SAEDRVT14_AO22_1 U224 ( .A1(SUB_DATE[1]), .A2(n24), .B1(MAIN_DATE[1]), .B2(
        n25), .X(selected_DATE[1]) );
  SAEDRVT14_AO22_1 U225 ( .A1(SUB_MIN[1]), .A2(SW2_DB), .B1(MAIN_MIN[1]), .B2(
        n25), .X(selected_MIN[1]) );
  SAEDRVT14_AO22_1 U226 ( .A1(SUB_SEC[1]), .A2(SW2_DB), .B1(MAIN_SEC[1]), .B2(
        n26), .X(selected_SEC[1]) );
  SAEDRVT14_AO22_1 U227 ( .A1(SUB_HOUR[0]), .A2(SW2_DB), .B1(MAIN_HOUR[0]), 
        .B2(n25), .X(seg_hour0[0]) );
  SAEDRVT14_AO22_1 U228 ( .A1(SUB_MIN[0]), .A2(SW2_DB), .B1(MAIN_MIN[0]), .B2(
        n25), .X(seg_min0[0]) );
  SAEDRVT14_AO22_1 U229 ( .A1(SUB_DATE[0]), .A2(n24), .B1(MAIN_DATE[0]), .B2(
        n25), .X(seg_date0[0]) );
  SAEDRVT14_AO22_1 U230 ( .A1(SUB_SEC[0]), .A2(SW2_DB), .B1(MAIN_SEC[0]), .B2(
        n26), .X(seg_sec0[0]) );
  SAEDRVT14_NR2_MM_1 U231 ( .A1(SW3_DB), .A2(N14), .X(n10) );
  SAEDRVT14_AN2_MM_1 U232 ( .A1(N26), .A2(n10), .X(N33) );
  SAEDRVT14_AN3_0P75 U233 ( .A1(SW1_shift[1]), .A2(SW1_shift[0]), .A3(
        SW1_shift[2]), .X(SW1_DB) );
  SAEDRVT14_AN2_MM_1 U234 ( .A1(N20), .A2(n10), .X(N27) );
  SAEDRVT14_AN2_1 U235 ( .A1(global_cnt[1]), .A2(global_cnt[0]), .X(n87) );
  SAEDRVT14_OR4_1 U236 ( .A1(global_cnt[2]), .A2(n87), .A3(global_cnt[4]), 
        .A4(global_cnt[3]), .X(n88) );
  SAEDRVT14_AN3_0P5 U237 ( .A1(global_cnt[5]), .A2(n88), .A3(global_cnt[6]), 
        .X(N14) );
endmodule

