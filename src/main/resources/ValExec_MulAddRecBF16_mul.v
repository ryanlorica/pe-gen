module MulAddRecFNToRaw_preMul(
    input [1:0] io_op,
    input [15:0] io_a,
    input [15:0] io_b,
    input [15:0] io_c,
    output[6:0] io_mulAddA,
    output[6:0] io_mulAddB,
    output[13:0] io_mulAddC,
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
    output[9:0] io_toPostMul_sExpSum,
    output io_toPostMul_doSubMags,
    output io_toPostMul_CIsDominant,
    output[2:0] io_toPostMul_CDom_CAlignDist,
    output[8:0] io_toPostMul_highAlignedSigC,
    output io_toPostMul_bit0AlignedSigC
);

  wire T0;
  wire[24:0] alignedSigC;
  wire T1;
  wire T2;
  wire reduced4CExtra;
  wire[1:0] T3;
  wire[1:0] T109;
  wire T4;
  wire[8:0] T5;
  wire[2:0] T6;
  wire[4:0] CAlignDist;
  wire[4:0] T7;
  wire[4:0] T8;
  wire[9:0] posNatCAlignDist;
  wire[11:0] sNatCAlignDist;
  wire[10:0] T110;
  wire[9:0] rawC_sExp;
  wire[9:0] T9;
  wire[9:0] T10;
  wire[8:0] T11;
  wire T111;
  wire[11:0] sExpAlignedProd;
  wire[11:0] T12;
  wire[10:0] T112;
  wire[9:0] rawB_sExp;
  wire[9:0] T13;
  wire[9:0] T14;
  wire[8:0] T15;
  wire T113;
  wire[10:0] T114;
  wire[9:0] rawA_sExp;
  wire[9:0] T16;
  wire[9:0] T17;
  wire[8:0] T18;
  wire T115;
  wire T19;
  wire isMinCAlign;
  wire T20;
  wire T21;
  wire rawB_isZero;
  wire T22;
  wire[2:0] T23;
  wire rawA_isZero;
  wire T24;
  wire[2:0] T25;
  wire[1:0] T26;
  wire[1:0] T27;
  wire T28;
  wire T29;
  wire[3:0] T30;
  wire[7:0] T31;
  wire[7:0] rawC_sig;
  wire[7:0] T32;
  wire[6:0] T33;
  wire[5:0] T34;
  wire T35;
  wire T36;
  wire[2:0] T37;
  wire T38;
  wire T39;
  wire[3:0] T40;
  wire T41;
  wire[2:0] T42;
  wire[26:0] mainAlignedSigC;
  wire[26:0] T43;
  wire[26:0] T44;
  wire[18:0] T45;
  wire[18:0] T116;
  wire[7:0] T46;
  wire[7:0] T47;
  wire T48;
  wire T49;
  wire T50;
  wire[2:0] T51;
  wire doSubMags;
  wire T52;
  wire T53;
  wire rawC_sign;
  wire T54;
  wire signProd;
  wire T55;
  wire T56;
  wire rawB_sign;
  wire T57;
  wire rawA_sign;
  wire T58;
  wire[23:0] T59;
  wire[8:0] T60;
  wire[2:0] T61;
  wire CIsDominant;
  wire T62;
  wire T63;
  wire T64;
  wire rawC_isZero;
  wire[9:0] T117;
  wire[11:0] T65;
  wire[11:0] T66;
  wire[10:0] T118;
  wire T119;
  wire rawC_isInf;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire[1:0] T71;
  wire rawC_isNaN;
  wire T72;
  wire T73;
  wire rawB_isInf;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire[1:0] T78;
  wire rawA_isInf;
  wire T79;
  wire T80;
  wire T81;
  wire T82;
  wire[1:0] T83;
  wire T84;
  wire rawB_isNaN;
  wire T85;
  wire T86;
  wire rawA_isNaN;
  wire T87;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire T94;
  wire T95;
  wire T96;
  wire[7:0] rawB_sig;
  wire[7:0] T97;
  wire[6:0] T98;
  wire[5:0] T99;
  wire T100;
  wire T101;
  wire T102;
  wire T103;
  wire[7:0] rawA_sig;
  wire[7:0] T104;
  wire[6:0] T105;
  wire[5:0] T106;
  wire T107;
  wire[13:0] T108;
  wire[6:0] T120;
  wire[6:0] T121;


  assign io_toPostMul_bit0AlignedSigC = T0;
  assign T0 = alignedSigC[0];
  assign alignedSigC = {T59, T1};
  assign T1 = doSubMags ? T48 : T2;
  assign T2 = T41 | reduced4CExtra;
  assign reduced4CExtra = T3 != 2'h0;
  assign T3 = T26 & T109;
  assign T109 = {1'h0, T4};
  assign T4 = T5[3];
  assign T5 = $signed(9'h100) >>> T6;
  assign T6 = CAlignDist >> 2'h2;
  assign CAlignDist = isMinCAlign ? 5'h0 : T7;
  assign T7 = T19 ? T8 : 5'h17;
  assign T8 = posNatCAlignDist[4:0];
  assign posNatCAlignDist = sNatCAlignDist[9:0];
  assign sNatCAlignDist = sExpAlignedProd - T110;
  assign T110 = {T111, rawC_sExp};
  assign rawC_sExp = T9;
  assign T9 = T10;
  assign T10 = {1'h0, T11};
  assign T11 = io_c[14:6];
  assign T111 = rawC_sExp[9];
  assign sExpAlignedProd = T12 + 11'h70a;
  assign T12 = T114 + T112;
  assign T112 = {T113, rawB_sExp};
  assign rawB_sExp = T13;
  assign T13 = T14;
  assign T14 = {1'h0, T15};
  assign T15 = io_b[14:6];
  assign T113 = rawB_sExp[9];
  assign T114 = {T115, rawA_sExp};
  assign rawA_sExp = T16;
  assign T16 = T17;
  assign T17 = {1'h0, T18};
  assign T18 = io_a[14:6];
  assign T115 = rawA_sExp[9];
  assign T19 = posNatCAlignDist < 10'h17;
  assign isMinCAlign = T21 | T20;
  assign T20 = $signed(sNatCAlignDist) < $signed(1'h0);
  assign T21 = rawA_isZero | rawB_isZero;
  assign rawB_isZero = T22;
  assign T22 = T23 == 3'h0;
  assign T23 = T15[8:6];
  assign rawA_isZero = T24;
  assign T24 = T25 == 3'h0;
  assign T25 = T18[8:6];
  assign T26 = T27;
  assign T27 = {T38, T28};
  assign T28 = T29;
  assign T29 = T30 != 4'h0;
  assign T30 = T31[3:0];
  assign T31 = rawC_sig << 1'h0;
  assign rawC_sig = T32;
  assign T32 = {1'h0, T33};
  assign T33 = {T35, T34};
  assign T34 = io_c[5:0];
  assign T35 = T36 ^ 1'h1;
  assign T36 = T37 == 3'h0;
  assign T37 = T11[8:6];
  assign T38 = T39;
  assign T39 = T40 != 4'h0;
  assign T40 = T31[7:4];
  assign T41 = T42 != 3'h0;
  assign T42 = mainAlignedSigC[2:0];
  assign mainAlignedSigC = $signed(T43) >>> CAlignDist;
  assign T43 = T44;
  assign T44 = {T46, T45};
  assign T45 = 19'h0 - T116;
  assign T116 = {18'h0, doSubMags};
  assign T46 = doSubMags ? T47 : rawC_sig;
  assign T47 = ~ rawC_sig;
  assign T48 = T50 & T49;
  assign T49 = reduced4CExtra ^ 1'h1;
  assign T50 = T51 == 3'h7;
  assign T51 = mainAlignedSigC[2:0];
  assign doSubMags = T53 ^ T52;
  assign T52 = io_op[0];
  assign T53 = signProd ^ rawC_sign;
  assign rawC_sign = T54;
  assign T54 = io_c[15];
  assign signProd = T56 ^ T55;
  assign T55 = io_op[1];
  assign T56 = rawA_sign ^ rawB_sign;
  assign rawB_sign = T57;
  assign T57 = io_b[15];
  assign rawA_sign = T58;
  assign T58 = io_a[15];
  assign T59 = $signed(mainAlignedSigC) >>> 2'h3;
  assign io_toPostMul_highAlignedSigC = T60;
  assign T60 = alignedSigC[23:15];
  assign io_toPostMul_CDom_CAlignDist = T61;
  assign T61 = CAlignDist[2:0];
  assign io_toPostMul_CIsDominant = CIsDominant;
  assign CIsDominant = T64 & T62;
  assign T62 = isMinCAlign | T63;
  assign T63 = posNatCAlignDist <= 10'h7;
  assign T64 = rawC_isZero ^ 1'h1;
  assign rawC_isZero = T36;
  assign io_toPostMul_doSubMags = doSubMags;
  assign io_toPostMul_sExpSum = T117;
  assign T117 = T65[9:0];
  assign T65 = CIsDominant ? T118 : T66;
  assign T66 = sExpAlignedProd - 11'h7;
  assign T118 = {T119, rawC_sExp};
  assign T119 = rawC_sExp[9];
  assign io_toPostMul_isZeroC = rawC_isZero;
  assign io_toPostMul_isInfC = rawC_isInf;
  assign rawC_isInf = T67;
  assign T67 = T70 & T68;
  assign T68 = T69 ^ 1'h1;
  assign T69 = T11[6];
  assign T70 = T71 == 2'h3;
  assign T71 = T11[8:7];
  assign io_toPostMul_isNaNC = rawC_isNaN;
  assign rawC_isNaN = T72;
  assign T72 = T70 & T73;
  assign T73 = T11[6];
  assign io_toPostMul_signProd = signProd;
  assign io_toPostMul_isZeroB = rawB_isZero;
  assign io_toPostMul_isInfB = rawB_isInf;
  assign rawB_isInf = T74;
  assign T74 = T77 & T75;
  assign T75 = T76 ^ 1'h1;
  assign T76 = T15[6];
  assign T77 = T78 == 2'h3;
  assign T78 = T15[8:7];
  assign io_toPostMul_isZeroA = rawA_isZero;
  assign io_toPostMul_isInfA = rawA_isInf;
  assign rawA_isInf = T79;
  assign T79 = T82 & T80;
  assign T80 = T81 ^ 1'h1;
  assign T81 = T18[6];
  assign T82 = T83 == 2'h3;
  assign T83 = T18[8:7];
  assign io_toPostMul_isNaNAOrB = T84;
  assign T84 = rawA_isNaN | rawB_isNaN;
  assign rawB_isNaN = T85;
  assign T85 = T77 & T86;
  assign T86 = T15[6];
  assign rawA_isNaN = T87;
  assign T87 = T82 & T88;
  assign T88 = T18[6];
  assign io_toPostMul_isSigNaNAny = T89;
  assign T89 = T93 | T90;
  assign T90 = rawC_isNaN & T91;
  assign T91 = T92 ^ 1'h1;
  assign T92 = rawC_sig[5];
  assign T93 = T101 | T94;
  assign T94 = rawB_isNaN & T95;
  assign T95 = T96 ^ 1'h1;
  assign T96 = rawB_sig[5];
  assign rawB_sig = T97;
  assign T97 = {1'h0, T98};
  assign T98 = {T100, T99};
  assign T99 = io_b[5:0];
  assign T100 = T22 ^ 1'h1;
  assign T101 = rawA_isNaN & T102;
  assign T102 = T103 ^ 1'h1;
  assign T103 = rawA_sig[5];
  assign rawA_sig = T104;
  assign T104 = {1'h0, T105};
  assign T105 = {T107, T106};
  assign T106 = io_a[5:0];
  assign T107 = T24 ^ 1'h1;
  assign io_mulAddC = T108;
  assign T108 = alignedSigC[14:1];
  assign io_mulAddB = T120;
  assign T120 = rawB_sig[6:0];
  assign io_mulAddA = T121;
  assign T121 = rawA_sig[6:0];
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
    input [9:0] io_fromPreMul_sExpSum,
    input  io_fromPreMul_doSubMags,
    input  io_fromPreMul_CIsDominant,
    input [2:0] io_fromPreMul_CDom_CAlignDist,
    input [8:0] io_fromPreMul_highAlignedSigC,
    input  io_fromPreMul_bit0AlignedSigC,
    input [14:0] io_mulAddResult,
    input [2:0] io_roundingMode,
    output io_invalidExc,
    output io_rawOut_isNaN,
    output io_rawOut_isInf,
    output io_rawOut_isZero,
    output io_rawOut_sign,
    output[9:0] io_rawOut_sExp,
    output[9:0] io_rawOut_sig
);

  wire[9:0] T0;
  wire[9:0] notCDom_sig;
  wire T1;
  wire notCDom_reduced4SigExtra;
  wire[2:0] T2;
  wire[2:0] T165;
  wire[1:0] T3;
  wire T4;
  wire[1:0] T5;
  wire[8:0] T6;
  wire[2:0] T7;
  wire[2:0] T8;
  wire[3:0] T166;
  wire[3:0] T167;
  wire[3:0] T168;
  wire[3:0] T169;
  wire[3:0] T170;
  wire[3:0] T171;
  wire[3:0] T172;
  wire[3:0] T173;
  wire T174;
  wire[8:0] T9;
  wire T10;
  wire[8:0] notCDom_reduced2AbsSigSum;
  wire[8:0] T11;
  wire[4:0] T12;
  wire[2:0] T13;
  wire[1:0] T14;
  wire T15;
  wire T16;
  wire[1:0] T17;
  wire[16:0] notCDom_absSigSum;
  wire[16:0] T18;
  wire[16:0] T175;
  wire[16:0] T19;
  wire[23:0] sigSum;
  wire[14:0] T20;
  wire[13:0] T21;
  wire[8:0] T22;
  wire[8:0] T23;
  wire T24;
  wire[16:0] T25;
  wire[16:0] T26;
  wire notCDom_signSigSum;
  wire T27;
  wire T28;
  wire[1:0] T29;
  wire T30;
  wire T31;
  wire[1:0] T32;
  wire[1:0] T33;
  wire T34;
  wire T35;
  wire[1:0] T36;
  wire T37;
  wire T38;
  wire[1:0] T39;
  wire[3:0] T40;
  wire[1:0] T41;
  wire T42;
  wire T43;
  wire[1:0] T44;
  wire T45;
  wire T46;
  wire[1:0] T47;
  wire[1:0] T48;
  wire T49;
  wire T50;
  wire[1:0] T51;
  wire T52;
  wire T53;
  wire T54;
  wire[7:0] T55;
  wire[7:0] T56;
  wire[7:0] T57;
  wire[6:0] T58;
  wire[7:0] T59;
  wire[7:0] T60;
  wire[7:0] T61;
  wire[5:0] T62;
  wire[7:0] T63;
  wire[7:0] T64;
  wire[7:0] T65;
  wire[3:0] T66;
  wire[7:0] T67;
  wire[7:0] T68;
  wire[7:0] T176;
  wire[3:0] T69;
  wire[7:0] T70;
  wire[7:0] T177;
  wire[5:0] T71;
  wire[7:0] T72;
  wire[7:0] T178;
  wire[6:0] T73;
  wire T179;
  wire T180;
  wire T181;
  wire T182;
  wire T183;
  wire T184;
  wire T185;
  wire T74;
  wire[2:0] T75;
  wire[2:0] T76;
  wire[1:0] T77;
  wire T78;
  wire T79;
  wire[1:0] T80;
  wire[4:0] T81;
  wire[3:0] T82;
  wire T83;
  wire T84;
  wire[1:0] T85;
  wire T86;
  wire T87;
  wire T88;
  wire T89;
  wire[2:0] T90;
  wire[11:0] notCDom_mainSig;
  wire[47:0] T91;
  wire[4:0] notCDom_nearNormDist;
  wire[8:0] T92;
  wire[9:0] CDom_sig;
  wire T93;
  wire CDom_absSigSumExtra;
  wire T94;
  wire[7:0] T95;
  wire T96;
  wire[6:0] T97;
  wire[6:0] T98;
  wire T99;
  wire CDom_reduced4SigExtra;
  wire[1:0] T100;
  wire[1:0] T186;
  wire T101;
  wire[2:0] T102;
  wire T103;
  wire T104;
  wire[1:0] T105;
  wire[1:0] T106;
  wire T107;
  wire T108;
  wire[3:0] T109;
  wire[6:0] T110;
  wire[6:0] T111;
  wire[15:0] CDom_absSigSum;
  wire[15:0] T112;
  wire[14:0] T113;
  wire[12:0] T114;
  wire[1:0] T115;
  wire[15:0] T116;
  wire[15:0] T117;
  wire T118;
  wire T119;
  wire[2:0] T120;
  wire T121;
  wire[2:0] T122;
  wire[11:0] CDom_mainSig;
  wire[22:0] T123;
  wire[8:0] T124;
  wire[9:0] T125;
  wire[9:0] notCDom_sExp;
  wire[9:0] T187;
  wire[5:0] T126;
  wire[5:0] T127;
  wire[3:0] T188;
  wire T189;
  wire[9:0] CDom_sExp;
  wire[9:0] T190;
  wire[1:0] T128;
  wire[1:0] T129;
  wire[7:0] T191;
  wire T192;
  wire T130;
  wire T131;
  wire T132;
  wire notCDom_sign;
  wire T133;
  wire roundingMode_min;
  wire notCDom_completeCancellation;
  wire[1:0] T134;
  wire CDom_sign;
  wire T135;
  wire T136;
  wire notNaN_addZeros;
  wire T137;
  wire T138;
  wire notNaN_isInfOut;
  wire notNaN_isInfProd;
  wire T139;
  wire T140;
  wire T141;
  wire T142;
  wire T143;
  wire T144;
  wire T145;
  wire T146;
  wire T147;
  wire T148;
  wire T149;
  wire T150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire T156;
  wire T157;
  wire T158;
  wire T159;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire T164;


  assign io_rawOut_sig = T0;
  assign T0 = io_fromPreMul_CIsDominant ? CDom_sig : notCDom_sig;
  assign notCDom_sig = {T92, T1};
  assign T1 = T89 | notCDom_reduced4SigExtra;
  assign notCDom_reduced4SigExtra = T2 != 3'h0;
  assign T2 = T75 & T165;
  assign T165 = {1'h0, T3};
  assign T3 = {T74, T4};
  assign T4 = T5[1];
  assign T5 = T6[2:1];
  assign T6 = $signed(9'h100) >>> T7;
  assign T7 = ~ T8;
  assign T8 = T166 >> 1'h1;
  assign T166 = T185 ? 1'h0 : T167;
  assign T167 = T184 ? 1'h1 : T168;
  assign T168 = T183 ? 2'h2 : T169;
  assign T169 = T182 ? 2'h3 : T170;
  assign T170 = T181 ? 3'h4 : T171;
  assign T171 = T180 ? 3'h5 : T172;
  assign T172 = T179 ? 3'h6 : T173;
  assign T173 = T174 ? 3'h7 : 4'h8;
  assign T174 = T9[7];
  assign T9 = {T55, T10};
  assign T10 = notCDom_reduced2AbsSigSum[8];
  assign notCDom_reduced2AbsSigSum = T11;
  assign T11 = {T40, T12};
  assign T12 = {T33, T13};
  assign T13 = {T30, T14};
  assign T14 = {T27, T15};
  assign T15 = T16;
  assign T16 = T17 != 2'h0;
  assign T17 = notCDom_absSigSum[1:0];
  assign notCDom_absSigSum = notCDom_signSigSum ? T25 : T18;
  assign T18 = T19 + T175;
  assign T175 = {16'h0, io_fromPreMul_doSubMags};
  assign T19 = sigSum[16:0];
  assign sigSum = {T22, T20};
  assign T20 = {T21, io_fromPreMul_bit0AlignedSigC};
  assign T21 = io_mulAddResult[13:0];
  assign T22 = T24 ? T23 : io_fromPreMul_highAlignedSigC;
  assign T23 = io_fromPreMul_highAlignedSigC + 9'h1;
  assign T24 = io_mulAddResult[14];
  assign T25 = ~ T26;
  assign T26 = sigSum[16:0];
  assign notCDom_signSigSum = sigSum[17];
  assign T27 = T28;
  assign T28 = T29 != 2'h0;
  assign T29 = notCDom_absSigSum[3:2];
  assign T30 = T31;
  assign T31 = T32 != 2'h0;
  assign T32 = notCDom_absSigSum[5:4];
  assign T33 = {T37, T34};
  assign T34 = T35;
  assign T35 = T36 != 2'h0;
  assign T36 = notCDom_absSigSum[7:6];
  assign T37 = T38;
  assign T38 = T39 != 2'h0;
  assign T39 = notCDom_absSigSum[9:8];
  assign T40 = {T48, T41};
  assign T41 = {T45, T42};
  assign T42 = T43;
  assign T43 = T44 != 2'h0;
  assign T44 = notCDom_absSigSum[11:10];
  assign T45 = T46;
  assign T46 = T47 != 2'h0;
  assign T47 = notCDom_absSigSum[13:12];
  assign T48 = {T52, T49};
  assign T49 = T50;
  assign T50 = T51 != 2'h0;
  assign T51 = notCDom_absSigSum[15:14];
  assign T52 = T53;
  assign T53 = T54 != 1'h0;
  assign T54 = notCDom_absSigSum[16];
  assign T55 = T72 | T56;
  assign T56 = T57 & 8'haa;
  assign T57 = T58 << 1'h1;
  assign T58 = T59[6:0];
  assign T59 = T70 | T60;
  assign T60 = T61 & 8'hcc;
  assign T61 = T62 << 2'h2;
  assign T62 = T63[5:0];
  assign T63 = T68 | T64;
  assign T64 = T65 & 8'hf0;
  assign T65 = T66 << 3'h4;
  assign T66 = T67[3:0];
  assign T67 = notCDom_reduced2AbsSigSum[7:0];
  assign T68 = T176 & 8'hf;
  assign T176 = {4'h0, T69};
  assign T69 = T67 >> 3'h4;
  assign T70 = T177 & 8'h33;
  assign T177 = {2'h0, T71};
  assign T71 = T63 >> 2'h2;
  assign T72 = T178 & 8'h55;
  assign T178 = {1'h0, T73};
  assign T73 = T59 >> 1'h1;
  assign T179 = T9[6];
  assign T180 = T9[5];
  assign T181 = T9[4];
  assign T182 = T9[3];
  assign T183 = T9[2];
  assign T184 = T9[1];
  assign T185 = T9[0];
  assign T74 = T5[0];
  assign T75 = T76;
  assign T76 = {T86, T77};
  assign T77 = {T83, T78};
  assign T78 = T79;
  assign T79 = T80 != 2'h0;
  assign T80 = T81[1:0];
  assign T81 = T82 << 1'h1;
  assign T82 = notCDom_reduced2AbsSigSum[3:0];
  assign T83 = T84;
  assign T84 = T85 != 2'h0;
  assign T85 = T81[3:2];
  assign T86 = T87;
  assign T87 = T88 != 1'h0;
  assign T88 = T81[4];
  assign T89 = T90 != 3'h0;
  assign T90 = notCDom_mainSig[2:0];
  assign notCDom_mainSig = T91[17:6];
  assign T91 = notCDom_absSigSum << notCDom_nearNormDist;
  assign notCDom_nearNormDist = T166 << 1'h1;
  assign T92 = notCDom_mainSig >> 2'h3;
  assign CDom_sig = {T124, T93};
  assign T93 = T99 | CDom_absSigSumExtra;
  assign CDom_absSigSumExtra = io_fromPreMul_doSubMags ? T96 : T94;
  assign T94 = T95 != 8'h0;
  assign T95 = sigSum[8:1];
  assign T96 = T97 != 7'h0;
  assign T97 = ~ T98;
  assign T98 = sigSum[7:1];
  assign T99 = T121 | CDom_reduced4SigExtra;
  assign CDom_reduced4SigExtra = T100 != 2'h0;
  assign T100 = T105 & T186;
  assign T186 = {1'h0, T101};
  assign T101 = T102[1];
  assign T102 = $signed(3'h4) >>> T103;
  assign T103 = ~ T104;
  assign T104 = io_fromPreMul_CDom_CAlignDist >> 2'h2;
  assign T105 = T106;
  assign T106 = {T118, T107};
  assign T107 = T108;
  assign T108 = T109 != 4'h0;
  assign T109 = T110[3:0];
  assign T110 = T111 << 1'h0;
  assign T111 = CDom_absSigSum[6:0];
  assign CDom_absSigSum = io_fromPreMul_doSubMags ? T116 : T112;
  assign T112 = {1'h0, T113};
  assign T113 = {T115, T114};
  assign T114 = sigSum[21:9];
  assign T115 = io_fromPreMul_highAlignedSigC[8:7];
  assign T116 = ~ T117;
  assign T117 = sigSum[23:8];
  assign T118 = T119;
  assign T119 = T120 != 3'h0;
  assign T120 = T110[6:4];
  assign T121 = T122 != 3'h0;
  assign T122 = CDom_mainSig[2:0];
  assign CDom_mainSig = T123[15:4];
  assign T123 = CDom_absSigSum << io_fromPreMul_CDom_CAlignDist;
  assign T124 = CDom_mainSig >> 2'h3;
  assign io_rawOut_sExp = T125;
  assign T125 = io_fromPreMul_CIsDominant ? CDom_sExp : notCDom_sExp;
  assign notCDom_sExp = io_fromPreMul_sExpSum - T187;
  assign T187 = {T188, T126};
  assign T126 = T127;
  assign T127 = {1'h0, notCDom_nearNormDist};
  assign T188 = T189 ? 4'hf : 4'h0;
  assign T189 = T126[5];
  assign CDom_sExp = io_fromPreMul_sExpSum - T190;
  assign T190 = {T191, T128};
  assign T128 = T129;
  assign T129 = {1'h0, io_fromPreMul_doSubMags};
  assign T191 = T192 ? 8'hff : 8'h0;
  assign T192 = T128[1];
  assign io_rawOut_sign = T130;
  assign T130 = T139 | T131;
  assign T131 = T135 & T132;
  assign T132 = io_fromPreMul_CIsDominant ? CDom_sign : notCDom_sign;
  assign notCDom_sign = notCDom_completeCancellation ? roundingMode_min : T133;
  assign T133 = io_fromPreMul_signProd ^ notCDom_signSigSum;
  assign roundingMode_min = io_roundingMode == 3'h2;
  assign notCDom_completeCancellation = T134 == 2'h0;
  assign T134 = notCDom_sig[9:8];
  assign CDom_sign = io_fromPreMul_signProd ^ io_fromPreMul_doSubMags;
  assign T135 = T138 & T136;
  assign T136 = notNaN_addZeros ^ 1'h1;
  assign notNaN_addZeros = T137 & io_fromPreMul_isZeroC;
  assign T137 = io_fromPreMul_isZeroA | io_fromPreMul_isZeroB;
  assign T138 = notNaN_isInfOut ^ 1'h1;
  assign notNaN_isInfOut = notNaN_isInfProd | io_fromPreMul_isInfC;
  assign notNaN_isInfProd = io_fromPreMul_isInfA | io_fromPreMul_isInfB;
  assign T139 = T143 | T140;
  assign T140 = T142 & T141;
  assign T141 = io_fromPreMul_signProd | CDom_sign;
  assign T142 = notNaN_addZeros & roundingMode_min;
  assign T143 = T148 | T144;
  assign T144 = T145 & CDom_sign;
  assign T145 = T146 & io_fromPreMul_signProd;
  assign T146 = notNaN_addZeros & T147;
  assign T147 = roundingMode_min ^ 1'h1;
  assign T148 = T150 | T149;
  assign T149 = io_fromPreMul_isInfC & CDom_sign;
  assign T150 = notNaN_isInfProd & io_fromPreMul_signProd;
  assign io_rawOut_isZero = T151;
  assign T151 = notNaN_addZeros | T152;
  assign T152 = T153 & notCDom_completeCancellation;
  assign T153 = io_fromPreMul_CIsDominant ^ 1'h1;
  assign io_rawOut_isInf = notNaN_isInfOut;
  assign io_rawOut_isNaN = T154;
  assign T154 = io_fromPreMul_isNaNAOrB | io_fromPreMul_isNaNC;
  assign io_invalidExc = T155;
  assign T155 = T161 | T156;
  assign T156 = T157 & io_fromPreMul_doSubMags;
  assign T157 = T158 & io_fromPreMul_isInfC;
  assign T158 = T160 & T159;
  assign T159 = io_fromPreMul_isInfA | io_fromPreMul_isInfB;
  assign T160 = io_fromPreMul_isNaNAOrB ^ 1'h1;
  assign T161 = T163 | T162;
  assign T162 = io_fromPreMul_isZeroA & io_fromPreMul_isInfB;
  assign T163 = io_fromPreMul_isSigNaNAny | T164;
  assign T164 = io_fromPreMul_isInfA & io_fromPreMul_isZeroB;
endmodule

module RoundAnyRawFNToRecFN(
    input  io_invalidExc,
    input  io_infiniteExc,
    input  io_in_isNaN,
    input  io_in_isInf,
    input  io_in_isZero,
    input  io_in_sign,
    input [9:0] io_in_sExp,
    input [9:0] io_in_sig,
    input [2:0] io_roundingMode,
    input  io_detectTininess,
    output[15:0] io_out,
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
  wire[9:0] T7;
  wire[9:0] T8;
  wire[8:0] T9;
  wire[9:0] T10;
  wire[7:0] T11;
  wire[7:0] T162;
  wire doShiftSigDown1;
  wire[7:0] T12;
  wire[7:0] T13;
  wire[7:0] T163;
  wire[2:0] T14;
  wire[2:0] T15;
  wire T16;
  wire[2:0] T17;
  wire[64:0] T18;
  wire[5:0] T19;
  wire[6:0] T20;
  wire[7:0] T21;
  wire[8:0] T22;
  wire[8:0] T23;
  wire[1:0] T24;
  wire T25;
  wire[1:0] T26;
  wire T27;
  wire T28;
  wire[7:0] T29;
  wire[4:0] T30;
  wire[4:0] T31;
  wire[4:0] T32;
  wire[4:0] T33;
  wire T34;
  wire[4:0] T35;
  wire[64:0] T36;
  wire[5:0] T37;
  wire[3:0] T38;
  wire[1:0] T39;
  wire T40;
  wire[1:0] T41;
  wire[3:0] T42;
  wire T43;
  wire[1:0] T44;
  wire T45;
  wire[1:0] T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire[9:0] adjustedSig;
  wire T51;
  wire[9:0] T52;
  wire[9:0] T53;
  wire[9:0] T54;
  wire common_totalUnderflow;
  wire T55;
  wire[12:0] T56;
  wire[11:0] T164;
  wire[3:0] T57;
  wire[3:0] T58;
  wire[2:0] T59;
  wire[9:0] T60;
  wire[8:0] T61;
  wire[8:0] T62;
  wire[8:0] T63;
  wire T64;
  wire roundingMode_odd;
  wire[8:0] T165;
  wire[7:0] T65;
  wire[9:0] T66;
  wire[9:0] T67;
  wire[9:0] T68;
  wire[8:0] T69;
  wire[8:0] T70;
  wire[8:0] T71;
  wire T72;
  wire T73;
  wire T74;
  wire roundingMode_near_even;
  wire[9:0] T75;
  wire[8:0] T166;
  wire[7:0] T76;
  wire[9:0] T77;
  wire T78;
  wire T79;
  wire roundMagUp;
  wire T80;
  wire T81;
  wire roundingMode_max;
  wire T82;
  wire roundingMode_min;
  wire T83;
  wire T84;
  wire roundingMode_near_maxMag;
  wire[7:0] T167;
  wire T168;
  wire[10:0] T169;
  wire T170;
  wire commonCase;
  wire T85;
  wire T86;
  wire T87;
  wire notNaN_isSpecialInfOut;
  wire T88;
  wire isNaNOut;
  wire underflow;
  wire common_underflow;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire T94;
  wire T95;
  wire T96;
  wire[1:0] T97;
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
  wire T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire[1:0] T122;
  wire overflow;
  wire common_overflow;
  wire T123;
  wire[5:0] T124;
  wire[1:0] T125;
  wire[15:0] T126;
  wire[14:0] T127;
  wire[5:0] fractOut;
  wire[5:0] T128;
  wire[5:0] T171;
  wire pegMaxFiniteMagOut;
  wire T129;
  wire overflow_roundMagUp;
  wire T130;
  wire[5:0] T131;
  wire[5:0] common_fractOut;
  wire[5:0] T132;
  wire[5:0] T133;
  wire[5:0] T134;
  wire[5:0] T135;
  wire T136;
  wire T137;
  wire[8:0] expOut;
  wire[8:0] T138;
  wire[8:0] T139;
  wire[8:0] T140;
  wire notNaN_isInfOut;
  wire T141;
  wire[8:0] T142;
  wire[8:0] T143;
  wire[8:0] T144;
  wire[8:0] T145;
  wire pegMinNonzeroMagOut;
  wire T146;
  wire T147;
  wire[8:0] T148;
  wire[8:0] T149;
  wire[8:0] T150;
  wire[8:0] T151;
  wire[8:0] T152;
  wire[8:0] T153;
  wire[8:0] T154;
  wire[8:0] T155;
  wire[8:0] T156;
  wire[8:0] T157;
  wire[8:0] T158;
  wire[8:0] T159;
  wire T160;
  wire[8:0] common_expOut;
  wire[8:0] T161;
  wire signOut;


  assign io_exceptionFlags = T0;
  assign T0 = {T125, T1};
  assign T1 = {overflow, T2};
  assign T2 = {underflow, inexact};
  assign inexact = overflow | T3;
  assign T3 = commonCase & common_inexact;
  assign common_inexact = T4;
  assign T4 = common_totalUnderflow | T5;
  assign T5 = T51 | T6;
  assign T6 = T7 != 10'h0;
  assign T7 = adjustedSig & T8;
  assign T8 = {1'h0, T9};
  assign T9 = T10 >> 1'h1;
  assign T10 = {T11, 2'h3};
  assign T11 = T12 | T162;
  assign T162 = {7'h0, doShiftSigDown1};
  assign doShiftSigDown1 = adjustedSig[9];
  assign T12 = T50 ? T13 : 8'h0;
  assign T13 = T49 ? T29 : T163;
  assign T163 = {5'h0, T14};
  assign T14 = T28 ? T15 : 3'h0;
  assign T15 = {T24, T16};
  assign T16 = T17[2];
  assign T17 = T18[2:0];
  assign T18 = $signed(65'h10000000000000000) >>> T19;
  assign T19 = T20[5:0];
  assign T20 = T21[6:0];
  assign T21 = T22[7:0];
  assign T22 = ~ T23;
  assign T23 = io_in_sExp[8:0];
  assign T24 = {T27, T25};
  assign T25 = T26[1];
  assign T26 = T17[1:0];
  assign T27 = T26[0];
  assign T28 = T20[6];
  assign T29 = {T30, 3'h7};
  assign T30 = ~ T31;
  assign T31 = T48 ? 5'h0 : T32;
  assign T32 = ~ T33;
  assign T33 = {T38, T34};
  assign T34 = T35[4];
  assign T35 = T36[63:59];
  assign T36 = $signed(65'h10000000000000000) >>> T37;
  assign T37 = T20[5:0];
  assign T38 = {T44, T39};
  assign T39 = {T43, T40};
  assign T40 = T41[1];
  assign T41 = T42[3:2];
  assign T42 = T35[3:0];
  assign T43 = T41[0];
  assign T44 = {T47, T45};
  assign T45 = T46[1];
  assign T46 = T42[1:0];
  assign T47 = T46[0];
  assign T48 = T20[6];
  assign T49 = T21[7];
  assign T50 = T22[8];
  assign adjustedSig = io_in_sig << 1'h0;
  assign T51 = T52 != 10'h0;
  assign T52 = adjustedSig & T53;
  assign T53 = T54 & T10;
  assign T54 = ~ T8;
  assign common_totalUnderflow = T55;
  assign T55 = $signed(T56) < $signed(8'h7c);
  assign T56 = T169 + T164;
  assign T164 = {T167, T57};
  assign T57 = T58;
  assign T58 = {1'h0, T59};
  assign T59 = T60 >> 3'h7;
  assign T60 = T78 ? T68 : T61;
  assign T61 = T165 | T62;
  assign T62 = T64 ? T63 : 9'h0;
  assign T63 = T53 >> 1'h1;
  assign T64 = roundingMode_odd & T5;
  assign roundingMode_odd = io_roundingMode == 3'h6;
  assign T165 = {1'h0, T65};
  assign T65 = T66 >> 2'h2;
  assign T66 = adjustedSig & T67;
  assign T67 = ~ T10;
  assign T68 = T75 & T69;
  assign T69 = ~ T70;
  assign T70 = T72 ? T71 : 9'h0;
  assign T71 = T10 >> 1'h1;
  assign T72 = T74 & T73;
  assign T73 = T6 ^ 1'h1;
  assign T74 = roundingMode_near_even & T51;
  assign roundingMode_near_even = io_roundingMode == 3'h0;
  assign T75 = T166 + 9'h1;
  assign T166 = {1'h0, T76};
  assign T76 = T77 >> 2'h2;
  assign T77 = adjustedSig | T10;
  assign T78 = T83 | T79;
  assign T79 = roundMagUp & T5;
  assign roundMagUp = T82 | T80;
  assign T80 = roundingMode_max & T81;
  assign T81 = io_in_sign ^ 1'h1;
  assign roundingMode_max = io_roundingMode == 3'h3;
  assign T82 = roundingMode_min & io_in_sign;
  assign roundingMode_min = io_roundingMode == 3'h2;
  assign T83 = T84 & T51;
  assign T84 = roundingMode_near_even | roundingMode_near_maxMag;
  assign roundingMode_near_maxMag = io_roundingMode == 3'h4;
  assign T167 = T168 ? 8'hff : 8'h0;
  assign T168 = T57[2];
  assign T169 = {T170, io_in_sExp};
  assign T170 = io_in_sExp[9];
  assign commonCase = T86 & T85;
  assign T85 = io_in_isZero ^ 1'h1;
  assign T86 = T88 & T87;
  assign T87 = notNaN_isSpecialInfOut ^ 1'h1;
  assign notNaN_isSpecialInfOut = io_infiniteExc | io_in_isInf;
  assign T88 = isNaNOut ^ 1'h1;
  assign isNaNOut = io_invalidExc | io_in_isNaN;
  assign underflow = commonCase & common_underflow;
  assign common_underflow = T89;
  assign T89 = common_totalUnderflow | T90;
  assign T90 = T116 & T91;
  assign T91 = T92 ^ 1'h1;
  assign T92 = T105 & T93;
  assign T93 = T100 | T94;
  assign T94 = roundMagUp & T95;
  assign T95 = T98 | T96;
  assign T96 = T97 != 2'h0;
  assign T97 = adjustedSig[1:0];
  assign T98 = doShiftSigDown1 & T99;
  assign T99 = adjustedSig[2];
  assign T100 = T104 & T101;
  assign T101 = doShiftSigDown1 ? T103 : T102;
  assign T102 = adjustedSig[1];
  assign T103 = adjustedSig[2];
  assign T104 = roundingMode_near_even | roundingMode_near_maxMag;
  assign T105 = T106 & T51;
  assign T106 = T110 & T107;
  assign T107 = doShiftSigDown1 ? T109 : T108;
  assign T108 = T60[7];
  assign T109 = T60[8];
  assign T110 = T115 & T111;
  assign T111 = T112 ^ 1'h1;
  assign T112 = doShiftSigDown1 ? T114 : T113;
  assign T113 = T10[3];
  assign T114 = T10[4];
  assign T115 = io_detectTininess == 1'h1;
  assign T116 = T120 & T117;
  assign T117 = doShiftSigDown1 ? T119 : T118;
  assign T118 = T10[2];
  assign T119 = T10[3];
  assign T120 = T5 & T121;
  assign T121 = $signed(T122) <= $signed(1'h0);
  assign T122 = $signed(io_in_sExp) >>> 4'h8;
  assign overflow = commonCase & common_overflow;
  assign common_overflow = T123;
  assign T123 = $signed(3'h3) <= $signed(T124);
  assign T124 = $signed(T56) >>> 3'h7;
  assign T125 = {io_invalidExc, io_infiniteExc};
  assign io_out = T126;
  assign T126 = {signOut, T127};
  assign T127 = {expOut, fractOut};
  assign fractOut = T131 | T128;
  assign T128 = 6'h0 - T171;
  assign T171 = {5'h0, pegMaxFiniteMagOut};
  assign pegMaxFiniteMagOut = overflow & T129;
  assign T129 = overflow_roundMagUp ^ 1'h1;
  assign overflow_roundMagUp = T130 | roundMagUp;
  assign T130 = roundingMode_near_even | roundingMode_near_maxMag;
  assign T131 = T136 ? T135 : common_fractOut;
  assign common_fractOut = T132;
  assign T132 = doShiftSigDown1 ? T134 : T133;
  assign T133 = T60[5:0];
  assign T134 = T60[6:1];
  assign T135 = isNaNOut ? 6'h20 : 6'h0;
  assign T136 = T137 | common_totalUnderflow;
  assign T137 = isNaNOut | io_in_isZero;
  assign expOut = T139 | T138;
  assign T138 = isNaNOut ? 9'h1c0 : 9'h0;
  assign T139 = T142 | T140;
  assign T140 = notNaN_isInfOut ? 9'h180 : 9'h0;
  assign notNaN_isInfOut = notNaN_isSpecialInfOut | T141;
  assign T141 = overflow & overflow_roundMagUp;
  assign T142 = T144 | T143;
  assign T143 = pegMaxFiniteMagOut ? 9'h17f : 9'h0;
  assign T144 = T148 | T145;
  assign T145 = pegMinNonzeroMagOut ? 9'h7c : 9'h0;
  assign pegMinNonzeroMagOut = T147 & T146;
  assign T146 = roundMagUp | roundingMode_odd;
  assign T147 = commonCase & common_totalUnderflow;
  assign T148 = T151 & T149;
  assign T149 = ~ T150;
  assign T150 = notNaN_isInfOut ? 9'h40 : 9'h0;
  assign T151 = T154 & T152;
  assign T152 = ~ T153;
  assign T153 = pegMaxFiniteMagOut ? 9'h80 : 9'h0;
  assign T154 = T157 & T155;
  assign T155 = ~ T156;
  assign T156 = pegMinNonzeroMagOut ? 9'h183 : 9'h0;
  assign T157 = common_expOut & T158;
  assign T158 = ~ T159;
  assign T159 = T160 ? 9'h1c0 : 9'h0;
  assign T160 = io_in_isZero | common_totalUnderflow;
  assign common_expOut = T161;
  assign T161 = T56[8:0];
  assign signOut = isNaNOut ? 1'h0 : io_in_sign;
endmodule

module RoundRawFNToRecFN(
    input  io_invalidExc,
    input  io_infiniteExc,
    input  io_in_isNaN,
    input  io_in_isInf,
    input  io_in_isZero,
    input  io_in_sign,
    input [9:0] io_in_sExp,
    input [9:0] io_in_sig,
    input [2:0] io_roundingMode,
    input  io_detectTininess,
    output[15:0] io_out,
    output[4:0] io_exceptionFlags
);

  wire[15:0] roundAnyRawFNToRecFN_io_out;
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
    input [15:0] io_a,
    input [15:0] io_b,
    input [15:0] io_c,
    input [2:0] io_roundingMode,
    input  io_detectTininess,
    output[15:0] io_out,
    output[4:0] io_exceptionFlags
);

  wire[14:0] mulAddResult;
  wire[14:0] T1;
  wire[14:0] T2;
  wire[13:0] T0;
  wire[6:0] mulAddRecFNToRaw_preMul_io_mulAddA;
  wire[6:0] mulAddRecFNToRaw_preMul_io_mulAddB;
  wire[13:0] mulAddRecFNToRaw_preMul_io_mulAddC;
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
  wire[9:0] mulAddRecFNToRaw_preMul_io_toPostMul_sExpSum;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_doSubMags;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_CIsDominant;
  wire[2:0] mulAddRecFNToRaw_preMul_io_toPostMul_CDom_CAlignDist;
  wire[8:0] mulAddRecFNToRaw_preMul_io_toPostMul_highAlignedSigC;
  wire mulAddRecFNToRaw_preMul_io_toPostMul_bit0AlignedSigC;
  wire mulAddRecFNToRaw_postMul_io_invalidExc;
  wire mulAddRecFNToRaw_postMul_io_rawOut_isNaN;
  wire mulAddRecFNToRaw_postMul_io_rawOut_isInf;
  wire mulAddRecFNToRaw_postMul_io_rawOut_isZero;
  wire mulAddRecFNToRaw_postMul_io_rawOut_sign;
  wire[9:0] mulAddRecFNToRaw_postMul_io_rawOut_sExp;
  wire[9:0] mulAddRecFNToRaw_postMul_io_rawOut_sig;
  wire[15:0] roundRawFNToRecFN_io_out;
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

module ValExec_MulAddRecBF16_mul(
    input [14:0] io_a,
    input [14:0] io_b,
    input [2:0] io_roundingMode,
    input  io_detectTininess,
    input [14:0] io_expected_out,
    input [4:0] io_expected_exceptionFlags,
    output[15:0] io_expected_recOut,
    output[15:0] io_actual_out,
    output[4:0] io_actual_exceptionFlags,
    output io_check,
    output io_pass
);

  wire[15:0] T0;
  wire[14:0] T1;
  wire[14:0] T2;
  wire[15:0] T3;
  wire[11:0] T4;
  wire[5:0] T5;
  wire[7:0] T6;
  wire[7:0] T7;
  wire[6:0] T8;
  wire[5:0] T9;
  wire[5:0] T10;
  wire[5:0] T11;
  wire[4:0] T12;
  wire[12:0] T13;
  wire[2:0] T185;
  wire[2:0] T186;
  wire[2:0] T187;
  wire[2:0] T188;
  wire[2:0] T189;
  wire T190;
  wire[5:0] T15;
  wire[1:0] T16;
  wire T17;
  wire[1:0] T18;
  wire T19;
  wire[3:0] T20;
  wire[1:0] T21;
  wire T22;
  wire[1:0] T23;
  wire[3:0] T24;
  wire T25;
  wire[1:0] T26;
  wire T27;
  wire[1:0] T28;
  wire T29;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T30;
  wire[7:0] T31;
  wire T32;
  wire T33;
  wire T34;
  wire[5:0] T35;
  wire[9:0] T36;
  wire[9:0] T37;
  wire[9:0] T38;
  wire[8:0] T39;
  wire[8:0] T40;
  wire[8:0] T195;
  wire[7:0] T41;
  wire[7:0] T196;
  wire[1:0] T42;
  wire[8:0] T43;
  wire[8:0] T197;
  wire[8:0] T44;
  wire[8:0] T198;
  wire[3:0] T45;
  wire[2:0] T46;
  wire[2:0] T199;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire[1:0] T51;
  wire[2:0] T52;
  wire[2:0] T53;
  wire T54;
  wire T55;
  wire T56;
  wire[15:0] T57;
  wire[11:0] T58;
  wire[5:0] T59;
  wire[7:0] T60;
  wire[7:0] T61;
  wire[6:0] T62;
  wire[5:0] T63;
  wire[5:0] T64;
  wire[5:0] T65;
  wire[4:0] T66;
  wire[12:0] T67;
  wire[2:0] T200;
  wire[2:0] T201;
  wire[2:0] T202;
  wire[2:0] T203;
  wire[2:0] T204;
  wire T205;
  wire[5:0] T69;
  wire[1:0] T70;
  wire T71;
  wire[1:0] T72;
  wire T73;
  wire[3:0] T74;
  wire[1:0] T75;
  wire T76;
  wire[1:0] T77;
  wire[3:0] T78;
  wire T79;
  wire[1:0] T80;
  wire T81;
  wire[1:0] T82;
  wire T83;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire T84;
  wire[7:0] T85;
  wire T86;
  wire T87;
  wire T88;
  wire[5:0] T89;
  wire[9:0] T90;
  wire[9:0] T91;
  wire[9:0] T92;
  wire[8:0] T93;
  wire[8:0] T94;
  wire[8:0] T210;
  wire[7:0] T95;
  wire[7:0] T211;
  wire[1:0] T96;
  wire[8:0] T97;
  wire[8:0] T212;
  wire[8:0] T98;
  wire[8:0] T213;
  wire[3:0] T99;
  wire[2:0] T100;
  wire[2:0] T214;
  wire T101;
  wire T102;
  wire T103;
  wire T104;
  wire[1:0] T105;
  wire[2:0] T106;
  wire[2:0] T107;
  wire T108;
  wire T109;
  wire T110;
  wire T111;
  wire T112;
  wire T113;
  wire T114;
  wire T115;
  wire T116;
  wire[3:0] T117;
  wire[3:0] T118;
  wire T119;
  wire[2:0] T120;
  wire T121;
  wire T122;
  wire[5:0] T123;
  wire[5:0] T124;
  wire T125;
  wire T126;
  wire T127;
  wire[2:0] T128;
  wire T129;
  wire[2:0] T130;
  wire[15:0] T131;
  wire[11:0] T132;
  wire[5:0] T133;
  wire[7:0] T134;
  wire[7:0] T135;
  wire[6:0] T136;
  wire[5:0] T137;
  wire[5:0] T138;
  wire[5:0] T139;
  wire[4:0] T140;
  wire[12:0] T141;
  wire[2:0] T215;
  wire[2:0] T216;
  wire[2:0] T217;
  wire[2:0] T218;
  wire[2:0] T219;
  wire T220;
  wire[5:0] T143;
  wire[1:0] T144;
  wire T145;
  wire[1:0] T146;
  wire T147;
  wire[3:0] T148;
  wire[1:0] T149;
  wire T150;
  wire[1:0] T151;
  wire[3:0] T152;
  wire T153;
  wire[1:0] T154;
  wire T155;
  wire[1:0] T156;
  wire T157;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
  wire T158;
  wire[7:0] T159;
  wire T160;
  wire T161;
  wire T162;
  wire[5:0] T163;
  wire[9:0] T164;
  wire[9:0] T165;
  wire[9:0] T166;
  wire[8:0] T167;
  wire[8:0] T168;
  wire[8:0] T225;
  wire[7:0] T169;
  wire[7:0] T226;
  wire[1:0] T170;
  wire[8:0] T171;
  wire[8:0] T227;
  wire[8:0] T172;
  wire[8:0] T228;
  wire[3:0] T173;
  wire[2:0] T174;
  wire[2:0] T229;
  wire T175;
  wire T176;
  wire T177;
  wire T178;
  wire[1:0] T179;
  wire[2:0] T180;
  wire[2:0] T181;
  wire T182;
  wire T183;
  wire T184;
  wire[15:0] mulAddRecFN_io_out;
  wire[4:0] mulAddRecFN_io_exceptionFlags;


  assign T0 = T1 << 1'h1;
  assign T1 = T2 & 15'h4000;
  assign T2 = io_a ^ io_b;
  assign T3 = {T45, T4};
  assign T4 = {T35, T5};
  assign T5 = T6[5:0];
  assign T6 = T7;
  assign T7 = {1'h0, T8};
  assign T8 = {T32, T9};
  assign T9 = T30 ? T11 : T10;
  assign T10 = io_b[5:0];
  assign T11 = T12 << 1'h1;
  assign T12 = T13[4:0];
  assign T13 = T10 << T185;
  assign T185 = T194 ? 1'h0 : T186;
  assign T186 = T193 ? 1'h1 : T187;
  assign T187 = T192 ? 2'h2 : T188;
  assign T188 = T191 ? 2'h3 : T189;
  assign T189 = T190 ? 3'h4 : 3'h5;
  assign T190 = T15[4];
  assign T15 = {T20, T16};
  assign T16 = {T19, T17};
  assign T17 = T18[1];
  assign T18 = T10[5:4];
  assign T19 = T18[0];
  assign T20 = {T26, T21};
  assign T21 = {T25, T22};
  assign T22 = T23[1];
  assign T23 = T24[3:2];
  assign T24 = T10[3:0];
  assign T25 = T23[0];
  assign T26 = {T29, T27};
  assign T27 = T28[1];
  assign T28 = T24[1:0];
  assign T29 = T28[0];
  assign T191 = T15[3];
  assign T192 = T15[2];
  assign T193 = T15[1];
  assign T194 = T15[0];
  assign T30 = T31 == 8'h0;
  assign T31 = io_b[13:6];
  assign T32 = T33 ^ 1'h1;
  assign T33 = T30 & T34;
  assign T34 = T10 == 6'h0;
  assign T35 = T36[5:0];
  assign T36 = T37;
  assign T37 = T38;
  assign T38 = {1'h0, T39};
  assign T39 = T40;
  assign T40 = T43 + T195;
  assign T195 = {1'h0, T41};
  assign T41 = 8'h80 | T196;
  assign T196 = {6'h0, T42};
  assign T42 = T30 ? 2'h2 : 2'h1;
  assign T43 = T30 ? T44 : T197;
  assign T197 = {1'h0, T31};
  assign T44 = T198 ^ 9'h1ff;
  assign T198 = {6'h0, T185};
  assign T45 = {T55, T46};
  assign T46 = T52 | T199;
  assign T199 = {2'h0, T47};
  assign T47 = T48;
  assign T48 = T50 & T49;
  assign T49 = T34 ^ 1'h1;
  assign T50 = T51 == 2'h3;
  assign T51 = T40[8:7];
  assign T52 = T54 ? 3'h0 : T53;
  assign T53 = T36[8:6];
  assign T54 = T33;
  assign T55 = T56;
  assign T56 = io_b[14];
  assign T57 = {T99, T58};
  assign T58 = {T89, T59};
  assign T59 = T60[5:0];
  assign T60 = T61;
  assign T61 = {1'h0, T62};
  assign T62 = {T86, T63};
  assign T63 = T84 ? T65 : T64;
  assign T64 = io_a[5:0];
  assign T65 = T66 << 1'h1;
  assign T66 = T67[4:0];
  assign T67 = T64 << T200;
  assign T200 = T209 ? 1'h0 : T201;
  assign T201 = T208 ? 1'h1 : T202;
  assign T202 = T207 ? 2'h2 : T203;
  assign T203 = T206 ? 2'h3 : T204;
  assign T204 = T205 ? 3'h4 : 3'h5;
  assign T205 = T69[4];
  assign T69 = {T74, T70};
  assign T70 = {T73, T71};
  assign T71 = T72[1];
  assign T72 = T64[5:4];
  assign T73 = T72[0];
  assign T74 = {T80, T75};
  assign T75 = {T79, T76};
  assign T76 = T77[1];
  assign T77 = T78[3:2];
  assign T78 = T64[3:0];
  assign T79 = T77[0];
  assign T80 = {T83, T81};
  assign T81 = T82[1];
  assign T82 = T78[1:0];
  assign T83 = T82[0];
  assign T206 = T69[3];
  assign T207 = T69[2];
  assign T208 = T69[1];
  assign T209 = T69[0];
  assign T84 = T85 == 8'h0;
  assign T85 = io_a[13:6];
  assign T86 = T87 ^ 1'h1;
  assign T87 = T84 & T88;
  assign T88 = T64 == 6'h0;
  assign T89 = T90[5:0];
  assign T90 = T91;
  assign T91 = T92;
  assign T92 = {1'h0, T93};
  assign T93 = T94;
  assign T94 = T97 + T210;
  assign T210 = {1'h0, T95};
  assign T95 = 8'h80 | T211;
  assign T211 = {6'h0, T96};
  assign T96 = T84 ? 2'h2 : 2'h1;
  assign T97 = T84 ? T98 : T212;
  assign T212 = {1'h0, T85};
  assign T98 = T213 ^ 9'h1ff;
  assign T213 = {6'h0, T200};
  assign T99 = {T109, T100};
  assign T100 = T106 | T214;
  assign T214 = {2'h0, T101};
  assign T101 = T102;
  assign T102 = T104 & T103;
  assign T103 = T88 ^ 1'h1;
  assign T104 = T105 == 2'h3;
  assign T105 = T94[8:7];
  assign T106 = T108 ? 3'h0 : T107;
  assign T107 = T90[8:6];
  assign T108 = T87;
  assign T109 = T110;
  assign T110 = io_a[14];
  assign io_pass = T111;
  assign T111 = T113 & T112;
  assign T112 = io_actual_exceptionFlags == io_expected_exceptionFlags;
  assign T113 = T126 ? T121 : T114;
  assign T114 = T119 ? T116 : T115;
  assign T115 = io_actual_out == io_expected_recOut;
  assign T116 = T118 == T117;
  assign T117 = io_expected_recOut[15:12];
  assign T118 = io_actual_out[15:12];
  assign T119 = T120 == 3'h6;
  assign T120 = T118[2:0];
  assign T121 = T125 & T122;
  assign T122 = T124 == T123;
  assign T123 = io_expected_recOut[5:0];
  assign T124 = io_actual_out[5:0];
  assign T125 = T118 == T117;
  assign T126 = T129 | T127;
  assign T127 = T128 == 3'h7;
  assign T128 = T118[2:0];
  assign T129 = T130 == 3'h0;
  assign T130 = T118[2:0];
  assign io_check = 1'h1;
  assign io_actual_exceptionFlags = mulAddRecFN_io_exceptionFlags;
  assign io_actual_out = mulAddRecFN_io_out;
  assign io_expected_recOut = T131;
  assign T131 = {T173, T132};
  assign T132 = {T163, T133};
  assign T133 = T134[5:0];
  assign T134 = T135;
  assign T135 = {1'h0, T136};
  assign T136 = {T160, T137};
  assign T137 = T158 ? T139 : T138;
  assign T138 = io_expected_out[5:0];
  assign T139 = T140 << 1'h1;
  assign T140 = T141[4:0];
  assign T141 = T138 << T215;
  assign T215 = T224 ? 1'h0 : T216;
  assign T216 = T223 ? 1'h1 : T217;
  assign T217 = T222 ? 2'h2 : T218;
  assign T218 = T221 ? 2'h3 : T219;
  assign T219 = T220 ? 3'h4 : 3'h5;
  assign T220 = T143[4];
  assign T143 = {T148, T144};
  assign T144 = {T147, T145};
  assign T145 = T146[1];
  assign T146 = T138[5:4];
  assign T147 = T146[0];
  assign T148 = {T154, T149};
  assign T149 = {T153, T150};
  assign T150 = T151[1];
  assign T151 = T152[3:2];
  assign T152 = T138[3:0];
  assign T153 = T151[0];
  assign T154 = {T157, T155};
  assign T155 = T156[1];
  assign T156 = T152[1:0];
  assign T157 = T156[0];
  assign T221 = T143[3];
  assign T222 = T143[2];
  assign T223 = T143[1];
  assign T224 = T143[0];
  assign T158 = T159 == 8'h0;
  assign T159 = io_expected_out[13:6];
  assign T160 = T161 ^ 1'h1;
  assign T161 = T158 & T162;
  assign T162 = T138 == 6'h0;
  assign T163 = T164[5:0];
  assign T164 = T165;
  assign T165 = T166;
  assign T166 = {1'h0, T167};
  assign T167 = T168;
  assign T168 = T171 + T225;
  assign T225 = {1'h0, T169};
  assign T169 = 8'h80 | T226;
  assign T226 = {6'h0, T170};
  assign T170 = T158 ? 2'h2 : 2'h1;
  assign T171 = T158 ? T172 : T227;
  assign T227 = {1'h0, T159};
  assign T172 = T228 ^ 9'h1ff;
  assign T228 = {6'h0, T215};
  assign T173 = {T183, T174};
  assign T174 = T180 | T229;
  assign T229 = {2'h0, T175};
  assign T175 = T176;
  assign T176 = T178 & T177;
  assign T177 = T162 ^ 1'h1;
  assign T178 = T179 == 2'h3;
  assign T179 = T168[8:7];
  assign T180 = T182 ? 3'h0 : T181;
  assign T181 = T164[8:6];
  assign T182 = T161;
  assign T183 = T184;
  assign T184 = io_expected_out[14];
  MulAddRecFN mulAddRecFN(
       .io_op( 2'h0 ),
       .io_a( T57 ),
       .io_b( T3 ),
       .io_c( T0 ),
       .io_roundingMode( io_roundingMode ),
       .io_detectTininess( io_detectTininess ),
       .io_out( mulAddRecFN_io_out ),
       .io_exceptionFlags( mulAddRecFN_io_exceptionFlags )
  );
endmodule

