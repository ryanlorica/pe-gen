module MulAddRecFNToRaw_preMul(
    input [1:0] io_op,
    input [16:0] io_a,
    input [16:0] io_b,
    input [16:0] io_c,
    output[10:0] io_mulAddA,
    output[10:0] io_mulAddB,
    output[21:0] io_mulAddC,
    output io_toPostMul_isSigNaNAny,
    output io_toPostMul_isNaNAOrB,
    output io_toPostMul_isInfA,
    output io_toPostMul_isZeroA,
    output io_toPostMul_isInfB,
    output io_toPostMul_isZeroB,
    output io_toPostMul_signProd,
    output io_toPostMul_isNaNC,
    output io_toPostMul_isInfC,
    output io_toPostMul_isZeroC,
    output[6:0] io_toPostMul_sExpSum,
    output io_toPostMul_doSubMags,
    output io_toPostMul_CIsDominant,
    output[3:0] io_toPostMul_CDom_CAlignDist,
    output[12:0] io_toPostMul_highAlignedSigC,
    output io_toPostMul_bit0AlignedSigC
);

  wire T0;
  wire[36:0] alignedSigC;
  wire T1;
  wire T2;
  wire reduced4CExtra;
  wire[2:0] T3;
  wire[2:0] T116;
  wire[1:0] T4;
  wire T5;
  wire[1:0] T6;
  wire[16:0] T7;
  wire[3:0] T8;
  wire[5:0] CAlignDist;
  wire[5:0] T9;
  wire[5:0] T10;
  wire[6:0] posNatCAlignDist;
  wire[8:0] sNatCAlignDist;
  wire[7:0] T117;
  wire[6:0] rawC_sExp;
  wire[6:0] T11;
  wire[6:0] T12;
  wire[5:0] T13;
  wire T118;
  wire[8:0] sExpAlignedProd;
  wire[8:0] T14;
  wire[7:0] T119;
  wire[6:0] rawB_sExp;
  wire[6:0] T15;
  wire[6:0] T16;
  wire[5:0] T17;
  wire T120;
  wire[7:0] T121;
  wire[6:0] rawA_sExp;
  wire[6:0] T18;
  wire[6:0] T19;
  wire[5:0] T20;
  wire T122;
  wire T21;
  wire isMinCAlign;
  wire T22;
  wire T23;
  wire rawB_isZero;
  wire T24;
  wire[2:0] T25;
  wire rawA_isZero;
  wire T26;
  wire[2:0] T27;
  wire T28;
  wire[2:0] T29;
  wire[2:0] T30;
  wire[1:0] T31;
  wire T32;
  wire T33;
  wire[3:0] T34;
  wire[11:0] T35;
  wire[11:0] rawC_sig;
  wire[11:0] T36;
  wire[10:0] T37;
  wire[9:0] T38;
  wire T39;
  wire T40;
  wire[2:0] T41;
  wire T42;
  wire T43;
  wire[3:0] T44;
  wire T45;
  wire T46;
  wire[3:0] T47;
  wire T48;
  wire[2:0] T49;
  wire[38:0] mainAlignedSigC;
  wire[38:0] T50;
  wire[38:0] T51;
  wire[26:0] T52;
  wire[26:0] T123;
  wire[11:0] T53;
  wire[11:0] T54;
  wire T55;
  wire T56;
  wire T57;
  wire[2:0] T58;
  wire doSubMags;
  wire T59;
  wire T60;
  wire rawC_sign;
  wire T61;
  wire signProd;
  wire T62;
  wire T63;
  wire rawB_sign;
  wire T64;
  wire rawA_sign;
  wire T65;
  wire[35:0] T66;
  wire[12:0] T67;
  wire[3:0] T68;
  wire CIsDominant;
  wire T69;
  wire T70;
  wire T71;
  wire rawC_isZero;
  wire[6:0] T124;
  wire[8:0] T72;
  wire[8:0] T73;
  wire[7:0] T125;
  wire T126;
  wire rawC_isInf;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire[1:0] T78;
  wire rawC_isNaN;
  wire T79;
  wire T80;
  wire rawB_isInf;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire[1:0] T85;
  wire rawA_isInf;
  wire T86;
  wire T87;
  wire T88;
  wire T89;
  wire[1:0] T90;
  wire T91;
  wire rawB_isNaN;
  wire T92;
  wire T93;
  wire rawA_isNaN;
  wire T94;
  wire T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire T102;
  wire T103;
  wire[11:0] rawB_sig;
  wire[11:0] T104;
  wire[10:0] T105;
  wire[9:0] T106;
  wire T107;
  wire T108;
  wire T109;
  wire T110;
  wire[11:0] rawA_sig;
  wire[11:0] T111;
  wire[10:0] T112;
  wire[9:0] T113;
  wire T114;
  wire[21:0] T115;
  wire[10:0] T127;
  wire[10:0] T128;


  assign io_toPostMul_bit0AlignedSigC = T0;
  assign T0 = alignedSigC[0];
  assign alignedSigC = {T66, T1};
  assign T1 = doSubMags ? T55 : T2;
  assign T2 = T48 | reduced4CExtra;
  assign reduced4CExtra = T3 != 3'h0;
  assign T3 = T29 & T116;
  assign T116 = {1'h0, T4};
  assign T4 = {T28, T5};
  assign T5 = T6[1];
  assign T6 = T7[9:8];
  assign T7 = $signed(17'h10000) >>> T8;
  assign T8 = CAlignDist >> 2'h2;
  assign CAlignDist = isMinCAlign ? 6'h0 : T9;
  assign T9 = T21 ? T10 : 6'h23;
  assign T10 = posNatCAlignDist[5:0];
  assign posNatCAlignDist = sNatCAlignDist[6:0];
  assign sNatCAlignDist = sExpAlignedProd - T117;
  assign T117 = {T118, rawC_sExp};
  assign rawC_sExp = T11;
  assign T11 = T12;
  assign T12 = {1'h0, T13};
  assign T13 = io_c[15:10];
  assign T118 = rawC_sExp[6];
  assign sExpAlignedProd = T14 + 8'hee;
  assign T14 = T121 + T119;
  assign T119 = {T120, rawB_sExp};
  assign rawB_sExp = T15;
  assign T15 = T16;
  assign T16 = {1'h0, T17};
  assign T17 = io_b[15:10];
  assign T120 = rawB_sExp[6];
  assign T121 = {T122, rawA_sExp};
  assign rawA_sExp = T18;
  assign T18 = T19;
  assign T19 = {1'h0, T20};
  assign T20 = io_a[15:10];
  assign T122 = rawA_sExp[6];
  assign T21 = posNatCAlignDist < 7'h23;
  assign isMinCAlign = T23 | T22;
  assign T22 = $signed(sNatCAlignDist) < $signed(1'h0);
  assign T23 = rawA_isZero | rawB_isZero;
  assign rawB_isZero = T24;
  assign T24 = T25 == 3'h0;
  assign T25 = T17[5:3];
  assign rawA_isZero = T26;
  assign T26 = T27 == 3'h0;
  assign T27 = T20[5:3];
  assign T28 = T6[0];
  assign T29 = T30;
  assign T30 = {T45, T31};
  assign T31 = {T42, T32};
  assign T32 = T33;
  assign T33 = T34 != 4'h0;
  assign T34 = T35[3:0];
  assign T35 = rawC_sig << 1'h0;
  assign rawC_sig = T36;
  assign T36 = {1'h0, T37};
  assign T37 = {T39, T38};
  assign T38 = io_c[9:0];
  assign T39 = T40 ^ 1'h1;
  assign T40 = T41 == 3'h0;
  assign T41 = T13[5:3];
  assign T42 = T43;
  assign T43 = T44 != 4'h0;
  assign T44 = T35[7:4];
  assign T45 = T46;
  assign T46 = T47 != 4'h0;
  assign T47 = T35[11:8];
  assign T48 = T49 != 3'h0;
  assign T49 = mainAlignedSigC[2:0];
  assign mainAlignedSigC = $signed(T50) >>> CAlignDist;
  assign T50 = T51;
  assign T51 = {T53, T52};
  assign T52 = 27'h0 - T123;
  assign T123 = {26'h0, doSubMags};
  assign T53 = doSubMags ? T54 : rawC_sig;
  assign T54 = ~ rawC_sig;
  assign T55 = T57 & T56;
  assign T56 = reduced4CExtra ^ 1'h1;
  assign T57 = T58 == 3'h7;
  assign T58 = mainAlignedSigC[2:0];
  assign doSubMags = T60 ^ T59;
  assign T59 = io_op[0];
  assign T60 = signProd ^ rawC_sign;
  assign rawC_sign = T61;
  assign T61 = io_c[16];
  assign signProd = T63 ^ T62;
  assign T62 = io_op[1];
  assign T63 = rawA_sign ^ rawB_sign;
  assign rawB_sign = T64;
  assign T64 = io_b[16];
  assign rawA_sign = T65;
  assign T65 = io_a[16];
  assign T66 = $signed(mainAlignedSigC) >>> 2'h3;
  assign io_toPostMul_highAlignedSigC = T67;
  assign T67 = alignedSigC[35:23];
  assign io_toPostMul_CDom_CAlignDist = T68;
  assign T68 = CAlignDist[3:0];
  assign io_toPostMul_CIsDominant = CIsDominant;
  assign CIsDominant = T71 & T69;
  assign T69 = isMinCAlign | T70;
  assign T70 = posNatCAlignDist <= 7'hb;
  assign T71 = rawC_isZero ^ 1'h1;
  assign rawC_isZero = T40;
  assign io_toPostMul_doSubMags = doSubMags;
  assign io_toPostMul_sExpSum = T124;
  assign T124 = T72[6:0];
  assign T72 = CIsDominant ? T125 : T73;
  assign T73 = sExpAlignedProd - 8'hb;
  assign T125 = {T126, rawC_sExp};
  assign T126 = rawC_sExp[6];
  assign io_toPostMul_isZeroC = rawC_isZero;
  assign io_toPostMul_isInfC = rawC_isInf;
  assign rawC_isInf = T74;
  assign T74 = T77 & T75;
  assign T75 = T76 ^ 1'h1;
  assign T76 = T13[3];
  assign T77 = T78 == 2'h3;
  assign T78 = T13[5:4];
  assign io_toPostMul_isNaNC = rawC_isNaN;
  assign rawC_isNaN = T79;
  assign T79 = T77 & T80;
  assign T80 = T13[3];
  assign io_toPostMul_signProd = signProd;
  assign io_toPostMul_isZeroB = rawB_isZero;
  assign io_toPostMul_isInfB = rawB_isInf;
  assign rawB_isInf = T81;
  assign T81 = T84 & T82;
  assign T82 = T83 ^ 1'h1;
  assign T83 = T17[3];
  assign T84 = T85 == 2'h3;
  assign T85 = T17[5:4];
  assign io_toPostMul_isZeroA = rawA_isZero;
  assign io_toPostMul_isInfA = rawA_isInf;
  assign rawA_isInf = T86;
  assign T86 = T89 & T87;
  assign T87 = T88 ^ 1'h1;
  assign T88 = T20[3];
  assign T89 = T90 == 2'h3;
  assign T90 = T20[5:4];
  assign io_toPostMul_isNaNAOrB = T91;
  assign T91 = rawA_isNaN | rawB_isNaN;
  assign rawB_isNaN = T92;
  assign T92 = T84 & T93;
  assign T93 = T17[3];
  assign rawA_isNaN = T94;
  assign T94 = T89 & T95;
  assign T95 = T20[3];
  assign io_toPostMul_isSigNaNAny = T96;
  assign T96 = T100 | T97;
  assign T97 = rawC_isNaN & T98;
  assign T98 = T99 ^ 1'h1;
  assign T99 = rawC_sig[9];
  assign T100 = T108 | T101;
  assign T101 = rawB_isNaN & T102;
  assign T102 = T103 ^ 1'h1;
  assign T103 = rawB_sig[9];
  assign rawB_sig = T104;
  assign T104 = {1'h0, T105};
  assign T105 = {T107, T106};
  assign T106 = io_b[9:0];
  assign T107 = T24 ^ 1'h1;
  assign T108 = rawA_isNaN & T109;
  assign T109 = T110 ^ 1'h1;
  assign T110 = rawA_sig[9];
  assign rawA_sig = T111;
  assign T111 = {1'h0, T112};
  assign T112 = {T114, T113};
  assign T113 = io_a[9:0];
  assign T114 = T26 ^ 1'h1;
  assign io_mulAddC = T115;
  assign T115 = alignedSigC[22:1];
  assign io_mulAddB = T127;
  assign T127 = rawB_sig[10:0];
  assign io_mulAddA = T128;
  assign T128 = rawA_sig[10:0];
endmodule

module MulAddRecFNToRaw_postMul(
    input  io_fromPreMul_isSigNaNAny,
    input  io_fromPreMul_isNaNAOrB,
    input  io_fromPreMul_isInfA,
    input  io_fromPreMul_isZeroA,
    input  io_fromPreMul_isInfB,
    input  io_fromPreMul_isZeroB,
    input  io_fromPreMul_signProd,
    input  io_fromPreMul_isNaNC,
    input  io_fromPreMul_isInfC,
    input  io_fromPreMul_isZeroC,
    input [6:0] io_fromPreMul_sExpSum,
    input  io_fromPreMul_doSubMags,
    input  io_fromPreMul_CIsDominant,
    input [3:0] io_fromPreMul_CDom_CAlignDist,
    input [12:0] io_fromPreMul_highAlignedSigC,
    input  io_fromPreMul_bit0AlignedSigC,
    input [22:0] io_mulAddResult,
    input [2:0] io_roundingMode,
    output io_invalidExc,
    output io_rawOut_isNaN,
    output io_rawOut_isInf,
    output io_rawOut_isZero,
    output io_rawOut_sign,
    output[6:0] io_rawOut_sExp,
    output[13:0] io_rawOut_sig
);

  wire[13:0] T0;
  wire[13:0] notCDom_sig;
  wire T1;
  wire notCDom_reduced4SigExtra;
  wire[3:0] T2;
  wire[3:0] T207;
  wire[2:0] T3;
  wire T4;
  wire[2:0] T5;
  wire[8:0] T6;
  wire[2:0] T7;
  wire[2:0] T8;
  wire[3:0] T208;
  wire[3:0] T209;
  wire[3:0] T210;
  wire[3:0] T211;
  wire[3:0] T212;
  wire[3:0] T213;
  wire[3:0] T214;
  wire[3:0] T215;
  wire[3:0] T216;
  wire[3:0] T217;
  wire[3:0] T218;
  wire[3:0] T219;
  wire T220;
  wire[12:0] T9;
  wire[4:0] T10;
  wire T11;
  wire[4:0] T12;
  wire[12:0] notCDom_reduced2AbsSigSum;
  wire[12:0] T13;
  wire[6:0] T14;
  wire[3:0] T15;
  wire[1:0] T16;
  wire T17;
  wire T18;
  wire[1:0] T19;
  wire[24:0] notCDom_absSigSum;
  wire[24:0] T20;
  wire[24:0] T221;
  wire[24:0] T21;
  wire[35:0] sigSum;
  wire[22:0] T22;
  wire[21:0] T23;
  wire[12:0] T24;
  wire[12:0] T25;
  wire T26;
  wire[24:0] T27;
  wire[24:0] T28;
  wire notCDom_signSigSum;
  wire T29;
  wire T30;
  wire[1:0] T31;
  wire[1:0] T32;
  wire T33;
  wire T34;
  wire[1:0] T35;
  wire T36;
  wire T37;
  wire[1:0] T38;
  wire[2:0] T39;
  wire[1:0] T40;
  wire T41;
  wire T42;
  wire[1:0] T43;
  wire T44;
  wire T45;
  wire[1:0] T46;
  wire T47;
  wire T48;
  wire[1:0] T49;
  wire[5:0] T50;
  wire[2:0] T51;
  wire[1:0] T52;
  wire T53;
  wire T54;
  wire[1:0] T55;
  wire T56;
  wire T57;
  wire[1:0] T58;
  wire T59;
  wire T60;
  wire[1:0] T61;
  wire[2:0] T62;
  wire[1:0] T63;
  wire T64;
  wire T65;
  wire[1:0] T66;
  wire T67;
  wire T68;
  wire[1:0] T69;
  wire T70;
  wire T71;
  wire T72;
  wire[3:0] T73;
  wire[1:0] T74;
  wire T75;
  wire[1:0] T76;
  wire[3:0] T77;
  wire T78;
  wire[1:0] T79;
  wire T80;
  wire[1:0] T81;
  wire T82;
  wire[7:0] T83;
  wire[7:0] T84;
  wire[7:0] T85;
  wire[6:0] T86;
  wire[7:0] T87;
  wire[7:0] T88;
  wire[7:0] T89;
  wire[5:0] T90;
  wire[7:0] T91;
  wire[7:0] T92;
  wire[7:0] T93;
  wire[3:0] T94;
  wire[7:0] T95;
  wire[7:0] T96;
  wire[7:0] T222;
  wire[3:0] T97;
  wire[7:0] T98;
  wire[7:0] T223;
  wire[5:0] T99;
  wire[7:0] T100;
  wire[7:0] T224;
  wire[6:0] T101;
  wire T225;
  wire T226;
  wire T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T233;
  wire T234;
  wire T235;
  wire[1:0] T102;
  wire T103;
  wire[1:0] T104;
  wire T105;
  wire[3:0] T106;
  wire[3:0] T107;
  wire[1:0] T108;
  wire T109;
  wire T110;
  wire[1:0] T111;
  wire[6:0] T112;
  wire[5:0] T113;
  wire T114;
  wire T115;
  wire[1:0] T116;
  wire[1:0] T117;
  wire T118;
  wire T119;
  wire[1:0] T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire[2:0] T125;
  wire[15:0] notCDom_mainSig;
  wire[55:0] T126;
  wire[4:0] notCDom_nearNormDist;
  wire[12:0] T127;
  wire[13:0] CDom_sig;
  wire T128;
  wire CDom_absSigSumExtra;
  wire T129;
  wire[11:0] T130;
  wire T131;
  wire[10:0] T132;
  wire[10:0] T133;
  wire T134;
  wire CDom_reduced4SigExtra;
  wire[2:0] T135;
  wire[2:0] T236;
  wire[1:0] T136;
  wire T137;
  wire[1:0] T138;
  wire[4:0] T139;
  wire[1:0] T140;
  wire[1:0] T141;
  wire T142;
  wire[2:0] T143;
  wire[2:0] T144;
  wire[1:0] T145;
  wire T146;
  wire T147;
  wire[3:0] T148;
  wire[10:0] T149;
  wire[10:0] T150;
  wire[23:0] CDom_absSigSum;
  wire[23:0] T151;
  wire[22:0] T152;
  wire[20:0] T153;
  wire[1:0] T154;
  wire[23:0] T155;
  wire[23:0] T156;
  wire T157;
  wire T158;
  wire[3:0] T159;
  wire T160;
  wire T161;
  wire[2:0] T162;
  wire T163;
  wire[2:0] T164;
  wire[15:0] CDom_mainSig;
  wire[38:0] T165;
  wire[12:0] T166;
  wire[6:0] T167;
  wire[6:0] notCDom_sExp;
  wire[6:0] T237;
  wire[5:0] T168;
  wire[5:0] T169;
  wire T238;
  wire[6:0] CDom_sExp;
  wire[6:0] T239;
  wire[1:0] T170;
  wire[1:0] T171;
  wire[4:0] T240;
  wire T241;
  wire T172;
  wire T173;
  wire T174;
  wire notCDom_sign;
  wire T175;
  wire roundingMode_min;
  wire notCDom_completeCancellation;
  wire[1:0] T176;
  wire CDom_sign;
  wire T177;
  wire T178;
  wire notNaN_addZeros;
  wire T179;
  wire T180;
  wire notNaN_isInfOut;
  wire notNaN_isInfProd;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire T186;
  wire T187;
  wire T188;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T195;
  wire T196;
  wire T197;
  wire T198;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire T206;


  assign io_rawOut_sig = T0;
  assign T0 = io_fromPreMul_CIsDominant ? CDom_sig : notCDom_sig;
  assign notCDom_sig = {T127, T1};
  assign T1 = T124 | notCDom_reduced4SigExtra;
  assign notCDom_reduced4SigExtra = T2 != 4'h0;
  assign T2 = T106 & T207;
  assign T207 = {1'h0, T3};
  assign T3 = {T102, T4};
  assign T4 = T5[2];
  assign T5 = T6[3:1];
  assign T6 = $signed(9'h100) >>> T7;
  assign T7 = ~ T8;
  assign T8 = T208 >> 1'h1;
  assign T208 = T235 ? 1'h0 : T209;
  assign T209 = T234 ? 1'h1 : T210;
  assign T210 = T233 ? 2'h2 : T211;
  assign T211 = T232 ? 2'h3 : T212;
  assign T212 = T231 ? 3'h4 : T213;
  assign T213 = T230 ? 3'h5 : T214;
  assign T214 = T229 ? 3'h6 : T215;
  assign T215 = T228 ? 3'h7 : T216;
  assign T216 = T227 ? 4'h8 : T217;
  assign T217 = T226 ? 4'h9 : T218;
  assign T218 = T225 ? 4'ha : T219;
  assign T219 = T220 ? 4'hb : 4'hc;
  assign T220 = T9[11];
  assign T9 = {T83, T10};
  assign T10 = {T73, T11};
  assign T11 = T12[4];
  assign T12 = notCDom_reduced2AbsSigSum[12:8];
  assign notCDom_reduced2AbsSigSum = T13;
  assign T13 = {T50, T14};
  assign T14 = {T39, T15};
  assign T15 = {T32, T16};
  assign T16 = {T29, T17};
  assign T17 = T18;
  assign T18 = T19 != 2'h0;
  assign T19 = notCDom_absSigSum[1:0];
  assign notCDom_absSigSum = notCDom_signSigSum ? T27 : T20;
  assign T20 = T21 + T221;
  assign T221 = {24'h0, io_fromPreMul_doSubMags};
  assign T21 = sigSum[24:0];
  assign sigSum = {T24, T22};
  assign T22 = {T23, io_fromPreMul_bit0AlignedSigC};
  assign T23 = io_mulAddResult[21:0];
  assign T24 = T26 ? T25 : io_fromPreMul_highAlignedSigC;
  assign T25 = io_fromPreMul_highAlignedSigC + 13'h1;
  assign T26 = io_mulAddResult[22];
  assign T27 = ~ T28;
  assign T28 = sigSum[24:0];
  assign notCDom_signSigSum = sigSum[25];
  assign T29 = T30;
  assign T30 = T31 != 2'h0;
  assign T31 = notCDom_absSigSum[3:2];
  assign T32 = {T36, T33};
  assign T33 = T34;
  assign T34 = T35 != 2'h0;
  assign T35 = notCDom_absSigSum[5:4];
  assign T36 = T37;
  assign T37 = T38 != 2'h0;
  assign T38 = notCDom_absSigSum[7:6];
  assign T39 = {T47, T40};
  assign T40 = {T44, T41};
  assign T41 = T42;
  assign T42 = T43 != 2'h0;
  assign T43 = notCDom_absSigSum[9:8];
  assign T44 = T45;
  assign T45 = T46 != 2'h0;
  assign T46 = notCDom_absSigSum[11:10];
  assign T47 = T48;
  assign T48 = T49 != 2'h0;
  assign T49 = notCDom_absSigSum[13:12];
  assign T50 = {T62, T51};
  assign T51 = {T59, T52};
  assign T52 = {T56, T53};
  assign T53 = T54;
  assign T54 = T55 != 2'h0;
  assign T55 = notCDom_absSigSum[15:14];
  assign T56 = T57;
  assign T57 = T58 != 2'h0;
  assign T58 = notCDom_absSigSum[17:16];
  assign T59 = T60;
  assign T60 = T61 != 2'h0;
  assign T61 = notCDom_absSigSum[19:18];
  assign T62 = {T70, T63};
  assign T63 = {T67, T64};
  assign T64 = T65;
  assign T65 = T66 != 2'h0;
  assign T66 = notCDom_absSigSum[21:20];
  assign T67 = T68;
  assign T68 = T69 != 2'h0;
  assign T69 = notCDom_absSigSum[23:22];
  assign T70 = T71;
  assign T71 = T72 != 1'h0;
  assign T72 = notCDom_absSigSum[24];
  assign T73 = {T79, T74};
  assign T74 = {T78, T75};
  assign T75 = T76[1];
  assign T76 = T77[3:2];
  assign T77 = T12[3:0];
  assign T78 = T76[0];
  assign T79 = {T82, T80};
  assign T80 = T81[1];
  assign T81 = T77[1:0];
  assign T82 = T81[0];
  assign T83 = T100 | T84;
  assign T84 = T85 & 8'haa;
  assign T85 = T86 << 1'h1;
  assign T86 = T87[6:0];
  assign T87 = T98 | T88;
  assign T88 = T89 & 8'hcc;
  assign T89 = T90 << 2'h2;
  assign T90 = T91[5:0];
  assign T91 = T96 | T92;
  assign T92 = T93 & 8'hf0;
  assign T93 = T94 << 3'h4;
  assign T94 = T95[3:0];
  assign T95 = notCDom_reduced2AbsSigSum[7:0];
  assign T96 = T222 & 8'hf;
  assign T222 = {4'h0, T97};
  assign T97 = T95 >> 3'h4;
  assign T98 = T223 & 8'h33;
  assign T223 = {2'h0, T99};
  assign T99 = T91 >> 2'h2;
  assign T100 = T224 & 8'h55;
  assign T224 = {1'h0, T101};
  assign T101 = T87 >> 1'h1;
  assign T225 = T9[10];
  assign T226 = T9[9];
  assign T227 = T9[8];
  assign T228 = T9[7];
  assign T229 = T9[6];
  assign T230 = T9[5];
  assign T231 = T9[4];
  assign T232 = T9[3];
  assign T233 = T9[2];
  assign T234 = T9[1];
  assign T235 = T9[0];
  assign T102 = {T105, T103};
  assign T103 = T104[1];
  assign T104 = T5[1:0];
  assign T105 = T104[0];
  assign T106 = T107;
  assign T107 = {T117, T108};
  assign T108 = {T114, T109};
  assign T109 = T110;
  assign T110 = T111 != 2'h0;
  assign T111 = T112[1:0];
  assign T112 = T113 << 1'h1;
  assign T113 = notCDom_reduced2AbsSigSum[5:0];
  assign T114 = T115;
  assign T115 = T116 != 2'h0;
  assign T116 = T112[3:2];
  assign T117 = {T121, T118};
  assign T118 = T119;
  assign T119 = T120 != 2'h0;
  assign T120 = T112[5:4];
  assign T121 = T122;
  assign T122 = T123 != 1'h0;
  assign T123 = T112[6];
  assign T124 = T125 != 3'h0;
  assign T125 = notCDom_mainSig[2:0];
  assign notCDom_mainSig = T126[25:10];
  assign T126 = notCDom_absSigSum << notCDom_nearNormDist;
  assign notCDom_nearNormDist = T208 << 1'h1;
  assign T127 = notCDom_mainSig >> 2'h3;
  assign CDom_sig = {T166, T128};
  assign T128 = T134 | CDom_absSigSumExtra;
  assign CDom_absSigSumExtra = io_fromPreMul_doSubMags ? T131 : T129;
  assign T129 = T130 != 12'h0;
  assign T130 = sigSum[12:1];
  assign T131 = T132 != 11'h0;
  assign T132 = ~ T133;
  assign T133 = sigSum[11:1];
  assign T134 = T163 | CDom_reduced4SigExtra;
  assign CDom_reduced4SigExtra = T135 != 3'h0;
  assign T135 = T143 & T236;
  assign T236 = {1'h0, T136};
  assign T136 = {T142, T137};
  assign T137 = T138[1];
  assign T138 = T139[2:1];
  assign T139 = $signed(5'h10) >>> T140;
  assign T140 = ~ T141;
  assign T141 = io_fromPreMul_CDom_CAlignDist >> 2'h2;
  assign T142 = T138[0];
  assign T143 = T144;
  assign T144 = {T160, T145};
  assign T145 = {T157, T146};
  assign T146 = T147;
  assign T147 = T148 != 4'h0;
  assign T148 = T149[3:0];
  assign T149 = T150 << 1'h0;
  assign T150 = CDom_absSigSum[10:0];
  assign CDom_absSigSum = io_fromPreMul_doSubMags ? T155 : T151;
  assign T151 = {1'h0, T152};
  assign T152 = {T154, T153};
  assign T153 = sigSum[33:13];
  assign T154 = io_fromPreMul_highAlignedSigC[12:11];
  assign T155 = ~ T156;
  assign T156 = sigSum[35:12];
  assign T157 = T158;
  assign T158 = T159 != 4'h0;
  assign T159 = T149[7:4];
  assign T160 = T161;
  assign T161 = T162 != 3'h0;
  assign T162 = T149[10:8];
  assign T163 = T164 != 3'h0;
  assign T164 = CDom_mainSig[2:0];
  assign CDom_mainSig = T165[23:8];
  assign T165 = CDom_absSigSum << io_fromPreMul_CDom_CAlignDist;
  assign T166 = CDom_mainSig >> 2'h3;
  assign io_rawOut_sExp = T167;
  assign T167 = io_fromPreMul_CIsDominant ? CDom_sExp : notCDom_sExp;
  assign notCDom_sExp = io_fromPreMul_sExpSum - T237;
  assign T237 = {T238, T168};
  assign T168 = T169;
  assign T169 = {1'h0, notCDom_nearNormDist};
  assign T238 = T168[5];
  assign CDom_sExp = io_fromPreMul_sExpSum - T239;
  assign T239 = {T240, T170};
  assign T170 = T171;
  assign T171 = {1'h0, io_fromPreMul_doSubMags};
  assign T240 = T241 ? 5'h1f : 5'h0;
  assign T241 = T170[1];
  assign io_rawOut_sign = T172;
  assign T172 = T181 | T173;
  assign T173 = T177 & T174;
  assign T174 = io_fromPreMul_CIsDominant ? CDom_sign : notCDom_sign;
  assign notCDom_sign = notCDom_completeCancellation ? roundingMode_min : T175;
  assign T175 = io_fromPreMul_signProd ^ notCDom_signSigSum;
  assign roundingMode_min = io_roundingMode == 3'h2;
  assign notCDom_completeCancellation = T176 == 2'h0;
  assign T176 = notCDom_sig[13:12];
  assign CDom_sign = io_fromPreMul_signProd ^ io_fromPreMul_doSubMags;
  assign T177 = T180 & T178;
  assign T178 = notNaN_addZeros ^ 1'h1;
  assign notNaN_addZeros = T179 & io_fromPreMul_isZeroC;
  assign T179 = io_fromPreMul_isZeroA | io_fromPreMul_isZeroB;
  assign T180 = notNaN_isInfOut ^ 1'h1;
  assign notNaN_isInfOut = notNaN_isInfProd | io_fromPreMul_isInfC;
  assign notNaN_isInfProd = io_fromPreMul_isInfA | io_fromPreMul_isInfB;
  assign T181 = T185 | T182;
  assign T182 = T184 & T183;
  assign T183 = io_fromPreMul_signProd | CDom_sign;
  assign T184 = notNaN_addZeros & roundingMode_min;
  assign T185 = T190 | T186;
  assign T186 = T187 & CDom_sign;
  assign T187 = T188 & io_fromPreMul_signProd;
  assign T188 = notNaN_addZeros & T189;
  assign T189 = roundingMode_min ^ 1'h1;
  assign T190 = T192 | T191;
  assign T191 = io_fromPreMul_isInfC & CDom_sign;
  assign T192 = notNaN_isInfProd & io_fromPreMul_signProd;
  assign io_rawOut_isZero = T193;
  assign T193 = notNaN_addZeros | T194;
  assign T194 = T195 & notCDom_completeCancellation;
  assign T195 = io_fromPreMul_CIsDominant ^ 1'h1;
  assign io_rawOut_isInf = notNaN_isInfOut;
  assign io_rawOut_isNaN = T196;
  assign T196 = io_fromPreMul_isNaNAOrB | io_fromPreMul_isNaNC;
  assign io_invalidExc = T197;
  assign T197 = T203 | T198;
  assign T198 = T199 & io_fromPreMul_doSubMags;
  assign T199 = T200 & io_fromPreMul_isInfC;
  assign T200 = T202 & T201;
  assign T201 = io_fromPreMul_isInfA | io_fromPreMul_isInfB;
  assign T202 = io_fromPreMul_isNaNAOrB ^ 1'h1;
  assign T203 = T205 | T204;
  assign T204 = io_fromPreMul_isZeroA & io_fromPreMul_isInfB;
  assign T205 = io_fromPreMul_isSigNaNAny | T206;
  assign T206 = io_fromPreMul_isInfA & io_fromPreMul_isZeroB;
endmodule

module RoundAnyRawFNToRecFN(
    input  io_invalidExc,
    input  io_infiniteExc,
    input  io_in_isNaN,
    input  io_in_isInf,
    input  io_in_isZero,
    input  io_in_sign,
    input [6:0] io_in_sExp,
    input [13:0] io_in_sig,
    input [2:0] io_roundingMode,
    input  io_detectTininess,
    output[16:0] io_out,
    output[4:0] io_exceptionFlags
);

  wire[4:0] T0;
  wire[2:0] T1;
  wire[1:0] T2;
  wire inexact;
  wire T3;
  wire common_inexact;
  wire T4;
  wire T5;
  wire T6;
  wire[13:0] T7;
  wire[13:0] T8;
  wire[12:0] T9;
  wire[13:0] T10;
  wire[11:0] T11;
  wire[11:0] T157;
  wire doShiftSigDown1;
  wire[11:0] T12;
  wire[3:0] T13;
  wire[1:0] T14;
  wire T15;
  wire[1:0] T16;
  wire[3:0] T17;
  wire[11:0] T18;
  wire[64:0] T19;
  wire[5:0] T20;
  wire[5:0] T21;
  wire T22;
  wire[1:0] T23;
  wire T24;
  wire[1:0] T25;
  wire T26;
  wire[7:0] T27;
  wire[7:0] T28;
  wire[7:0] T29;
  wire[6:0] T30;
  wire[7:0] T31;
  wire[7:0] T32;
  wire[7:0] T33;
  wire[5:0] T34;
  wire[7:0] T35;
  wire[7:0] T36;
  wire[7:0] T37;
  wire[3:0] T38;
  wire[7:0] T39;
  wire[7:0] T40;
  wire[7:0] T158;
  wire[3:0] T41;
  wire[7:0] T42;
  wire[7:0] T159;
  wire[5:0] T43;
  wire[7:0] T44;
  wire[7:0] T160;
  wire[6:0] T45;
  wire[13:0] adjustedSig;
  wire T46;
  wire[13:0] T47;
  wire[13:0] T48;
  wire[13:0] T49;
  wire common_totalUnderflow;
  wire T50;
  wire[9:0] T51;
  wire[8:0] T161;
  wire[3:0] T52;
  wire[3:0] T53;
  wire[2:0] T54;
  wire[13:0] T55;
  wire[12:0] T56;
  wire[12:0] T57;
  wire[12:0] T58;
  wire T59;
  wire roundingMode_odd;
  wire[12:0] T162;
  wire[11:0] T60;
  wire[13:0] T61;
  wire[13:0] T62;
  wire[13:0] T63;
  wire[12:0] T64;
  wire[12:0] T65;
  wire[12:0] T66;
  wire T67;
  wire T68;
  wire T69;
  wire roundingMode_near_even;
  wire[13:0] T70;
  wire[12:0] T163;
  wire[11:0] T71;
  wire[13:0] T72;
  wire T73;
  wire T74;
  wire roundMagUp;
  wire T75;
  wire T76;
  wire roundingMode_max;
  wire T77;
  wire roundingMode_min;
  wire T78;
  wire T79;
  wire roundingMode_near_maxMag;
  wire[4:0] T164;
  wire T165;
  wire[7:0] T166;
  wire T167;
  wire commonCase;
  wire T80;
  wire T81;
  wire T82;
  wire notNaN_isSpecialInfOut;
  wire T83;
  wire isNaNOut;
  wire underflow;
  wire common_underflow;
  wire T84;
  wire T85;
  wire T86;
  wire T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire[1:0] T92;
  wire T93;
  wire T94;
  wire T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;
  wire T102;
  wire T103;
  wire T104;
  wire T105;
  wire T106;
  wire T107;
  wire T108;
  wire T109;
  wire T110;
  wire T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire[1:0] T117;
  wire overflow;
  wire common_overflow;
  wire T118;
  wire[5:0] T119;
  wire[1:0] T120;
  wire[16:0] T121;
  wire[15:0] T122;
  wire[9:0] fractOut;
  wire[9:0] T123;
  wire[9:0] T168;
  wire pegMaxFiniteMagOut;
  wire T124;
  wire overflow_roundMagUp;
  wire T125;
  wire[9:0] T126;
  wire[9:0] common_fractOut;
  wire[9:0] T127;
  wire[9:0] T128;
  wire[9:0] T129;
  wire[9:0] T130;
  wire T131;
  wire T132;
  wire[5:0] expOut;
  wire[5:0] T133;
  wire[5:0] T134;
  wire[5:0] T135;
  wire notNaN_isInfOut;
  wire T136;
  wire[5:0] T137;
  wire[5:0] T138;
  wire[5:0] T139;
  wire[5:0] T140;
  wire pegMinNonzeroMagOut;
  wire T141;
  wire T142;
  wire[5:0] T143;
  wire[5:0] T144;
  wire[5:0] T145;
  wire[5:0] T146;
  wire[5:0] T147;
  wire[5:0] T148;
  wire[5:0] T149;
  wire[5:0] T150;
  wire[5:0] T151;
  wire[5:0] T152;
  wire[5:0] T153;
  wire[5:0] T154;
  wire T155;
  wire[5:0] common_expOut;
  wire[5:0] T156;
  wire signOut;


  assign io_exceptionFlags = T0;
  assign T0 = {T120, T1};
  assign T1 = {overflow, T2};
  assign T2 = {underflow, inexact};
  assign inexact = overflow | T3;
  assign T3 = commonCase & common_inexact;
  assign common_inexact = T4;
  assign T4 = common_totalUnderflow | T5;
  assign T5 = T46 | T6;
  assign T6 = T7 != 14'h0;
  assign T7 = adjustedSig & T8;
  assign T8 = {1'h0, T9};
  assign T9 = T10 >> 1'h1;
  assign T10 = {T11, 2'h3};
  assign T11 = T12 | T157;
  assign T157 = {11'h0, doShiftSigDown1};
  assign doShiftSigDown1 = adjustedSig[13];
  assign T12 = {T27, T13};
  assign T13 = {T23, T14};
  assign T14 = {T22, T15};
  assign T15 = T16[1];
  assign T16 = T17[3:2];
  assign T17 = T18[11:8];
  assign T18 = T19[18:7];
  assign T19 = $signed(65'h10000000000000000) >>> T20;
  assign T20 = ~ T21;
  assign T21 = io_in_sExp[5:0];
  assign T22 = T16[0];
  assign T23 = {T26, T24};
  assign T24 = T25[1];
  assign T25 = T17[1:0];
  assign T26 = T25[0];
  assign T27 = T44 | T28;
  assign T28 = T29 & 8'haa;
  assign T29 = T30 << 1'h1;
  assign T30 = T31[6:0];
  assign T31 = T42 | T32;
  assign T32 = T33 & 8'hcc;
  assign T33 = T34 << 2'h2;
  assign T34 = T35[5:0];
  assign T35 = T40 | T36;
  assign T36 = T37 & 8'hf0;
  assign T37 = T38 << 3'h4;
  assign T38 = T39[3:0];
  assign T39 = T18[7:0];
  assign T40 = T158 & 8'hf;
  assign T158 = {4'h0, T41};
  assign T41 = T39 >> 3'h4;
  assign T42 = T159 & 8'h33;
  assign T159 = {2'h0, T43};
  assign T43 = T35 >> 2'h2;
  assign T44 = T160 & 8'h55;
  assign T160 = {1'h0, T45};
  assign T45 = T31 >> 1'h1;
  assign adjustedSig = io_in_sig << 1'h0;
  assign T46 = T47 != 14'h0;
  assign T47 = adjustedSig & T48;
  assign T48 = T49 & T10;
  assign T49 = ~ T8;
  assign common_totalUnderflow = T50;
  assign T50 = $signed(T51) < $signed(5'h8);
  assign T51 = T166 + T161;
  assign T161 = {T164, T52};
  assign T52 = T53;
  assign T53 = {1'h0, T54};
  assign T54 = T55 >> 4'hb;
  assign T55 = T73 ? T63 : T56;
  assign T56 = T162 | T57;
  assign T57 = T59 ? T58 : 13'h0;
  assign T58 = T48 >> 1'h1;
  assign T59 = roundingMode_odd & T5;
  assign roundingMode_odd = io_roundingMode == 3'h6;
  assign T162 = {1'h0, T60};
  assign T60 = T61 >> 2'h2;
  assign T61 = adjustedSig & T62;
  assign T62 = ~ T10;
  assign T63 = T70 & T64;
  assign T64 = ~ T65;
  assign T65 = T67 ? T66 : 13'h0;
  assign T66 = T10 >> 1'h1;
  assign T67 = T69 & T68;
  assign T68 = T6 ^ 1'h1;
  assign T69 = roundingMode_near_even & T46;
  assign roundingMode_near_even = io_roundingMode == 3'h0;
  assign T70 = T163 + 13'h1;
  assign T163 = {1'h0, T71};
  assign T71 = T72 >> 2'h2;
  assign T72 = adjustedSig | T10;
  assign T73 = T78 | T74;
  assign T74 = roundMagUp & T5;
  assign roundMagUp = T77 | T75;
  assign T75 = roundingMode_max & T76;
  assign T76 = io_in_sign ^ 1'h1;
  assign roundingMode_max = io_roundingMode == 3'h3;
  assign T77 = roundingMode_min & io_in_sign;
  assign roundingMode_min = io_roundingMode == 3'h2;
  assign T78 = T79 & T46;
  assign T79 = roundingMode_near_even | roundingMode_near_maxMag;
  assign roundingMode_near_maxMag = io_roundingMode == 3'h4;
  assign T164 = T165 ? 5'h1f : 5'h0;
  assign T165 = T52[2];
  assign T166 = {T167, io_in_sExp};
  assign T167 = io_in_sExp[6];
  assign commonCase = T81 & T80;
  assign T80 = io_in_isZero ^ 1'h1;
  assign T81 = T83 & T82;
  assign T82 = notNaN_isSpecialInfOut ^ 1'h1;
  assign notNaN_isSpecialInfOut = io_infiniteExc | io_in_isInf;
  assign T83 = isNaNOut ^ 1'h1;
  assign isNaNOut = io_invalidExc | io_in_isNaN;
  assign underflow = commonCase & common_underflow;
  assign common_underflow = T84;
  assign T84 = common_totalUnderflow | T85;
  assign T85 = T111 & T86;
  assign T86 = T87 ^ 1'h1;
  assign T87 = T100 & T88;
  assign T88 = T95 | T89;
  assign T89 = roundMagUp & T90;
  assign T90 = T93 | T91;
  assign T91 = T92 != 2'h0;
  assign T92 = adjustedSig[1:0];
  assign T93 = doShiftSigDown1 & T94;
  assign T94 = adjustedSig[2];
  assign T95 = T99 & T96;
  assign T96 = doShiftSigDown1 ? T98 : T97;
  assign T97 = adjustedSig[1];
  assign T98 = adjustedSig[2];
  assign T99 = roundingMode_near_even | roundingMode_near_maxMag;
  assign T100 = T101 & T46;
  assign T101 = T105 & T102;
  assign T102 = doShiftSigDown1 ? T104 : T103;
  assign T103 = T55[11];
  assign T104 = T55[12];
  assign T105 = T110 & T106;
  assign T106 = T107 ^ 1'h1;
  assign T107 = doShiftSigDown1 ? T109 : T108;
  assign T108 = T10[3];
  assign T109 = T10[4];
  assign T110 = io_detectTininess == 1'h1;
  assign T111 = T115 & T112;
  assign T112 = doShiftSigDown1 ? T114 : T113;
  assign T113 = T10[2];
  assign T114 = T10[3];
  assign T115 = T5 & T116;
  assign T116 = $signed(T117) <= $signed(1'h0);
  assign T117 = $signed(io_in_sExp) >>> 3'h5;
  assign overflow = commonCase & common_overflow;
  assign common_overflow = T118;
  assign T118 = $signed(3'h3) <= $signed(T119);
  assign T119 = $signed(T51) >>> 3'h4;
  assign T120 = {io_invalidExc, io_infiniteExc};
  assign io_out = T121;
  assign T121 = {signOut, T122};
  assign T122 = {expOut, fractOut};
  assign fractOut = T126 | T123;
  assign T123 = 10'h0 - T168;
  assign T168 = {9'h0, pegMaxFiniteMagOut};
  assign pegMaxFiniteMagOut = overflow & T124;
  assign T124 = overflow_roundMagUp ^ 1'h1;
  assign overflow_roundMagUp = T125 | roundMagUp;
  assign T125 = roundingMode_near_even | roundingMode_near_maxMag;
  assign T126 = T131 ? T130 : common_fractOut;
  assign common_fractOut = T127;
  assign T127 = doShiftSigDown1 ? T129 : T128;
  assign T128 = T55[9:0];
  assign T129 = T55[10:1];
  assign T130 = isNaNOut ? 10'h200 : 10'h0;
  assign T131 = T132 | common_totalUnderflow;
  assign T132 = isNaNOut | io_in_isZero;
  assign expOut = T134 | T133;
  assign T133 = isNaNOut ? 6'h38 : 6'h0;
  assign T134 = T137 | T135;
  assign T135 = notNaN_isInfOut ? 6'h30 : 6'h0;
  assign notNaN_isInfOut = notNaN_isSpecialInfOut | T136;
  assign T136 = overflow & overflow_roundMagUp;
  assign T137 = T139 | T138;
  assign T138 = pegMaxFiniteMagOut ? 6'h2f : 6'h0;
  assign T139 = T143 | T140;
  assign T140 = pegMinNonzeroMagOut ? 6'h8 : 6'h0;
  assign pegMinNonzeroMagOut = T142 & T141;
  assign T141 = roundMagUp | roundingMode_odd;
  assign T142 = commonCase & common_totalUnderflow;
  assign T143 = T146 & T144;
  assign T144 = ~ T145;
  assign T145 = notNaN_isInfOut ? 6'h8 : 6'h0;
  assign T146 = T149 & T147;
  assign T147 = ~ T148;
  assign T148 = pegMaxFiniteMagOut ? 6'h10 : 6'h0;
  assign T149 = T152 & T150;
  assign T150 = ~ T151;
  assign T151 = pegMinNonzeroMagOut ? 6'h37 : 6'h0;
  assign T152 = common_expOut & T153;
  assign T153 = ~ T154;
  assign T154 = T155 ? 6'h38 : 6'h0;
  assign T155 = io_in_isZero | common_totalUnderflow;
  assign common_expOut = T156;
  assign T156 = T51[5:0];
  assign signOut = isNaNOut ? 1'h0 : io_in_sign;
endmodule

module RoundRawFNToRecFN(
    input  io_invalidExc,
    input  io_infiniteExc,
    input  io_in_isNaN,
    input  io_in_isInf,
    input  io_in_isZero,
    input  io_in_sign,
    input [6:0] io_in_sExp,
    input [13:0] io_in_sig,
    input [2:0] io_roundingMode,
    input  io_detectTininess,
    output[16:0] io_out,
    output[4:0] io_exceptionFlags
);

  wire[16:0] roundAnyRawFNToRecFN_io_out;
  wire[4:0] roundAnyRawFNToRecFN_io_exceptionFlags;


  assign io_exceptionFlags = roundAnyRawFNToRecFN_io_exceptionFlags;
  assign io_out = roundAnyRawFNToRecFN_io_out;
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN(
       .io_invalidExc( io_invalidExc ),
       .io_infiniteExc( io_infiniteExc ),
       .io_in_isNaN( io_in_isNaN ),
       .io_in_isInf( io_in_isInf ),
       .io_in_isZero( io_in_isZero ),
       .io_in_sign( io_in_sign ),
       .io_in_sExp( io_in_sExp ),
       .io_in_sig( io_in_sig ),
       .io_roundingMode( io_roundingMode ),
       .io_detectTininess( io_detectTininess ),
       .io_out( roundAnyRawFNToRecFN_io_out ),
       .io_exceptionFlags( roundAnyRawFNToRecFN_io_exceptionFlags )
  );
endmodule

module MulAddRecFN(
    input [1:0] io_op,
    input [16:0] io_a,
    input [16:0] io_b,
    input [16:0] io_c,
    input [2:0] io_roundingMode,
    input  io_detectTininess,
    output[16:0] io_out,
    output[4:0] io_exceptionFlags
);

  wire[22:0] mulAddResult;
  wire[22:0] T1;
  wire[22:0] T2;
  wire[21:0] T0;
  wire[10:0] mulAddRecFNToRaw_preMul_io_mulAddA;
  wire[10:0] mulAddRecFNToRaw_preMul_io_mulAddB;
  wire[21:0] mulAddRecFNToRaw_preMul_io_mulAddC;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isInfA;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isInfB;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_signProd;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isInfC;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC;
  wire[6:0] mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant;
  wire[3:0] mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist;
  wire[12:0] mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC;
  wire mulAddRecFNToRaw_postMul_io_invalidExc;
  wire mulAddRecFNToRaw_postMul_io_rawOut_isNaN;
  wire mulAddRecFNToRaw_postMul_io_rawOut_isInf;
  wire mulAddRecFNToRaw_postMul_io_rawOut_isZero;
  wire mulAddRecFNToRaw_postMul_io_rawOut_sign;
  wire[6:0] mulAddRecFNToRaw_postMul_io_rawOut_sExp;
  wire[13:0] mulAddRecFNToRaw_postMul_io_rawOut_sig;
  wire[16:0] roundRawFNToRecFN_io_out;
  wire[4:0] roundRawFNToRecFN_io_exceptionFlags;


  assign mulAddResult = T2 + T1;
  assign T1 = {1'h0, mulAddRecFNToRaw_preMul_io_mulAddC};
  assign T2 = {1'h0, T0};
  assign T0 = mulAddRecFNToRaw_preMul_io_mulAddA * mulAddRecFNToRaw_preMul_io_mulAddB;
  assign io_exceptionFlags = roundRawFNToRecFN_io_exceptionFlags;
  assign io_out = roundRawFNToRecFN_io_out;
  MulAddRecFNToRaw_preMul mulAddRecFNToRaw_preMul(
       .io_op( io_op ),
       .io_a( io_a ),
       .io_b( io_b ),
       .io_c( io_c ),
       .io_mulAddA( mulAddRecFNToRaw_preMul_io_mulAddA ),
       .io_mulAddB( mulAddRecFNToRaw_preMul_io_mulAddB ),
       .io_mulAddC( mulAddRecFNToRaw_preMul_io_mulAddC ),
       .io_toPostMul_isSigNaNAny( mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny ),
       .io_toPostMul_isNaNAOrB( mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB ),
       .io_toPostMul_isInfA( mulAddRecFNToRaw_preMul_io_toPostMul_isInfA ),
       .io_toPostMul_isZeroA( mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA ),
       .io_toPostMul_isInfB( mulAddRecFNToRaw_preMul_io_toPostMul_isInfB ),
       .io_toPostMul_isZeroB( mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB ),
       .io_toPostMul_signProd( mulAddRecFNToRaw_preMul_io_toPostMul_signProd ),
       .io_toPostMul_isNaNC( mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC ),
       .io_toPostMul_isInfC( mulAddRecFNToRaw_preMul_io_toPostMul_isInfC ),
       .io_toPostMul_isZeroC( mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC ),
       .io_toPostMul_sExpSum( mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum ),
       .io_toPostMul_doSubMags( mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags ),
       .io_toPostMul_CIsDominant( mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant ),
       .io_toPostMul_CDom_CAlignDist( mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist ),
       .io_toPostMul_highAlignedSigC( mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC ),
       .io_toPostMul_bit0AlignedSigC( mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC )
  );
  MulAddRecFNToRaw_postMul mulAddRecFNToRaw_postMul(
       .io_fromPreMul_isSigNaNAny( mulAddRecFNToRaw_preMul_io_toPostMul_isSigNaNAny ),
       .io_fromPreMul_isNaNAOrB( mulAddRecFNToRaw_preMul_io_toPostMul_isNaNAOrB ),
       .io_fromPreMul_isInfA( mulAddRecFNToRaw_preMul_io_toPostMul_isInfA ),
       .io_fromPreMul_isZeroA( mulAddRecFNToRaw_preMul_io_toPostMul_isZeroA ),
       .io_fromPreMul_isInfB( mulAddRecFNToRaw_preMul_io_toPostMul_isInfB ),
       .io_fromPreMul_isZeroB( mulAddRecFNToRaw_preMul_io_toPostMul_isZeroB ),
       .io_fromPreMul_signProd( mulAddRecFNToRaw_preMul_io_toPostMul_signProd ),
       .io_fromPreMul_isNaNC( mulAddRecFNToRaw_preMul_io_toPostMul_isNaNC ),
       .io_fromPreMul_isInfC( mulAddRecFNToRaw_preMul_io_toPostMul_isInfC ),
       .io_fromPreMul_isZeroC( mulAddRecFNToRaw_preMul_io_toPostMul_isZeroC ),
       .io_fromPreMul_sExpSum( mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum ),
       .io_fromPreMul_doSubMags( mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags ),
       .io_fromPreMul_CIsDominant( mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant ),
       .io_fromPreMul_CDom_CAlignDist( mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist ),
       .io_fromPreMul_highAlignedSigC( mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC ),
       .io_fromPreMul_bit0AlignedSigC( mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC ),
       .io_mulAddResult( mulAddResult ),
       .io_roundingMode( io_roundingMode ),
       .io_invalidExc( mulAddRecFNToRaw_postMul_io_invalidExc ),
       .io_rawOut_isNaN( mulAddRecFNToRaw_postMul_io_rawOut_isNaN ),
       .io_rawOut_isInf( mulAddRecFNToRaw_postMul_io_rawOut_isInf ),
       .io_rawOut_isZero( mulAddRecFNToRaw_postMul_io_rawOut_isZero ),
       .io_rawOut_sign( mulAddRecFNToRaw_postMul_io_rawOut_sign ),
       .io_rawOut_sExp( mulAddRecFNToRaw_postMul_io_rawOut_sExp ),
       .io_rawOut_sig( mulAddRecFNToRaw_postMul_io_rawOut_sig )
  );
  RoundRawFNToRecFN roundRawFNToRecFN(
       .io_invalidExc( mulAddRecFNToRaw_postMul_io_invalidExc ),
       .io_infiniteExc( 1'h0 ),
       .io_in_isNaN( mulAddRecFNToRaw_postMul_io_rawOut_isNaN ),
       .io_in_isInf( mulAddRecFNToRaw_postMul_io_rawOut_isInf ),
       .io_in_isZero( mulAddRecFNToRaw_postMul_io_rawOut_isZero ),
       .io_in_sign( mulAddRecFNToRaw_postMul_io_rawOut_sign ),
       .io_in_sExp( mulAddRecFNToRaw_postMul_io_rawOut_sExp ),
       .io_in_sig( mulAddRecFNToRaw_postMul_io_rawOut_sig ),
       .io_roundingMode( io_roundingMode ),
       .io_detectTininess( io_detectTininess ),
       .io_out( roundRawFNToRecFN_io_out ),
       .io_exceptionFlags( roundRawFNToRecFN_io_exceptionFlags )
  );
endmodule

module ValExec_MulAddRecF16_mul(
    input [15:0] io_a,
    input [15:0] io_b,
    input [2:0] io_roundingMode,
    input  io_detectTininess,
    input [15:0] io_expected_out,
    input [4:0] io_expected_exceptionFlags,
    output[16:0] io_expected_recOut,
    output[16:0] io_actual_out,
    output[4:0] io_actual_exceptionFlags,
    output io_check,
    output io_pass
);

  wire[16:0] T0;
  wire[15:0] T1;
  wire[15:0] T2;
  wire[16:0] T3;
  wire[12:0] T4;
  wire[9:0] T5;
  wire[11:0] T6;
  wire[11:0] T7;
  wire[10:0] T8;
  wire[9:0] T9;
  wire[9:0] T10;
  wire[9:0] T11;
  wire[8:0] T12;
  wire[24:0] T13;
  wire[3:0] T212;
  wire[3:0] T213;
  wire[3:0] T214;
  wire[3:0] T215;
  wire[3:0] T216;
  wire[3:0] T217;
  wire[3:0] T218;
  wire[3:0] T219;
  wire[3:0] T220;
  wire T221;
  wire[9:0] T15;
  wire[1:0] T16;
  wire T17;
  wire[1:0] T18;
  wire T19;
  wire[7:0] T20;
  wire[7:0] T21;
  wire[7:0] T22;
  wire[6:0] T23;
  wire[7:0] T24;
  wire[7:0] T25;
  wire[7:0] T26;
  wire[5:0] T27;
  wire[7:0] T28;
  wire[7:0] T29;
  wire[7:0] T30;
  wire[3:0] T31;
  wire[7:0] T32;
  wire[7:0] T33;
  wire[7:0] T222;
  wire[3:0] T34;
  wire[7:0] T35;
  wire[7:0] T223;
  wire[5:0] T36;
  wire[7:0] T37;
  wire[7:0] T224;
  wire[6:0] T38;
  wire T225;
  wire T226;
  wire T227;
  wire T228;
  wire T229;
  wire T230;
  wire T231;
  wire T232;
  wire T39;
  wire[4:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire[2:0] T44;
  wire[6:0] T45;
  wire[6:0] T46;
  wire[6:0] T47;
  wire[5:0] T48;
  wire[5:0] T49;
  wire[5:0] T233;
  wire[4:0] T50;
  wire[4:0] T234;
  wire[1:0] T51;
  wire[5:0] T52;
  wire[5:0] T235;
  wire[5:0] T53;
  wire[5:0] T236;
  wire[3:0] T54;
  wire[2:0] T55;
  wire[2:0] T237;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire[1:0] T60;
  wire[2:0] T61;
  wire[2:0] T62;
  wire T63;
  wire T64;
  wire T65;
  wire[16:0] T66;
  wire[12:0] T67;
  wire[9:0] T68;
  wire[11:0] T69;
  wire[11:0] T70;
  wire[10:0] T71;
  wire[9:0] T72;
  wire[9:0] T73;
  wire[9:0] T74;
  wire[8:0] T75;
  wire[24:0] T76;
  wire[3:0] T238;
  wire[3:0] T239;
  wire[3:0] T240;
  wire[3:0] T241;
  wire[3:0] T242;
  wire[3:0] T243;
  wire[3:0] T244;
  wire[3:0] T245;
  wire[3:0] T246;
  wire T247;
  wire[9:0] T78;
  wire[1:0] T79;
  wire T80;
  wire[1:0] T81;
  wire T82;
  wire[7:0] T83;
  wire[7:0] T84;
  wire[7:0] T85;
  wire[6:0] T86;
  wire[7:0] T87;
  wire[7:0] T88;
  wire[7:0] T89;
  wire[5:0] T90;
  wire[7:0] T91;
  wire[7:0] T92;
  wire[7:0] T93;
  wire[3:0] T94;
  wire[7:0] T95;
  wire[7:0] T96;
  wire[7:0] T248;
  wire[3:0] T97;
  wire[7:0] T98;
  wire[7:0] T249;
  wire[5:0] T99;
  wire[7:0] T100;
  wire[7:0] T250;
  wire[6:0] T101;
  wire T251;
  wire T252;
  wire T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire T258;
  wire T102;
  wire[4:0] T103;
  wire T104;
  wire T105;
  wire T106;
  wire[2:0] T107;
  wire[6:0] T108;
  wire[6:0] T109;
  wire[6:0] T110;
  wire[5:0] T111;
  wire[5:0] T112;
  wire[5:0] T259;
  wire[4:0] T113;
  wire[4:0] T260;
  wire[1:0] T114;
  wire[5:0] T115;
  wire[5:0] T261;
  wire[5:0] T116;
  wire[5:0] T262;
  wire[3:0] T117;
  wire[2:0] T118;
  wire[2:0] T263;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire[1:0] T123;
  wire[2:0] T124;
  wire[2:0] T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire T132;
  wire T133;
  wire T134;
  wire[3:0] T135;
  wire[3:0] T136;
  wire T137;
  wire[2:0] T138;
  wire T139;
  wire T140;
  wire[9:0] T141;
  wire[9:0] T142;
  wire T143;
  wire T144;
  wire T145;
  wire[2:0] T146;
  wire T147;
  wire[2:0] T148;
  wire[16:0] T149;
  wire[12:0] T150;
  wire[9:0] T151;
  wire[11:0] T152;
  wire[11:0] T153;
  wire[10:0] T154;
  wire[9:0] T155;
  wire[9:0] T156;
  wire[9:0] T157;
  wire[8:0] T158;
  wire[24:0] T159;
  wire[3:0] T264;
  wire[3:0] T265;
  wire[3:0] T266;
  wire[3:0] T267;
  wire[3:0] T268;
  wire[3:0] T269;
  wire[3:0] T270;
  wire[3:0] T271;
  wire[3:0] T272;
  wire T273;
  wire[9:0] T161;
  wire[1:0] T162;
  wire T163;
  wire[1:0] T164;
  wire T165;
  wire[7:0] T166;
  wire[7:0] T167;
  wire[7:0] T168;
  wire[6:0] T169;
  wire[7:0] T170;
  wire[7:0] T171;
  wire[7:0] T172;
  wire[5:0] T173;
  wire[7:0] T174;
  wire[7:0] T175;
  wire[7:0] T176;
  wire[3:0] T177;
  wire[7:0] T178;
  wire[7:0] T179;
  wire[7:0] T274;
  wire[3:0] T180;
  wire[7:0] T181;
  wire[7:0] T275;
  wire[5:0] T182;
  wire[7:0] T183;
  wire[7:0] T276;
  wire[6:0] T184;
  wire T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire T282;
  wire T283;
  wire T284;
  wire T185;
  wire[4:0] T186;
  wire T187;
  wire T188;
  wire T189;
  wire[2:0] T190;
  wire[6:0] T191;
  wire[6:0] T192;
  wire[6:0] T193;
  wire[5:0] T194;
  wire[5:0] T195;
  wire[5:0] T285;
  wire[4:0] T196;
  wire[4:0] T286;
  wire[1:0] T197;
  wire[5:0] T198;
  wire[5:0] T287;
  wire[5:0] T199;
  wire[5:0] T288;
  wire[3:0] T200;
  wire[2:0] T201;
  wire[2:0] T289;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire[1:0] T206;
  wire[2:0] T207;
  wire[2:0] T208;
  wire T209;
  wire T210;
  wire T211;
  wire[16:0] mulAddRecFN_io_out;
  wire[4:0] mulAddRecFN_io_exceptionFlags;


  assign T0 = T1 << 1'h1;
  assign T1 = T2 & 16'h8000;
  assign T2 = io_a ^ io_b;
  assign T3 = {T54, T4};
  assign T4 = {T44, T5};
  assign T5 = T6[9:0];
  assign T6 = T7;
  assign T7 = {1'h0, T8};
  assign T8 = {T41, T9};
  assign T9 = T39 ? T11 : T10;
  assign T10 = io_b[9:0];
  assign T11 = T12 << 1'h1;
  assign T12 = T13[8:0];
  assign T13 = T10 << T212;
  assign T212 = T232 ? 1'h0 : T213;
  assign T213 = T231 ? 1'h1 : T214;
  assign T214 = T230 ? 2'h2 : T215;
  assign T215 = T229 ? 2'h3 : T216;
  assign T216 = T228 ? 3'h4 : T217;
  assign T217 = T227 ? 3'h5 : T218;
  assign T218 = T226 ? 3'h6 : T219;
  assign T219 = T225 ? 3'h7 : T220;
  assign T220 = T221 ? 4'h8 : 4'h9;
  assign T221 = T15[8];
  assign T15 = {T20, T16};
  assign T16 = {T19, T17};
  assign T17 = T18[1];
  assign T18 = T10[9:8];
  assign T19 = T18[0];
  assign T20 = T37 | T21;
  assign T21 = T22 & 8'haa;
  assign T22 = T23 << 1'h1;
  assign T23 = T24[6:0];
  assign T24 = T35 | T25;
  assign T25 = T26 & 8'hcc;
  assign T26 = T27 << 2'h2;
  assign T27 = T28[5:0];
  assign T28 = T33 | T29;
  assign T29 = T30 & 8'hf0;
  assign T30 = T31 << 3'h4;
  assign T31 = T32[3:0];
  assign T32 = T10[7:0];
  assign T33 = T222 & 8'hf;
  assign T222 = {4'h0, T34};
  assign T34 = T32 >> 3'h4;
  assign T35 = T223 & 8'h33;
  assign T223 = {2'h0, T36};
  assign T36 = T28 >> 2'h2;
  assign T37 = T224 & 8'h55;
  assign T224 = {1'h0, T38};
  assign T38 = T24 >> 1'h1;
  assign T225 = T15[7];
  assign T226 = T15[6];
  assign T227 = T15[5];
  assign T228 = T15[4];
  assign T229 = T15[3];
  assign T230 = T15[2];
  assign T231 = T15[1];
  assign T232 = T15[0];
  assign T39 = T40 == 5'h0;
  assign T40 = io_b[14:10];
  assign T41 = T42 ^ 1'h1;
  assign T42 = T39 & T43;
  assign T43 = T10 == 10'h0;
  assign T44 = T45[2:0];
  assign T45 = T46;
  assign T46 = T47;
  assign T47 = {1'h0, T48};
  assign T48 = T49;
  assign T49 = T52 + T233;
  assign T233 = {1'h0, T50};
  assign T50 = 5'h10 | T234;
  assign T234 = {3'h0, T51};
  assign T51 = T39 ? 2'h2 : 2'h1;
  assign T52 = T39 ? T53 : T235;
  assign T235 = {1'h0, T40};
  assign T53 = T236 ^ 6'h3f;
  assign T236 = {2'h0, T212};
  assign T54 = {T64, T55};
  assign T55 = T61 | T237;
  assign T237 = {2'h0, T56};
  assign T56 = T57;
  assign T57 = T59 & T58;
  assign T58 = T43 ^ 1'h1;
  assign T59 = T60 == 2'h3;
  assign T60 = T49[5:4];
  assign T61 = T63 ? 3'h0 : T62;
  assign T62 = T45[5:3];
  assign T63 = T42;
  assign T64 = T65;
  assign T65 = io_b[15];
  assign T66 = {T117, T67};
  assign T67 = {T107, T68};
  assign T68 = T69[9:0];
  assign T69 = T70;
  assign T70 = {1'h0, T71};
  assign T71 = {T104, T72};
  assign T72 = T102 ? T74 : T73;
  assign T73 = io_a[9:0];
  assign T74 = T75 << 1'h1;
  assign T75 = T76[8:0];
  assign T76 = T73 << T238;
  assign T238 = T258 ? 1'h0 : T239;
  assign T239 = T257 ? 1'h1 : T240;
  assign T240 = T256 ? 2'h2 : T241;
  assign T241 = T255 ? 2'h3 : T242;
  assign T242 = T254 ? 3'h4 : T243;
  assign T243 = T253 ? 3'h5 : T244;
  assign T244 = T252 ? 3'h6 : T245;
  assign T245 = T251 ? 3'h7 : T246;
  assign T246 = T247 ? 4'h8 : 4'h9;
  assign T247 = T78[8];
  assign T78 = {T83, T79};
  assign T79 = {T82, T80};
  assign T80 = T81[1];
  assign T81 = T73[9:8];
  assign T82 = T81[0];
  assign T83 = T100 | T84;
  assign T84 = T85 & 8'haa;
  assign T85 = T86 << 1'h1;
  assign T86 = T87[6:0];
  assign T87 = T98 | T88;
  assign T88 = T89 & 8'hcc;
  assign T89 = T90 << 2'h2;
  assign T90 = T91[5:0];
  assign T91 = T96 | T92;
  assign T92 = T93 & 8'hf0;
  assign T93 = T94 << 3'h4;
  assign T94 = T95[3:0];
  assign T95 = T73[7:0];
  assign T96 = T248 & 8'hf;
  assign T248 = {4'h0, T97};
  assign T97 = T95 >> 3'h4;
  assign T98 = T249 & 8'h33;
  assign T249 = {2'h0, T99};
  assign T99 = T91 >> 2'h2;
  assign T100 = T250 & 8'h55;
  assign T250 = {1'h0, T101};
  assign T101 = T87 >> 1'h1;
  assign T251 = T78[7];
  assign T252 = T78[6];
  assign T253 = T78[5];
  assign T254 = T78[4];
  assign T255 = T78[3];
  assign T256 = T78[2];
  assign T257 = T78[1];
  assign T258 = T78[0];
  assign T102 = T103 == 5'h0;
  assign T103 = io_a[14:10];
  assign T104 = T105 ^ 1'h1;
  assign T105 = T102 & T106;
  assign T106 = T73 == 10'h0;
  assign T107 = T108[2:0];
  assign T108 = T109;
  assign T109 = T110;
  assign T110 = {1'h0, T111};
  assign T111 = T112;
  assign T112 = T115 + T259;
  assign T259 = {1'h0, T113};
  assign T113 = 5'h10 | T260;
  assign T260 = {3'h0, T114};
  assign T114 = T102 ? 2'h2 : 2'h1;
  assign T115 = T102 ? T116 : T261;
  assign T261 = {1'h0, T103};
  assign T116 = T262 ^ 6'h3f;
  assign T262 = {2'h0, T238};
  assign T117 = {T127, T118};
  assign T118 = T124 | T263;
  assign T263 = {2'h0, T119};
  assign T119 = T120;
  assign T120 = T122 & T121;
  assign T121 = T106 ^ 1'h1;
  assign T122 = T123 == 2'h3;
  assign T123 = T112[5:4];
  assign T124 = T126 ? 3'h0 : T125;
  assign T125 = T108[5:3];
  assign T126 = T105;
  assign T127 = T128;
  assign T128 = io_a[15];
  assign io_pass = T129;
  assign T129 = T131 & T130;
  assign T130 = io_actual_exceptionFlags == io_expected_exceptionFlags;
  assign T131 = T144 ? T139 : T132;
  assign T132 = T137 ? T134 : T133;
  assign T133 = io_actual_out == io_expected_recOut;
  assign T134 = T136 == T135;
  assign T135 = io_expected_recOut[16:13];
  assign T136 = io_actual_out[16:13];
  assign T137 = T138 == 3'h6;
  assign T138 = T136[2:0];
  assign T139 = T143 & T140;
  assign T140 = T142 == T141;
  assign T141 = io_expected_recOut[9:0];
  assign T142 = io_actual_out[9:0];
  assign T143 = T136 == T135;
  assign T144 = T147 | T145;
  assign T145 = T146 == 3'h7;
  assign T146 = T136[2:0];
  assign T147 = T148 == 3'h0;
  assign T148 = T136[2:0];
  assign io_check = 1'h1;
  assign io_actual_exceptionFlags = mulAddRecFN_io_exceptionFlags;
  assign io_actual_out = mulAddRecFN_io_out;
  assign io_expected_recOut = T149;
  assign T149 = {T200, T150};
  assign T150 = {T190, T151};
  assign T151 = T152[9:0];
  assign T152 = T153;
  assign T153 = {1'h0, T154};
  assign T154 = {T187, T155};
  assign T155 = T185 ? T157 : T156;
  assign T156 = io_expected_out[9:0];
  assign T157 = T158 << 1'h1;
  assign T158 = T159[8:0];
  assign T159 = T156 << T264;
  assign T264 = T284 ? 1'h0 : T265;
  assign T265 = T283 ? 1'h1 : T266;
  assign T266 = T282 ? 2'h2 : T267;
  assign T267 = T281 ? 2'h3 : T268;
  assign T268 = T280 ? 3'h4 : T269;
  assign T269 = T279 ? 3'h5 : T270;
  assign T270 = T278 ? 3'h6 : T271;
  assign T271 = T277 ? 3'h7 : T272;
  assign T272 = T273 ? 4'h8 : 4'h9;
  assign T273 = T161[8];
  assign T161 = {T166, T162};
  assign T162 = {T165, T163};
  assign T163 = T164[1];
  assign T164 = T156[9:8];
  assign T165 = T164[0];
  assign T166 = T183 | T167;
  assign T167 = T168 & 8'haa;
  assign T168 = T169 << 1'h1;
  assign T169 = T170[6:0];
  assign T170 = T181 | T171;
  assign T171 = T172 & 8'hcc;
  assign T172 = T173 << 2'h2;
  assign T173 = T174[5:0];
  assign T174 = T179 | T175;
  assign T175 = T176 & 8'hf0;
  assign T176 = T177 << 3'h4;
  assign T177 = T178[3:0];
  assign T178 = T156[7:0];
  assign T179 = T274 & 8'hf;
  assign T274 = {4'h0, T180};
  assign T180 = T178 >> 3'h4;
  assign T181 = T275 & 8'h33;
  assign T275 = {2'h0, T182};
  assign T182 = T174 >> 2'h2;
  assign T183 = T276 & 8'h55;
  assign T276 = {1'h0, T184};
  assign T184 = T170 >> 1'h1;
  assign T277 = T161[7];
  assign T278 = T161[6];
  assign T279 = T161[5];
  assign T280 = T161[4];
  assign T281 = T161[3];
  assign T282 = T161[2];
  assign T283 = T161[1];
  assign T284 = T161[0];
  assign T185 = T186 == 5'h0;
  assign T186 = io_expected_out[14:10];
  assign T187 = T188 ^ 1'h1;
  assign T188 = T185 & T189;
  assign T189 = T156 == 10'h0;
  assign T190 = T191[2:0];
  assign T191 = T192;
  assign T192 = T193;
  assign T193 = {1'h0, T194};
  assign T194 = T195;
  assign T195 = T198 + T285;
  assign T285 = {1'h0, T196};
  assign T196 = 5'h10 | T286;
  assign T286 = {3'h0, T197};
  assign T197 = T185 ? 2'h2 : 2'h1;
  assign T198 = T185 ? T199 : T287;
  assign T287 = {1'h0, T186};
  assign T199 = T288 ^ 6'h3f;
  assign T288 = {2'h0, T264};
  assign T200 = {T210, T201};
  assign T201 = T207 | T289;
  assign T289 = {2'h0, T202};
  assign T202 = T203;
  assign T203 = T205 & T204;
  assign T204 = T189 ^ 1'h1;
  assign T205 = T206 == 2'h3;
  assign T206 = T195[5:4];
  assign T207 = T209 ? 3'h0 : T208;
  assign T208 = T191[5:3];
  assign T209 = T188;
  assign T210 = T211;
  assign T211 = io_expected_out[15];
  MulAddRecFN mulAddRecFN(
       .io_op( 2'h0 ),
       .io_a( T66 ),
       .io_b( T3 ),
       .io_c( T0 ),
       .io_roundingMode( io_roundingMode ),
       .io_detectTininess( io_detectTininess ),
       .io_out( mulAddRecFN_io_out ),
       .io_exceptionFlags( mulAddRecFN_io_exceptionFlags )
  );
endmodule

