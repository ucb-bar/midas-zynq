module DaisyDatapath_3(input clk,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_13,
    input [31:0] io_dataIo_data_12,
    input [31:0] io_dataIo_data_11,
    input [31:0] io_dataIo_data_10,
    input [31:0] io_dataIo_data_9,
    input [31:0] io_dataIo_data_8,
    input [31:0] io_dataIo_data_7,
    input [31:0] io_dataIo_data_6,
    input [31:0] io_dataIo_data_5,
    input [31:0] io_dataIo_data_4,
    input [31:0] io_dataIo_data_3,
    input [31:0] io_dataIo_data_2,
    input [31:0] io_dataIo_data_1,
    input [31:0] io_dataIo_data_0,
    input  io_ctrlIo_copyCond,
    input  io_ctrlIo_readCond,
    input  io_ctrlIo_cntrNotZero,
    output io_ctrlIo_outFire,
    output io_ctrlIo_inValid
);

  wire T0;
  reg [31:0] regs_13;
  wire[31:0] T1;
  wire[31:0] T2;
  reg [31:0] regs_12;
  wire[31:0] T3;
  wire[31:0] T4;
  reg [31:0] regs_11;
  wire[31:0] T5;
  wire[31:0] T6;
  reg [31:0] regs_10;
  wire[31:0] T7;
  wire[31:0] T8;
  reg [31:0] regs_9;
  wire[31:0] T9;
  wire[31:0] T10;
  reg [31:0] regs_8;
  wire[31:0] T11;
  wire[31:0] T12;
  reg [31:0] regs_7;
  wire[31:0] T13;
  wire[31:0] T14;
  reg [31:0] regs_6;
  wire[31:0] T15;
  wire[31:0] T16;
  reg [31:0] regs_5;
  wire[31:0] T17;
  wire[31:0] T18;
  reg [31:0] regs_4;
  wire[31:0] T19;
  wire[31:0] T20;
  reg [31:0] regs_3;
  wire[31:0] T21;
  wire[31:0] T22;
  reg [31:0] regs_2;
  wire[31:0] T23;
  wire[31:0] T24;
  reg [31:0] regs_1;
  wire[31:0] T25;
  wire[31:0] T26;
  reg [31:0] regs_0;
  wire[31:0] T27;
  wire[31:0] T28;
  wire readCondAndOutFire;
  wire T29;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regs_13 = {1{$random}};
    regs_12 = {1{$random}};
    regs_11 = {1{$random}};
    regs_10 = {1{$random}};
    regs_9 = {1{$random}};
    regs_8 = {1{$random}};
    regs_7 = {1{$random}};
    regs_6 = {1{$random}};
    regs_5 = {1{$random}};
    regs_4 = {1{$random}};
    regs_3 = {1{$random}};
    regs_2 = {1{$random}};
    regs_1 = {1{$random}};
    regs_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_inValid = io_dataIo_in_valid;
  assign io_ctrlIo_outFire = T0;
  assign T0 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_bits = regs_13;
  assign T1 = readCondAndOutFire ? regs_12 : T2;
  assign T2 = io_ctrlIo_copyCond ? io_dataIo_data_13 : regs_13;
  assign T3 = readCondAndOutFire ? regs_11 : T4;
  assign T4 = io_ctrlIo_copyCond ? io_dataIo_data_12 : regs_12;
  assign T5 = readCondAndOutFire ? regs_10 : T6;
  assign T6 = io_ctrlIo_copyCond ? io_dataIo_data_11 : regs_11;
  assign T7 = readCondAndOutFire ? regs_9 : T8;
  assign T8 = io_ctrlIo_copyCond ? io_dataIo_data_10 : regs_10;
  assign T9 = readCondAndOutFire ? regs_8 : T10;
  assign T10 = io_ctrlIo_copyCond ? io_dataIo_data_9 : regs_9;
  assign T11 = readCondAndOutFire ? regs_7 : T12;
  assign T12 = io_ctrlIo_copyCond ? io_dataIo_data_8 : regs_8;
  assign T13 = readCondAndOutFire ? regs_6 : T14;
  assign T14 = io_ctrlIo_copyCond ? io_dataIo_data_7 : regs_7;
  assign T15 = readCondAndOutFire ? regs_5 : T16;
  assign T16 = io_ctrlIo_copyCond ? io_dataIo_data_6 : regs_6;
  assign T17 = readCondAndOutFire ? regs_4 : T18;
  assign T18 = io_ctrlIo_copyCond ? io_dataIo_data_5 : regs_5;
  assign T19 = readCondAndOutFire ? regs_3 : T20;
  assign T20 = io_ctrlIo_copyCond ? io_dataIo_data_4 : regs_4;
  assign T21 = readCondAndOutFire ? regs_2 : T22;
  assign T22 = io_ctrlIo_copyCond ? io_dataIo_data_3 : regs_3;
  assign T23 = readCondAndOutFire ? regs_1 : T24;
  assign T24 = io_ctrlIo_copyCond ? io_dataIo_data_2 : regs_2;
  assign T25 = readCondAndOutFire ? regs_0 : T26;
  assign T26 = io_ctrlIo_copyCond ? io_dataIo_data_1 : regs_1;
  assign T27 = readCondAndOutFire ? io_dataIo_in_bits : T28;
  assign T28 = io_ctrlIo_copyCond ? io_dataIo_data_0 : regs_0;
  assign readCondAndOutFire = io_ctrlIo_readCond & T29;
  assign T29 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_valid = io_ctrlIo_cntrNotZero;
  assign io_dataIo_in_ready = io_dataIo_out_ready;

  always @(posedge clk) begin
    if(readCondAndOutFire) begin
      regs_13 <= regs_12;
    end else if(io_ctrlIo_copyCond) begin
      regs_13 <= io_dataIo_data_13;
    end
    if(readCondAndOutFire) begin
      regs_12 <= regs_11;
    end else if(io_ctrlIo_copyCond) begin
      regs_12 <= io_dataIo_data_12;
    end
    if(readCondAndOutFire) begin
      regs_11 <= regs_10;
    end else if(io_ctrlIo_copyCond) begin
      regs_11 <= io_dataIo_data_11;
    end
    if(readCondAndOutFire) begin
      regs_10 <= regs_9;
    end else if(io_ctrlIo_copyCond) begin
      regs_10 <= io_dataIo_data_10;
    end
    if(readCondAndOutFire) begin
      regs_9 <= regs_8;
    end else if(io_ctrlIo_copyCond) begin
      regs_9 <= io_dataIo_data_9;
    end
    if(readCondAndOutFire) begin
      regs_8 <= regs_7;
    end else if(io_ctrlIo_copyCond) begin
      regs_8 <= io_dataIo_data_8;
    end
    if(readCondAndOutFire) begin
      regs_7 <= regs_6;
    end else if(io_ctrlIo_copyCond) begin
      regs_7 <= io_dataIo_data_7;
    end
    if(readCondAndOutFire) begin
      regs_6 <= regs_5;
    end else if(io_ctrlIo_copyCond) begin
      regs_6 <= io_dataIo_data_6;
    end
    if(readCondAndOutFire) begin
      regs_5 <= regs_4;
    end else if(io_ctrlIo_copyCond) begin
      regs_5 <= io_dataIo_data_5;
    end
    if(readCondAndOutFire) begin
      regs_4 <= regs_3;
    end else if(io_ctrlIo_copyCond) begin
      regs_4 <= io_dataIo_data_4;
    end
    if(readCondAndOutFire) begin
      regs_3 <= regs_2;
    end else if(io_ctrlIo_copyCond) begin
      regs_3 <= io_dataIo_data_3;
    end
    if(readCondAndOutFire) begin
      regs_2 <= regs_1;
    end else if(io_ctrlIo_copyCond) begin
      regs_2 <= io_dataIo_data_2;
    end
    if(readCondAndOutFire) begin
      regs_1 <= regs_0;
    end else if(io_ctrlIo_copyCond) begin
      regs_1 <= io_dataIo_data_1;
    end
    if(readCondAndOutFire) begin
      regs_0 <= io_dataIo_in_bits;
    end else if(io_ctrlIo_copyCond) begin
      regs_0 <= io_dataIo_data_0;
    end
  end
endmodule

module RegChainControl_3(input clk, input reset,
    input  io_stall,
    output io_ctrlIo_copyCond,
    output io_ctrlIo_readCond,
    output io_ctrlIo_cntrNotZero,
    input  io_ctrlIo_outFire,
    input  io_ctrlIo_inValid
);

  wire T0;
  reg [3:0] counter;
  wire[3:0] T1;
  wire[3:0] T2;
  wire[3:0] T3;
  wire[3:0] T4;
  wire T5;
  wire T6;
  wire T7;
  wire[3:0] T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  reg  copied;
  wire T18;
  reg  R19;
  wire T20;
  wire T21;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    counter = {1{$random}};
    copied = {1{$random}};
    R19 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_cntrNotZero = T0;
  assign T0 = counter != 4'h0;
  assign T1 = reset ? 4'h0 : T2;
  assign T2 = T9 ? T8 : T3;
  assign T3 = T6 ? 4'he : T4;
  assign T4 = T5 ? 4'h0 : counter;
  assign T5 = io_stall ^ 1'h1;
  assign T6 = T7 & io_ctrlIo_copyCond;
  assign T7 = T5 ^ 1'h1;
  assign T8 = counter - 4'h1;
  assign T9 = T13 & T10;
  assign T10 = T12 & T11;
  assign T11 = io_ctrlIo_inValid ^ 1'h1;
  assign T12 = io_ctrlIo_readCond & io_ctrlIo_outFire;
  assign T13 = T14 ^ 1'h1;
  assign T14 = T5 | io_ctrlIo_copyCond;
  assign io_ctrlIo_readCond = T15;
  assign T15 = T17 & T16;
  assign T16 = counter != 4'h0;
  assign T17 = io_stall & copied;
  assign io_ctrlIo_copyCond = T18;
  assign T18 = T20 | R19;
  assign T20 = io_stall & T21;
  assign T21 = copied ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      counter <= 4'h0;
    end else if(T9) begin
      counter <= T8;
    end else if(T6) begin
      counter <= 4'he;
    end else if(T5) begin
      counter <= 4'h0;
    end
    copied <= io_stall;
    R19 <= reset;
  end
endmodule

module RegChain_3(input clk, input reset,
    input  io_stall,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_13,
    input [31:0] io_dataIo_data_12,
    input [31:0] io_dataIo_data_11,
    input [31:0] io_dataIo_data_10,
    input [31:0] io_dataIo_data_9,
    input [31:0] io_dataIo_data_8,
    input [31:0] io_dataIo_data_7,
    input [31:0] io_dataIo_data_6,
    input [31:0] io_dataIo_data_5,
    input [31:0] io_dataIo_data_4,
    input [31:0] io_dataIo_data_3,
    input [31:0] io_dataIo_data_2,
    input [31:0] io_dataIo_data_1,
    input [31:0] io_dataIo_data_0
);

  wire datapath_io_dataIo_in_ready;
  wire datapath_io_dataIo_out_valid;
  wire[31:0] datapath_io_dataIo_out_bits;
  wire datapath_io_ctrlIo_outFire;
  wire datapath_io_ctrlIo_inValid;
  wire control_io_ctrlIo_copyCond;
  wire control_io_ctrlIo_readCond;
  wire control_io_ctrlIo_cntrNotZero;


  assign io_dataIo_out_bits = datapath_io_dataIo_out_bits;
  assign io_dataIo_out_valid = datapath_io_dataIo_out_valid;
  assign io_dataIo_in_ready = datapath_io_dataIo_in_ready;
  DaisyDatapath_3 datapath(.clk(clk),
       .io_dataIo_in_ready( datapath_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_dataIo_in_valid ),
       .io_dataIo_in_bits( io_dataIo_in_bits ),
       .io_dataIo_out_ready( io_dataIo_out_ready ),
       .io_dataIo_out_valid( datapath_io_dataIo_out_valid ),
       .io_dataIo_out_bits( datapath_io_dataIo_out_bits ),
       .io_dataIo_data_13( io_dataIo_data_13 ),
       .io_dataIo_data_12( io_dataIo_data_12 ),
       .io_dataIo_data_11( io_dataIo_data_11 ),
       .io_dataIo_data_10( io_dataIo_data_10 ),
       .io_dataIo_data_9( io_dataIo_data_9 ),
       .io_dataIo_data_8( io_dataIo_data_8 ),
       .io_dataIo_data_7( io_dataIo_data_7 ),
       .io_dataIo_data_6( io_dataIo_data_6 ),
       .io_dataIo_data_5( io_dataIo_data_5 ),
       .io_dataIo_data_4( io_dataIo_data_4 ),
       .io_dataIo_data_3( io_dataIo_data_3 ),
       .io_dataIo_data_2( io_dataIo_data_2 ),
       .io_dataIo_data_1( io_dataIo_data_1 ),
       .io_dataIo_data_0( io_dataIo_data_0 ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
  RegChainControl_3 control(.clk(clk), .reset(reset),
       .io_stall( io_stall ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
endmodule

module CSR(input clk, input host__reset,
    input  io_stall,
    input [2:0] io_cmd,
    input [31:0] io_in,
    output[31:0] io_out,
    input [31:0] io_pc,
    input [31:0] io_addr,
    input [31:0] io_inst,
    input  io_illegal,
    input [1:0] io_st_type,
    input [2:0] io_ld_type,
    input  io_pc_check,
    output io_expt,
    output[31:0] io_evec,
    output[31:0] io_epc,
    input  io_host_fromhost_valid,
    input [31:0] io_host_fromhost_bits,
    output[31:0] io_host_tohost,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  wire[31:0] T363;
  wire[22:0] T364;
  reg  IE;
  wire T365;
  wire T366;
  wire T367;
  wire T204;
  wire T205;
  wire T206;
  wire T48;
  wire T44;
  reg  IE1;
  wire T368;
  wire T369;
  wire T370;
  wire T207;
  wire T208;
  wire T209;
  wire T210;
  wire[31:0] wdata;
  wire[31:0] T1;
  wire[31:0] T2;
  wire[31:0] T3;
  wire[31:0] T4;
  wire T5;
  wire[31:0] T6;
  wire T7;
  wire T8;
  wire T62;
  wire T63;
  wire isEret;
  wire T40;
  wire[11:0] csr_addr;
  wire T41;
  wire T42;
  wire T43;
  wire privInst;
  wire T64;
  wire T211;
  wire T66;
  wire T31;
  wire T32;
  wire T33;
  wire wen;
  wire T34;
  wire T35;
  wire[4:0] rs1_addr;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire[8:0] T371;
  wire[7:0] T372;
  reg [31:0] mfromhost;
  wire[31:0] T373;
  wire[31:0] T214;
  wire[31:0] T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T11;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire[31:0] T374;
  wire[24:0] T375;
  wire[23:0] T376;
  reg  MSIP;
  wire T377;
  wire T378;
  wire T379;
  wire T225;
  wire T226;
  wire T227;
  wire T228;
  wire T229;
  wire[6:0] T380;
  reg  MTIP;
  wire T381;
  wire T382;
  wire T383;
  wire T232;
  wire T233;
  wire[5:0] T384;
  reg [31:0] mbadaddr;
  wire[31:0] T385;
  wire[31:0] T235;
  wire[31:0] T236;
  wire T237;
  wire T238;
  wire saddrInvalid;
  wire T153;
  wire T154;
  wire T155;
  wire T156;
  wire[1:0] T157;
  wire T158;
  wire T239;
  wire laddrInvalid;
  wire T160;
  wire T161;
  wire T162;
  wire T163;
  wire T164;
  wire T165;
  wire T166;
  wire[1:0] T167;
  wire T168;
  wire iaddrInvalid;
  wire T170;
  wire T240;
  wire T241;
  wire T242;
  wire[31:0] T386;
  wire[25:0] T387;
  wire[5:0] T388;
  reg [31:0] mcause;
  wire[31:0] T389;
  wire[31:0] T244;
  wire[31:0] T245;
  wire[31:0] T390;
  wire[3:0] T246;
  wire[3:0] T247;
  wire[3:0] T248;
  wire[3:0] T249;
  wire[3:0] T391;
  wire[1:0] T250;
  wire isEbreak;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire[3:0] T251;
  wire[3:0] T392;
  reg [1:0] PRV;
  wire[1:0] T393;
  wire[1:0] T394;
  wire[1:0] T395;
  wire[1:0] T55;
  wire[1:0] T56;
  wire[1:0] T57;
  reg [1:0] PRV1;
  wire[1:0] T396;
  wire[1:0] T397;
  wire[1:0] T398;
  wire[1:0] T58;
  wire[1:0] T59;
  wire[1:0] T60;
  wire[1:0] T61;
  wire[1:0] T65;
  wire isEcall;
  wire T73;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire[31:0] T252;
  wire T253;
  wire T254;
  wire T255;
  wire[31:0] T399;
  wire[25:0] T400;
  wire[5:0] T401;
  reg [31:0] mscratch;
  wire[31:0] T402;
  wire T403;
  wire T259;
  wire T260;
  wire T261;
  wire[31:0] T404;
  wire[26:0] T405;
  wire[25:0] T406;
  reg  MSIE;
  wire T407;
  wire T408;
  wire T409;
  wire T272;
  wire T273;
  wire T274;
  wire T275;
  wire T276;
  wire[4:0] T410;
  reg  MTIE;
  wire T411;
  wire T412;
  wire T413;
  wire T279;
  wire T280;
  wire[3:0] T414;
  reg [31:0] mtimecmp;
  wire[31:0] T415;
  wire T416;
  wire T266;
  wire T267;
  wire T268;
  wire[31:0] T417;
  wire[27:0] T418;
  wire[3:0] T419;
  reg [31:0] instreth;
  wire[31:0] T420;
  wire[31:0] T421;
  wire[31:0] T422;
  wire[31:0] T293;
  wire[31:0] T294;
  wire[31:0] T295;
  wire T296;
  wire T297;
  reg [31:0] instret;
  wire[31:0] T423;
  wire[31:0] T424;
  wire[31:0] T425;
  wire[31:0] T340;
  wire[31:0] T341;
  wire[31:0] T342;
  wire T343;
  wire T344;
  wire T313;
  wire T345;
  wire T314;
  wire T315;
  wire T316;
  wire T317;
  wire T318;
  wire isInstRet;
  wire T298;
  wire T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire T305;
  wire T306;
  wire T307;
  wire T308;
  wire T309;
  wire T310;
  wire T311;
  wire T312;
  wire[31:0] T426;
  wire[27:0] T427;
  wire[3:0] T428;
  reg [31:0] timeh;
  wire[31:0] T429;
  wire[31:0] T430;
  wire[31:0] T431;
  wire[31:0] T320;
  wire[31:0] T321;
  wire[31:0] T322;
  wire[31:0] T323;
  wire T324;
  reg [31:0] time_;
  wire[31:0] T432;
  wire[31:0] T433;
  wire[31:0] T434;
  wire[31:0] T347;
  wire[31:0] T348;
  wire[31:0] T349;
  wire T350;
  wire T351;
  wire T352;
  wire T353;
  wire T354;
  wire T355;
  wire T325;
  wire T326;
  wire T327;
  wire T328;
  wire T329;
  wire T330;
  wire[31:0] T435;
  wire[27:0] T436;
  wire[3:0] T437;
  reg [31:0] cycleh;
  wire[31:0] T438;
  wire[31:0] T439;
  wire[31:0] T440;
  wire[31:0] T332;
  wire[31:0] T333;
  wire[31:0] T334;
  wire T335;
  reg [31:0] cycle;
  wire[31:0] T441;
  wire[31:0] T442;
  wire[31:0] T443;
  wire[31:0] T357;
  wire[31:0] T358;
  wire T359;
  wire T360;
  wire T361;
  wire T336;
  wire T337;
  wire T338;
  wire[31:0] T444;
  wire[29:0] T445;
  wire[27:0] T446;
  wire[1:0] T447;
  wire[31:0] T448;
  wire[29:0] T449;
  wire[1:0] T450;
  wire[31:0] T451;
  wire[29:0] T452;
  wire[1:0] T453;
  wire[31:0] T454;
  wire[29:0] T455;
  reg [31:0] mtohost;
  wire[31:0] T456;
  wire[31:0] T457;
  wire[31:0] T458;
  wire[31:0] T0;
  wire T9;
  wire T10;
  wire T12;
  reg [31:0] mepc;
  wire[31:0] T459;
  wire[31:0] T45;
  wire[31:0] T46;
  wire[31:0] T47;
  wire[31:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire T460;
  wire[31:0] T461;
  wire[8:0] T53;
  wire[8:0] T462;
  wire[7:0] T54;
  wire T67;
  wire T72;
  wire T78;
  wire T79;
  wire T80;
  wire privValid;
  wire[1:0] T81;
  wire T82;
  wire T83;
  wire csrRO;
  wire T84;
  wire T85;
  wire T86;
  wire T87;
  wire[1:0] T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire csrValid;
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
  wire T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire T132;
  wire T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  wire T138;
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
  wire[1:0] T151;
  wire T152;
  wire T159;
  wire T169;
  wire[31:0] T463;
  wire[32:0] T171;
  wire[32:0] T172;
  wire[31:0] csr;
  wire[31:0] T173;
  wire[31:0] T174;
  wire[31:0] T175;
  wire[31:0] T176;
  wire[31:0] T177;
  wire[31:0] T178;
  wire[31:0] T179;
  wire[31:0] T180;
  wire[31:0] T181;
  wire[31:0] T182;
  wire[31:0] T183;
  wire[31:0] T184;
  wire[31:0] T185;
  wire[31:0] T186;
  wire[31:0] T187;
  wire[31:0] T188;
  wire[31:0] T189;
  wire[31:0] T190;
  wire[31:0] T191;
  wire[31:0] T192;
  wire[31:0] T193;
  wire[31:0] T194;
  wire[31:0] T195;
  wire[31:0] T196;
  wire[31:0] T197;
  wire[31:0] T198;
  wire[31:0] T199;
  wire[31:0] T200;
  wire[31:0] mstatus;
  wire[9:0] T201;
  wire[5:0] T202;
  wire[2:0] T203;
  wire[2:0] T212;
  wire T213;
  wire T221;
  wire T222;
  wire[31:0] mip;
  wire[4:0] T223;
  wire[1:0] T224;
  wire[26:0] T230;
  wire[24:0] T231;
  wire T234;
  wire T243;
  wire T256;
  wire T257;
  wire T262;
  wire T263;
  wire T264;
  wire T269;
  wire[31:0] mie;
  wire[4:0] T270;
  wire[1:0] T271;
  wire[26:0] T277;
  wire[24:0] T278;
  wire T281;
  wire T282;
  wire T283;
  wire T284;
  wire T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire T292;
  wire T319;
  wire T331;
  wire T339;
  wire T346;
  wire T356;
  wire T362;
  wire RegChain_io_dataIo_in_ready;
  wire RegChain_io_dataIo_out_valid;
  wire[31:0] RegChain_io_dataIo_out_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    IE = {1{$random}};
    IE1 = {1{$random}};
    mfromhost = {1{$random}};
    MSIP = {1{$random}};
    MTIP = {1{$random}};
    mbadaddr = {1{$random}};
    mcause = {1{$random}};
    PRV = {1{$random}};
    PRV1 = {1{$random}};
    mscratch = {1{$random}};
    MSIE = {1{$random}};
    MTIE = {1{$random}};
    mtimecmp = {1{$random}};
    instreth = {1{$random}};
    instret = {1{$random}};
    timeh = {1{$random}};
    time_ = {1{$random}};
    cycleh = {1{$random}};
    cycle = {1{$random}};
    mtohost = {1{$random}};
    mepc = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign T363 = {T371, T364};
  assign T364 = {IE, 22'h0};
  assign T365 = host__reset ? 1'h0 : T366;
  assign T366 = fire_pin ? T367 : IE;
  assign T367 = host__reset ? 1'h0 : T204;
  assign T204 = T66 ? T211 : T205;
  assign T205 = T62 ? IE1 : T206;
  assign T206 = T48 ? 1'h0 : IE;
  assign T48 = T44 & io_expt;
  assign T44 = io_stall ^ 1'h1;
  assign T368 = host__reset ? 1'h0 : T369;
  assign T369 = fire_pin ? T370 : IE1;
  assign T370 = host__reset ? 1'h0 : T207;
  assign T207 = T66 ? T210 : T208;
  assign T208 = T62 ? 1'h1 : T209;
  assign T209 = T48 ? IE : IE1;
  assign T210 = wdata[2'h3];
  assign wdata = T8 ? io_in : T1;
  assign T1 = T7 ? T6 : T2;
  assign T2 = T5 ? T3 : 32'h0;
  assign T3 = io_out & T4;
  assign T4 = ~ io_in;
  assign T5 = io_cmd == 3'h3;
  assign T6 = io_out | io_in;
  assign T7 = io_cmd == 3'h2;
  assign T8 = io_cmd == 3'h1;
  assign T62 = T44 & T63;
  assign T63 = T64 & isEret;
  assign isEret = T41 & T40;
  assign T40 = csr_addr[4'h8];
  assign csr_addr = io_inst[5'h1f:5'h14];
  assign T41 = privInst & T42;
  assign T42 = T43 ^ 1'h1;
  assign T43 = csr_addr[1'h0];
  assign privInst = io_cmd == 3'h4;
  assign T64 = io_expt ^ 1'h1;
  assign T211 = wdata[1'h0];
  assign T66 = T32 & T31;
  assign T31 = csr_addr == 12'h300;
  assign T32 = T44 & T33;
  assign T33 = T38 & wen;
  assign wen = T37 | T34;
  assign T34 = T36 & T35;
  assign T35 = rs1_addr != 5'h0;
  assign rs1_addr = io_inst[5'h13:4'hf];
  assign T36 = io_cmd[1'h1];
  assign T37 = io_cmd == 3'h1;
  assign T38 = T39 ^ 1'h1;
  assign T39 = io_expt | isEret;
  assign T371 = {T372, IE1};
  assign T372 = mfromhost[3'h7:1'h0];
  assign T373 = fire_pin ? T214 : mfromhost;
  assign T214 = T216 ? wdata : T215;
  assign T215 = io_host_fromhost_valid ? io_host_fromhost_bits : mfromhost;
  assign T216 = T32 & T217;
  assign T217 = T219 & T218;
  assign T218 = csr_addr == 12'h781;
  assign T219 = T220 ^ 1'h1;
  assign T220 = T13 | T11;
  assign T11 = csr_addr == 12'h780;
  assign T13 = T15 | T14;
  assign T14 = csr_addr == 12'h343;
  assign T15 = T17 | T16;
  assign T16 = csr_addr == 12'h342;
  assign T17 = T19 | T18;
  assign T18 = csr_addr == 12'h341;
  assign T19 = T21 | T20;
  assign T20 = csr_addr == 12'h340;
  assign T21 = T23 | T22;
  assign T22 = csr_addr == 12'h321;
  assign T23 = T25 | T24;
  assign T24 = csr_addr == 12'h741;
  assign T25 = T27 | T26;
  assign T26 = csr_addr == 12'h701;
  assign T27 = T29 | T28;
  assign T28 = csr_addr == 12'h304;
  assign T29 = T31 | T30;
  assign T30 = csr_addr == 12'h344;
  assign T374 = {T380, T375};
  assign T375 = {MSIP, T376};
  assign T376 = mfromhost[5'h1f:4'h8];
  assign T377 = host__reset ? 1'h0 : T378;
  assign T378 = fire_pin ? T379 : MSIP;
  assign T379 = host__reset ? 1'h0 : T225;
  assign T225 = T227 ? T226 : MSIP;
  assign T226 = wdata[2'h3];
  assign T227 = T32 & T228;
  assign T228 = T229 & T30;
  assign T229 = T31 ^ 1'h1;
  assign T380 = {T384, MTIP};
  assign T381 = host__reset ? 1'h0 : T382;
  assign T382 = fire_pin ? T383 : MTIP;
  assign T383 = host__reset ? 1'h0 : T232;
  assign T232 = T227 ? T233 : MTIP;
  assign T233 = wdata[3'h7];
  assign T384 = mbadaddr[3'h5:1'h0];
  assign T385 = fire_pin ? T235 : mbadaddr;
  assign T235 = T240 ? wdata : T236;
  assign T236 = T237 ? io_addr : mbadaddr;
  assign T237 = T48 & T238;
  assign T238 = T239 | saddrInvalid;
  assign saddrInvalid = T158 ? T156 : T153;
  assign T153 = T155 ? T154 : 1'h0;
  assign T154 = io_addr[1'h0];
  assign T155 = io_st_type == 2'h2;
  assign T156 = T157 != 2'h0;
  assign T157 = io_addr[1'h1:1'h0];
  assign T158 = io_st_type == 2'h1;
  assign T239 = iaddrInvalid | laddrInvalid;
  assign laddrInvalid = T168 ? T166 : T160;
  assign T160 = T165 ? T164 : T161;
  assign T161 = T163 ? T162 : 1'h0;
  assign T162 = io_addr[1'h0];
  assign T163 = io_ld_type == 3'h4;
  assign T164 = io_addr[1'h0];
  assign T165 = io_ld_type == 3'h2;
  assign T166 = T167 != 2'h0;
  assign T167 = io_addr[1'h1:1'h0];
  assign T168 = io_ld_type == 3'h1;
  assign iaddrInvalid = io_pc_check & T170;
  assign T170 = io_addr[1'h1];
  assign T240 = T32 & T241;
  assign T241 = T242 & T14;
  assign T242 = T15 ^ 1'h1;
  assign T386 = {T388, T387};
  assign T387 = mbadaddr[5'h1f:3'h6];
  assign T388 = mcause[3'h5:1'h0];
  assign T389 = fire_pin ? T244 : mcause;
  assign T244 = T253 ? T252 : T245;
  assign T245 = T48 ? T390 : mcause;
  assign T390 = {28'h0, T246};
  assign T246 = iaddrInvalid ? 4'h0 : T247;
  assign T247 = laddrInvalid ? 4'h4 : T248;
  assign T248 = saddrInvalid ? 4'h6 : T249;
  assign T249 = isEcall ? T251 : T391;
  assign T391 = {2'h0, T250};
  assign T250 = isEbreak ? 2'h3 : 2'h2;
  assign isEbreak = T70 & T68;
  assign T68 = T69 ^ 1'h1;
  assign T69 = csr_addr[4'h8];
  assign T70 = privInst & T71;
  assign T71 = csr_addr[1'h0];
  assign T251 = 4'h8 + T392;
  assign T392 = {2'h0, PRV};
  assign T393 = host__reset ? 2'h3 : T394;
  assign T394 = fire_pin ? T395 : PRV;
  assign T395 = host__reset ? 2'h3 : T55;
  assign T55 = T66 ? T65 : T56;
  assign T56 = T62 ? PRV1 : T57;
  assign T57 = T48 ? 2'h3 : PRV;
  assign T396 = host__reset ? 2'h3 : T397;
  assign T397 = fire_pin ? T398 : PRV1;
  assign T398 = host__reset ? 2'h3 : T58;
  assign T58 = T66 ? T61 : T59;
  assign T59 = T62 ? 2'h0 : T60;
  assign T60 = T48 ? PRV : PRV1;
  assign T61 = wdata[3'h5:3'h4];
  assign T65 = wdata[2'h2:1'h1];
  assign isEcall = T75 & T73;
  assign T73 = T74 ^ 1'h1;
  assign T74 = csr_addr[4'h8];
  assign T75 = privInst & T76;
  assign T76 = T77 ^ 1'h1;
  assign T77 = csr_addr[1'h0];
  assign T252 = wdata & 32'h8000000f;
  assign T253 = T32 & T254;
  assign T254 = T255 & T16;
  assign T255 = T17 ^ 1'h1;
  assign T399 = {T401, T400};
  assign T400 = mcause[5'h1f:3'h6];
  assign T401 = mscratch[3'h5:1'h0];
  assign T402 = T403 ? wdata : mscratch;
  assign T403 = T259 & fire_pin;
  assign T259 = T32 & T260;
  assign T260 = T261 & T20;
  assign T261 = T21 ^ 1'h1;
  assign T404 = {T410, T405};
  assign T405 = {MSIE, T406};
  assign T406 = mscratch[5'h1f:3'h6];
  assign T407 = host__reset ? 1'h0 : T408;
  assign T408 = fire_pin ? T409 : MSIE;
  assign T409 = host__reset ? 1'h0 : T272;
  assign T272 = T274 ? T273 : MSIE;
  assign T273 = wdata[2'h3];
  assign T274 = T32 & T275;
  assign T275 = T276 & T28;
  assign T276 = T29 ^ 1'h1;
  assign T410 = {T414, MTIE};
  assign T411 = host__reset ? 1'h0 : T412;
  assign T412 = fire_pin ? T413 : MTIE;
  assign T413 = host__reset ? 1'h0 : T279;
  assign T279 = T274 ? T280 : MTIE;
  assign T280 = wdata[3'h7];
  assign T414 = mtimecmp[2'h3:1'h0];
  assign T415 = T416 ? wdata : mtimecmp;
  assign T416 = T266 & fire_pin;
  assign T266 = T32 & T267;
  assign T267 = T268 & T22;
  assign T268 = T23 ^ 1'h1;
  assign T417 = {T419, T418};
  assign T418 = mtimecmp[5'h1f:3'h4];
  assign T419 = instreth[2'h3:1'h0];
  assign T420 = host__reset ? 32'h0 : T421;
  assign T421 = fire_pin ? T422 : instreth;
  assign T422 = host__reset ? 32'h0 : T293;
  assign T293 = T304 ? wdata : T294;
  assign T294 = T296 ? T295 : instreth;
  assign T295 = instreth + 32'h1;
  assign T296 = isInstRet & T297;
  assign T297 = instret == 32'hffffffff;
  assign T423 = host__reset ? 32'h0 : T424;
  assign T424 = fire_pin ? T425 : instret;
  assign T425 = host__reset ? 32'h0 : T340;
  assign T340 = T343 ? wdata : T341;
  assign T341 = isInstRet ? T342 : instret;
  assign T342 = instret + 32'h1;
  assign T343 = T32 & T344;
  assign T344 = T345 & T313;
  assign T313 = csr_addr == 12'h902;
  assign T345 = T314 ^ 1'h1;
  assign T314 = T316 | T315;
  assign T315 = csr_addr == 12'h901;
  assign T316 = T318 | T317;
  assign T317 = csr_addr == 12'h900;
  assign T318 = T220 | T218;
  assign isInstRet = T299 & T298;
  assign T298 = io_stall ^ 1'h1;
  assign T299 = T303 & T300;
  assign T300 = T301 | isEbreak;
  assign T301 = T302 | isEcall;
  assign T302 = io_expt ^ 1'h1;
  assign T303 = io_inst != 32'h13;
  assign T304 = T32 & T305;
  assign T305 = T307 & T306;
  assign T306 = csr_addr == 12'h982;
  assign T307 = T308 ^ 1'h1;
  assign T308 = T310 | T309;
  assign T309 = csr_addr == 12'h981;
  assign T310 = T312 | T311;
  assign T311 = csr_addr == 12'h980;
  assign T312 = T314 | T313;
  assign T426 = {T428, T427};
  assign T427 = instreth[5'h1f:3'h4];
  assign T428 = timeh[2'h3:1'h0];
  assign T429 = host__reset ? 32'h0 : T430;
  assign T430 = fire_pin ? T431 : timeh;
  assign T431 = host__reset ? 32'h0 : T320;
  assign T320 = T328 ? wdata : T321;
  assign T321 = T325 ? wdata : T322;
  assign T322 = T324 ? T323 : timeh;
  assign T323 = timeh + 32'h1;
  assign T324 = time_ == 32'hffffffff;
  assign T432 = host__reset ? 32'h0 : T433;
  assign T433 = fire_pin ? T434 : time_;
  assign T434 = host__reset ? 32'h0 : T347;
  assign T347 = T353 ? wdata : T348;
  assign T348 = T350 ? wdata : T349;
  assign T349 = time_ + 32'h1;
  assign T350 = T32 & T351;
  assign T351 = T352 & T26;
  assign T352 = T27 ^ 1'h1;
  assign T353 = T32 & T354;
  assign T354 = T355 & T315;
  assign T355 = T316 ^ 1'h1;
  assign T325 = T32 & T326;
  assign T326 = T327 & T24;
  assign T327 = T25 ^ 1'h1;
  assign T328 = T32 & T329;
  assign T329 = T330 & T309;
  assign T330 = T310 ^ 1'h1;
  assign T435 = {T437, T436};
  assign T436 = timeh[5'h1f:3'h4];
  assign T437 = cycleh[2'h3:1'h0];
  assign T438 = host__reset ? 32'h0 : T439;
  assign T439 = fire_pin ? T440 : cycleh;
  assign T440 = host__reset ? 32'h0 : T332;
  assign T332 = T336 ? wdata : T333;
  assign T333 = T335 ? T334 : cycleh;
  assign T334 = cycleh + 32'h1;
  assign T335 = cycle == 32'hffffffff;
  assign T441 = host__reset ? 32'h0 : T442;
  assign T442 = fire_pin ? T443 : cycle;
  assign T443 = host__reset ? 32'h0 : T357;
  assign T357 = T359 ? wdata : T358;
  assign T358 = cycle + 32'h1;
  assign T359 = T32 & T360;
  assign T360 = T361 & T317;
  assign T361 = T318 ^ 1'h1;
  assign T336 = T32 & T337;
  assign T337 = T338 & T311;
  assign T338 = T312 ^ 1'h1;
  assign T444 = {T447, T445};
  assign T445 = {PRV1, T446};
  assign T446 = cycleh[5'h1f:3'h4];
  assign T447 = instret[1'h1:1'h0];
  assign T448 = {T450, T449};
  assign T449 = instret[5'h1f:2'h2];
  assign T450 = time_[1'h1:1'h0];
  assign T451 = {T453, T452};
  assign T452 = time_[5'h1f:2'h2];
  assign T453 = cycle[1'h1:1'h0];
  assign T454 = {PRV, T455};
  assign T455 = cycle[5'h1f:2'h2];
  assign T456 = host__reset ? 32'h0 : T457;
  assign T457 = fire_pin ? T458 : mtohost;
  assign T458 = host__reset ? 32'h0 : T0;
  assign T0 = T9 ? wdata : mtohost;
  assign T9 = T32 & T10;
  assign T10 = T12 & T11;
  assign T12 = T13 ^ 1'h1;
  assign T459 = fire_pin ? T45 : mepc;
  assign T45 = T50 ? T49 : T46;
  assign T46 = T48 ? T47 : mepc;
  assign T47 = io_pc & 32'hfffffffc;
  assign T49 = wdata & 32'hfffffffc;
  assign T50 = T32 & T51;
  assign T51 = T52 & T18;
  assign T52 = T19 ^ 1'h1;
  assign T460 = fire_pin ^ 1'h1;
  assign io_daisy_regs_out_bits = RegChain_io_dataIo_out_bits;
  assign io_daisy_regs_out_valid = RegChain_io_dataIo_out_valid;
  assign io_daisy_regs_in_ready = RegChain_io_dataIo_in_ready;
  assign io_host_tohost = mtohost;
  assign io_epc = mepc;
  assign io_evec = T461;
  assign T461 = {23'h0, T53};
  assign T53 = 9'h100 + T462;
  assign T462 = {1'h0, T54};
  assign T54 = PRV << 3'h6;
  assign io_expt = T67;
  assign T67 = T72 | isEbreak;
  assign T72 = T78 | isEcall;
  assign T78 = T82 | T79;
  assign T79 = privInst & T80;
  assign T80 = privValid ^ 1'h1;
  assign privValid = T81 <= PRV;
  assign T81 = csr_addr[4'h9:4'h8];
  assign T82 = T89 | T83;
  assign T83 = wen & csrRO;
  assign csrRO = T85 | T84;
  assign T84 = csr_addr == 12'h302;
  assign T85 = T87 | T86;
  assign T86 = csr_addr == 12'h301;
  assign T87 = T88 == 2'h3;
  assign T88 = csr_addr[4'hb:4'ha];
  assign T89 = T152 | T90;
  assign T90 = T150 & T91;
  assign T91 = T93 | T92;
  assign T92 = privValid ^ 1'h1;
  assign T93 = csrValid ^ 1'h1;
  assign csrValid = T95 | T94;
  assign T94 = 12'h300 == csr_addr;
  assign T95 = T97 | T96;
  assign T96 = 12'h781 == csr_addr;
  assign T97 = T99 | T98;
  assign T98 = 12'h780 == csr_addr;
  assign T99 = T101 | T100;
  assign T100 = 12'h344 == csr_addr;
  assign T101 = T103 | T102;
  assign T102 = 12'h343 == csr_addr;
  assign T103 = T105 | T104;
  assign T104 = 12'h342 == csr_addr;
  assign T105 = T107 | T106;
  assign T106 = 12'h341 == csr_addr;
  assign T107 = T109 | T108;
  assign T108 = 12'h340 == csr_addr;
  assign T109 = T111 | T110;
  assign T110 = 12'h741 == csr_addr;
  assign T111 = T113 | T112;
  assign T112 = 12'h701 == csr_addr;
  assign T113 = T115 | T114;
  assign T114 = 12'h321 == csr_addr;
  assign T115 = T117 | T116;
  assign T116 = 12'h304 == csr_addr;
  assign T117 = T119 | T118;
  assign T118 = 12'h302 == csr_addr;
  assign T119 = T121 | T120;
  assign T120 = 12'h301 == csr_addr;
  assign T121 = T123 | T122;
  assign T122 = 12'hf10 == csr_addr;
  assign T123 = T125 | T124;
  assign T124 = 12'hf01 == csr_addr;
  assign T125 = T127 | T126;
  assign T126 = 12'hf00 == csr_addr;
  assign T127 = T129 | T128;
  assign T128 = 12'h982 == csr_addr;
  assign T129 = T131 | T130;
  assign T130 = 12'h981 == csr_addr;
  assign T131 = T133 | T132;
  assign T132 = 12'h980 == csr_addr;
  assign T133 = T135 | T134;
  assign T134 = 12'h902 == csr_addr;
  assign T135 = T137 | T136;
  assign T136 = 12'h901 == csr_addr;
  assign T137 = T139 | T138;
  assign T138 = 12'h900 == csr_addr;
  assign T139 = T141 | T140;
  assign T140 = 12'hc82 == csr_addr;
  assign T141 = T143 | T142;
  assign T142 = 12'hc81 == csr_addr;
  assign T143 = T145 | T144;
  assign T144 = 12'hc80 == csr_addr;
  assign T145 = T147 | T146;
  assign T146 = 12'hc02 == csr_addr;
  assign T147 = T149 | T148;
  assign T148 = 12'hc01 == csr_addr;
  assign T149 = 12'hc00 == csr_addr;
  assign T150 = T151 != 2'h0;
  assign T151 = io_cmd[1'h1:1'h0];
  assign T152 = T159 | saddrInvalid;
  assign T159 = T169 | laddrInvalid;
  assign T169 = io_illegal | iaddrInvalid;
  assign io_out = T463;
  assign T463 = T171[5'h1f:1'h0];
  assign T171 = T172;
  assign T172 = {1'h0, csr};
  assign csr = T362 ? cycle : T173;
  assign T173 = T356 ? time_ : T174;
  assign T174 = T346 ? instret : T175;
  assign T175 = T339 ? cycleh : T176;
  assign T176 = T331 ? timeh : T177;
  assign T177 = T319 ? instreth : T178;
  assign T178 = T292 ? cycle : T179;
  assign T179 = T291 ? time_ : T180;
  assign T180 = T290 ? instret : T181;
  assign T181 = T289 ? cycleh : T182;
  assign T182 = T288 ? timeh : T183;
  assign T183 = T287 ? instreth : T184;
  assign T184 = T286 ? 32'h100100 : T185;
  assign T185 = T285 ? 32'h0 : T186;
  assign T186 = T284 ? 32'h0 : T187;
  assign T187 = T283 ? 32'h100 : T188;
  assign T188 = T282 ? 32'h0 : T189;
  assign T189 = T281 ? mie : T190;
  assign T190 = T269 ? mtimecmp : T191;
  assign T191 = T264 ? time_ : T192;
  assign T192 = T263 ? timeh : T193;
  assign T193 = T262 ? mscratch : T194;
  assign T194 = T257 ? mepc : T195;
  assign T195 = T256 ? mcause : T196;
  assign T196 = T243 ? mbadaddr : T197;
  assign T197 = T234 ? mip : T198;
  assign T198 = T222 ? mtohost : T199;
  assign T199 = T221 ? mfromhost : T200;
  assign T200 = T213 ? mstatus : 32'h0;
  assign mstatus = {22'h0, T201};
  assign T201 = {4'h0, T202};
  assign T202 = {T212, T203};
  assign T203 = {PRV, IE};
  assign T212 = {PRV1, IE1};
  assign T213 = csr_addr == 12'h300;
  assign T221 = csr_addr == 12'h781;
  assign T222 = csr_addr == 12'h780;
  assign mip = {T230, T223};
  assign T223 = {T224, 3'h0};
  assign T224 = {1'h0, MSIP};
  assign T230 = {T231, 2'h0};
  assign T231 = {24'h0, MTIP};
  assign T234 = csr_addr == 12'h344;
  assign T243 = csr_addr == 12'h343;
  assign T256 = csr_addr == 12'h342;
  assign T257 = csr_addr == 12'h341;
  assign T262 = csr_addr == 12'h340;
  assign T263 = csr_addr == 12'h741;
  assign T264 = csr_addr == 12'h701;
  assign T269 = csr_addr == 12'h321;
  assign mie = {T277, T270};
  assign T270 = {T271, 3'h0};
  assign T271 = {1'h0, MSIE};
  assign T277 = {T278, 2'h0};
  assign T278 = {24'h0, MTIE};
  assign T281 = csr_addr == 12'h304;
  assign T282 = csr_addr == 12'h302;
  assign T283 = csr_addr == 12'h301;
  assign T284 = csr_addr == 12'hf10;
  assign T285 = csr_addr == 12'hf01;
  assign T286 = csr_addr == 12'hf00;
  assign T287 = csr_addr == 12'h982;
  assign T288 = csr_addr == 12'h981;
  assign T289 = csr_addr == 12'h980;
  assign T290 = csr_addr == 12'h902;
  assign T291 = csr_addr == 12'h901;
  assign T292 = csr_addr == 12'h900;
  assign T319 = csr_addr == 12'hc82;
  assign T331 = csr_addr == 12'hc81;
  assign T339 = csr_addr == 12'hc80;
  assign T346 = csr_addr == 12'hc02;
  assign T356 = csr_addr == 12'hc01;
  assign T362 = csr_addr == 12'hc00;
  RegChain_3 RegChain(.clk(clk), .reset(daisy__rst),
       .io_stall( T460 ),
       .io_dataIo_in_ready( RegChain_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_daisy_regs_in_valid ),
       .io_dataIo_in_bits( io_daisy_regs_in_bits ),
       .io_dataIo_out_ready( io_daisy_regs_out_ready ),
       .io_dataIo_out_valid( RegChain_io_dataIo_out_valid ),
       .io_dataIo_out_bits( RegChain_io_dataIo_out_bits ),
       .io_dataIo_data_13( mepc ),
       .io_dataIo_data_12( mtohost ),
       .io_dataIo_data_11( T454 ),
       .io_dataIo_data_10( T451 ),
       .io_dataIo_data_9( T448 ),
       .io_dataIo_data_8( T444 ),
       .io_dataIo_data_7( T435 ),
       .io_dataIo_data_6( T426 ),
       .io_dataIo_data_5( T417 ),
       .io_dataIo_data_4( T404 ),
       .io_dataIo_data_3( T399 ),
       .io_dataIo_data_2( T386 ),
       .io_dataIo_data_1( T374 ),
       .io_dataIo_data_0( T363 )
  );

  always @(posedge clk) begin
    if(host__reset) begin
      IE <= 1'h0;
    end else if(fire_pin) begin
      IE <= T367;
    end
    if(host__reset) begin
      IE1 <= 1'h0;
    end else if(fire_pin) begin
      IE1 <= T370;
    end
    if(fire_pin) begin
      mfromhost <= T214;
    end
    if(host__reset) begin
      MSIP <= 1'h0;
    end else if(fire_pin) begin
      MSIP <= T379;
    end
    if(host__reset) begin
      MTIP <= 1'h0;
    end else if(fire_pin) begin
      MTIP <= T383;
    end
    if(fire_pin) begin
      mbadaddr <= T235;
    end
    if(fire_pin) begin
      mcause <= T244;
    end
    if(host__reset) begin
      PRV <= 2'h3;
    end else if(fire_pin) begin
      PRV <= T395;
    end
    if(host__reset) begin
      PRV1 <= 2'h3;
    end else if(fire_pin) begin
      PRV1 <= T398;
    end
    if(T403) begin
      mscratch <= wdata;
    end
    if(host__reset) begin
      MSIE <= 1'h0;
    end else if(fire_pin) begin
      MSIE <= T409;
    end
    if(host__reset) begin
      MTIE <= 1'h0;
    end else if(fire_pin) begin
      MTIE <= T413;
    end
    if(T416) begin
      mtimecmp <= wdata;
    end
    if(host__reset) begin
      instreth <= 32'h0;
    end else if(fire_pin) begin
      instreth <= T422;
    end
    if(host__reset) begin
      instret <= 32'h0;
    end else if(fire_pin) begin
      instret <= T425;
    end
    if(host__reset) begin
      timeh <= 32'h0;
    end else if(fire_pin) begin
      timeh <= T431;
    end
    if(host__reset) begin
      time_ <= 32'h0;
    end else if(fire_pin) begin
      time_ <= T434;
    end
    if(host__reset) begin
      cycleh <= 32'h0;
    end else if(fire_pin) begin
      cycleh <= T440;
    end
    if(host__reset) begin
      cycle <= 32'h0;
    end else if(fire_pin) begin
      cycle <= T443;
    end
    if(host__reset) begin
      mtohost <= 32'h0;
    end else if(fire_pin) begin
      mtohost <= T458;
    end
    if(fire_pin) begin
      mepc <= T45;
    end
  end
endmodule

module DaisyDatapath_4(input clk,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_31,
    input [31:0] io_dataIo_data_30,
    input [31:0] io_dataIo_data_29,
    input [31:0] io_dataIo_data_28,
    input [31:0] io_dataIo_data_27,
    input [31:0] io_dataIo_data_26,
    input [31:0] io_dataIo_data_25,
    input [31:0] io_dataIo_data_24,
    input [31:0] io_dataIo_data_23,
    input [31:0] io_dataIo_data_22,
    input [31:0] io_dataIo_data_21,
    input [31:0] io_dataIo_data_20,
    input [31:0] io_dataIo_data_19,
    input [31:0] io_dataIo_data_18,
    input [31:0] io_dataIo_data_17,
    input [31:0] io_dataIo_data_16,
    input [31:0] io_dataIo_data_15,
    input [31:0] io_dataIo_data_14,
    input [31:0] io_dataIo_data_13,
    input [31:0] io_dataIo_data_12,
    input [31:0] io_dataIo_data_11,
    input [31:0] io_dataIo_data_10,
    input [31:0] io_dataIo_data_9,
    input [31:0] io_dataIo_data_8,
    input [31:0] io_dataIo_data_7,
    input [31:0] io_dataIo_data_6,
    input [31:0] io_dataIo_data_5,
    input [31:0] io_dataIo_data_4,
    input [31:0] io_dataIo_data_3,
    input [31:0] io_dataIo_data_2,
    input [31:0] io_dataIo_data_1,
    input [31:0] io_dataIo_data_0,
    input  io_ctrlIo_copyCond,
    input  io_ctrlIo_readCond,
    input  io_ctrlIo_cntrNotZero,
    output io_ctrlIo_outFire,
    output io_ctrlIo_inValid
);

  wire T0;
  reg [31:0] regs_31;
  wire[31:0] T1;
  wire[31:0] T2;
  reg [31:0] regs_30;
  wire[31:0] T3;
  wire[31:0] T4;
  reg [31:0] regs_29;
  wire[31:0] T5;
  wire[31:0] T6;
  reg [31:0] regs_28;
  wire[31:0] T7;
  wire[31:0] T8;
  reg [31:0] regs_27;
  wire[31:0] T9;
  wire[31:0] T10;
  reg [31:0] regs_26;
  wire[31:0] T11;
  wire[31:0] T12;
  reg [31:0] regs_25;
  wire[31:0] T13;
  wire[31:0] T14;
  reg [31:0] regs_24;
  wire[31:0] T15;
  wire[31:0] T16;
  reg [31:0] regs_23;
  wire[31:0] T17;
  wire[31:0] T18;
  reg [31:0] regs_22;
  wire[31:0] T19;
  wire[31:0] T20;
  reg [31:0] regs_21;
  wire[31:0] T21;
  wire[31:0] T22;
  reg [31:0] regs_20;
  wire[31:0] T23;
  wire[31:0] T24;
  reg [31:0] regs_19;
  wire[31:0] T25;
  wire[31:0] T26;
  reg [31:0] regs_18;
  wire[31:0] T27;
  wire[31:0] T28;
  reg [31:0] regs_17;
  wire[31:0] T29;
  wire[31:0] T30;
  reg [31:0] regs_16;
  wire[31:0] T31;
  wire[31:0] T32;
  reg [31:0] regs_15;
  wire[31:0] T33;
  wire[31:0] T34;
  reg [31:0] regs_14;
  wire[31:0] T35;
  wire[31:0] T36;
  reg [31:0] regs_13;
  wire[31:0] T37;
  wire[31:0] T38;
  reg [31:0] regs_12;
  wire[31:0] T39;
  wire[31:0] T40;
  reg [31:0] regs_11;
  wire[31:0] T41;
  wire[31:0] T42;
  reg [31:0] regs_10;
  wire[31:0] T43;
  wire[31:0] T44;
  reg [31:0] regs_9;
  wire[31:0] T45;
  wire[31:0] T46;
  reg [31:0] regs_8;
  wire[31:0] T47;
  wire[31:0] T48;
  reg [31:0] regs_7;
  wire[31:0] T49;
  wire[31:0] T50;
  reg [31:0] regs_6;
  wire[31:0] T51;
  wire[31:0] T52;
  reg [31:0] regs_5;
  wire[31:0] T53;
  wire[31:0] T54;
  reg [31:0] regs_4;
  wire[31:0] T55;
  wire[31:0] T56;
  reg [31:0] regs_3;
  wire[31:0] T57;
  wire[31:0] T58;
  reg [31:0] regs_2;
  wire[31:0] T59;
  wire[31:0] T60;
  reg [31:0] regs_1;
  wire[31:0] T61;
  wire[31:0] T62;
  reg [31:0] regs_0;
  wire[31:0] T63;
  wire[31:0] T64;
  wire readCondAndOutFire;
  wire T65;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regs_31 = {1{$random}};
    regs_30 = {1{$random}};
    regs_29 = {1{$random}};
    regs_28 = {1{$random}};
    regs_27 = {1{$random}};
    regs_26 = {1{$random}};
    regs_25 = {1{$random}};
    regs_24 = {1{$random}};
    regs_23 = {1{$random}};
    regs_22 = {1{$random}};
    regs_21 = {1{$random}};
    regs_20 = {1{$random}};
    regs_19 = {1{$random}};
    regs_18 = {1{$random}};
    regs_17 = {1{$random}};
    regs_16 = {1{$random}};
    regs_15 = {1{$random}};
    regs_14 = {1{$random}};
    regs_13 = {1{$random}};
    regs_12 = {1{$random}};
    regs_11 = {1{$random}};
    regs_10 = {1{$random}};
    regs_9 = {1{$random}};
    regs_8 = {1{$random}};
    regs_7 = {1{$random}};
    regs_6 = {1{$random}};
    regs_5 = {1{$random}};
    regs_4 = {1{$random}};
    regs_3 = {1{$random}};
    regs_2 = {1{$random}};
    regs_1 = {1{$random}};
    regs_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_inValid = io_dataIo_in_valid;
  assign io_ctrlIo_outFire = T0;
  assign T0 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_bits = regs_31;
  assign T1 = readCondAndOutFire ? regs_30 : T2;
  assign T2 = io_ctrlIo_copyCond ? io_dataIo_data_31 : regs_31;
  assign T3 = readCondAndOutFire ? regs_29 : T4;
  assign T4 = io_ctrlIo_copyCond ? io_dataIo_data_30 : regs_30;
  assign T5 = readCondAndOutFire ? regs_28 : T6;
  assign T6 = io_ctrlIo_copyCond ? io_dataIo_data_29 : regs_29;
  assign T7 = readCondAndOutFire ? regs_27 : T8;
  assign T8 = io_ctrlIo_copyCond ? io_dataIo_data_28 : regs_28;
  assign T9 = readCondAndOutFire ? regs_26 : T10;
  assign T10 = io_ctrlIo_copyCond ? io_dataIo_data_27 : regs_27;
  assign T11 = readCondAndOutFire ? regs_25 : T12;
  assign T12 = io_ctrlIo_copyCond ? io_dataIo_data_26 : regs_26;
  assign T13 = readCondAndOutFire ? regs_24 : T14;
  assign T14 = io_ctrlIo_copyCond ? io_dataIo_data_25 : regs_25;
  assign T15 = readCondAndOutFire ? regs_23 : T16;
  assign T16 = io_ctrlIo_copyCond ? io_dataIo_data_24 : regs_24;
  assign T17 = readCondAndOutFire ? regs_22 : T18;
  assign T18 = io_ctrlIo_copyCond ? io_dataIo_data_23 : regs_23;
  assign T19 = readCondAndOutFire ? regs_21 : T20;
  assign T20 = io_ctrlIo_copyCond ? io_dataIo_data_22 : regs_22;
  assign T21 = readCondAndOutFire ? regs_20 : T22;
  assign T22 = io_ctrlIo_copyCond ? io_dataIo_data_21 : regs_21;
  assign T23 = readCondAndOutFire ? regs_19 : T24;
  assign T24 = io_ctrlIo_copyCond ? io_dataIo_data_20 : regs_20;
  assign T25 = readCondAndOutFire ? regs_18 : T26;
  assign T26 = io_ctrlIo_copyCond ? io_dataIo_data_19 : regs_19;
  assign T27 = readCondAndOutFire ? regs_17 : T28;
  assign T28 = io_ctrlIo_copyCond ? io_dataIo_data_18 : regs_18;
  assign T29 = readCondAndOutFire ? regs_16 : T30;
  assign T30 = io_ctrlIo_copyCond ? io_dataIo_data_17 : regs_17;
  assign T31 = readCondAndOutFire ? regs_15 : T32;
  assign T32 = io_ctrlIo_copyCond ? io_dataIo_data_16 : regs_16;
  assign T33 = readCondAndOutFire ? regs_14 : T34;
  assign T34 = io_ctrlIo_copyCond ? io_dataIo_data_15 : regs_15;
  assign T35 = readCondAndOutFire ? regs_13 : T36;
  assign T36 = io_ctrlIo_copyCond ? io_dataIo_data_14 : regs_14;
  assign T37 = readCondAndOutFire ? regs_12 : T38;
  assign T38 = io_ctrlIo_copyCond ? io_dataIo_data_13 : regs_13;
  assign T39 = readCondAndOutFire ? regs_11 : T40;
  assign T40 = io_ctrlIo_copyCond ? io_dataIo_data_12 : regs_12;
  assign T41 = readCondAndOutFire ? regs_10 : T42;
  assign T42 = io_ctrlIo_copyCond ? io_dataIo_data_11 : regs_11;
  assign T43 = readCondAndOutFire ? regs_9 : T44;
  assign T44 = io_ctrlIo_copyCond ? io_dataIo_data_10 : regs_10;
  assign T45 = readCondAndOutFire ? regs_8 : T46;
  assign T46 = io_ctrlIo_copyCond ? io_dataIo_data_9 : regs_9;
  assign T47 = readCondAndOutFire ? regs_7 : T48;
  assign T48 = io_ctrlIo_copyCond ? io_dataIo_data_8 : regs_8;
  assign T49 = readCondAndOutFire ? regs_6 : T50;
  assign T50 = io_ctrlIo_copyCond ? io_dataIo_data_7 : regs_7;
  assign T51 = readCondAndOutFire ? regs_5 : T52;
  assign T52 = io_ctrlIo_copyCond ? io_dataIo_data_6 : regs_6;
  assign T53 = readCondAndOutFire ? regs_4 : T54;
  assign T54 = io_ctrlIo_copyCond ? io_dataIo_data_5 : regs_5;
  assign T55 = readCondAndOutFire ? regs_3 : T56;
  assign T56 = io_ctrlIo_copyCond ? io_dataIo_data_4 : regs_4;
  assign T57 = readCondAndOutFire ? regs_2 : T58;
  assign T58 = io_ctrlIo_copyCond ? io_dataIo_data_3 : regs_3;
  assign T59 = readCondAndOutFire ? regs_1 : T60;
  assign T60 = io_ctrlIo_copyCond ? io_dataIo_data_2 : regs_2;
  assign T61 = readCondAndOutFire ? regs_0 : T62;
  assign T62 = io_ctrlIo_copyCond ? io_dataIo_data_1 : regs_1;
  assign T63 = readCondAndOutFire ? io_dataIo_in_bits : T64;
  assign T64 = io_ctrlIo_copyCond ? io_dataIo_data_0 : regs_0;
  assign readCondAndOutFire = io_ctrlIo_readCond & T65;
  assign T65 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_valid = io_ctrlIo_cntrNotZero;
  assign io_dataIo_in_ready = io_dataIo_out_ready;

  always @(posedge clk) begin
    if(readCondAndOutFire) begin
      regs_31 <= regs_30;
    end else if(io_ctrlIo_copyCond) begin
      regs_31 <= io_dataIo_data_31;
    end
    if(readCondAndOutFire) begin
      regs_30 <= regs_29;
    end else if(io_ctrlIo_copyCond) begin
      regs_30 <= io_dataIo_data_30;
    end
    if(readCondAndOutFire) begin
      regs_29 <= regs_28;
    end else if(io_ctrlIo_copyCond) begin
      regs_29 <= io_dataIo_data_29;
    end
    if(readCondAndOutFire) begin
      regs_28 <= regs_27;
    end else if(io_ctrlIo_copyCond) begin
      regs_28 <= io_dataIo_data_28;
    end
    if(readCondAndOutFire) begin
      regs_27 <= regs_26;
    end else if(io_ctrlIo_copyCond) begin
      regs_27 <= io_dataIo_data_27;
    end
    if(readCondAndOutFire) begin
      regs_26 <= regs_25;
    end else if(io_ctrlIo_copyCond) begin
      regs_26 <= io_dataIo_data_26;
    end
    if(readCondAndOutFire) begin
      regs_25 <= regs_24;
    end else if(io_ctrlIo_copyCond) begin
      regs_25 <= io_dataIo_data_25;
    end
    if(readCondAndOutFire) begin
      regs_24 <= regs_23;
    end else if(io_ctrlIo_copyCond) begin
      regs_24 <= io_dataIo_data_24;
    end
    if(readCondAndOutFire) begin
      regs_23 <= regs_22;
    end else if(io_ctrlIo_copyCond) begin
      regs_23 <= io_dataIo_data_23;
    end
    if(readCondAndOutFire) begin
      regs_22 <= regs_21;
    end else if(io_ctrlIo_copyCond) begin
      regs_22 <= io_dataIo_data_22;
    end
    if(readCondAndOutFire) begin
      regs_21 <= regs_20;
    end else if(io_ctrlIo_copyCond) begin
      regs_21 <= io_dataIo_data_21;
    end
    if(readCondAndOutFire) begin
      regs_20 <= regs_19;
    end else if(io_ctrlIo_copyCond) begin
      regs_20 <= io_dataIo_data_20;
    end
    if(readCondAndOutFire) begin
      regs_19 <= regs_18;
    end else if(io_ctrlIo_copyCond) begin
      regs_19 <= io_dataIo_data_19;
    end
    if(readCondAndOutFire) begin
      regs_18 <= regs_17;
    end else if(io_ctrlIo_copyCond) begin
      regs_18 <= io_dataIo_data_18;
    end
    if(readCondAndOutFire) begin
      regs_17 <= regs_16;
    end else if(io_ctrlIo_copyCond) begin
      regs_17 <= io_dataIo_data_17;
    end
    if(readCondAndOutFire) begin
      regs_16 <= regs_15;
    end else if(io_ctrlIo_copyCond) begin
      regs_16 <= io_dataIo_data_16;
    end
    if(readCondAndOutFire) begin
      regs_15 <= regs_14;
    end else if(io_ctrlIo_copyCond) begin
      regs_15 <= io_dataIo_data_15;
    end
    if(readCondAndOutFire) begin
      regs_14 <= regs_13;
    end else if(io_ctrlIo_copyCond) begin
      regs_14 <= io_dataIo_data_14;
    end
    if(readCondAndOutFire) begin
      regs_13 <= regs_12;
    end else if(io_ctrlIo_copyCond) begin
      regs_13 <= io_dataIo_data_13;
    end
    if(readCondAndOutFire) begin
      regs_12 <= regs_11;
    end else if(io_ctrlIo_copyCond) begin
      regs_12 <= io_dataIo_data_12;
    end
    if(readCondAndOutFire) begin
      regs_11 <= regs_10;
    end else if(io_ctrlIo_copyCond) begin
      regs_11 <= io_dataIo_data_11;
    end
    if(readCondAndOutFire) begin
      regs_10 <= regs_9;
    end else if(io_ctrlIo_copyCond) begin
      regs_10 <= io_dataIo_data_10;
    end
    if(readCondAndOutFire) begin
      regs_9 <= regs_8;
    end else if(io_ctrlIo_copyCond) begin
      regs_9 <= io_dataIo_data_9;
    end
    if(readCondAndOutFire) begin
      regs_8 <= regs_7;
    end else if(io_ctrlIo_copyCond) begin
      regs_8 <= io_dataIo_data_8;
    end
    if(readCondAndOutFire) begin
      regs_7 <= regs_6;
    end else if(io_ctrlIo_copyCond) begin
      regs_7 <= io_dataIo_data_7;
    end
    if(readCondAndOutFire) begin
      regs_6 <= regs_5;
    end else if(io_ctrlIo_copyCond) begin
      regs_6 <= io_dataIo_data_6;
    end
    if(readCondAndOutFire) begin
      regs_5 <= regs_4;
    end else if(io_ctrlIo_copyCond) begin
      regs_5 <= io_dataIo_data_5;
    end
    if(readCondAndOutFire) begin
      regs_4 <= regs_3;
    end else if(io_ctrlIo_copyCond) begin
      regs_4 <= io_dataIo_data_4;
    end
    if(readCondAndOutFire) begin
      regs_3 <= regs_2;
    end else if(io_ctrlIo_copyCond) begin
      regs_3 <= io_dataIo_data_3;
    end
    if(readCondAndOutFire) begin
      regs_2 <= regs_1;
    end else if(io_ctrlIo_copyCond) begin
      regs_2 <= io_dataIo_data_2;
    end
    if(readCondAndOutFire) begin
      regs_1 <= regs_0;
    end else if(io_ctrlIo_copyCond) begin
      regs_1 <= io_dataIo_data_1;
    end
    if(readCondAndOutFire) begin
      regs_0 <= io_dataIo_in_bits;
    end else if(io_ctrlIo_copyCond) begin
      regs_0 <= io_dataIo_data_0;
    end
  end
endmodule

module RegChainControl_4(input clk, input reset,
    input  io_stall,
    output io_ctrlIo_copyCond,
    output io_ctrlIo_readCond,
    output io_ctrlIo_cntrNotZero,
    input  io_ctrlIo_outFire,
    input  io_ctrlIo_inValid
);

  wire T0;
  reg [5:0] counter;
  wire[5:0] T1;
  wire[5:0] T2;
  wire[5:0] T3;
  wire[5:0] T4;
  wire T5;
  wire T6;
  wire T7;
  wire[5:0] T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  reg  copied;
  wire T18;
  reg  R19;
  wire T20;
  wire T21;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    counter = {1{$random}};
    copied = {1{$random}};
    R19 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_cntrNotZero = T0;
  assign T0 = counter != 6'h0;
  assign T1 = reset ? 6'h0 : T2;
  assign T2 = T9 ? T8 : T3;
  assign T3 = T6 ? 6'h20 : T4;
  assign T4 = T5 ? 6'h0 : counter;
  assign T5 = io_stall ^ 1'h1;
  assign T6 = T7 & io_ctrlIo_copyCond;
  assign T7 = T5 ^ 1'h1;
  assign T8 = counter - 6'h1;
  assign T9 = T13 & T10;
  assign T10 = T12 & T11;
  assign T11 = io_ctrlIo_inValid ^ 1'h1;
  assign T12 = io_ctrlIo_readCond & io_ctrlIo_outFire;
  assign T13 = T14 ^ 1'h1;
  assign T14 = T5 | io_ctrlIo_copyCond;
  assign io_ctrlIo_readCond = T15;
  assign T15 = T17 & T16;
  assign T16 = counter != 6'h0;
  assign T17 = io_stall & copied;
  assign io_ctrlIo_copyCond = T18;
  assign T18 = T20 | R19;
  assign T20 = io_stall & T21;
  assign T21 = copied ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      counter <= 6'h0;
    end else if(T9) begin
      counter <= T8;
    end else if(T6) begin
      counter <= 6'h20;
    end else if(T5) begin
      counter <= 6'h0;
    end
    copied <= io_stall;
    R19 <= reset;
  end
endmodule

module RegChain_4(input clk, input reset,
    input  io_stall,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_31,
    input [31:0] io_dataIo_data_30,
    input [31:0] io_dataIo_data_29,
    input [31:0] io_dataIo_data_28,
    input [31:0] io_dataIo_data_27,
    input [31:0] io_dataIo_data_26,
    input [31:0] io_dataIo_data_25,
    input [31:0] io_dataIo_data_24,
    input [31:0] io_dataIo_data_23,
    input [31:0] io_dataIo_data_22,
    input [31:0] io_dataIo_data_21,
    input [31:0] io_dataIo_data_20,
    input [31:0] io_dataIo_data_19,
    input [31:0] io_dataIo_data_18,
    input [31:0] io_dataIo_data_17,
    input [31:0] io_dataIo_data_16,
    input [31:0] io_dataIo_data_15,
    input [31:0] io_dataIo_data_14,
    input [31:0] io_dataIo_data_13,
    input [31:0] io_dataIo_data_12,
    input [31:0] io_dataIo_data_11,
    input [31:0] io_dataIo_data_10,
    input [31:0] io_dataIo_data_9,
    input [31:0] io_dataIo_data_8,
    input [31:0] io_dataIo_data_7,
    input [31:0] io_dataIo_data_6,
    input [31:0] io_dataIo_data_5,
    input [31:0] io_dataIo_data_4,
    input [31:0] io_dataIo_data_3,
    input [31:0] io_dataIo_data_2,
    input [31:0] io_dataIo_data_1,
    input [31:0] io_dataIo_data_0
);

  wire datapath_io_dataIo_in_ready;
  wire datapath_io_dataIo_out_valid;
  wire[31:0] datapath_io_dataIo_out_bits;
  wire datapath_io_ctrlIo_outFire;
  wire datapath_io_ctrlIo_inValid;
  wire control_io_ctrlIo_copyCond;
  wire control_io_ctrlIo_readCond;
  wire control_io_ctrlIo_cntrNotZero;


  assign io_dataIo_out_bits = datapath_io_dataIo_out_bits;
  assign io_dataIo_out_valid = datapath_io_dataIo_out_valid;
  assign io_dataIo_in_ready = datapath_io_dataIo_in_ready;
  DaisyDatapath_4 datapath(.clk(clk),
       .io_dataIo_in_ready( datapath_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_dataIo_in_valid ),
       .io_dataIo_in_bits( io_dataIo_in_bits ),
       .io_dataIo_out_ready( io_dataIo_out_ready ),
       .io_dataIo_out_valid( datapath_io_dataIo_out_valid ),
       .io_dataIo_out_bits( datapath_io_dataIo_out_bits ),
       .io_dataIo_data_31( io_dataIo_data_31 ),
       .io_dataIo_data_30( io_dataIo_data_30 ),
       .io_dataIo_data_29( io_dataIo_data_29 ),
       .io_dataIo_data_28( io_dataIo_data_28 ),
       .io_dataIo_data_27( io_dataIo_data_27 ),
       .io_dataIo_data_26( io_dataIo_data_26 ),
       .io_dataIo_data_25( io_dataIo_data_25 ),
       .io_dataIo_data_24( io_dataIo_data_24 ),
       .io_dataIo_data_23( io_dataIo_data_23 ),
       .io_dataIo_data_22( io_dataIo_data_22 ),
       .io_dataIo_data_21( io_dataIo_data_21 ),
       .io_dataIo_data_20( io_dataIo_data_20 ),
       .io_dataIo_data_19( io_dataIo_data_19 ),
       .io_dataIo_data_18( io_dataIo_data_18 ),
       .io_dataIo_data_17( io_dataIo_data_17 ),
       .io_dataIo_data_16( io_dataIo_data_16 ),
       .io_dataIo_data_15( io_dataIo_data_15 ),
       .io_dataIo_data_14( io_dataIo_data_14 ),
       .io_dataIo_data_13( io_dataIo_data_13 ),
       .io_dataIo_data_12( io_dataIo_data_12 ),
       .io_dataIo_data_11( io_dataIo_data_11 ),
       .io_dataIo_data_10( io_dataIo_data_10 ),
       .io_dataIo_data_9( io_dataIo_data_9 ),
       .io_dataIo_data_8( io_dataIo_data_8 ),
       .io_dataIo_data_7( io_dataIo_data_7 ),
       .io_dataIo_data_6( io_dataIo_data_6 ),
       .io_dataIo_data_5( io_dataIo_data_5 ),
       .io_dataIo_data_4( io_dataIo_data_4 ),
       .io_dataIo_data_3( io_dataIo_data_3 ),
       .io_dataIo_data_2( io_dataIo_data_2 ),
       .io_dataIo_data_1( io_dataIo_data_1 ),
       .io_dataIo_data_0( io_dataIo_data_0 ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
  RegChainControl_4 control(.clk(clk), .reset(reset),
       .io_stall( io_stall ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
endmodule

module RegFile(input clk, input host__reset,
    input [4:0] io_raddr1,
    input [4:0] io_raddr2,
    output[31:0] io_rdata1,
    output[31:0] io_rdata2,
    input  io_wen,
    input [4:0] io_waddr,
    input [31:0] io_wdata,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  wire[31:0] T9;
  reg [31:0] regs [31:0];
  wire[31:0] T2;
  wire T10;
  wire T3;
  wire T4;
  wire[31:0] T11;
  wire[31:0] T12;
  wire[31:0] T13;
  wire[31:0] T14;
  wire[31:0] T15;
  wire[31:0] T16;
  wire[31:0] T17;
  wire[31:0] T18;
  wire[31:0] T19;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[31:0] T22;
  wire[31:0] T23;
  wire[31:0] T24;
  wire[31:0] T25;
  wire[31:0] T26;
  wire[31:0] T27;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[31:0] T30;
  wire[31:0] T31;
  wire[31:0] T32;
  wire[31:0] T33;
  wire[31:0] T34;
  wire[31:0] T35;
  wire[31:0] T36;
  wire[31:0] T37;
  wire[31:0] T38;
  wire[31:0] T39;
  wire[31:0] T40;
  wire[31:0] T41;
  wire T42;
  wire[31:0] T0;
  wire[31:0] T1;
  wire T5;
  wire[31:0] T6;
  wire[31:0] T7;
  wire T8;
  wire RegChain_io_dataIo_in_ready;
  wire RegChain_io_dataIo_out_valid;
  wire[31:0] RegChain_io_dataIo_out_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    for (initvar = 0; initvar < 32; initvar = initvar+1)
      regs[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign T9 = regs[5'h1f];
  assign T10 = T3 & fire_pin;
  assign T3 = io_wen & T4;
  assign T4 = io_waddr != 5'h0;
  assign T11 = regs[5'h1e];
  assign T12 = regs[5'h1d];
  assign T13 = regs[5'h1c];
  assign T14 = regs[5'h1b];
  assign T15 = regs[5'h1a];
  assign T16 = regs[5'h19];
  assign T17 = regs[5'h18];
  assign T18 = regs[5'h17];
  assign T19 = regs[5'h16];
  assign T20 = regs[5'h15];
  assign T21 = regs[5'h14];
  assign T22 = regs[5'h13];
  assign T23 = regs[5'h12];
  assign T24 = regs[5'h11];
  assign T25 = regs[5'h10];
  assign T26 = regs[5'hf];
  assign T27 = regs[5'he];
  assign T28 = regs[5'hd];
  assign T29 = regs[5'hc];
  assign T30 = regs[5'hb];
  assign T31 = regs[5'ha];
  assign T32 = regs[5'h9];
  assign T33 = regs[5'h8];
  assign T34 = regs[5'h7];
  assign T35 = regs[5'h6];
  assign T36 = regs[5'h5];
  assign T37 = regs[5'h4];
  assign T38 = regs[5'h3];
  assign T39 = regs[5'h2];
  assign T40 = regs[5'h1];
  assign T41 = regs[5'h0];
  assign T42 = fire_pin ^ 1'h1;
  assign io_daisy_regs_out_bits = RegChain_io_dataIo_out_bits;
  assign io_daisy_regs_out_valid = RegChain_io_dataIo_out_valid;
  assign io_daisy_regs_in_ready = RegChain_io_dataIo_in_ready;
  assign io_rdata2 = T0;
  assign T0 = T5 ? T1 : 32'h0;
  assign T1 = regs[io_raddr2];
  assign T5 = io_raddr2 != 5'h0;
  assign io_rdata1 = T6;
  assign T6 = T8 ? T7 : 32'h0;
  assign T7 = regs[io_raddr1];
  assign T8 = io_raddr1 != 5'h0;
  RegChain_4 RegChain(.clk(clk), .reset(daisy__rst),
       .io_stall( T42 ),
       .io_dataIo_in_ready( RegChain_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_daisy_regs_in_valid ),
       .io_dataIo_in_bits( io_daisy_regs_in_bits ),
       .io_dataIo_out_ready( io_daisy_regs_out_ready ),
       .io_dataIo_out_valid( RegChain_io_dataIo_out_valid ),
       .io_dataIo_out_bits( RegChain_io_dataIo_out_bits ),
       .io_dataIo_data_31( T41 ),
       .io_dataIo_data_30( T40 ),
       .io_dataIo_data_29( T39 ),
       .io_dataIo_data_28( T38 ),
       .io_dataIo_data_27( T37 ),
       .io_dataIo_data_26( T36 ),
       .io_dataIo_data_25( T35 ),
       .io_dataIo_data_24( T34 ),
       .io_dataIo_data_23( T33 ),
       .io_dataIo_data_22( T32 ),
       .io_dataIo_data_21( T31 ),
       .io_dataIo_data_20( T30 ),
       .io_dataIo_data_19( T29 ),
       .io_dataIo_data_18( T28 ),
       .io_dataIo_data_17( T27 ),
       .io_dataIo_data_16( T26 ),
       .io_dataIo_data_15( T25 ),
       .io_dataIo_data_14( T24 ),
       .io_dataIo_data_13( T23 ),
       .io_dataIo_data_12( T22 ),
       .io_dataIo_data_11( T21 ),
       .io_dataIo_data_10( T20 ),
       .io_dataIo_data_9( T19 ),
       .io_dataIo_data_8( T18 ),
       .io_dataIo_data_7( T17 ),
       .io_dataIo_data_6( T16 ),
       .io_dataIo_data_5( T15 ),
       .io_dataIo_data_4( T14 ),
       .io_dataIo_data_3( T13 ),
       .io_dataIo_data_2( T12 ),
       .io_dataIo_data_1( T11 ),
       .io_dataIo_data_0( T9 )
  );

  always @(posedge clk) begin
    if (T10)
      regs[io_waddr] <= io_wdata;
  end
endmodule

module ALUArea(input host__reset,
    input [31:0] io_A,
    input [31:0] io_B,
    input [3:0] io_alu_op,
    output[31:0] io_out,
    output[31:0] io_sum
    //output io_daisy_regs_in_ready
    //input  io_daisy_regs_in_valid
    //input [31:0] io_daisy_regs_in_bits
    //input  io_daisy_regs_out_ready
    //output io_daisy_regs_out_valid
    //output[31:0] io_daisy_regs_out_bits
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
);

  wire[31:0] sum;
  wire[31:0] T0;
  wire[31:0] T1;
  wire T2;
  wire[31:0] out;
  wire[31:0] T3;
  wire[31:0] T4;
  wire[31:0] T5;
  wire[31:0] T6;
  wire[31:0] T7;
  wire[31:0] T8;
  wire[31:0] T9;
  wire T10;
  wire[31:0] T11;
  wire T12;
  wire[31:0] T13;
  wire T14;
  wire[31:0] T15;
  wire T16;
  wire[31:0] shiftl;
  wire[31:0] T17;
  wire[31:0] T18;
  wire[30:0] T19;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[31:0] T22;
  wire[29:0] T23;
  wire[31:0] T24;
  wire[31:0] T25;
  wire[31:0] T26;
  wire[27:0] T27;
  wire[31:0] T28;
  wire[31:0] T29;
  wire[31:0] T30;
  wire[23:0] T31;
  wire[31:0] T32;
  wire[31:0] T33;
  wire[31:0] T34;
  wire[15:0] T35;
  wire[31:0] T36;
  wire[31:0] T102;
  wire[15:0] T37;
  wire[31:0] T38;
  wire[31:0] T103;
  wire[23:0] T39;
  wire[31:0] T40;
  wire[31:0] T104;
  wire[27:0] T41;
  wire[31:0] T42;
  wire[31:0] T105;
  wire[29:0] T43;
  wire[31:0] T44;
  wire[31:0] T106;
  wire[30:0] T45;
  wire T46;
  wire[31:0] shiftr;
  wire[32:0] T47;
  wire[4:0] shamt;
  wire[4:0] T48;
  wire[32:0] T49;
  wire[32:0] T50;
  wire[31:0] shin;
  wire[31:0] T51;
  wire[31:0] T52;
  wire[31:0] T53;
  wire[30:0] T54;
  wire[31:0] T55;
  wire[31:0] T56;
  wire[31:0] T57;
  wire[29:0] T58;
  wire[31:0] T59;
  wire[31:0] T60;
  wire[31:0] T61;
  wire[27:0] T62;
  wire[31:0] T63;
  wire[31:0] T64;
  wire[31:0] T65;
  wire[23:0] T66;
  wire[31:0] T67;
  wire[31:0] T68;
  wire[31:0] T69;
  wire[15:0] T70;
  wire[31:0] T71;
  wire[31:0] T107;
  wire[15:0] T72;
  wire[31:0] T73;
  wire[31:0] T108;
  wire[23:0] T74;
  wire[31:0] T75;
  wire[31:0] T109;
  wire[27:0] T76;
  wire[31:0] T77;
  wire[31:0] T110;
  wire[29:0] T78;
  wire[31:0] T79;
  wire[31:0] T111;
  wire[30:0] T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire T86;
  wire T87;
  wire[31:0] T112;
  wire cmp;
  wire T88;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire T94;
  wire T95;
  wire T96;
  wire T97;
  wire T98;
  wire T99;
  wire T100;
  wire T101;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
//  assign io_daisy_regs_out_bits = {1{$random}};
//  assign io_daisy_regs_out_valid = {1{$random}};
//  assign io_daisy_regs_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign io_sum = sum;
  assign sum = io_A + T0;
  assign T0 = T2 ? T1 : io_B;
  assign T1 = 32'h0 - io_B;
  assign T2 = io_alu_op[1'h0];
  assign io_out = out;
  assign out = T99 ? sum : T3;
  assign T3 = T96 ? T112 : T4;
  assign T4 = T85 ? shiftr : T5;
  assign T5 = T46 ? shiftl : T6;
  assign T6 = T16 ? T15 : T7;
  assign T7 = T14 ? T13 : T8;
  assign T8 = T12 ? T11 : T9;
  assign T9 = T10 ? io_A : io_B;
  assign T10 = io_alu_op == 4'ha;
  assign T11 = io_A ^ io_B;
  assign T12 = io_alu_op == 4'h4;
  assign T13 = io_A | io_B;
  assign T14 = io_alu_op == 4'h3;
  assign T15 = io_A & io_B;
  assign T16 = io_alu_op == 4'h2;
  assign shiftl = T44 | T17;
  assign T17 = T18 & 32'haaaaaaaa;
  assign T18 = T19 << 1'h1;
  assign T19 = T20[5'h1e:1'h0];
  assign T20 = T42 | T21;
  assign T21 = T22 & 32'hcccccccc;
  assign T22 = T23 << 2'h2;
  assign T23 = T24[5'h1d:1'h0];
  assign T24 = T40 | T25;
  assign T25 = T26 & 32'hf0f0f0f0;
  assign T26 = T27 << 3'h4;
  assign T27 = T28[5'h1b:1'h0];
  assign T28 = T38 | T29;
  assign T29 = T30 & 32'hff00ff00;
  assign T30 = T31 << 4'h8;
  assign T31 = T32[5'h17:1'h0];
  assign T32 = T36 | T33;
  assign T33 = T34 & 32'hffff0000;
  assign T34 = T35 << 5'h10;
  assign T35 = shiftr[4'hf:1'h0];
  assign T36 = T102 & 32'hffff;
  assign T102 = {16'h0, T37};
  assign T37 = shiftr >> 5'h10;
  assign T38 = T103 & 32'hff00ff;
  assign T103 = {8'h0, T39};
  assign T39 = T32 >> 4'h8;
  assign T40 = T104 & 32'hf0f0f0f;
  assign T104 = {4'h0, T41};
  assign T41 = T28 >> 3'h4;
  assign T42 = T105 & 32'h33333333;
  assign T105 = {2'h0, T43};
  assign T43 = T24 >> 2'h2;
  assign T44 = T106 & 32'h55555555;
  assign T106 = {1'h0, T45};
  assign T45 = T20 >> 1'h1;
  assign T46 = io_alu_op == 4'h6;
  assign shiftr = T47[5'h1f:1'h0];
  assign T47 = $signed(T49) >>> shamt;
  assign shamt = T48;
  assign T48 = io_B[3'h4:1'h0];
  assign T49 = T50;
  assign T50 = {T82, shin};
  assign shin = T81 ? io_A : T51;
  assign T51 = T79 | T52;
  assign T52 = T53 & 32'haaaaaaaa;
  assign T53 = T54 << 1'h1;
  assign T54 = T55[5'h1e:1'h0];
  assign T55 = T77 | T56;
  assign T56 = T57 & 32'hcccccccc;
  assign T57 = T58 << 2'h2;
  assign T58 = T59[5'h1d:1'h0];
  assign T59 = T75 | T60;
  assign T60 = T61 & 32'hf0f0f0f0;
  assign T61 = T62 << 3'h4;
  assign T62 = T63[5'h1b:1'h0];
  assign T63 = T73 | T64;
  assign T64 = T65 & 32'hff00ff00;
  assign T65 = T66 << 4'h8;
  assign T66 = T67[5'h17:1'h0];
  assign T67 = T71 | T68;
  assign T68 = T69 & 32'hffff0000;
  assign T69 = T70 << 5'h10;
  assign T70 = io_A[4'hf:1'h0];
  assign T71 = T107 & 32'hffff;
  assign T107 = {16'h0, T72};
  assign T72 = io_A >> 5'h10;
  assign T73 = T108 & 32'hff00ff;
  assign T108 = {8'h0, T74};
  assign T74 = T67 >> 4'h8;
  assign T75 = T109 & 32'hf0f0f0f;
  assign T109 = {4'h0, T76};
  assign T76 = T63 >> 3'h4;
  assign T77 = T110 & 32'h33333333;
  assign T110 = {2'h0, T78};
  assign T78 = T59 >> 2'h2;
  assign T79 = T111 & 32'h55555555;
  assign T111 = {1'h0, T80};
  assign T80 = T55 >> 1'h1;
  assign T81 = io_alu_op[2'h3];
  assign T82 = T84 & T83;
  assign T83 = shin[5'h1f];
  assign T84 = io_alu_op[1'h0];
  assign T85 = T87 | T86;
  assign T86 = io_alu_op == 4'h8;
  assign T87 = io_alu_op == 4'h9;
  assign T112 = {31'h0, cmp};
  assign cmp = T93 ? T92 : T88;
  assign T88 = T91 ? T90 : T89;
  assign T89 = io_A[5'h1f];
  assign T90 = io_B[5'h1f];
  assign T91 = io_alu_op[1'h1];
  assign T92 = sum[5'h1f];
  assign T93 = T95 == T94;
  assign T94 = io_B[5'h1f];
  assign T95 = io_A[5'h1f];
  assign T96 = T98 | T97;
  assign T97 = io_alu_op == 4'h7;
  assign T98 = io_alu_op == 4'h5;
  assign T99 = T101 | T100;
  assign T100 = io_alu_op == 4'h1;
  assign T101 = io_alu_op == 4'h0;
endmodule

module ImmGenWire(input host__reset,
    input [31:0] io_inst,
    input [2:0] io_sel,
    output[31:0] io_out
    //output io_daisy_regs_in_ready
    //input  io_daisy_regs_in_valid
    //input [31:0] io_daisy_regs_in_bits
    //input  io_daisy_regs_out_ready
    //output io_daisy_regs_out_valid
    //output[31:0] io_daisy_regs_out_bits
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
);

  wire[31:0] T0;
  wire[31:0] T1;
  wire[31:0] T2;
  wire[31:0] T3;
  wire[31:0] T39;
  wire[20:0] T4;
  wire[20:0] T40;
  wire[11:0] T5;
  wire[11:0] T6;
  wire[11:0] Iimm;
  wire[11:0] T37;
  wire[11:0] T41;
  wire[5:0] Zimm;
  wire[5:0] T7;
  wire[4:0] T8;
  wire[5:0] T42;
  wire T43;
  wire T9;
  wire[8:0] T44;
  wire T45;
  wire[20:0] Jimm;
  wire[20:0] T10;
  wire[10:0] T11;
  wire[4:0] T12;
  wire[3:0] T13;
  wire[5:0] T14;
  wire[9:0] T15;
  wire[8:0] T16;
  wire T17;
  wire[7:0] T18;
  wire T19;
  wire T20;
  wire[10:0] T46;
  wire T47;
  wire[31:0] Uimm;
  wire[31:0] T21;
  wire[19:0] T22;
  wire T23;
  wire[31:0] T48;
  wire[12:0] Bimm;
  wire[12:0] T24;
  wire[10:0] T25;
  wire[4:0] T26;
  wire[3:0] T27;
  wire[5:0] T28;
  wire[1:0] T29;
  wire T30;
  wire T31;
  wire[18:0] T49;
  wire T50;
  wire T32;
  wire[31:0] T51;
  wire[11:0] Simm;
  wire[11:0] T33;
  wire[4:0] T34;
  wire[6:0] T35;
  wire[19:0] T52;
  wire T53;
  wire T36;
  wire[31:0] T54;
  wire[19:0] T55;
  wire T56;
  wire T38;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
//  assign io_daisy_regs_out_bits = {1{$random}};
//  assign io_daisy_regs_out_valid = {1{$random}};
//  assign io_daisy_regs_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign io_out = T0;
  assign T0 = T38 ? T54 : T1;
  assign T1 = T36 ? T51 : T2;
  assign T2 = T32 ? T48 : T3;
  assign T3 = T23 ? Uimm : T39;
  assign T39 = {T46, T4};
  assign T4 = T20 ? Jimm : T40;
  assign T40 = {T44, T5};
  assign T5 = T9 ? T41 : T6;
  assign T6 = Iimm & 12'hffe;
  assign Iimm = T37;
  assign T37 = io_inst[5'h1f:5'h14];
  assign T41 = {T42, Zimm};
  assign Zimm = T7;
  assign T7 = {1'h0, T8};
  assign T8 = io_inst[5'h13:4'hf];
  assign T42 = T43 ? 6'h3f : 6'h0;
  assign T43 = Zimm[3'h5];
  assign T9 = io_sel == 3'h6;
  assign T44 = T45 ? 9'h1ff : 9'h0;
  assign T45 = T5[4'hb];
  assign Jimm = T10;
  assign T10 = {T15, T11};
  assign T11 = {T14, T12};
  assign T12 = {T13, 1'h0};
  assign T13 = io_inst[5'h18:5'h15];
  assign T14 = io_inst[5'h1e:5'h19];
  assign T15 = {T19, T16};
  assign T16 = {T18, T17};
  assign T17 = io_inst[5'h14];
  assign T18 = io_inst[5'h13:4'hc];
  assign T19 = io_inst[5'h1f];
  assign T20 = io_sel == 3'h4;
  assign T46 = T47 ? 11'h7ff : 11'h0;
  assign T47 = T4[5'h14];
  assign Uimm = T21;
  assign T21 = {T22, 12'h0};
  assign T22 = io_inst[5'h1f:4'hc];
  assign T23 = io_sel == 3'h3;
  assign T48 = {T49, Bimm};
  assign Bimm = T24;
  assign T24 = {T29, T25};
  assign T25 = {T28, T26};
  assign T26 = {T27, 1'h0};
  assign T27 = io_inst[4'hb:4'h8];
  assign T28 = io_inst[5'h1e:5'h19];
  assign T29 = {T31, T30};
  assign T30 = io_inst[3'h7];
  assign T31 = io_inst[5'h1f];
  assign T49 = T50 ? 19'h7ffff : 19'h0;
  assign T50 = Bimm[4'hc];
  assign T32 = io_sel == 3'h5;
  assign T51 = {T52, Simm};
  assign Simm = T33;
  assign T33 = {T35, T34};
  assign T34 = io_inst[4'hb:3'h7];
  assign T35 = io_inst[5'h1f:5'h19];
  assign T52 = T53 ? 20'hfffff : 20'h0;
  assign T53 = Simm[4'hb];
  assign T36 = io_sel == 3'h2;
  assign T54 = {T55, Iimm};
  assign T55 = T56 ? 20'hfffff : 20'h0;
  assign T56 = Iimm[4'hb];
  assign T38 = io_sel == 3'h1;
endmodule

module BrCondArea(input host__reset,
    input [31:0] io_rs1,
    input [31:0] io_rs2,
    input [2:0] io_br_type,
    output io_taken
    //output io_daisy_regs_in_ready
    //input  io_daisy_regs_in_valid
    //input [31:0] io_daisy_regs_in_bits
    //input  io_daisy_regs_out_ready
    //output io_daisy_regs_out_valid
    //output[31:0] io_daisy_regs_out_bits
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
);

  wire T0;
  wire T1;
  wire geu;
  wire ltu;
  wire T2;
  wire T3;
  wire[31:0] diff;
  wire isSameSign;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire ge;
  wire lt;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire neq;
  wire T20;
  wire T21;
  wire eq;
  wire T22;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
//  assign io_daisy_regs_out_bits = {1{$random}};
//  assign io_daisy_regs_out_valid = {1{$random}};
//  assign io_daisy_regs_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign io_taken = T0;
  assign T0 = T7 | T1;
  assign T1 = T6 & geu;
  assign geu = ltu ^ 1'h1;
  assign ltu = isSameSign ? T3 : T2;
  assign T2 = io_rs2[5'h1f];
  assign T3 = diff[5'h1f];
  assign diff = io_rs1 - io_rs2;
  assign isSameSign = T5 == T4;
  assign T4 = io_rs2[5'h1f];
  assign T5 = io_rs1[5'h1f];
  assign T6 = io_br_type == 3'h4;
  assign T7 = T10 | T8;
  assign T8 = T9 & ltu;
  assign T9 = io_br_type == 3'h1;
  assign T10 = T15 | T11;
  assign T11 = T14 & ge;
  assign ge = lt ^ 1'h1;
  assign lt = isSameSign ? T13 : T12;
  assign T12 = io_rs1[5'h1f];
  assign T13 = diff[5'h1f];
  assign T14 = io_br_type == 3'h5;
  assign T15 = T18 | T16;
  assign T16 = T17 & lt;
  assign T17 = io_br_type == 3'h2;
  assign T18 = T21 | T19;
  assign T19 = T20 & neq;
  assign neq = diff != 32'h0;
  assign T20 = io_br_type == 3'h6;
  assign T21 = T22 & eq;
  assign eq = neq ^ 1'h1;
  assign T22 = io_br_type == 3'h3;
endmodule

module DaisyDatapath_2(input clk,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_7,
    input [31:0] io_dataIo_data_6,
    input [31:0] io_dataIo_data_5,
    input [31:0] io_dataIo_data_4,
    input [31:0] io_dataIo_data_3,
    input [31:0] io_dataIo_data_2,
    input [31:0] io_dataIo_data_1,
    input [31:0] io_dataIo_data_0,
    input  io_ctrlIo_copyCond,
    input  io_ctrlIo_readCond,
    input  io_ctrlIo_cntrNotZero,
    output io_ctrlIo_outFire,
    output io_ctrlIo_inValid
);

  wire T0;
  reg [31:0] regs_7;
  wire[31:0] T1;
  wire[31:0] T2;
  reg [31:0] regs_6;
  wire[31:0] T3;
  wire[31:0] T4;
  reg [31:0] regs_5;
  wire[31:0] T5;
  wire[31:0] T6;
  reg [31:0] regs_4;
  wire[31:0] T7;
  wire[31:0] T8;
  reg [31:0] regs_3;
  wire[31:0] T9;
  wire[31:0] T10;
  reg [31:0] regs_2;
  wire[31:0] T11;
  wire[31:0] T12;
  reg [31:0] regs_1;
  wire[31:0] T13;
  wire[31:0] T14;
  reg [31:0] regs_0;
  wire[31:0] T15;
  wire[31:0] T16;
  wire readCondAndOutFire;
  wire T17;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regs_7 = {1{$random}};
    regs_6 = {1{$random}};
    regs_5 = {1{$random}};
    regs_4 = {1{$random}};
    regs_3 = {1{$random}};
    regs_2 = {1{$random}};
    regs_1 = {1{$random}};
    regs_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_inValid = io_dataIo_in_valid;
  assign io_ctrlIo_outFire = T0;
  assign T0 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_bits = regs_7;
  assign T1 = readCondAndOutFire ? regs_6 : T2;
  assign T2 = io_ctrlIo_copyCond ? io_dataIo_data_7 : regs_7;
  assign T3 = readCondAndOutFire ? regs_5 : T4;
  assign T4 = io_ctrlIo_copyCond ? io_dataIo_data_6 : regs_6;
  assign T5 = readCondAndOutFire ? regs_4 : T6;
  assign T6 = io_ctrlIo_copyCond ? io_dataIo_data_5 : regs_5;
  assign T7 = readCondAndOutFire ? regs_3 : T8;
  assign T8 = io_ctrlIo_copyCond ? io_dataIo_data_4 : regs_4;
  assign T9 = readCondAndOutFire ? regs_2 : T10;
  assign T10 = io_ctrlIo_copyCond ? io_dataIo_data_3 : regs_3;
  assign T11 = readCondAndOutFire ? regs_1 : T12;
  assign T12 = io_ctrlIo_copyCond ? io_dataIo_data_2 : regs_2;
  assign T13 = readCondAndOutFire ? regs_0 : T14;
  assign T14 = io_ctrlIo_copyCond ? io_dataIo_data_1 : regs_1;
  assign T15 = readCondAndOutFire ? io_dataIo_in_bits : T16;
  assign T16 = io_ctrlIo_copyCond ? io_dataIo_data_0 : regs_0;
  assign readCondAndOutFire = io_ctrlIo_readCond & T17;
  assign T17 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_valid = io_ctrlIo_cntrNotZero;
  assign io_dataIo_in_ready = io_dataIo_out_ready;

  always @(posedge clk) begin
    if(readCondAndOutFire) begin
      regs_7 <= regs_6;
    end else if(io_ctrlIo_copyCond) begin
      regs_7 <= io_dataIo_data_7;
    end
    if(readCondAndOutFire) begin
      regs_6 <= regs_5;
    end else if(io_ctrlIo_copyCond) begin
      regs_6 <= io_dataIo_data_6;
    end
    if(readCondAndOutFire) begin
      regs_5 <= regs_4;
    end else if(io_ctrlIo_copyCond) begin
      regs_5 <= io_dataIo_data_5;
    end
    if(readCondAndOutFire) begin
      regs_4 <= regs_3;
    end else if(io_ctrlIo_copyCond) begin
      regs_4 <= io_dataIo_data_4;
    end
    if(readCondAndOutFire) begin
      regs_3 <= regs_2;
    end else if(io_ctrlIo_copyCond) begin
      regs_3 <= io_dataIo_data_3;
    end
    if(readCondAndOutFire) begin
      regs_2 <= regs_1;
    end else if(io_ctrlIo_copyCond) begin
      regs_2 <= io_dataIo_data_2;
    end
    if(readCondAndOutFire) begin
      regs_1 <= regs_0;
    end else if(io_ctrlIo_copyCond) begin
      regs_1 <= io_dataIo_data_1;
    end
    if(readCondAndOutFire) begin
      regs_0 <= io_dataIo_in_bits;
    end else if(io_ctrlIo_copyCond) begin
      regs_0 <= io_dataIo_data_0;
    end
  end
endmodule

module RegChainControl_2(input clk, input reset,
    input  io_stall,
    output io_ctrlIo_copyCond,
    output io_ctrlIo_readCond,
    output io_ctrlIo_cntrNotZero,
    input  io_ctrlIo_outFire,
    input  io_ctrlIo_inValid
);

  wire T0;
  reg [3:0] counter;
  wire[3:0] T1;
  wire[3:0] T2;
  wire[3:0] T3;
  wire[3:0] T4;
  wire T5;
  wire T6;
  wire T7;
  wire[3:0] T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  reg  copied;
  wire T18;
  reg  R19;
  wire T20;
  wire T21;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    counter = {1{$random}};
    copied = {1{$random}};
    R19 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_cntrNotZero = T0;
  assign T0 = counter != 4'h0;
  assign T1 = reset ? 4'h0 : T2;
  assign T2 = T9 ? T8 : T3;
  assign T3 = T6 ? 4'h8 : T4;
  assign T4 = T5 ? 4'h0 : counter;
  assign T5 = io_stall ^ 1'h1;
  assign T6 = T7 & io_ctrlIo_copyCond;
  assign T7 = T5 ^ 1'h1;
  assign T8 = counter - 4'h1;
  assign T9 = T13 & T10;
  assign T10 = T12 & T11;
  assign T11 = io_ctrlIo_inValid ^ 1'h1;
  assign T12 = io_ctrlIo_readCond & io_ctrlIo_outFire;
  assign T13 = T14 ^ 1'h1;
  assign T14 = T5 | io_ctrlIo_copyCond;
  assign io_ctrlIo_readCond = T15;
  assign T15 = T17 & T16;
  assign T16 = counter != 4'h0;
  assign T17 = io_stall & copied;
  assign io_ctrlIo_copyCond = T18;
  assign T18 = T20 | R19;
  assign T20 = io_stall & T21;
  assign T21 = copied ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      counter <= 4'h0;
    end else if(T9) begin
      counter <= T8;
    end else if(T6) begin
      counter <= 4'h8;
    end else if(T5) begin
      counter <= 4'h0;
    end
    copied <= io_stall;
    R19 <= reset;
  end
endmodule

module RegChain_2(input clk, input reset,
    input  io_stall,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_7,
    input [31:0] io_dataIo_data_6,
    input [31:0] io_dataIo_data_5,
    input [31:0] io_dataIo_data_4,
    input [31:0] io_dataIo_data_3,
    input [31:0] io_dataIo_data_2,
    input [31:0] io_dataIo_data_1,
    input [31:0] io_dataIo_data_0
);

  wire datapath_io_dataIo_in_ready;
  wire datapath_io_dataIo_out_valid;
  wire[31:0] datapath_io_dataIo_out_bits;
  wire datapath_io_ctrlIo_outFire;
  wire datapath_io_ctrlIo_inValid;
  wire control_io_ctrlIo_copyCond;
  wire control_io_ctrlIo_readCond;
  wire control_io_ctrlIo_cntrNotZero;


  assign io_dataIo_out_bits = datapath_io_dataIo_out_bits;
  assign io_dataIo_out_valid = datapath_io_dataIo_out_valid;
  assign io_dataIo_in_ready = datapath_io_dataIo_in_ready;
  DaisyDatapath_2 datapath(.clk(clk),
       .io_dataIo_in_ready( datapath_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_dataIo_in_valid ),
       .io_dataIo_in_bits( io_dataIo_in_bits ),
       .io_dataIo_out_ready( io_dataIo_out_ready ),
       .io_dataIo_out_valid( datapath_io_dataIo_out_valid ),
       .io_dataIo_out_bits( datapath_io_dataIo_out_bits ),
       .io_dataIo_data_7( io_dataIo_data_7 ),
       .io_dataIo_data_6( io_dataIo_data_6 ),
       .io_dataIo_data_5( io_dataIo_data_5 ),
       .io_dataIo_data_4( io_dataIo_data_4 ),
       .io_dataIo_data_3( io_dataIo_data_3 ),
       .io_dataIo_data_2( io_dataIo_data_2 ),
       .io_dataIo_data_1( io_dataIo_data_1 ),
       .io_dataIo_data_0( io_dataIo_data_0 ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
  RegChainControl_2 control(.clk(clk), .reset(reset),
       .io_stall( io_stall ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
endmodule

module Datapath(input clk, input host__reset,
    input  io_host_fromhost_valid,
    input [31:0] io_host_fromhost_bits,
    output[31:0] io_host_tohost,
    output io_icache_abort,
    output io_icache_req_valid,
    output[31:0] io_icache_req_bits_addr,
    output[31:0] io_icache_req_bits_data,
    output[3:0] io_icache_req_bits_mask,
    input  io_icache_resp_valid,
    input [31:0] io_icache_resp_bits_data,
    output io_dcache_abort,
    output io_dcache_req_valid,
    output[31:0] io_dcache_req_bits_addr,
    output[31:0] io_dcache_req_bits_data,
    output[3:0] io_dcache_req_bits_mask,
    input  io_dcache_resp_valid,
    input [31:0] io_dcache_resp_bits_data,
    output[31:0] io_ctrl_inst,
    input [1:0] io_ctrl_pc_sel,
    input  io_ctrl_inst_kill,
    input  io_ctrl_A_sel,
    input  io_ctrl_B_sel,
    input [2:0] io_ctrl_imm_sel,
    input [3:0] io_ctrl_alu_op,
    input [2:0] io_ctrl_br_type,
    input [1:0] io_ctrl_st_type,
    input [2:0] io_ctrl_ld_type,
    input [1:0] io_ctrl_wb_sel,
    input  io_ctrl_wb_en,
    input [2:0] io_ctrl_csr_cmd,
    input  io_ctrl_illegal,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  wire T130;
  wire T0;
  wire[31:0] T1;
  wire[31:0] T2;
  wire[4:0] T3;
  wire[4:0] T4;
  wire[4:0] wb_rd_addr;
  reg [31:0] ew_inst;
  wire[31:0] T131;
  wire[31:0] T132;
  wire[31:0] T133;
  wire[31:0] T5;
  reg [31:0] fe_inst;
  wire[31:0] T134;
  wire[31:0] T135;
  wire[31:0] T136;
  wire[31:0] T6;
  wire[31:0] inst;
  wire T7;
  wire T8;
  wire T9;
  reg  started;
  wire T137;
  wire T10;
  wire stall;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire[31:0] T16;
  wire[31:0] T17;
  reg [31:0] ew_pc;
  wire[31:0] T138;
  reg [31:0] fe_pc;
  wire[31:0] T139;
  reg [31:0] pc;
  wire[31:0] T140;
  wire[31:0] T141;
  wire[31:0] T142;
  wire[31:0] npc;
  wire[31:0] T20;
  wire[31:0] T21;
  wire[31:0] T22;
  wire[31:0] T23;
  wire[31:0] T24;
  wire T25;
  wire[31:0] T26;
  wire T27;
  wire T28;
  wire T29;
  wire T143;
  wire T144;
  wire[399:0] T30;
  wire[31:0] T145;
  wire[19:0] T146;
  wire[18:0] T147;
  reg  wb_en;
  wire T148;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire[11:0] T149;
  reg [1:0] wb_sel;
  wire[1:0] T150;
  wire T151;
  wire[9:0] T152;
  wire[31:0] T153;
  wire[21:0] T154;
  wire[9:0] T155;
  wire[31:0] T156;
  wire[23:0] T157;
  wire[22:0] T158;
  wire[21:0] T159;
  reg  pc_check;
  wire T160;
  wire T95;
  wire T96;
  wire T97;
  reg  illegal;
  wire T161;
  wire T100;
  wire T101;
  wire[7:0] T162;
  wire[4:0] T163;
  reg [2:0] ld_type;
  wire[2:0] T164;
  wire[2:0] T78;
  wire[2:0] T79;
  reg [1:0] st_type;
  wire[1:0] T165;
  wire[1:0] T98;
  wire[1:0] T99;
  wire[2:0] T166;
  reg [31:0] ew_alu;
  wire[31:0] T167;
  wire T168;
  wire[31:0] T169;
  wire[28:0] T170;
  wire[2:0] T171;
  reg [31:0] csr_in;
  wire[31:0] T172;
  wire[31:0] T103;
  wire[31:0] rs1;
  wire T45;
  wire rs1hazard;
  wire T46;
  wire[4:0] rs1_addr;
  wire T47;
  wire T48;
  wire T49;
  wire T104;
  wire T173;
  wire[31:0] T174;
  wire[28:0] T175;
  reg [2:0] csr_cmd;
  wire[2:0] T176;
  wire[2:0] T105;
  wire[2:0] T106;
  wire T177;
  wire[31:0] rs2;
  wire T32;
  wire rs2hazard;
  wire T33;
  wire[4:0] rs2_addr;
  wire T34;
  wire T35;
  wire T43;
  wire[31:0] T50;
  wire T51;
  wire[31:0] T52;
  wire T53;
  wire[31:0] T178;
  wire[32:0] regWrite;
  wire[32:0] T54;
  wire[32:0] T55;
  wire[32:0] T56;
  wire[32:0] T57;
  wire[32:0] T58;
  wire[32:0] T59;
  wire T60;
  wire[32:0] T61;
  wire[32:0] T62;
  wire[31:0] T63;
  wire T64;
  wire[32:0] load;
  wire[32:0] T65;
  wire[32:0] T66;
  wire[32:0] T67;
  wire[32:0] T68;
  wire[32:0] T69;
  wire[32:0] T179;
  wire[8:0] T70;
  wire[8:0] T71;
  wire[7:0] T72;
  wire[31:0] lshift;
  wire[4:0] loffset;
  wire[4:0] T180;
  wire[3:0] T73;
  wire T74;
  wire[4:0] T75;
  wire T76;
  wire[23:0] T181;
  wire T182;
  wire T77;
  wire[32:0] T183;
  wire[16:0] T80;
  wire[16:0] T81;
  wire[15:0] T82;
  wire[15:0] T184;
  wire T185;
  wire T83;
  wire[32:0] T186;
  wire[7:0] T84;
  wire[7:0] T85;
  wire[24:0] T187;
  wire T188;
  wire T86;
  wire[32:0] T189;
  wire[15:0] T87;
  wire[15:0] T88;
  wire[16:0] T190;
  wire T191;
  wire T89;
  wire T90;
  wire T91;
  wire T92;
  wire T93;
  wire T94;
  wire[3:0] T192;
  wire[4:0] T107;
  wire[4:0] T108;
  wire[4:0] T193;
  wire[3:0] T109;
  wire[3:0] T110;
  wire[1:0] T111;
  wire T112;
  wire[1:0] T113;
  wire[4:0] T114;
  wire[1:0] T115;
  wire T116;
  wire T117;
  wire[31:0] T194;
  wire[62:0] T118;
  wire[4:0] woffset;
  wire[4:0] T195;
  wire[3:0] T119;
  wire T120;
  wire[4:0] T121;
  wire T122;
  wire[31:0] daddr;
  wire[31:0] T123;
  wire T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire[31:0] alu_io_out;
  wire[31:0] alu_io_sum;
  wire[31:0] immGen_io_out;
  wire brCond_io_taken;
  wire RegChain_io_dataIo_in_ready;
  wire RegChain_io_dataIo_out_valid;
  wire[31:0] RegChain_io_dataIo_out_bits;
  wire[31:0] csr_io_out;
  wire csr_io_expt;
  wire[31:0] csr_io_evec;
  wire[31:0] csr_io_epc;
  wire[31:0] csr_io_host_tohost;
  wire csr_io_daisy_regs_in_ready;
  wire csr_io_daisy_regs_out_valid;
  wire[31:0] csr_io_daisy_regs_out_bits;
  wire[31:0] regFile_io_rdata1;
  wire[31:0] regFile_io_rdata2;
  wire regFile_io_daisy_regs_in_ready;
  wire regFile_io_daisy_regs_out_valid;
  wire[31:0] regFile_io_daisy_regs_out_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    ew_inst = {1{$random}};
    fe_inst = {1{$random}};
    started = {1{$random}};
    ew_pc = {1{$random}};
    fe_pc = {1{$random}};
    pc = {1{$random}};
    wb_en = {1{$random}};
    wb_sel = {1{$random}};
    pc_check = {1{$random}};
    illegal = {1{$random}};
    ld_type = {1{$random}};
    st_type = {1{$random}};
    ew_alu = {1{$random}};
    csr_in = {1{$random}};
    csr_cmd = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign T130 = T0 & fire_pin;
  assign T0 = host__reset ^ 1'h1;
  assign T1 = T2;
  assign T2 = T91 ? T178 : 32'h0;
  assign T3 = T4;
  assign T4 = T91 ? wb_rd_addr : 5'h0;
  assign wb_rd_addr = ew_inst[4'hb:3'h7];
  assign T131 = host__reset ? 32'h13 : T132;
  assign T132 = fire_pin ? T133 : ew_inst;
  assign T133 = host__reset ? 32'h13 : T5;
  assign T5 = T13 ? fe_inst : ew_inst;
  assign T134 = host__reset ? 32'h13 : T135;
  assign T135 = fire_pin ? T136 : fe_inst;
  assign T136 = host__reset ? 32'h13 : T6;
  assign T6 = T10 ? inst : fe_inst;
  assign inst = T7 ? 32'h13 : io_icache_resp_bits_data;
  assign T7 = T8 | csr_io_expt;
  assign T8 = T9 | brCond_io_taken;
  assign T9 = started | io_ctrl_inst_kill;
  assign T137 = fire_pin ? host__reset : started;
  assign T10 = stall ^ 1'h1;
  assign stall = T12 | T11;
  assign T11 = io_dcache_resp_valid ^ 1'h1;
  assign T12 = io_icache_resp_valid ^ 1'h1;
  assign T13 = T15 & T14;
  assign T14 = csr_io_expt ^ 1'h1;
  assign T15 = stall ^ 1'h1;
  assign T16 = ew_inst;
  assign T17 = ew_pc;
  assign T138 = T144 ? fe_pc : ew_pc;
  assign T139 = T143 ? pc : fe_pc;
  assign T140 = host__reset ? 32'h1fc : T141;
  assign T141 = fire_pin ? T142 : pc;
  assign T142 = host__reset ? 32'h1fc : npc;
  assign npc = stall ? pc : T20;
  assign T20 = csr_io_expt ? csr_io_evec : T21;
  assign T21 = T29 ? csr_io_epc : T22;
  assign T22 = T27 ? T26 : T23;
  assign T23 = T25 ? pc : T24;
  assign T24 = pc + 32'h4;
  assign T25 = io_ctrl_pc_sel == 2'h2;
  assign T26 = alu_io_sum & 32'hfffffffe;
  assign T27 = T28 | brCond_io_taken;
  assign T28 = io_ctrl_pc_sel == 2'h1;
  assign T29 = io_ctrl_pc_sel == 2'h3;
  assign T143 = T10 & fire_pin;
  assign T144 = T13 & fire_pin;
  assign T145 = {T149, T146};
  assign T146 = {wb_en, T147};
  assign T147 = {started, 18'h0};
  assign T148 = fire_pin ? T36 : wb_en;
  assign T36 = T38 ? 1'h0 : T37;
  assign T37 = T13 ? io_ctrl_wb_en : wb_en;
  assign T38 = T42 & T39;
  assign T39 = host__reset | T40;
  assign T40 = T41 & csr_io_expt;
  assign T41 = stall ^ 1'h1;
  assign T42 = T13 ^ 1'h1;
  assign T149 = {T152, wb_sel};
  assign T150 = T151 ? io_ctrl_wb_sel : wb_sel;
  assign T151 = T13 & fire_pin;
  assign T152 = fe_pc[4'h9:1'h0];
  assign T153 = {T155, T154};
  assign T154 = fe_pc[5'h1f:4'ha];
  assign T155 = pc[4'h9:1'h0];
  assign T156 = {T162, T157};
  assign T157 = {illegal, T158};
  assign T158 = {pc_check, T159};
  assign T159 = pc[5'h1f:4'ha];
  assign T160 = fire_pin ? T95 : pc_check;
  assign T95 = T38 ? 1'h0 : T96;
  assign T96 = T13 ? T97 : pc_check;
  assign T97 = io_ctrl_pc_sel == 2'h1;
  assign T161 = fire_pin ? T100 : illegal;
  assign T100 = T38 ? 1'h0 : T101;
  assign T101 = T13 ? io_ctrl_illegal : illegal;
  assign T162 = {T166, T163};
  assign T163 = {st_type, ld_type};
  assign T164 = fire_pin ? T78 : ld_type;
  assign T78 = T38 ? 3'h0 : T79;
  assign T79 = T13 ? io_ctrl_ld_type : ld_type;
  assign T165 = fire_pin ? T98 : st_type;
  assign T98 = T38 ? 2'h0 : T99;
  assign T99 = T13 ? io_ctrl_st_type : st_type;
  assign T166 = ew_alu[2'h2:1'h0];
  assign T167 = T168 ? alu_io_out : ew_alu;
  assign T168 = T13 & fire_pin;
  assign T169 = {T171, T170};
  assign T170 = ew_alu[5'h1f:2'h3];
  assign T171 = csr_in[2'h2:1'h0];
  assign T172 = T173 ? T103 : csr_in;
  assign T103 = T104 ? immGen_io_out : rs1;
  assign rs1 = T45 ? ew_alu : regFile_io_rdata1;
  assign T45 = T49 & rs1hazard;
  assign rs1hazard = T47 & T46;
  assign T46 = rs1_addr == wb_rd_addr;
  assign rs1_addr = fe_inst[5'h13:4'hf];
  assign T47 = wb_en & T48;
  assign T48 = rs1_addr != 5'h0;
  assign T49 = wb_sel == 2'h0;
  assign T104 = io_ctrl_imm_sel == 3'h6;
  assign T173 = T13 & fire_pin;
  assign T174 = {csr_cmd, T175};
  assign T175 = csr_in[5'h1f:2'h3];
  assign T176 = fire_pin ? T105 : csr_cmd;
  assign T105 = T38 ? 3'h0 : T106;
  assign T106 = T13 ? io_ctrl_csr_cmd : csr_cmd;
  assign T177 = fire_pin ^ 1'h1;
  assign rs2 = T32 ? ew_alu : regFile_io_rdata2;
  assign T32 = T43 & rs2hazard;
  assign rs2hazard = T34 & T33;
  assign T33 = rs2_addr == wb_rd_addr;
  assign rs2_addr = fe_inst[5'h18:5'h14];
  assign T34 = wb_en & T35;
  assign T35 = rs2_addr != 5'h0;
  assign T43 = wb_sel == 2'h0;
  assign T50 = T51 ? rs2 : immGen_io_out;
  assign T51 = io_ctrl_B_sel == 1'h1;
  assign T52 = T53 ? rs1 : fe_pc;
  assign T53 = io_ctrl_A_sel == 1'h1;
  assign T178 = regWrite[5'h1f:1'h0];
  assign regWrite = T90 ? load : T54;
  assign T54 = T64 ? T61 : T55;
  assign T55 = T60 ? T58 : T56;
  assign T56 = T57;
  assign T57 = {1'h0, ew_alu};
  assign T58 = T59;
  assign T59 = {1'h0, csr_io_out};
  assign T60 = wb_sel == 2'h3;
  assign T61 = T62;
  assign T62 = {1'h0, T63};
  assign T63 = ew_pc + 32'h4;
  assign T64 = wb_sel == 2'h2;
  assign load = T89 ? T189 : T65;
  assign T65 = T86 ? T186 : T66;
  assign T66 = T83 ? T183 : T67;
  assign T67 = T77 ? T179 : T68;
  assign T68 = T69;
  assign T69 = {1'h0, io_dcache_resp_bits_data};
  assign T179 = {T181, T70};
  assign T70 = T71;
  assign T71 = {1'h0, T72};
  assign T72 = lshift[3'h7:1'h0];
  assign lshift = io_dcache_resp_bits_data >> loffset;
  assign loffset = T75 | T180;
  assign T180 = {1'h0, T73};
  assign T73 = T74 << 2'h3;
  assign T74 = ew_alu[1'h0];
  assign T75 = T76 << 3'h4;
  assign T76 = ew_alu[1'h1];
  assign T181 = T182 ? 24'hffffff : 24'h0;
  assign T182 = T70[4'h8];
  assign T77 = ld_type == 3'h5;
  assign T183 = {T184, T80};
  assign T80 = T81;
  assign T81 = {1'h0, T82};
  assign T82 = lshift[4'hf:1'h0];
  assign T184 = T185 ? 16'hffff : 16'h0;
  assign T185 = T80[5'h10];
  assign T83 = ld_type == 3'h4;
  assign T186 = {T187, T84};
  assign T84 = T85;
  assign T85 = lshift[3'h7:1'h0];
  assign T187 = T188 ? 25'h1ffffff : 25'h0;
  assign T188 = T84[3'h7];
  assign T86 = ld_type == 3'h3;
  assign T189 = {T190, T87};
  assign T87 = T88;
  assign T88 = lshift[4'hf:1'h0];
  assign T190 = T191 ? 17'h1ffff : 17'h0;
  assign T191 = T87[4'hf];
  assign T89 = ld_type == 3'h2;
  assign T90 = wb_sel == 2'h1;
  assign T91 = T93 & T92;
  assign T92 = csr_io_expt ^ 1'h1;
  assign T93 = wb_en & T94;
  assign T94 = stall ^ 1'h1;
  assign io_daisy_regs_out_bits = RegChain_io_dataIo_out_bits;
  assign io_daisy_regs_out_valid = RegChain_io_dataIo_out_valid;
  assign io_daisy_regs_in_ready = regFile_io_daisy_regs_in_ready;
  assign io_ctrl_inst = fe_inst;
  assign io_dcache_req_bits_mask = T192;
  assign T192 = T107[2'h3:1'h0];
  assign T107 = T117 ? 5'hf : T108;
  assign T108 = T116 ? T114 : T193;
  assign T193 = {1'h0, T109};
  assign T109 = T112 ? T110 : 4'h0;
  assign T110 = 1'h1 << T111;
  assign T111 = alu_io_sum[1'h1:1'h0];
  assign T112 = T113 == 2'h3;
  assign T113 = stall ? st_type : io_ctrl_st_type;
  assign T114 = 2'h3 << T115;
  assign T115 = alu_io_sum[1'h1:1'h0];
  assign T116 = T113 == 2'h2;
  assign T117 = T113 == 2'h1;
  assign io_dcache_req_bits_data = T194;
  assign T194 = T118[5'h1f:1'h0];
  assign T118 = rs2 << woffset;
  assign woffset = T121 | T195;
  assign T195 = {1'h0, T119};
  assign T119 = T120 << 2'h3;
  assign T120 = alu_io_sum[1'h0];
  assign T121 = T122 << 3'h4;
  assign T122 = alu_io_sum[1'h1];
  assign io_dcache_req_bits_addr = daddr;
  assign daddr = T123 & 32'hfffffffc;
  assign T123 = stall ? ew_alu : alu_io_sum;
  assign io_dcache_req_valid = T124;
  assign T124 = T128 & T125;
  assign T125 = T127 | T126;
  assign T126 = io_ctrl_ld_type != 3'h0;
  assign T127 = io_ctrl_st_type != 2'h0;
  assign T128 = stall ^ 1'h1;
  assign io_dcache_abort = csr_io_expt;
  assign io_icache_req_bits_mask = 4'h0;
  assign io_icache_req_bits_data = 32'h0;
  assign io_icache_req_bits_addr = npc;
  assign io_icache_req_valid = T129;
  assign T129 = stall ^ 1'h1;
  assign io_icache_abort = 1'h0;
  assign io_host_tohost = csr_io_host_tohost;
  CSR csr(.clk(clk), .host__reset(host__reset),
       .io_stall( stall ),
       .io_cmd( csr_cmd ),
       .io_in( csr_in ),
       .io_out( csr_io_out ),
       .io_pc( ew_pc ),
       .io_addr( ew_alu ),
       .io_inst( ew_inst ),
       .io_illegal( illegal ),
       .io_st_type( st_type ),
       .io_ld_type( ld_type ),
       .io_pc_check( pc_check ),
       .io_expt( csr_io_expt ),
       .io_evec( csr_io_evec ),
       .io_epc( csr_io_epc ),
       .io_host_fromhost_valid( io_host_fromhost_valid ),
       .io_host_fromhost_bits( io_host_fromhost_bits ),
       .io_host_tohost( csr_io_host_tohost ),
       .io_daisy_regs_in_ready( csr_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( regFile_io_daisy_regs_out_valid ),
       .io_daisy_regs_in_bits( regFile_io_daisy_regs_out_bits ),
       .io_daisy_regs_out_ready( RegChain_io_dataIo_in_ready ),
       .io_daisy_regs_out_valid( csr_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( csr_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
  RegFile regFile(.clk(clk), .host__reset(host__reset),
       .io_raddr1( rs1_addr ),
       .io_raddr2( rs2_addr ),
       .io_rdata1( regFile_io_rdata1 ),
       .io_rdata2( regFile_io_rdata2 ),
       .io_wen( T91 ),
       .io_waddr( wb_rd_addr ),
       .io_wdata( T178 ),
       .io_daisy_regs_in_ready( regFile_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( io_daisy_regs_in_valid ),
       .io_daisy_regs_in_bits( io_daisy_regs_in_bits ),
       .io_daisy_regs_out_ready( csr_io_daisy_regs_in_ready ),
       .io_daisy_regs_out_valid( regFile_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( regFile_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
  ALUArea alu(.host__reset(host__reset),
       .io_A( T52 ),
       .io_B( T50 ),
       .io_alu_op( io_ctrl_alu_op ),
       .io_out( alu_io_out ),
       .io_sum( alu_io_sum )
       //.io_daisy_regs_in_ready(  )
       //.io_daisy_regs_in_valid(  )
       //.io_daisy_regs_in_bits(  )
       //.io_daisy_regs_out_ready(  )
       //.io_daisy_regs_out_valid(  )
       //.io_daisy_regs_out_bits(  )
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
  );
  ImmGenWire immGen(.host__reset(host__reset),
       .io_inst( fe_inst ),
       .io_sel( io_ctrl_imm_sel ),
       .io_out( immGen_io_out )
       //.io_daisy_regs_in_ready(  )
       //.io_daisy_regs_in_valid(  )
       //.io_daisy_regs_in_bits(  )
       //.io_daisy_regs_out_ready(  )
       //.io_daisy_regs_out_valid(  )
       //.io_daisy_regs_out_bits(  )
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
  );
  BrCondArea brCond(.host__reset(host__reset),
       .io_rs1( rs1 ),
       .io_rs2( rs2 ),
       .io_br_type( io_ctrl_br_type ),
       .io_taken( brCond_io_taken )
       //.io_daisy_regs_in_ready(  )
       //.io_daisy_regs_in_valid(  )
       //.io_daisy_regs_in_bits(  )
       //.io_daisy_regs_out_ready(  )
       //.io_daisy_regs_out_valid(  )
       //.io_daisy_regs_out_bits(  )
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
  );
  RegChain_2 RegChain(.clk(clk), .reset(daisy__rst),
       .io_stall( T177 ),
       .io_dataIo_in_ready( RegChain_io_dataIo_in_ready ),
       .io_dataIo_in_valid( csr_io_daisy_regs_out_valid ),
       .io_dataIo_in_bits( csr_io_daisy_regs_out_bits ),
       .io_dataIo_out_ready( io_daisy_regs_out_ready ),
       .io_dataIo_out_valid( RegChain_io_dataIo_out_valid ),
       .io_dataIo_out_bits( RegChain_io_dataIo_out_bits ),
       .io_dataIo_data_7( ew_pc ),
       .io_dataIo_data_6( ew_inst ),
       .io_dataIo_data_5( fe_inst ),
       .io_dataIo_data_4( T174 ),
       .io_dataIo_data_3( T169 ),
       .io_dataIo_data_2( T156 ),
       .io_dataIo_data_1( T153 ),
       .io_dataIo_data_0( T145 )
  );

  always @(posedge clk) begin
    if(host__reset) begin
      ew_inst <= 32'h13;
    end else if(fire_pin) begin
      ew_inst <= T133;
    end
    if(host__reset) begin
      fe_inst <= 32'h13;
    end else if(fire_pin) begin
      fe_inst <= T136;
    end
    if(fire_pin) begin
      started <= host__reset;
    end
    if(T144) begin
      ew_pc <= fe_pc;
    end
    if(T143) begin
      fe_pc <= pc;
    end
    if(host__reset) begin
      pc <= 32'h1fc;
    end else if(fire_pin) begin
      pc <= T142;
    end
    if(fire_pin) begin
      wb_en <= T36;
    end
    if(T151) begin
      wb_sel <= io_ctrl_wb_sel;
    end
    if(fire_pin) begin
      pc_check <= T95;
    end
    if(fire_pin) begin
      illegal <= T100;
    end
    if(fire_pin) begin
      ld_type <= T78;
    end
    if(fire_pin) begin
      st_type <= T98;
    end
    if(T168) begin
      ew_alu <= alu_io_out;
    end
    if(T173) begin
      csr_in <= T103;
    end
    if(fire_pin) begin
      csr_cmd <= T105;
    end
`ifndef SYNTHESIS
// synthesis translate_off
`ifdef PRINTF_COND
    if (`PRINTF_COND)
`endif
      if (T130)
        $fwrite(32'h80000002, "PC: %h, INST: %h, REG[%d] <- %h\n", T17, T16, T3, T1);
// synthesis translate_on
`endif
  end
endmodule

module Control(input host__reset,
    input [31:0] io_ctrl_inst,
    output[1:0] io_ctrl_pc_sel,
    output io_ctrl_inst_kill,
    output io_ctrl_A_sel,
    output io_ctrl_B_sel,
    output[2:0] io_ctrl_imm_sel,
    output[3:0] io_ctrl_alu_op,
    output[2:0] io_ctrl_br_type,
    output[1:0] io_ctrl_st_type,
    output[2:0] io_ctrl_ld_type,
    output[1:0] io_ctrl_wb_sel,
    output io_ctrl_wb_en,
    output[2:0] io_ctrl_csr_cmd,
    output io_ctrl_illegal
    //output io_daisy_regs_in_ready
    //input  io_daisy_regs_in_valid
    //input [31:0] io_daisy_regs_in_bits
    //input  io_daisy_regs_out_ready
    //output io_daisy_regs_out_valid
    //output[31:0] io_daisy_regs_out_bits
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
);

  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire[31:0] T54;
  wire T55;
  wire[31:0] T56;
  wire T57;
  wire[31:0] T58;
  wire T59;
  wire[31:0] T60;
  wire T61;
  wire[31:0] T62;
  wire T63;
  wire[31:0] T64;
  wire T65;
  wire T66;
  wire[31:0] T67;
  wire T68;
  wire[31:0] T69;
  wire T70;
  wire[31:0] T71;
  wire T72;
  wire[31:0] T73;
  wire T74;
  wire[31:0] T75;
  wire T76;
  wire[31:0] T77;
  wire T78;
  wire[31:0] T79;
  wire T80;
  wire[31:0] T81;
  wire T82;
  wire[31:0] T83;
  wire T84;
  wire[31:0] T85;
  wire T86;
  wire[31:0] T87;
  wire T88;
  wire[31:0] T89;
  wire T90;
  wire[31:0] T91;
  wire T92;
  wire[31:0] T93;
  wire T94;
  wire[31:0] T95;
  wire T96;
  wire[31:0] T97;
  wire T98;
  wire[31:0] T99;
  wire T100;
  wire[31:0] T101;
  wire T102;
  wire[31:0] T103;
  wire T104;
  wire[31:0] T105;
  wire T106;
  wire[31:0] T107;
  wire T108;
  wire[31:0] T109;
  wire T110;
  wire[31:0] T111;
  wire T112;
  wire[31:0] T113;
  wire T114;
  wire[31:0] T115;
  wire T116;
  wire[31:0] T117;
  wire T118;
  wire[31:0] T119;
  wire T120;
  wire[31:0] T121;
  wire T122;
  wire[31:0] T123;
  wire T124;
  wire[31:0] T125;
  wire T126;
  wire[31:0] T127;
  wire T128;
  wire[31:0] T129;
  wire T130;
  wire[31:0] T131;
  wire T132;
  wire[31:0] T133;
  wire T134;
  wire[31:0] T135;
  wire T136;
  wire[31:0] T137;
  wire T138;
  wire[31:0] T139;
  wire T140;
  wire[31:0] T141;
  wire[2:0] T142;
  wire[2:0] T143;
  wire[2:0] T144;
  wire[2:0] T145;
  wire[2:0] T146;
  wire[2:0] T147;
  wire[2:0] T148;
  wire[2:0] T149;
  wire[2:0] T150;
  wire[2:0] T151;
  wire[2:0] T152;
  wire[2:0] T153;
  wire[2:0] T154;
  wire[2:0] T155;
  wire[2:0] T156;
  wire[2:0] T157;
  wire[2:0] T158;
  wire[2:0] T159;
  wire[2:0] T160;
  wire[2:0] T161;
  wire[2:0] T162;
  wire[2:0] T163;
  wire[2:0] T164;
  wire[2:0] T165;
  wire[2:0] T166;
  wire[2:0] T167;
  wire[2:0] T168;
  wire[2:0] T169;
  wire[2:0] T170;
  wire[2:0] T171;
  wire[2:0] T172;
  wire[2:0] T173;
  wire[2:0] T174;
  wire[2:0] T175;
  wire[2:0] T176;
  wire[2:0] T177;
  wire[2:0] T178;
  wire[2:0] T179;
  wire[2:0] T180;
  wire[2:0] T181;
  wire[2:0] T182;
  wire[2:0] T183;
  wire[2:0] T184;
  wire[2:0] T185;
  wire[2:0] T186;
  wire[2:0] T187;
  wire[2:0] T188;
  wire[2:0] T189;
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
  wire T207;
  wire T208;
  wire T209;
  wire T210;
  wire T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire T221;
  wire T222;
  wire T223;
  wire T224;
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
  wire[1:0] T235;
  wire[1:0] T236;
  wire[1:0] T237;
  wire[1:0] T238;
  wire[1:0] T239;
  wire[1:0] T240;
  wire[1:0] T241;
  wire[1:0] T242;
  wire[1:0] T243;
  wire[1:0] T244;
  wire[1:0] T245;
  wire[1:0] T246;
  wire[1:0] T247;
  wire[1:0] T248;
  wire[1:0] T249;
  wire[1:0] T250;
  wire[1:0] T251;
  wire[1:0] T252;
  wire[1:0] T253;
  wire[1:0] T254;
  wire[1:0] T255;
  wire[1:0] T256;
  wire[1:0] T257;
  wire[1:0] T258;
  wire[1:0] T259;
  wire[1:0] T260;
  wire[1:0] T261;
  wire[1:0] T262;
  wire[1:0] T263;
  wire[1:0] T264;
  wire[1:0] T265;
  wire[1:0] T266;
  wire[1:0] T267;
  wire[1:0] T268;
  wire[1:0] T269;
  wire[1:0] T270;
  wire[1:0] T271;
  wire[1:0] T272;
  wire[1:0] T273;
  wire[1:0] T274;
  wire[1:0] T275;
  wire[1:0] T276;
  wire[1:0] T277;
  wire[1:0] T278;
  wire[1:0] T279;
  wire[1:0] T280;
  wire[1:0] T281;
  wire[1:0] T282;
  wire[2:0] T283;
  wire[2:0] T284;
  wire[2:0] T285;
  wire[2:0] T286;
  wire[2:0] T287;
  wire[2:0] T288;
  wire[2:0] T289;
  wire[2:0] T290;
  wire[2:0] T291;
  wire[2:0] T292;
  wire[2:0] T293;
  wire[2:0] T294;
  wire[2:0] T295;
  wire[2:0] T296;
  wire[2:0] T297;
  wire[1:0] T298;
  wire[1:0] T299;
  wire[1:0] T300;
  wire[1:0] T301;
  wire[1:0] T302;
  wire[1:0] T303;
  wire[1:0] T304;
  wire[1:0] T305;
  wire[1:0] T306;
  wire[1:0] T307;
  wire[1:0] T308;
  wire[1:0] T309;
  wire[1:0] T310;
  wire[1:0] T311;
  wire[1:0] T312;
  wire[1:0] T313;
  wire[1:0] T314;
  wire[1:0] T315;
  wire[2:0] T316;
  wire[2:0] T317;
  wire[2:0] T318;
  wire[2:0] T319;
  wire[2:0] T320;
  wire[2:0] T321;
  wire[2:0] T322;
  wire[2:0] T323;
  wire[2:0] T324;
  wire[2:0] T325;
  wire[3:0] T326;
  wire[3:0] T327;
  wire[3:0] T328;
  wire[3:0] T329;
  wire[3:0] T330;
  wire[3:0] T331;
  wire[3:0] T332;
  wire[3:0] T333;
  wire[3:0] T334;
  wire[3:0] T335;
  wire[3:0] T336;
  wire[3:0] T337;
  wire[3:0] T338;
  wire[3:0] T339;
  wire[3:0] T340;
  wire[3:0] T341;
  wire[3:0] T342;
  wire[3:0] T343;
  wire[3:0] T344;
  wire[3:0] T345;
  wire[3:0] T346;
  wire[3:0] T347;
  wire[3:0] T348;
  wire[3:0] T349;
  wire[3:0] T350;
  wire[3:0] T351;
  wire[3:0] T352;
  wire[3:0] T353;
  wire[3:0] T354;
  wire[3:0] T355;
  wire[3:0] T356;
  wire[3:0] T357;
  wire[3:0] T358;
  wire[3:0] T359;
  wire[3:0] T360;
  wire[3:0] T361;
  wire[3:0] T362;
  wire[3:0] T363;
  wire[3:0] T364;
  wire[3:0] T365;
  wire[3:0] T366;
  wire[3:0] T367;
  wire[2:0] T368;
  wire[2:0] T369;
  wire[2:0] T370;
  wire[2:0] T371;
  wire[2:0] T372;
  wire[2:0] T373;
  wire[2:0] T374;
  wire[2:0] T375;
  wire[2:0] T376;
  wire[2:0] T377;
  wire[2:0] T378;
  wire[2:0] T379;
  wire[2:0] T380;
  wire[2:0] T381;
  wire[2:0] T382;
  wire[2:0] T383;
  wire[2:0] T384;
  wire[2:0] T385;
  wire[2:0] T386;
  wire[2:0] T387;
  wire[2:0] T388;
  wire[2:0] T389;
  wire[2:0] T390;
  wire[2:0] T391;
  wire[2:0] T392;
  wire[2:0] T393;
  wire[2:0] T394;
  wire[2:0] T395;
  wire[2:0] T396;
  wire[2:0] T397;
  wire[2:0] T398;
  wire[2:0] T399;
  wire[2:0] T400;
  wire[2:0] T401;
  wire[2:0] T402;
  wire[2:0] T403;
  wire[2:0] T404;
  wire[2:0] T405;
  wire[2:0] T406;
  wire[2:0] T407;
  wire[2:0] T408;
  wire[2:0] T409;
  wire[2:0] T410;
  wire[2:0] T411;
  wire[2:0] T412;
  wire T413;
  wire T414;
  wire T415;
  wire T416;
  wire T417;
  wire T418;
  wire T419;
  wire T420;
  wire T421;
  wire T422;
  wire T423;
  wire T424;
  wire T425;
  wire T426;
  wire T427;
  wire T428;
  wire T429;
  wire T430;
  wire T431;
  wire T432;
  wire T433;
  wire T434;
  wire T435;
  wire T436;
  wire T437;
  wire T438;
  wire T439;
  wire T440;
  wire T441;
  wire T442;
  wire T443;
  wire T444;
  wire T445;
  wire T446;
  wire T447;
  wire T448;
  wire T449;
  wire T450;
  wire T451;
  wire T452;
  wire T453;
  wire T454;
  wire T455;
  wire T456;
  wire T457;
  wire T458;
  wire T459;
  wire T460;
  wire T461;
  wire T462;
  wire T463;
  wire T464;
  wire T465;
  wire T466;
  wire T467;
  wire T468;
  wire T469;
  wire T470;
  wire T471;
  wire T472;
  wire T473;
  wire T474;
  wire T475;
  wire T476;
  wire T477;
  wire T478;
  wire T479;
  wire T480;
  wire T481;
  wire T482;
  wire T483;
  wire T484;
  wire T485;
  wire T486;
  wire T487;
  wire T488;
  wire T489;
  wire T490;
  wire T491;
  wire T492;
  wire T493;
  wire T494;
  wire T495;
  wire T496;
  wire T497;
  wire T498;
  wire T499;
  wire T500;
  wire T501;
  wire T502;
  wire T503;
  wire T504;
  wire T505;
  wire T506;
  wire T507;
  wire T508;
  wire T509;
  wire T510;
  wire T511;
  wire T512;
  wire T513;
  wire T514;
  wire T515;
  wire T516;
  wire T517;
  wire T518;
  wire T519;
  wire T520;
  wire T521;
  wire T522;
  wire T523;
  wire T524;
  wire T525;
  wire T526;
  wire T527;
  wire T528;
  wire T529;
  wire T530;
  wire T531;
  wire T532;
  wire T533;
  wire T534;
  wire T535;
  wire T536;
  wire T537;
  wire[1:0] T538;
  wire[1:0] T539;
  wire[1:0] T540;
  wire[1:0] T541;
  wire[1:0] T542;
  wire[1:0] T543;
  wire[1:0] T544;
  wire[1:0] T545;
  wire[1:0] T546;
  wire[1:0] T547;
  wire[1:0] T548;
  wire[1:0] T549;
  wire[1:0] T550;
  wire[1:0] T551;
  wire[1:0] T552;
  wire[1:0] T553;
  wire[1:0] T554;
  wire[1:0] T555;
  wire[1:0] T556;
  wire[1:0] T557;
  wire[1:0] T558;
  wire[1:0] T559;
  wire[1:0] T560;
  wire[1:0] T561;
  wire[1:0] T562;
  wire[1:0] T563;
  wire[1:0] T564;
  wire[1:0] T565;
  wire[1:0] T566;
  wire[1:0] T567;
  wire[1:0] T568;
  wire[1:0] T569;
  wire[1:0] T570;
  wire[1:0] T571;
  wire[1:0] T572;
  wire[1:0] T573;
  wire[1:0] T574;
  wire[1:0] T575;
  wire[1:0] T576;
  wire[1:0] T577;
  wire[1:0] T578;
  wire[1:0] T579;
  wire[1:0] T580;
  wire[1:0] T581;
  wire[1:0] T582;
  wire[1:0] T583;
  wire[1:0] T584;
  wire[1:0] T585;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
//  assign io_daisy_regs_out_bits = {1{$random}};
//  assign io_daisy_regs_out_valid = {1{$random}};
//  assign io_daisy_regs_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign io_ctrl_illegal = T0;
  assign T0 = T140 ? 1'h0 : T1;
  assign T1 = T138 ? 1'h0 : T2;
  assign T2 = T136 ? 1'h0 : T3;
  assign T3 = T134 ? 1'h0 : T4;
  assign T4 = T132 ? 1'h0 : T5;
  assign T5 = T130 ? 1'h0 : T6;
  assign T6 = T128 ? 1'h0 : T7;
  assign T7 = T126 ? 1'h0 : T8;
  assign T8 = T124 ? 1'h0 : T9;
  assign T9 = T122 ? 1'h0 : T10;
  assign T10 = T120 ? 1'h0 : T11;
  assign T11 = T118 ? 1'h0 : T12;
  assign T12 = T116 ? 1'h0 : T13;
  assign T13 = T114 ? 1'h0 : T14;
  assign T14 = T112 ? 1'h0 : T15;
  assign T15 = T110 ? 1'h0 : T16;
  assign T16 = T108 ? 1'h0 : T17;
  assign T17 = T106 ? 1'h0 : T18;
  assign T18 = T104 ? 1'h0 : T19;
  assign T19 = T102 ? 1'h0 : T20;
  assign T20 = T100 ? 1'h0 : T21;
  assign T21 = T98 ? 1'h0 : T22;
  assign T22 = T96 ? 1'h0 : T23;
  assign T23 = T94 ? 1'h0 : T24;
  assign T24 = T92 ? 1'h0 : T25;
  assign T25 = T90 ? 1'h0 : T26;
  assign T26 = T88 ? 1'h0 : T27;
  assign T27 = T86 ? 1'h0 : T28;
  assign T28 = T84 ? 1'h0 : T29;
  assign T29 = T82 ? 1'h0 : T30;
  assign T30 = T80 ? 1'h0 : T31;
  assign T31 = T78 ? 1'h0 : T32;
  assign T32 = T76 ? 1'h0 : T33;
  assign T33 = T74 ? 1'h0 : T34;
  assign T34 = T72 ? 1'h0 : T35;
  assign T35 = T70 ? 1'h0 : T36;
  assign T36 = T68 ? 1'h0 : T37;
  assign T37 = T66 ? 1'h0 : T38;
  assign T38 = T65 ? 1'h0 : T39;
  assign T39 = T63 ? 1'h0 : T40;
  assign T40 = T61 ? 1'h0 : T41;
  assign T41 = T59 ? 1'h0 : T42;
  assign T42 = T57 ? 1'h0 : T43;
  assign T43 = T55 ? 1'h0 : T44;
  assign T44 = T53 ? 1'h0 : T45;
  assign T45 = T52 ? 1'h0 : T46;
  assign T46 = T51 ? 1'h0 : T47;
  assign T47 = T50 ? 1'h0 : T48;
  assign T48 = T49 == 1'h0;
  assign T49 = io_ctrl_inst == 32'h10200073;
  assign T50 = io_ctrl_inst == 32'h10000073;
  assign T51 = io_ctrl_inst == 32'h100073;
  assign T52 = io_ctrl_inst == 32'h73;
  assign T53 = 32'h7073 == T54;
  assign T54 = io_ctrl_inst & 32'h707f;
  assign T55 = 32'h6073 == T56;
  assign T56 = io_ctrl_inst & 32'h707f;
  assign T57 = 32'h5073 == T58;
  assign T58 = io_ctrl_inst & 32'h707f;
  assign T59 = 32'h3073 == T60;
  assign T60 = io_ctrl_inst & 32'h707f;
  assign T61 = 32'h2073 == T62;
  assign T62 = io_ctrl_inst & 32'h707f;
  assign T63 = 32'h1073 == T64;
  assign T64 = io_ctrl_inst & 32'h707f;
  assign T65 = io_ctrl_inst == 32'h100f;
  assign T66 = 32'hf == T67;
  assign T67 = io_ctrl_inst & 32'hf00fffff;
  assign T68 = 32'h7033 == T69;
  assign T69 = io_ctrl_inst & 32'hfe00707f;
  assign T70 = 32'h6033 == T71;
  assign T71 = io_ctrl_inst & 32'hfe00707f;
  assign T72 = 32'h40005033 == T73;
  assign T73 = io_ctrl_inst & 32'hfe00707f;
  assign T74 = 32'h5033 == T75;
  assign T75 = io_ctrl_inst & 32'hfe00707f;
  assign T76 = 32'h4033 == T77;
  assign T77 = io_ctrl_inst & 32'hfe00707f;
  assign T78 = 32'h3033 == T79;
  assign T79 = io_ctrl_inst & 32'hfe00707f;
  assign T80 = 32'h2033 == T81;
  assign T81 = io_ctrl_inst & 32'hfe00707f;
  assign T82 = 32'h1033 == T83;
  assign T83 = io_ctrl_inst & 32'hfe00707f;
  assign T84 = 32'h40000033 == T85;
  assign T85 = io_ctrl_inst & 32'hfe00707f;
  assign T86 = 32'h33 == T87;
  assign T87 = io_ctrl_inst & 32'hfe00707f;
  assign T88 = 32'h40005013 == T89;
  assign T89 = io_ctrl_inst & 32'hfe00707f;
  assign T90 = 32'h5013 == T91;
  assign T91 = io_ctrl_inst & 32'hfe00707f;
  assign T92 = 32'h1013 == T93;
  assign T93 = io_ctrl_inst & 32'hfe00707f;
  assign T94 = 32'h7013 == T95;
  assign T95 = io_ctrl_inst & 32'h707f;
  assign T96 = 32'h6013 == T97;
  assign T97 = io_ctrl_inst & 32'h707f;
  assign T98 = 32'h4013 == T99;
  assign T99 = io_ctrl_inst & 32'h707f;
  assign T100 = 32'h3013 == T101;
  assign T101 = io_ctrl_inst & 32'h707f;
  assign T102 = 32'h2013 == T103;
  assign T103 = io_ctrl_inst & 32'h707f;
  assign T104 = 32'h13 == T105;
  assign T105 = io_ctrl_inst & 32'h707f;
  assign T106 = 32'h2023 == T107;
  assign T107 = io_ctrl_inst & 32'h707f;
  assign T108 = 32'h1023 == T109;
  assign T109 = io_ctrl_inst & 32'h707f;
  assign T110 = 32'h23 == T111;
  assign T111 = io_ctrl_inst & 32'h707f;
  assign T112 = 32'h5003 == T113;
  assign T113 = io_ctrl_inst & 32'h707f;
  assign T114 = 32'h4003 == T115;
  assign T115 = io_ctrl_inst & 32'h707f;
  assign T116 = 32'h2003 == T117;
  assign T117 = io_ctrl_inst & 32'h707f;
  assign T118 = 32'h1003 == T119;
  assign T119 = io_ctrl_inst & 32'h707f;
  assign T120 = 32'h3 == T121;
  assign T121 = io_ctrl_inst & 32'h707f;
  assign T122 = 32'h7063 == T123;
  assign T123 = io_ctrl_inst & 32'h707f;
  assign T124 = 32'h6063 == T125;
  assign T125 = io_ctrl_inst & 32'h707f;
  assign T126 = 32'h5063 == T127;
  assign T127 = io_ctrl_inst & 32'h707f;
  assign T128 = 32'h4063 == T129;
  assign T129 = io_ctrl_inst & 32'h707f;
  assign T130 = 32'h1063 == T131;
  assign T131 = io_ctrl_inst & 32'h707f;
  assign T132 = 32'h63 == T133;
  assign T133 = io_ctrl_inst & 32'h707f;
  assign T134 = 32'h67 == T135;
  assign T135 = io_ctrl_inst & 32'h707f;
  assign T136 = 32'h6f == T137;
  assign T137 = io_ctrl_inst & 32'h7f;
  assign T138 = 32'h17 == T139;
  assign T139 = io_ctrl_inst & 32'h7f;
  assign T140 = 32'h37 == T141;
  assign T141 = io_ctrl_inst & 32'h7f;
  assign io_ctrl_csr_cmd = T142;
  assign T142 = T140 ? 3'h0 : T143;
  assign T143 = T138 ? 3'h0 : T144;
  assign T144 = T136 ? 3'h0 : T145;
  assign T145 = T134 ? 3'h0 : T146;
  assign T146 = T132 ? 3'h0 : T147;
  assign T147 = T130 ? 3'h0 : T148;
  assign T148 = T128 ? 3'h0 : T149;
  assign T149 = T126 ? 3'h0 : T150;
  assign T150 = T124 ? 3'h0 : T151;
  assign T151 = T122 ? 3'h0 : T152;
  assign T152 = T120 ? 3'h0 : T153;
  assign T153 = T118 ? 3'h0 : T154;
  assign T154 = T116 ? 3'h0 : T155;
  assign T155 = T114 ? 3'h0 : T156;
  assign T156 = T112 ? 3'h0 : T157;
  assign T157 = T110 ? 3'h0 : T158;
  assign T158 = T108 ? 3'h0 : T159;
  assign T159 = T106 ? 3'h0 : T160;
  assign T160 = T104 ? 3'h0 : T161;
  assign T161 = T102 ? 3'h0 : T162;
  assign T162 = T100 ? 3'h0 : T163;
  assign T163 = T98 ? 3'h0 : T164;
  assign T164 = T96 ? 3'h0 : T165;
  assign T165 = T94 ? 3'h0 : T166;
  assign T166 = T92 ? 3'h0 : T167;
  assign T167 = T90 ? 3'h0 : T168;
  assign T168 = T88 ? 3'h0 : T169;
  assign T169 = T86 ? 3'h0 : T170;
  assign T170 = T84 ? 3'h0 : T171;
  assign T171 = T82 ? 3'h0 : T172;
  assign T172 = T80 ? 3'h0 : T173;
  assign T173 = T78 ? 3'h0 : T174;
  assign T174 = T76 ? 3'h0 : T175;
  assign T175 = T74 ? 3'h0 : T176;
  assign T176 = T72 ? 3'h0 : T177;
  assign T177 = T70 ? 3'h0 : T178;
  assign T178 = T68 ? 3'h0 : T179;
  assign T179 = T66 ? 3'h0 : T180;
  assign T180 = T65 ? 3'h0 : T181;
  assign T181 = T63 ? 3'h1 : T182;
  assign T182 = T61 ? 3'h2 : T183;
  assign T183 = T59 ? 3'h3 : T184;
  assign T184 = T57 ? 3'h1 : T185;
  assign T185 = T55 ? 3'h2 : T186;
  assign T186 = T53 ? 3'h3 : T187;
  assign T187 = T52 ? 3'h4 : T188;
  assign T188 = T51 ? 3'h4 : T189;
  assign T189 = T50 ? 3'h4 : 3'h0;
  assign io_ctrl_wb_en = T190;
  assign T190 = T191;
  assign T191 = T140 ? 1'h1 : T192;
  assign T192 = T138 ? 1'h1 : T193;
  assign T193 = T136 ? 1'h1 : T194;
  assign T194 = T134 ? 1'h1 : T195;
  assign T195 = T132 ? 1'h0 : T196;
  assign T196 = T130 ? 1'h0 : T197;
  assign T197 = T128 ? 1'h0 : T198;
  assign T198 = T126 ? 1'h0 : T199;
  assign T199 = T124 ? 1'h0 : T200;
  assign T200 = T122 ? 1'h0 : T201;
  assign T201 = T120 ? 1'h1 : T202;
  assign T202 = T118 ? 1'h1 : T203;
  assign T203 = T116 ? 1'h1 : T204;
  assign T204 = T114 ? 1'h1 : T205;
  assign T205 = T112 ? 1'h1 : T206;
  assign T206 = T110 ? 1'h0 : T207;
  assign T207 = T108 ? 1'h0 : T208;
  assign T208 = T106 ? 1'h0 : T209;
  assign T209 = T104 ? 1'h1 : T210;
  assign T210 = T102 ? 1'h1 : T211;
  assign T211 = T100 ? 1'h1 : T212;
  assign T212 = T98 ? 1'h1 : T213;
  assign T213 = T96 ? 1'h1 : T214;
  assign T214 = T94 ? 1'h1 : T215;
  assign T215 = T92 ? 1'h1 : T216;
  assign T216 = T90 ? 1'h1 : T217;
  assign T217 = T88 ? 1'h1 : T218;
  assign T218 = T86 ? 1'h1 : T219;
  assign T219 = T84 ? 1'h1 : T220;
  assign T220 = T82 ? 1'h1 : T221;
  assign T221 = T80 ? 1'h1 : T222;
  assign T222 = T78 ? 1'h1 : T223;
  assign T223 = T76 ? 1'h1 : T224;
  assign T224 = T74 ? 1'h1 : T225;
  assign T225 = T72 ? 1'h1 : T226;
  assign T226 = T70 ? 1'h1 : T227;
  assign T227 = T68 ? 1'h1 : T228;
  assign T228 = T66 ? 1'h0 : T229;
  assign T229 = T65 ? 1'h0 : T230;
  assign T230 = T63 ? 1'h1 : T231;
  assign T231 = T61 ? 1'h1 : T232;
  assign T232 = T59 ? 1'h1 : T233;
  assign T233 = T57 ? 1'h1 : T234;
  assign T234 = T55 ? 1'h1 : T53;
  assign io_ctrl_wb_sel = T235;
  assign T235 = T140 ? 2'h0 : T236;
  assign T236 = T138 ? 2'h0 : T237;
  assign T237 = T136 ? 2'h2 : T238;
  assign T238 = T134 ? 2'h2 : T239;
  assign T239 = T132 ? 2'h0 : T240;
  assign T240 = T130 ? 2'h0 : T241;
  assign T241 = T128 ? 2'h0 : T242;
  assign T242 = T126 ? 2'h0 : T243;
  assign T243 = T124 ? 2'h0 : T244;
  assign T244 = T122 ? 2'h0 : T245;
  assign T245 = T120 ? 2'h1 : T246;
  assign T246 = T118 ? 2'h1 : T247;
  assign T247 = T116 ? 2'h1 : T248;
  assign T248 = T114 ? 2'h1 : T249;
  assign T249 = T112 ? 2'h1 : T250;
  assign T250 = T110 ? 2'h0 : T251;
  assign T251 = T108 ? 2'h0 : T252;
  assign T252 = T106 ? 2'h0 : T253;
  assign T253 = T104 ? 2'h0 : T254;
  assign T254 = T102 ? 2'h0 : T255;
  assign T255 = T100 ? 2'h0 : T256;
  assign T256 = T98 ? 2'h0 : T257;
  assign T257 = T96 ? 2'h0 : T258;
  assign T258 = T94 ? 2'h0 : T259;
  assign T259 = T92 ? 2'h0 : T260;
  assign T260 = T90 ? 2'h0 : T261;
  assign T261 = T88 ? 2'h0 : T262;
  assign T262 = T86 ? 2'h0 : T263;
  assign T263 = T84 ? 2'h0 : T264;
  assign T264 = T82 ? 2'h0 : T265;
  assign T265 = T80 ? 2'h0 : T266;
  assign T266 = T78 ? 2'h0 : T267;
  assign T267 = T76 ? 2'h0 : T268;
  assign T268 = T74 ? 2'h0 : T269;
  assign T269 = T72 ? 2'h0 : T270;
  assign T270 = T70 ? 2'h0 : T271;
  assign T271 = T68 ? 2'h0 : T272;
  assign T272 = T66 ? 2'h0 : T273;
  assign T273 = T65 ? 2'h0 : T274;
  assign T274 = T63 ? 2'h3 : T275;
  assign T275 = T61 ? 2'h3 : T276;
  assign T276 = T59 ? 2'h3 : T277;
  assign T277 = T57 ? 2'h3 : T278;
  assign T278 = T55 ? 2'h3 : T279;
  assign T279 = T53 ? 2'h3 : T280;
  assign T280 = T52 ? 2'h3 : T281;
  assign T281 = T51 ? 2'h3 : T282;
  assign T282 = T50 ? 2'h3 : 2'h0;
  assign io_ctrl_ld_type = T283;
  assign T283 = T140 ? 3'h0 : T284;
  assign T284 = T138 ? 3'h0 : T285;
  assign T285 = T136 ? 3'h0 : T286;
  assign T286 = T134 ? 3'h0 : T287;
  assign T287 = T132 ? 3'h0 : T288;
  assign T288 = T130 ? 3'h0 : T289;
  assign T289 = T128 ? 3'h0 : T290;
  assign T290 = T126 ? 3'h0 : T291;
  assign T291 = T124 ? 3'h0 : T292;
  assign T292 = T122 ? 3'h0 : T293;
  assign T293 = T120 ? 3'h3 : T294;
  assign T294 = T118 ? 3'h2 : T295;
  assign T295 = T116 ? 3'h1 : T296;
  assign T296 = T114 ? 3'h5 : T297;
  assign T297 = T112 ? 3'h4 : 3'h0;
  assign io_ctrl_st_type = T298;
  assign T298 = T140 ? 2'h0 : T299;
  assign T299 = T138 ? 2'h0 : T300;
  assign T300 = T136 ? 2'h0 : T301;
  assign T301 = T134 ? 2'h0 : T302;
  assign T302 = T132 ? 2'h0 : T303;
  assign T303 = T130 ? 2'h0 : T304;
  assign T304 = T128 ? 2'h0 : T305;
  assign T305 = T126 ? 2'h0 : T306;
  assign T306 = T124 ? 2'h0 : T307;
  assign T307 = T122 ? 2'h0 : T308;
  assign T308 = T120 ? 2'h0 : T309;
  assign T309 = T118 ? 2'h0 : T310;
  assign T310 = T116 ? 2'h0 : T311;
  assign T311 = T114 ? 2'h0 : T312;
  assign T312 = T112 ? 2'h0 : T313;
  assign T313 = T110 ? 2'h3 : T314;
  assign T314 = T108 ? 2'h2 : T315;
  assign T315 = T106 ? 2'h1 : 2'h0;
  assign io_ctrl_br_type = T316;
  assign T316 = T140 ? 3'h0 : T317;
  assign T317 = T138 ? 3'h0 : T318;
  assign T318 = T136 ? 3'h0 : T319;
  assign T319 = T134 ? 3'h0 : T320;
  assign T320 = T132 ? 3'h3 : T321;
  assign T321 = T130 ? 3'h6 : T322;
  assign T322 = T128 ? 3'h2 : T323;
  assign T323 = T126 ? 3'h5 : T324;
  assign T324 = T124 ? 3'h1 : T325;
  assign T325 = T122 ? 3'h4 : 3'h0;
  assign io_ctrl_alu_op = T326;
  assign T326 = T140 ? 4'hb : T327;
  assign T327 = T138 ? 4'h0 : T328;
  assign T328 = T136 ? 4'h0 : T329;
  assign T329 = T134 ? 4'h0 : T330;
  assign T330 = T132 ? 4'h0 : T331;
  assign T331 = T130 ? 4'h0 : T332;
  assign T332 = T128 ? 4'h0 : T333;
  assign T333 = T126 ? 4'h0 : T334;
  assign T334 = T124 ? 4'h0 : T335;
  assign T335 = T122 ? 4'h0 : T336;
  assign T336 = T120 ? 4'h0 : T337;
  assign T337 = T118 ? 4'h0 : T338;
  assign T338 = T116 ? 4'h0 : T339;
  assign T339 = T114 ? 4'h0 : T340;
  assign T340 = T112 ? 4'h0 : T341;
  assign T341 = T110 ? 4'h0 : T342;
  assign T342 = T108 ? 4'h0 : T343;
  assign T343 = T106 ? 4'h0 : T344;
  assign T344 = T104 ? 4'h0 : T345;
  assign T345 = T102 ? 4'h5 : T346;
  assign T346 = T100 ? 4'h7 : T347;
  assign T347 = T98 ? 4'h4 : T348;
  assign T348 = T96 ? 4'h3 : T349;
  assign T349 = T94 ? 4'h2 : T350;
  assign T350 = T92 ? 4'h6 : T351;
  assign T351 = T90 ? 4'h8 : T352;
  assign T352 = T88 ? 4'h9 : T353;
  assign T353 = T86 ? 4'h0 : T354;
  assign T354 = T84 ? 4'h1 : T355;
  assign T355 = T82 ? 4'h6 : T356;
  assign T356 = T80 ? 4'h5 : T357;
  assign T357 = T78 ? 4'h7 : T358;
  assign T358 = T76 ? 4'h4 : T359;
  assign T359 = T74 ? 4'h8 : T360;
  assign T360 = T72 ? 4'h9 : T361;
  assign T361 = T70 ? 4'h3 : T362;
  assign T362 = T68 ? 4'h2 : T363;
  assign T363 = T66 ? 4'hf : T364;
  assign T364 = T65 ? 4'hf : T365;
  assign T365 = T63 ? 4'ha : T366;
  assign T366 = T61 ? 4'ha : T367;
  assign T367 = T59 ? 4'ha : 4'hf;
  assign io_ctrl_imm_sel = T368;
  assign T368 = T140 ? 3'h3 : T369;
  assign T369 = T138 ? 3'h3 : T370;
  assign T370 = T136 ? 3'h4 : T371;
  assign T371 = T134 ? 3'h1 : T372;
  assign T372 = T132 ? 3'h5 : T373;
  assign T373 = T130 ? 3'h5 : T374;
  assign T374 = T128 ? 3'h5 : T375;
  assign T375 = T126 ? 3'h5 : T376;
  assign T376 = T124 ? 3'h5 : T377;
  assign T377 = T122 ? 3'h5 : T378;
  assign T378 = T120 ? 3'h1 : T379;
  assign T379 = T118 ? 3'h1 : T380;
  assign T380 = T116 ? 3'h1 : T381;
  assign T381 = T114 ? 3'h1 : T382;
  assign T382 = T112 ? 3'h1 : T383;
  assign T383 = T110 ? 3'h2 : T384;
  assign T384 = T108 ? 3'h2 : T385;
  assign T385 = T106 ? 3'h2 : T386;
  assign T386 = T104 ? 3'h1 : T387;
  assign T387 = T102 ? 3'h1 : T388;
  assign T388 = T100 ? 3'h1 : T389;
  assign T389 = T98 ? 3'h1 : T390;
  assign T390 = T96 ? 3'h1 : T391;
  assign T391 = T94 ? 3'h1 : T392;
  assign T392 = T92 ? 3'h1 : T393;
  assign T393 = T90 ? 3'h1 : T394;
  assign T394 = T88 ? 3'h1 : T395;
  assign T395 = T86 ? 3'h0 : T396;
  assign T396 = T84 ? 3'h0 : T397;
  assign T397 = T82 ? 3'h0 : T398;
  assign T398 = T80 ? 3'h0 : T399;
  assign T399 = T78 ? 3'h0 : T400;
  assign T400 = T76 ? 3'h0 : T401;
  assign T401 = T74 ? 3'h0 : T402;
  assign T402 = T72 ? 3'h0 : T403;
  assign T403 = T70 ? 3'h0 : T404;
  assign T404 = T68 ? 3'h0 : T405;
  assign T405 = T66 ? 3'h0 : T406;
  assign T406 = T65 ? 3'h0 : T407;
  assign T407 = T63 ? 3'h0 : T408;
  assign T408 = T61 ? 3'h0 : T409;
  assign T409 = T59 ? 3'h0 : T410;
  assign T410 = T57 ? 3'h6 : T411;
  assign T411 = T55 ? 3'h6 : T412;
  assign T412 = T53 ? 3'h6 : 3'h0;
  assign io_ctrl_B_sel = T413;
  assign T413 = T140 ? 1'h0 : T414;
  assign T414 = T138 ? 1'h0 : T415;
  assign T415 = T136 ? 1'h0 : T416;
  assign T416 = T134 ? 1'h0 : T417;
  assign T417 = T132 ? 1'h0 : T418;
  assign T418 = T130 ? 1'h0 : T419;
  assign T419 = T128 ? 1'h0 : T420;
  assign T420 = T126 ? 1'h0 : T421;
  assign T421 = T124 ? 1'h0 : T422;
  assign T422 = T122 ? 1'h0 : T423;
  assign T423 = T120 ? 1'h0 : T424;
  assign T424 = T118 ? 1'h0 : T425;
  assign T425 = T116 ? 1'h0 : T426;
  assign T426 = T114 ? 1'h0 : T427;
  assign T427 = T112 ? 1'h0 : T428;
  assign T428 = T110 ? 1'h0 : T429;
  assign T429 = T108 ? 1'h0 : T430;
  assign T430 = T106 ? 1'h0 : T431;
  assign T431 = T104 ? 1'h0 : T432;
  assign T432 = T102 ? 1'h0 : T433;
  assign T433 = T100 ? 1'h0 : T434;
  assign T434 = T98 ? 1'h0 : T435;
  assign T435 = T96 ? 1'h0 : T436;
  assign T436 = T94 ? 1'h0 : T437;
  assign T437 = T92 ? 1'h0 : T438;
  assign T438 = T90 ? 1'h0 : T439;
  assign T439 = T88 ? 1'h0 : T440;
  assign T440 = T86 ? 1'h1 : T441;
  assign T441 = T84 ? 1'h1 : T442;
  assign T442 = T82 ? 1'h1 : T443;
  assign T443 = T80 ? 1'h1 : T444;
  assign T444 = T78 ? 1'h1 : T445;
  assign T445 = T76 ? 1'h1 : T446;
  assign T446 = T74 ? 1'h1 : T447;
  assign T447 = T72 ? 1'h1 : T448;
  assign T448 = T70 ? 1'h1 : T68;
  assign io_ctrl_A_sel = T449;
  assign T449 = T140 ? 1'h0 : T450;
  assign T450 = T138 ? 1'h0 : T451;
  assign T451 = T136 ? 1'h0 : T452;
  assign T452 = T134 ? 1'h1 : T453;
  assign T453 = T132 ? 1'h0 : T454;
  assign T454 = T130 ? 1'h0 : T455;
  assign T455 = T128 ? 1'h0 : T456;
  assign T456 = T126 ? 1'h0 : T457;
  assign T457 = T124 ? 1'h0 : T458;
  assign T458 = T122 ? 1'h0 : T459;
  assign T459 = T120 ? 1'h1 : T460;
  assign T460 = T118 ? 1'h1 : T461;
  assign T461 = T116 ? 1'h1 : T462;
  assign T462 = T114 ? 1'h1 : T463;
  assign T463 = T112 ? 1'h1 : T464;
  assign T464 = T110 ? 1'h1 : T465;
  assign T465 = T108 ? 1'h1 : T466;
  assign T466 = T106 ? 1'h1 : T467;
  assign T467 = T104 ? 1'h1 : T468;
  assign T468 = T102 ? 1'h1 : T469;
  assign T469 = T100 ? 1'h1 : T470;
  assign T470 = T98 ? 1'h1 : T471;
  assign T471 = T96 ? 1'h1 : T472;
  assign T472 = T94 ? 1'h1 : T473;
  assign T473 = T92 ? 1'h1 : T474;
  assign T474 = T90 ? 1'h1 : T475;
  assign T475 = T88 ? 1'h1 : T476;
  assign T476 = T86 ? 1'h1 : T477;
  assign T477 = T84 ? 1'h1 : T478;
  assign T478 = T82 ? 1'h1 : T479;
  assign T479 = T80 ? 1'h1 : T480;
  assign T480 = T78 ? 1'h1 : T481;
  assign T481 = T76 ? 1'h1 : T482;
  assign T482 = T74 ? 1'h1 : T483;
  assign T483 = T72 ? 1'h1 : T484;
  assign T484 = T70 ? 1'h1 : T485;
  assign T485 = T68 ? 1'h1 : T486;
  assign T486 = T66 ? 1'h0 : T487;
  assign T487 = T65 ? 1'h0 : T488;
  assign T488 = T63 ? 1'h1 : T489;
  assign T489 = T61 ? 1'h1 : T59;
  assign io_ctrl_inst_kill = T490;
  assign T490 = T491;
  assign T491 = T140 ? 1'h0 : T492;
  assign T492 = T138 ? 1'h0 : T493;
  assign T493 = T136 ? 1'h1 : T494;
  assign T494 = T134 ? 1'h1 : T495;
  assign T495 = T132 ? 1'h0 : T496;
  assign T496 = T130 ? 1'h0 : T497;
  assign T497 = T128 ? 1'h0 : T498;
  assign T498 = T126 ? 1'h0 : T499;
  assign T499 = T124 ? 1'h0 : T500;
  assign T500 = T122 ? 1'h0 : T501;
  assign T501 = T120 ? 1'h1 : T502;
  assign T502 = T118 ? 1'h1 : T503;
  assign T503 = T116 ? 1'h1 : T504;
  assign T504 = T114 ? 1'h1 : T505;
  assign T505 = T112 ? 1'h1 : T506;
  assign T506 = T110 ? 1'h0 : T507;
  assign T507 = T108 ? 1'h0 : T508;
  assign T508 = T106 ? 1'h0 : T509;
  assign T509 = T104 ? 1'h0 : T510;
  assign T510 = T102 ? 1'h0 : T511;
  assign T511 = T100 ? 1'h0 : T512;
  assign T512 = T98 ? 1'h0 : T513;
  assign T513 = T96 ? 1'h0 : T514;
  assign T514 = T94 ? 1'h0 : T515;
  assign T515 = T92 ? 1'h0 : T516;
  assign T516 = T90 ? 1'h0 : T517;
  assign T517 = T88 ? 1'h0 : T518;
  assign T518 = T86 ? 1'h0 : T519;
  assign T519 = T84 ? 1'h0 : T520;
  assign T520 = T82 ? 1'h0 : T521;
  assign T521 = T80 ? 1'h0 : T522;
  assign T522 = T78 ? 1'h0 : T523;
  assign T523 = T76 ? 1'h0 : T524;
  assign T524 = T74 ? 1'h0 : T525;
  assign T525 = T72 ? 1'h0 : T526;
  assign T526 = T70 ? 1'h0 : T527;
  assign T527 = T68 ? 1'h0 : T528;
  assign T528 = T66 ? 1'h0 : T529;
  assign T529 = T65 ? 1'h1 : T530;
  assign T530 = T63 ? 1'h1 : T531;
  assign T531 = T61 ? 1'h1 : T532;
  assign T532 = T59 ? 1'h1 : T533;
  assign T533 = T57 ? 1'h1 : T534;
  assign T534 = T55 ? 1'h1 : T535;
  assign T535 = T53 ? 1'h1 : T536;
  assign T536 = T52 ? 1'h0 : T537;
  assign T537 = T51 ? 1'h0 : T50;
  assign io_ctrl_pc_sel = T538;
  assign T538 = T140 ? 2'h0 : T539;
  assign T539 = T138 ? 2'h0 : T540;
  assign T540 = T136 ? 2'h1 : T541;
  assign T541 = T134 ? 2'h1 : T542;
  assign T542 = T132 ? 2'h0 : T543;
  assign T543 = T130 ? 2'h0 : T544;
  assign T544 = T128 ? 2'h0 : T545;
  assign T545 = T126 ? 2'h0 : T546;
  assign T546 = T124 ? 2'h0 : T547;
  assign T547 = T122 ? 2'h0 : T548;
  assign T548 = T120 ? 2'h2 : T549;
  assign T549 = T118 ? 2'h2 : T550;
  assign T550 = T116 ? 2'h2 : T551;
  assign T551 = T114 ? 2'h2 : T552;
  assign T552 = T112 ? 2'h2 : T553;
  assign T553 = T110 ? 2'h0 : T554;
  assign T554 = T108 ? 2'h0 : T555;
  assign T555 = T106 ? 2'h0 : T556;
  assign T556 = T104 ? 2'h0 : T557;
  assign T557 = T102 ? 2'h0 : T558;
  assign T558 = T100 ? 2'h0 : T559;
  assign T559 = T98 ? 2'h0 : T560;
  assign T560 = T96 ? 2'h0 : T561;
  assign T561 = T94 ? 2'h0 : T562;
  assign T562 = T92 ? 2'h0 : T563;
  assign T563 = T90 ? 2'h0 : T564;
  assign T564 = T88 ? 2'h0 : T565;
  assign T565 = T86 ? 2'h0 : T566;
  assign T566 = T84 ? 2'h0 : T567;
  assign T567 = T82 ? 2'h0 : T568;
  assign T568 = T80 ? 2'h0 : T569;
  assign T569 = T78 ? 2'h0 : T570;
  assign T570 = T76 ? 2'h0 : T571;
  assign T571 = T74 ? 2'h0 : T572;
  assign T572 = T72 ? 2'h0 : T573;
  assign T573 = T70 ? 2'h0 : T574;
  assign T574 = T68 ? 2'h0 : T575;
  assign T575 = T66 ? 2'h0 : T576;
  assign T576 = T65 ? 2'h2 : T577;
  assign T577 = T63 ? 2'h2 : T578;
  assign T578 = T61 ? 2'h2 : T579;
  assign T579 = T59 ? 2'h2 : T580;
  assign T580 = T57 ? 2'h2 : T581;
  assign T581 = T55 ? 2'h2 : T582;
  assign T582 = T53 ? 2'h2 : T583;
  assign T583 = T52 ? 2'h0 : T584;
  assign T584 = T51 ? 2'h0 : T585;
  assign T585 = T50 ? 2'h3 : 2'h0;
endmodule

module Core(input clk, input host__reset,
    input  io_host_fromhost_valid,
    input [31:0] io_host_fromhost_bits,
    output[31:0] io_host_tohost,
    output io_icache_abort,
    output io_icache_req_valid,
    output[31:0] io_icache_req_bits_addr,
    output[31:0] io_icache_req_bits_data,
    output[3:0] io_icache_req_bits_mask,
    input  io_icache_resp_valid,
    input [31:0] io_icache_resp_bits_data,
    output io_dcache_abort,
    output io_dcache_req_valid,
    output[31:0] io_dcache_req_bits_addr,
    output[31:0] io_dcache_req_bits_data,
    output[3:0] io_dcache_req_bits_mask,
    input  io_dcache_resp_valid,
    input [31:0] io_dcache_resp_bits_data,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  wire[1:0] ctrl_io_ctrl_pc_sel;
  wire ctrl_io_ctrl_inst_kill;
  wire ctrl_io_ctrl_A_sel;
  wire ctrl_io_ctrl_B_sel;
  wire[2:0] ctrl_io_ctrl_imm_sel;
  wire[3:0] ctrl_io_ctrl_alu_op;
  wire[2:0] ctrl_io_ctrl_br_type;
  wire[1:0] ctrl_io_ctrl_st_type;
  wire[2:0] ctrl_io_ctrl_ld_type;
  wire[1:0] ctrl_io_ctrl_wb_sel;
  wire ctrl_io_ctrl_wb_en;
  wire[2:0] ctrl_io_ctrl_csr_cmd;
  wire ctrl_io_ctrl_illegal;
  wire[31:0] dpath_io_host_tohost;
  wire dpath_io_icache_abort;
  wire dpath_io_icache_req_valid;
  wire[31:0] dpath_io_icache_req_bits_addr;
  wire[31:0] dpath_io_icache_req_bits_data;
  wire[3:0] dpath_io_icache_req_bits_mask;
  wire dpath_io_dcache_abort;
  wire dpath_io_dcache_req_valid;
  wire[31:0] dpath_io_dcache_req_bits_addr;
  wire[31:0] dpath_io_dcache_req_bits_data;
  wire[3:0] dpath_io_dcache_req_bits_mask;
  wire[31:0] dpath_io_ctrl_inst;
  wire dpath_io_daisy_regs_in_ready;
  wire dpath_io_daisy_regs_out_valid;
  wire[31:0] dpath_io_daisy_regs_out_bits;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign io_daisy_regs_out_bits = dpath_io_daisy_regs_out_bits;
  assign io_daisy_regs_out_valid = dpath_io_daisy_regs_out_valid;
  assign io_daisy_regs_in_ready = dpath_io_daisy_regs_in_ready;
  assign io_dcache_req_bits_mask = dpath_io_dcache_req_bits_mask;
  assign io_dcache_req_bits_data = dpath_io_dcache_req_bits_data;
  assign io_dcache_req_bits_addr = dpath_io_dcache_req_bits_addr;
  assign io_dcache_req_valid = dpath_io_dcache_req_valid;
  assign io_dcache_abort = dpath_io_dcache_abort;
  assign io_icache_req_bits_mask = dpath_io_icache_req_bits_mask;
  assign io_icache_req_bits_data = dpath_io_icache_req_bits_data;
  assign io_icache_req_bits_addr = dpath_io_icache_req_bits_addr;
  assign io_icache_req_valid = dpath_io_icache_req_valid;
  assign io_icache_abort = dpath_io_icache_abort;
  assign io_host_tohost = dpath_io_host_tohost;
  Datapath dpath(.clk(clk), .host__reset(host__reset),
       .io_host_fromhost_valid( io_host_fromhost_valid ),
       .io_host_fromhost_bits( io_host_fromhost_bits ),
       .io_host_tohost( dpath_io_host_tohost ),
       .io_icache_abort( dpath_io_icache_abort ),
       .io_icache_req_valid( dpath_io_icache_req_valid ),
       .io_icache_req_bits_addr( dpath_io_icache_req_bits_addr ),
       .io_icache_req_bits_data( dpath_io_icache_req_bits_data ),
       .io_icache_req_bits_mask( dpath_io_icache_req_bits_mask ),
       .io_icache_resp_valid( io_icache_resp_valid ),
       .io_icache_resp_bits_data( io_icache_resp_bits_data ),
       .io_dcache_abort( dpath_io_dcache_abort ),
       .io_dcache_req_valid( dpath_io_dcache_req_valid ),
       .io_dcache_req_bits_addr( dpath_io_dcache_req_bits_addr ),
       .io_dcache_req_bits_data( dpath_io_dcache_req_bits_data ),
       .io_dcache_req_bits_mask( dpath_io_dcache_req_bits_mask ),
       .io_dcache_resp_valid( io_dcache_resp_valid ),
       .io_dcache_resp_bits_data( io_dcache_resp_bits_data ),
       .io_ctrl_inst( dpath_io_ctrl_inst ),
       .io_ctrl_pc_sel( ctrl_io_ctrl_pc_sel ),
       .io_ctrl_inst_kill( ctrl_io_ctrl_inst_kill ),
       .io_ctrl_A_sel( ctrl_io_ctrl_A_sel ),
       .io_ctrl_B_sel( ctrl_io_ctrl_B_sel ),
       .io_ctrl_imm_sel( ctrl_io_ctrl_imm_sel ),
       .io_ctrl_alu_op( ctrl_io_ctrl_alu_op ),
       .io_ctrl_br_type( ctrl_io_ctrl_br_type ),
       .io_ctrl_st_type( ctrl_io_ctrl_st_type ),
       .io_ctrl_ld_type( ctrl_io_ctrl_ld_type ),
       .io_ctrl_wb_sel( ctrl_io_ctrl_wb_sel ),
       .io_ctrl_wb_en( ctrl_io_ctrl_wb_en ),
       .io_ctrl_csr_cmd( ctrl_io_ctrl_csr_cmd ),
       .io_ctrl_illegal( ctrl_io_ctrl_illegal ),
       .io_daisy_regs_in_ready( dpath_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( io_daisy_regs_in_valid ),
       .io_daisy_regs_in_bits( io_daisy_regs_in_bits ),
       .io_daisy_regs_out_ready( io_daisy_regs_out_ready ),
       .io_daisy_regs_out_valid( dpath_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( dpath_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
  Control ctrl(.host__reset(host__reset),
       .io_ctrl_inst( dpath_io_ctrl_inst ),
       .io_ctrl_pc_sel( ctrl_io_ctrl_pc_sel ),
       .io_ctrl_inst_kill( ctrl_io_ctrl_inst_kill ),
       .io_ctrl_A_sel( ctrl_io_ctrl_A_sel ),
       .io_ctrl_B_sel( ctrl_io_ctrl_B_sel ),
       .io_ctrl_imm_sel( ctrl_io_ctrl_imm_sel ),
       .io_ctrl_alu_op( ctrl_io_ctrl_alu_op ),
       .io_ctrl_br_type( ctrl_io_ctrl_br_type ),
       .io_ctrl_st_type( ctrl_io_ctrl_st_type ),
       .io_ctrl_ld_type( ctrl_io_ctrl_ld_type ),
       .io_ctrl_wb_sel( ctrl_io_ctrl_wb_sel ),
       .io_ctrl_wb_en( ctrl_io_ctrl_wb_en ),
       .io_ctrl_csr_cmd( ctrl_io_ctrl_csr_cmd ),
       .io_ctrl_illegal( ctrl_io_ctrl_illegal )
       //.io_daisy_regs_in_ready(  )
       //.io_daisy_regs_in_valid(  )
       //.io_daisy_regs_in_bits(  )
       //.io_daisy_regs_out_ready(  )
       //.io_daisy_regs_out_valid(  )
       //.io_daisy_regs_out_bits(  )
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
  );
endmodule

module DaisyDatapath_0(input clk,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_20,
    input [31:0] io_dataIo_data_19,
    input [31:0] io_dataIo_data_18,
    input [31:0] io_dataIo_data_17,
    input [31:0] io_dataIo_data_16,
    input [31:0] io_dataIo_data_15,
    input [31:0] io_dataIo_data_14,
    input [31:0] io_dataIo_data_13,
    input [31:0] io_dataIo_data_12,
    input [31:0] io_dataIo_data_11,
    input [31:0] io_dataIo_data_10,
    input [31:0] io_dataIo_data_9,
    input [31:0] io_dataIo_data_8,
    input [31:0] io_dataIo_data_7,
    input [31:0] io_dataIo_data_6,
    input [31:0] io_dataIo_data_5,
    input [31:0] io_dataIo_data_4,
    input [31:0] io_dataIo_data_3,
    input [31:0] io_dataIo_data_2,
    input [31:0] io_dataIo_data_1,
    input [31:0] io_dataIo_data_0,
    input  io_ctrlIo_copyCond,
    input  io_ctrlIo_readCond,
    input  io_ctrlIo_cntrNotZero,
    output io_ctrlIo_outFire,
    output io_ctrlIo_inValid
);

  wire T0;
  reg [31:0] regs_20;
  wire[31:0] T1;
  wire[31:0] T2;
  reg [31:0] regs_19;
  wire[31:0] T3;
  wire[31:0] T4;
  reg [31:0] regs_18;
  wire[31:0] T5;
  wire[31:0] T6;
  reg [31:0] regs_17;
  wire[31:0] T7;
  wire[31:0] T8;
  reg [31:0] regs_16;
  wire[31:0] T9;
  wire[31:0] T10;
  reg [31:0] regs_15;
  wire[31:0] T11;
  wire[31:0] T12;
  reg [31:0] regs_14;
  wire[31:0] T13;
  wire[31:0] T14;
  reg [31:0] regs_13;
  wire[31:0] T15;
  wire[31:0] T16;
  reg [31:0] regs_12;
  wire[31:0] T17;
  wire[31:0] T18;
  reg [31:0] regs_11;
  wire[31:0] T19;
  wire[31:0] T20;
  reg [31:0] regs_10;
  wire[31:0] T21;
  wire[31:0] T22;
  reg [31:0] regs_9;
  wire[31:0] T23;
  wire[31:0] T24;
  reg [31:0] regs_8;
  wire[31:0] T25;
  wire[31:0] T26;
  reg [31:0] regs_7;
  wire[31:0] T27;
  wire[31:0] T28;
  reg [31:0] regs_6;
  wire[31:0] T29;
  wire[31:0] T30;
  reg [31:0] regs_5;
  wire[31:0] T31;
  wire[31:0] T32;
  reg [31:0] regs_4;
  wire[31:0] T33;
  wire[31:0] T34;
  reg [31:0] regs_3;
  wire[31:0] T35;
  wire[31:0] T36;
  reg [31:0] regs_2;
  wire[31:0] T37;
  wire[31:0] T38;
  reg [31:0] regs_1;
  wire[31:0] T39;
  wire[31:0] T40;
  reg [31:0] regs_0;
  wire[31:0] T41;
  wire[31:0] T42;
  wire readCondAndOutFire;
  wire T43;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regs_20 = {1{$random}};
    regs_19 = {1{$random}};
    regs_18 = {1{$random}};
    regs_17 = {1{$random}};
    regs_16 = {1{$random}};
    regs_15 = {1{$random}};
    regs_14 = {1{$random}};
    regs_13 = {1{$random}};
    regs_12 = {1{$random}};
    regs_11 = {1{$random}};
    regs_10 = {1{$random}};
    regs_9 = {1{$random}};
    regs_8 = {1{$random}};
    regs_7 = {1{$random}};
    regs_6 = {1{$random}};
    regs_5 = {1{$random}};
    regs_4 = {1{$random}};
    regs_3 = {1{$random}};
    regs_2 = {1{$random}};
    regs_1 = {1{$random}};
    regs_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_inValid = io_dataIo_in_valid;
  assign io_ctrlIo_outFire = T0;
  assign T0 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_bits = regs_20;
  assign T1 = readCondAndOutFire ? regs_19 : T2;
  assign T2 = io_ctrlIo_copyCond ? io_dataIo_data_20 : regs_20;
  assign T3 = readCondAndOutFire ? regs_18 : T4;
  assign T4 = io_ctrlIo_copyCond ? io_dataIo_data_19 : regs_19;
  assign T5 = readCondAndOutFire ? regs_17 : T6;
  assign T6 = io_ctrlIo_copyCond ? io_dataIo_data_18 : regs_18;
  assign T7 = readCondAndOutFire ? regs_16 : T8;
  assign T8 = io_ctrlIo_copyCond ? io_dataIo_data_17 : regs_17;
  assign T9 = readCondAndOutFire ? regs_15 : T10;
  assign T10 = io_ctrlIo_copyCond ? io_dataIo_data_16 : regs_16;
  assign T11 = readCondAndOutFire ? regs_14 : T12;
  assign T12 = io_ctrlIo_copyCond ? io_dataIo_data_15 : regs_15;
  assign T13 = readCondAndOutFire ? regs_13 : T14;
  assign T14 = io_ctrlIo_copyCond ? io_dataIo_data_14 : regs_14;
  assign T15 = readCondAndOutFire ? regs_12 : T16;
  assign T16 = io_ctrlIo_copyCond ? io_dataIo_data_13 : regs_13;
  assign T17 = readCondAndOutFire ? regs_11 : T18;
  assign T18 = io_ctrlIo_copyCond ? io_dataIo_data_12 : regs_12;
  assign T19 = readCondAndOutFire ? regs_10 : T20;
  assign T20 = io_ctrlIo_copyCond ? io_dataIo_data_11 : regs_11;
  assign T21 = readCondAndOutFire ? regs_9 : T22;
  assign T22 = io_ctrlIo_copyCond ? io_dataIo_data_10 : regs_10;
  assign T23 = readCondAndOutFire ? regs_8 : T24;
  assign T24 = io_ctrlIo_copyCond ? io_dataIo_data_9 : regs_9;
  assign T25 = readCondAndOutFire ? regs_7 : T26;
  assign T26 = io_ctrlIo_copyCond ? io_dataIo_data_8 : regs_8;
  assign T27 = readCondAndOutFire ? regs_6 : T28;
  assign T28 = io_ctrlIo_copyCond ? io_dataIo_data_7 : regs_7;
  assign T29 = readCondAndOutFire ? regs_5 : T30;
  assign T30 = io_ctrlIo_copyCond ? io_dataIo_data_6 : regs_6;
  assign T31 = readCondAndOutFire ? regs_4 : T32;
  assign T32 = io_ctrlIo_copyCond ? io_dataIo_data_5 : regs_5;
  assign T33 = readCondAndOutFire ? regs_3 : T34;
  assign T34 = io_ctrlIo_copyCond ? io_dataIo_data_4 : regs_4;
  assign T35 = readCondAndOutFire ? regs_2 : T36;
  assign T36 = io_ctrlIo_copyCond ? io_dataIo_data_3 : regs_3;
  assign T37 = readCondAndOutFire ? regs_1 : T38;
  assign T38 = io_ctrlIo_copyCond ? io_dataIo_data_2 : regs_2;
  assign T39 = readCondAndOutFire ? regs_0 : T40;
  assign T40 = io_ctrlIo_copyCond ? io_dataIo_data_1 : regs_1;
  assign T41 = readCondAndOutFire ? io_dataIo_in_bits : T42;
  assign T42 = io_ctrlIo_copyCond ? io_dataIo_data_0 : regs_0;
  assign readCondAndOutFire = io_ctrlIo_readCond & T43;
  assign T43 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_valid = io_ctrlIo_cntrNotZero;
  assign io_dataIo_in_ready = io_dataIo_out_ready;

  always @(posedge clk) begin
    if(readCondAndOutFire) begin
      regs_20 <= regs_19;
    end else if(io_ctrlIo_copyCond) begin
      regs_20 <= io_dataIo_data_20;
    end
    if(readCondAndOutFire) begin
      regs_19 <= regs_18;
    end else if(io_ctrlIo_copyCond) begin
      regs_19 <= io_dataIo_data_19;
    end
    if(readCondAndOutFire) begin
      regs_18 <= regs_17;
    end else if(io_ctrlIo_copyCond) begin
      regs_18 <= io_dataIo_data_18;
    end
    if(readCondAndOutFire) begin
      regs_17 <= regs_16;
    end else if(io_ctrlIo_copyCond) begin
      regs_17 <= io_dataIo_data_17;
    end
    if(readCondAndOutFire) begin
      regs_16 <= regs_15;
    end else if(io_ctrlIo_copyCond) begin
      regs_16 <= io_dataIo_data_16;
    end
    if(readCondAndOutFire) begin
      regs_15 <= regs_14;
    end else if(io_ctrlIo_copyCond) begin
      regs_15 <= io_dataIo_data_15;
    end
    if(readCondAndOutFire) begin
      regs_14 <= regs_13;
    end else if(io_ctrlIo_copyCond) begin
      regs_14 <= io_dataIo_data_14;
    end
    if(readCondAndOutFire) begin
      regs_13 <= regs_12;
    end else if(io_ctrlIo_copyCond) begin
      regs_13 <= io_dataIo_data_13;
    end
    if(readCondAndOutFire) begin
      regs_12 <= regs_11;
    end else if(io_ctrlIo_copyCond) begin
      regs_12 <= io_dataIo_data_12;
    end
    if(readCondAndOutFire) begin
      regs_11 <= regs_10;
    end else if(io_ctrlIo_copyCond) begin
      regs_11 <= io_dataIo_data_11;
    end
    if(readCondAndOutFire) begin
      regs_10 <= regs_9;
    end else if(io_ctrlIo_copyCond) begin
      regs_10 <= io_dataIo_data_10;
    end
    if(readCondAndOutFire) begin
      regs_9 <= regs_8;
    end else if(io_ctrlIo_copyCond) begin
      regs_9 <= io_dataIo_data_9;
    end
    if(readCondAndOutFire) begin
      regs_8 <= regs_7;
    end else if(io_ctrlIo_copyCond) begin
      regs_8 <= io_dataIo_data_8;
    end
    if(readCondAndOutFire) begin
      regs_7 <= regs_6;
    end else if(io_ctrlIo_copyCond) begin
      regs_7 <= io_dataIo_data_7;
    end
    if(readCondAndOutFire) begin
      regs_6 <= regs_5;
    end else if(io_ctrlIo_copyCond) begin
      regs_6 <= io_dataIo_data_6;
    end
    if(readCondAndOutFire) begin
      regs_5 <= regs_4;
    end else if(io_ctrlIo_copyCond) begin
      regs_5 <= io_dataIo_data_5;
    end
    if(readCondAndOutFire) begin
      regs_4 <= regs_3;
    end else if(io_ctrlIo_copyCond) begin
      regs_4 <= io_dataIo_data_4;
    end
    if(readCondAndOutFire) begin
      regs_3 <= regs_2;
    end else if(io_ctrlIo_copyCond) begin
      regs_3 <= io_dataIo_data_3;
    end
    if(readCondAndOutFire) begin
      regs_2 <= regs_1;
    end else if(io_ctrlIo_copyCond) begin
      regs_2 <= io_dataIo_data_2;
    end
    if(readCondAndOutFire) begin
      regs_1 <= regs_0;
    end else if(io_ctrlIo_copyCond) begin
      regs_1 <= io_dataIo_data_1;
    end
    if(readCondAndOutFire) begin
      regs_0 <= io_dataIo_in_bits;
    end else if(io_ctrlIo_copyCond) begin
      regs_0 <= io_dataIo_data_0;
    end
  end
endmodule

module RegChainControl_0(input clk, input reset,
    input  io_stall,
    output io_ctrlIo_copyCond,
    output io_ctrlIo_readCond,
    output io_ctrlIo_cntrNotZero,
    input  io_ctrlIo_outFire,
    input  io_ctrlIo_inValid
);

  wire T0;
  reg [4:0] counter;
  wire[4:0] T1;
  wire[4:0] T2;
  wire[4:0] T3;
  wire[4:0] T4;
  wire T5;
  wire T6;
  wire T7;
  wire[4:0] T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  reg  copied;
  wire T18;
  reg  R19;
  wire T20;
  wire T21;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    counter = {1{$random}};
    copied = {1{$random}};
    R19 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_cntrNotZero = T0;
  assign T0 = counter != 5'h0;
  assign T1 = reset ? 5'h0 : T2;
  assign T2 = T9 ? T8 : T3;
  assign T3 = T6 ? 5'h15 : T4;
  assign T4 = T5 ? 5'h0 : counter;
  assign T5 = io_stall ^ 1'h1;
  assign T6 = T7 & io_ctrlIo_copyCond;
  assign T7 = T5 ^ 1'h1;
  assign T8 = counter - 5'h1;
  assign T9 = T13 & T10;
  assign T10 = T12 & T11;
  assign T11 = io_ctrlIo_inValid ^ 1'h1;
  assign T12 = io_ctrlIo_readCond & io_ctrlIo_outFire;
  assign T13 = T14 ^ 1'h1;
  assign T14 = T5 | io_ctrlIo_copyCond;
  assign io_ctrlIo_readCond = T15;
  assign T15 = T17 & T16;
  assign T16 = counter != 5'h0;
  assign T17 = io_stall & copied;
  assign io_ctrlIo_copyCond = T18;
  assign T18 = T20 | R19;
  assign T20 = io_stall & T21;
  assign T21 = copied ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      counter <= 5'h0;
    end else if(T9) begin
      counter <= T8;
    end else if(T6) begin
      counter <= 5'h15;
    end else if(T5) begin
      counter <= 5'h0;
    end
    copied <= io_stall;
    R19 <= reset;
  end
endmodule

module RegChain_0(input clk, input reset,
    input  io_stall,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_20,
    input [31:0] io_dataIo_data_19,
    input [31:0] io_dataIo_data_18,
    input [31:0] io_dataIo_data_17,
    input [31:0] io_dataIo_data_16,
    input [31:0] io_dataIo_data_15,
    input [31:0] io_dataIo_data_14,
    input [31:0] io_dataIo_data_13,
    input [31:0] io_dataIo_data_12,
    input [31:0] io_dataIo_data_11,
    input [31:0] io_dataIo_data_10,
    input [31:0] io_dataIo_data_9,
    input [31:0] io_dataIo_data_8,
    input [31:0] io_dataIo_data_7,
    input [31:0] io_dataIo_data_6,
    input [31:0] io_dataIo_data_5,
    input [31:0] io_dataIo_data_4,
    input [31:0] io_dataIo_data_3,
    input [31:0] io_dataIo_data_2,
    input [31:0] io_dataIo_data_1,
    input [31:0] io_dataIo_data_0
);

  wire datapath_io_dataIo_in_ready;
  wire datapath_io_dataIo_out_valid;
  wire[31:0] datapath_io_dataIo_out_bits;
  wire datapath_io_ctrlIo_outFire;
  wire datapath_io_ctrlIo_inValid;
  wire control_io_ctrlIo_copyCond;
  wire control_io_ctrlIo_readCond;
  wire control_io_ctrlIo_cntrNotZero;


  assign io_dataIo_out_bits = datapath_io_dataIo_out_bits;
  assign io_dataIo_out_valid = datapath_io_dataIo_out_valid;
  assign io_dataIo_in_ready = datapath_io_dataIo_in_ready;
  DaisyDatapath_0 datapath(.clk(clk),
       .io_dataIo_in_ready( datapath_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_dataIo_in_valid ),
       .io_dataIo_in_bits( io_dataIo_in_bits ),
       .io_dataIo_out_ready( io_dataIo_out_ready ),
       .io_dataIo_out_valid( datapath_io_dataIo_out_valid ),
       .io_dataIo_out_bits( datapath_io_dataIo_out_bits ),
       .io_dataIo_data_20( io_dataIo_data_20 ),
       .io_dataIo_data_19( io_dataIo_data_19 ),
       .io_dataIo_data_18( io_dataIo_data_18 ),
       .io_dataIo_data_17( io_dataIo_data_17 ),
       .io_dataIo_data_16( io_dataIo_data_16 ),
       .io_dataIo_data_15( io_dataIo_data_15 ),
       .io_dataIo_data_14( io_dataIo_data_14 ),
       .io_dataIo_data_13( io_dataIo_data_13 ),
       .io_dataIo_data_12( io_dataIo_data_12 ),
       .io_dataIo_data_11( io_dataIo_data_11 ),
       .io_dataIo_data_10( io_dataIo_data_10 ),
       .io_dataIo_data_9( io_dataIo_data_9 ),
       .io_dataIo_data_8( io_dataIo_data_8 ),
       .io_dataIo_data_7( io_dataIo_data_7 ),
       .io_dataIo_data_6( io_dataIo_data_6 ),
       .io_dataIo_data_5( io_dataIo_data_5 ),
       .io_dataIo_data_4( io_dataIo_data_4 ),
       .io_dataIo_data_3( io_dataIo_data_3 ),
       .io_dataIo_data_2( io_dataIo_data_2 ),
       .io_dataIo_data_1( io_dataIo_data_1 ),
       .io_dataIo_data_0( io_dataIo_data_0 ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
  RegChainControl_0 control(.clk(clk), .reset(reset),
       .io_stall( io_stall ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
endmodule

module DaisyDatapath_1(input clk,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_0,
    input  io_ctrlIo_copyCond,
    input  io_ctrlIo_readCond,
    input  io_ctrlIo_cntrNotZero,
    output io_ctrlIo_outFire,
    output io_ctrlIo_inValid
);

  wire T0;
  reg [31:0] regs_0;
  wire[31:0] T1;
  wire[31:0] T2;
  wire readCondAndOutFire;
  wire T3;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    regs_0 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_inValid = io_dataIo_in_valid;
  assign io_ctrlIo_outFire = T0;
  assign T0 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_bits = regs_0;
  assign T1 = readCondAndOutFire ? io_dataIo_in_bits : T2;
  assign T2 = io_ctrlIo_copyCond ? io_dataIo_data_0 : regs_0;
  assign readCondAndOutFire = io_ctrlIo_readCond & T3;
  assign T3 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign io_dataIo_out_valid = io_ctrlIo_cntrNotZero;
  assign io_dataIo_in_ready = io_dataIo_out_ready;

  always @(posedge clk) begin
    if(readCondAndOutFire) begin
      regs_0 <= io_dataIo_in_bits;
    end else if(io_ctrlIo_copyCond) begin
      regs_0 <= io_dataIo_data_0;
    end
  end
endmodule

module SRAMChainControl(input clk, input reset,
    input  io_stall,
    output io_ctrlIo_copyCond,
    output io_ctrlIo_readCond,
    output io_ctrlIo_cntrNotZero,
    input  io_ctrlIo_outFire,
    input  io_ctrlIo_inValid,
    input  io_restart,
    input [7:0] io_addrIo_in,
    output io_addrIo_out_valid,
    output[7:0] io_addrIo_out_bits
);

  wire[7:0] T0;
  wire[7:0] T1;
  reg [7:0] addrOut;
  wire[7:0] T2;
  wire[7:0] T3;
  wire T4;
  reg [1:0] addrState;
  wire[1:0] T5;
  wire[1:0] T6;
  wire[1:0] T7;
  wire[1:0] T8;
  wire[1:0] T9;
  wire[1:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire[7:0] T15;
  wire T16;
  wire T17;
  reg [7:0] addrIn;
  wire[7:0] T18;
  wire T19;
  wire T20;
  wire T21;
  reg  counter;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    addrOut = {1{$random}};
    addrState = {1{$random}};
    addrIn = {1{$random}};
    counter = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_addrIo_out_bits = T0;
  assign T0 = T19 ? addrIn : T1;
  assign T1 = T17 ? addrOut : addrIn;
  assign T2 = T16 ? T15 : T3;
  assign T3 = T4 ? 8'h0 : addrOut;
  assign T4 = 2'h0 == addrState;
  assign T5 = reset ? 2'h0 : T6;
  assign T6 = T13 ? 2'h0 : T7;
  assign T7 = T12 ? 2'h1 : T8;
  assign T8 = T16 ? 2'h3 : T9;
  assign T9 = T17 ? 2'h2 : T10;
  assign T10 = T11 ? 2'h3 : addrState;
  assign T11 = T4 & io_stall;
  assign T12 = T19 & io_restart;
  assign T13 = T19 & T14;
  assign T14 = io_stall ^ 1'h1;
  assign T15 = addrOut + 8'h1;
  assign T16 = 2'h2 == addrState;
  assign T17 = 2'h1 == addrState;
  assign T18 = T4 ? io_addrIo_in : addrIn;
  assign T19 = 2'h3 == addrState;
  assign io_addrIo_out_valid = T20;
  assign T20 = T19 ? io_stall : T17;
  assign io_ctrlIo_cntrNotZero = T21;
  assign T21 = counter != 1'h0;
  assign T22 = reset ? 1'h0 : T23;
  assign T23 = T30 ? T29 : T24;
  assign T24 = T27 ? 1'h1 : T25;
  assign T25 = T26 ? 1'h0 : counter;
  assign T26 = io_stall ^ 1'h1;
  assign T27 = T28 & io_ctrlIo_copyCond;
  assign T28 = T26 ^ 1'h1;
  assign T29 = counter - 1'h1;
  assign T30 = T34 & T31;
  assign T31 = T33 & T32;
  assign T32 = io_ctrlIo_inValid ^ 1'h1;
  assign T33 = io_ctrlIo_readCond & io_ctrlIo_outFire;
  assign T34 = T35 ^ 1'h1;
  assign T35 = T26 | io_ctrlIo_copyCond;
  assign io_ctrlIo_readCond = T36;
  assign T36 = T38 & T37;
  assign T37 = counter != 1'h0;
  assign T38 = addrState == 2'h3;
  assign io_ctrlIo_copyCond = T39;
  assign T39 = addrState == 2'h2;

  always @(posedge clk) begin
    if(T16) begin
      addrOut <= T15;
    end else if(T4) begin
      addrOut <= 8'h0;
    end
    if(reset) begin
      addrState <= 2'h0;
    end else if(T13) begin
      addrState <= 2'h0;
    end else if(T12) begin
      addrState <= 2'h1;
    end else if(T16) begin
      addrState <= 2'h3;
    end else if(T17) begin
      addrState <= 2'h2;
    end else if(T11) begin
      addrState <= 2'h3;
    end
    if(T4) begin
      addrIn <= io_addrIo_in;
    end
    if(reset) begin
      counter <= 1'h0;
    end else if(T30) begin
      counter <= T29;
    end else if(T27) begin
      counter <= 1'h1;
    end else if(T26) begin
      counter <= 1'h0;
    end
  end
endmodule

module SRAMChain(input clk, input reset,
    input  io_stall,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_0,
    input  io_restart,
    input [7:0] io_addrIo_in,
    output io_addrIo_out_valid,
    output[7:0] io_addrIo_out_bits
);

  wire datapath_io_dataIo_in_ready;
  wire datapath_io_dataIo_out_valid;
  wire[31:0] datapath_io_dataIo_out_bits;
  wire datapath_io_ctrlIo_outFire;
  wire datapath_io_ctrlIo_inValid;
  wire control_io_ctrlIo_copyCond;
  wire control_io_ctrlIo_readCond;
  wire control_io_ctrlIo_cntrNotZero;
  wire control_io_addrIo_out_valid;
  wire[7:0] control_io_addrIo_out_bits;


  assign io_addrIo_out_bits = control_io_addrIo_out_bits;
  assign io_addrIo_out_valid = control_io_addrIo_out_valid;
  assign io_dataIo_out_bits = datapath_io_dataIo_out_bits;
  assign io_dataIo_out_valid = datapath_io_dataIo_out_valid;
  assign io_dataIo_in_ready = datapath_io_dataIo_in_ready;
  DaisyDatapath_1 datapath(.clk(clk),
       .io_dataIo_in_ready( datapath_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_dataIo_in_valid ),
       .io_dataIo_in_bits( io_dataIo_in_bits ),
       .io_dataIo_out_ready( io_dataIo_out_ready ),
       .io_dataIo_out_valid( datapath_io_dataIo_out_valid ),
       .io_dataIo_out_bits( datapath_io_dataIo_out_bits ),
       .io_dataIo_data_0( io_dataIo_data_0 ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
  SRAMChainControl control(.clk(clk), .reset(reset),
       .io_stall( io_stall ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid ),
       .io_restart( io_restart ),
       .io_addrIo_in( io_addrIo_in ),
       .io_addrIo_out_valid( control_io_addrIo_out_valid ),
       .io_addrIo_out_bits( control_io_addrIo_out_bits )
  );
endmodule

module Cache(input clk, input host__reset,
    input  io_cpu_abort,
    input  io_cpu_req_valid,
    input [31:0] io_cpu_req_bits_addr,
    input [31:0] io_cpu_req_bits_data,
    input [3:0] io_cpu_req_bits_mask,
    output io_cpu_resp_valid,
    output[31:0] io_cpu_resp_bits_data,
    input  io_nasti_aw_ready,
    output io_nasti_aw_valid,
    output[31:0] io_nasti_aw_bits_addr,
    output[7:0] io_nasti_aw_bits_len,
    output[2:0] io_nasti_aw_bits_size,
    output[1:0] io_nasti_aw_bits_burst,
    output io_nasti_aw_bits_lock,
    output[3:0] io_nasti_aw_bits_cache,
    output[2:0] io_nasti_aw_bits_prot,
    output[3:0] io_nasti_aw_bits_qos,
    output[3:0] io_nasti_aw_bits_region,
    output[4:0] io_nasti_aw_bits_id,
    output io_nasti_aw_bits_user,
    input  io_nasti_w_ready,
    output io_nasti_w_valid,
    output[63:0] io_nasti_w_bits_data,
    output io_nasti_w_bits_last,
    output[7:0] io_nasti_w_bits_strb,
    output io_nasti_w_bits_user,
    output io_nasti_b_ready,
    //input  io_nasti_b_valid
    //input [1:0] io_nasti_b_bits_resp
    //input [4:0] io_nasti_b_bits_id
    //input  io_nasti_b_bits_user
    input  io_nasti_ar_ready,
    output io_nasti_ar_valid,
    output[31:0] io_nasti_ar_bits_addr,
    output[7:0] io_nasti_ar_bits_len,
    output[2:0] io_nasti_ar_bits_size,
    output[1:0] io_nasti_ar_bits_burst,
    output io_nasti_ar_bits_lock,
    output[3:0] io_nasti_ar_bits_cache,
    output[2:0] io_nasti_ar_bits_prot,
    output[3:0] io_nasti_ar_bits_qos,
    output[3:0] io_nasti_ar_bits_region,
    output[4:0] io_nasti_ar_bits_id,
    output io_nasti_ar_bits_user,
    output io_nasti_r_ready,
    input  io_nasti_r_valid,
    input [1:0] io_nasti_r_bits_resp,
    input [63:0] io_nasti_r_bits_data,
    input  io_nasti_r_bits_last,
    input [4:0] io_nasti_r_bits_id,
    input  io_nasti_r_bits_user,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    output io_daisy_sram_0_in_ready,
    input  io_daisy_sram_0_in_valid,
    input [31:0] io_daisy_sram_0_in_bits,
    input  io_daisy_sram_0_out_ready,
    output io_daisy_sram_0_out_valid,
    output[31:0] io_daisy_sram_0_out_bits,
    input  io_daisy_sram_0_restart,
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  reg [7:0] R164;
  wire[7:0] T305;
  wire[7:0] T306;
  wire[7:0] idx;
  wire T307;
  wire T308;
  wire ren;
  wire T40;
  wire T41;
  wire is_read;
  reg [2:0] state;
  wire[2:0] T309;
  wire[2:0] T310;
  wire[2:0] T311;
  wire[2:0] T1;
  wire[2:0] T2;
  wire[2:0] T3;
  wire[2:0] T4;
  wire[2:0] T5;
  wire[2:0] T6;
  wire[2:0] T7;
  wire[2:0] T8;
  wire[2:0] T9;
  wire[2:0] T10;
  wire[2:0] T11;
  wire[2:0] T12;
  wire T13;
  wire T14;
  wire T15;
  wire[2:0] T16;
  wire T17;
  wire T18;
  wire T19;
  wire hit;
  wire T20;
  wire T21;
  wire[19:0] tag_reg;
  reg [31:0] addr_reg;
  wire[31:0] T312;
  wire T313;
  wire[19:0] T23;
  wire[20:0] T24;
  wire T314;
  wire T315;
  wire[7:0] T316;
  wire[20:0] T25;
  wire[20:0] T26;
  wire[20:0] T27;
  wire[19:0] wmeta_tag;
  wire wmeta_dirty;
  wire T28;
  wire is_alloc;
  wire read_wrap_out;
  wire T29;
  reg  read_count;
  wire T317;
  wire T318;
  wire T319;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T320;
  wire wen;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  reg  is_allocd;
  wire T321;
  wire is_write;
  wire[7:0] idx_reg;
  reg [7:0] R38;
  wire[7:0] T322;
  wire T43;
  reg [255:0] v;
  wire[255:0] T323;
  wire[255:0] T324;
  wire[255:0] T325;
  wire[255:0] T44;
  wire[255:0] T45;
  wire[255:0] T46;
  wire[255:0] T47;
  wire[255:0] T326;
  wire T48;
  wire[255:0] T49;
  wire[255:0] T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire T72;
  wire T73;
  wire T74;
  wire write_wrap_out;
  wire T75;
  reg  write_count;
  wire T327;
  wire T328;
  wire T329;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire T80;
  wire T81;
  wire T82;
  wire[2:0] T83;
  wire T84;
  reg [3:0] cpu_mask;
  wire[3:0] T330;
  wire T331;
  wire T86;
  wire T87;
  wire is_idle;
  wire T42;
  wire[31:0] T131;
  wire[31:0] T132;
  wire[31:0] T133;
  wire[31:0] T134;
  wire[15:0] T135;
  wire[7:0] T136;
  wire[7:0] T332;
  wire T137;
  wire[3:0] T138;
  wire[19:0] wmask;
  wire[19:0] T139;
  wire[19:0] T140;
  wire[18:0] T141;
  wire[3:0] T142;
  wire[1:0] off_reg;
  wire T143;
  wire[7:0] T144;
  wire[7:0] T333;
  wire T145;
  wire[15:0] T146;
  wire[7:0] T147;
  wire[7:0] T334;
  wire T148;
  wire[7:0] T149;
  wire[7:0] T335;
  wire T150;
  wire[31:0] T151;
  wire[31:0] T152;
  wire[15:0] T153;
  wire[7:0] T154;
  wire[127:0] wdata;
  wire[127:0] T155;
  reg [63:0] rdata_buf_0;
  wire[63:0] T336;
  wire T337;
  wire T117;
  wire T118;
  wire[1:0] T119;
  wire T120;
  wire T121;
  wire[127:0] T156;
  wire[63:0] T157;
  reg [31:0] cpu_data;
  wire[31:0] T338;
  wire T339;
  wire T159;
  wire[7:0] T160;
  wire[15:0] T161;
  wire[7:0] T162;
  wire[7:0] T163;
  wire T340;
  wire T341;
  reg [7:0] R197;
  wire[7:0] T342;
  wire[7:0] T343;
  wire T344;
  wire T345;
  wire[31:0] T174;
  wire[31:0] T175;
  wire[31:0] T176;
  wire[31:0] T177;
  wire[15:0] T178;
  wire[7:0] T179;
  wire[7:0] T346;
  wire T180;
  wire[3:0] T181;
  wire[7:0] T182;
  wire[7:0] T347;
  wire T183;
  wire[15:0] T184;
  wire[7:0] T185;
  wire[7:0] T348;
  wire T186;
  wire[7:0] T187;
  wire[7:0] T349;
  wire T188;
  wire[31:0] T189;
  wire[31:0] T190;
  wire[15:0] T191;
  wire[7:0] T192;
  wire[7:0] T193;
  wire[15:0] T194;
  wire[7:0] T195;
  wire[7:0] T196;
  wire T350;
  wire T351;
  reg [7:0] R231;
  wire[7:0] T352;
  wire[7:0] T353;
  wire T354;
  wire T355;
  wire[31:0] T208;
  wire[31:0] T209;
  wire[31:0] T210;
  wire[31:0] T211;
  wire[15:0] T212;
  wire[7:0] T213;
  wire[7:0] T356;
  wire T214;
  wire[3:0] T215;
  wire[7:0] T216;
  wire[7:0] T357;
  wire T217;
  wire[15:0] T218;
  wire[7:0] T219;
  wire[7:0] T358;
  wire T220;
  wire[7:0] T221;
  wire[7:0] T359;
  wire T222;
  wire[31:0] T223;
  wire[31:0] T224;
  wire[15:0] T225;
  wire[7:0] T226;
  wire[7:0] T227;
  wire[15:0] T228;
  wire[7:0] T229;
  wire[7:0] T230;
  wire T360;
  wire T361;
  reg [7:0] R264;
  wire[7:0] T362;
  wire[7:0] T363;
  wire T364;
  wire T365;
  wire[31:0] T241;
  wire[31:0] T242;
  wire[31:0] T243;
  wire[31:0] T244;
  wire[15:0] T245;
  wire[7:0] T246;
  wire[7:0] T366;
  wire T247;
  wire[3:0] T248;
  wire[7:0] T249;
  wire[7:0] T367;
  wire T250;
  wire[15:0] T251;
  wire[7:0] T252;
  wire[7:0] T368;
  wire T253;
  wire[7:0] T254;
  wire[7:0] T369;
  wire T255;
  wire[31:0] T256;
  wire[31:0] T257;
  wire[15:0] T258;
  wire[7:0] T259;
  wire[7:0] T260;
  wire[15:0] T261;
  wire[7:0] T262;
  wire[7:0] T263;
  wire T370;
  wire T371;
  wire[31:0] T372;
  wire T373;
  wire[31:0] T374;
  wire[6:0] T375;
  wire[31:0] T376;
  wire[24:0] T377;
  wire[6:0] T378;
  wire[31:0] T379;
  wire[24:0] T380;
  wire[6:0] T381;
  wire[31:0] T382;
  wire T383;
  wire[30:0] T384;
  wire[31:0] T385;
  wire[8:0] T386;
  wire T387;
  wire[22:0] T388;
  wire[31:0] T389;
  wire[16:0] T390;
  wire[8:0] T391;
  wire[14:0] T392;
  wire[31:0] T393;
  wire[24:0] T394;
  wire[16:0] T395;
  wire[6:0] T396;
  wire[5:0] T397;
  wire[31:0] T398;
  wire[31:0] T399;
  wire[25:0] T400;
  wire[5:0] T401;
  reg [63:0] rdata_buf_1;
  wire[63:0] T402;
  wire T403;
  wire T123;
  wire T124;
  wire[31:0] T404;
  wire[31:0] T405;
  wire[29:0] T406;
  wire[25:0] T407;
  wire[1:0] T408;
  wire[31:0] T409;
  wire[30:0] T410;
  wire[29:0] T411;
  wire T412;
  wire[31:0] T413;
  wire[27:0] T414;
  wire[19:0] T415;
  wire[3:0] T416;
  wire[31:0] T417;
  wire[31:0] T418;
  wire[31:0] T419;
  wire[31:0] T420;
  wire[31:0] T421;
  wire[31:0] T422;
  wire[31:0] T423;
  wire[31:0] T424;
  wire[28:0] T425;
  wire[27:0] T426;
  wire T427;
  wire T0;
  wire T88;
  wire[4:0] T89;
  wire[3:0] T90;
  wire[3:0] T91;
  wire[2:0] T92;
  wire[3:0] T93;
  wire T94;
  wire[1:0] T95;
  wire[2:0] T96;
  wire[7:0] T97;
  wire[31:0] T98;
  wire[31:0] T99;
  wire[27:0] T100;
  wire T101;
  wire T102;
  wire T103;
  wire T104;
  wire is_dirty;
  wire T105;
  wire T106;
  wire T107;
  wire T108;
  wire[7:0] T109;
  wire T110;
  wire[63:0] T111;
  wire[63:0] T112;
  wire[63:0] T113;
  wire[127:0] rdata;
  wire[127:0] T114;
  wire[127:0] T115;
  wire[127:0] T125;
  wire[63:0] T126;
  wire[31:0] T127;
  wire[31:0] T128;
  wire[15:0] T129;
  wire[7:0] T130;
  wire[7:0] T166;
  wire[15:0] T167;
  wire[7:0] T168;
  wire[7:0] T169;
  wire[31:0] T170;
  wire[31:0] T171;
  wire[15:0] T172;
  wire[7:0] T173;
  wire[7:0] T199;
  wire[15:0] T200;
  wire[7:0] T201;
  wire[7:0] T202;
  wire[63:0] T203;
  wire[31:0] T204;
  wire[31:0] T205;
  wire[15:0] T206;
  wire[7:0] T207;
  wire[7:0] T233;
  wire[15:0] T234;
  wire[7:0] T235;
  wire[7:0] T236;
  wire[31:0] T237;
  wire[31:0] T238;
  wire[15:0] T239;
  wire[7:0] T240;
  wire[7:0] T266;
  wire[15:0] T267;
  wire[7:0] T268;
  wire[7:0] T269;
  wire T270;
  wire[63:0] T271;
  wire T272;
  wire T273;
  wire[4:0] T274;
  wire[3:0] T275;
  wire[3:0] T276;
  wire[2:0] T277;
  wire[3:0] T278;
  wire T279;
  wire[1:0] T280;
  wire[2:0] T281;
  wire[7:0] T282;
  wire[31:0] T283;
  wire[31:0] T284;
  wire[27:0] T285;
  wire T286;
  wire T287;
  wire[31:0] T288;
  wire[31:0] T289;
  wire[31:0] T290;
  wire[31:0] T291;
  wire T292;
  wire[1:0] T293;
  wire[31:0] T294;
  wire[31:0] T295;
  wire[31:0] T296;
  wire T297;
  wire T298;
  wire T299;
  wire T300;
  wire T301;
  wire T302;
  wire T303;
  wire T304;
  wire RegChain_io_dataIo_in_ready;
  wire RegChain_io_dataIo_out_valid;
  wire[31:0] RegChain_io_dataIo_out_bits;
  wire SRAMChain_io_dataIo_in_ready;
  wire SRAMChain_io_dataIo_out_valid;
  wire[31:0] SRAMChain_io_dataIo_out_bits;
  wire SRAMChain_io_addrIo_out_valid;
  wire[7:0] SRAMChain_io_addrIo_out_bits;
  wire SRAMChain_1_io_dataIo_in_ready;
  wire SRAMChain_1_io_dataIo_out_valid;
  wire[31:0] SRAMChain_1_io_dataIo_out_bits;
  wire SRAMChain_1_io_addrIo_out_valid;
  wire[7:0] SRAMChain_1_io_addrIo_out_bits;
  wire SRAMChain_2_io_dataIo_in_ready;
  wire SRAMChain_2_io_dataIo_out_valid;
  wire[31:0] SRAMChain_2_io_dataIo_out_bits;
  wire SRAMChain_2_io_addrIo_out_valid;
  wire[7:0] SRAMChain_2_io_addrIo_out_bits;
  wire SRAMChain_3_io_dataIo_in_ready;
  wire SRAMChain_3_io_dataIo_out_valid;
  wire[31:0] SRAMChain_3_io_dataIo_out_bits;
  wire SRAMChain_3_io_addrIo_out_valid;
  wire[7:0] SRAMChain_3_io_addrIo_out_bits;
  wire SRAMChain_4_io_dataIo_in_ready;
  wire SRAMChain_4_io_dataIo_out_valid;
  wire[31:0] SRAMChain_4_io_dataIo_out_bits;
  wire SRAMChain_4_io_addrIo_out_valid;
  wire[7:0] SRAMChain_4_io_addrIo_out_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R164 = {1{$random}};
    state = {1{$random}};
    addr_reg = {1{$random}};
    read_count = {1{$random}};
    is_allocd = {1{$random}};
    R38 = {1{$random}};
    v = {8{$random}};
    write_count = {1{$random}};
    cpu_mask = {1{$random}};
    rdata_buf_0 = {2{$random}};
    cpu_data = {1{$random}};
    R197 = {1{$random}};
    R231 = {1{$random}};
    R264 = {1{$random}};
    rdata_buf_1 = {2{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign T305 = T307 ? T306 : R164;
  assign T306 = SRAMChain_4_io_addrIo_out_valid ? SRAMChain_4_io_addrIo_out_bits : idx;
  assign idx = io_cpu_req_bits_addr[4'hb:3'h4];
  assign T307 = SRAMChain_4_io_addrIo_out_valid | T308;
  assign T308 = ren & fire_pin;
  assign ren = T40 & io_cpu_req_valid;
  assign T40 = T42 & T41;
  assign T41 = is_idle | is_read;
  assign is_read = state == 3'h1;
  assign T309 = host__reset ? 3'h0 : T310;
  assign T310 = fire_pin ? T311 : state;
  assign T311 = host__reset ? 3'h0 : T1;
  assign T1 = T86 ? T83 : T2;
  assign T2 = T80 ? 3'h5 : T3;
  assign T3 = T74 ? 3'h4 : T4;
  assign T4 = T70 ? 3'h5 : T5;
  assign T5 = T66 ? 3'h3 : T6;
  assign T6 = T62 ? 3'h0 : T7;
  assign T7 = T58 ? 3'h5 : T8;
  assign T8 = T54 ? 3'h3 : T9;
  assign T9 = T52 ? 3'h0 : T10;
  assign T10 = T18 ? T16 : T11;
  assign T11 = T14 ? T12 : state;
  assign T12 = T13 ? 3'h2 : 3'h1;
  assign T13 = io_cpu_req_bits_mask != 4'h0;
  assign T14 = T15 & io_cpu_req_valid;
  assign T15 = 3'h0 == state;
  assign T16 = T17 ? 3'h2 : 3'h1;
  assign T17 = io_cpu_req_bits_mask != 4'h0;
  assign T18 = T19 & io_cpu_req_valid;
  assign T19 = T51 & hit;
  assign hit = T20;
  assign T20 = T43 & T21;
  assign T21 = T23 == tag_reg;
  assign tag_reg = addr_reg[5'h1f:4'hc];
  assign T312 = T313 ? io_cpu_req_bits_addr : addr_reg;
  assign T313 = io_cpu_resp_valid & fire_pin;
  assign T23 = T24[5'h13:1'h0];
  assign T314 = SRAMChain_io_addrIo_out_valid | T315;
  assign T315 = ren & fire_pin;
  assign T316 = SRAMChain_io_addrIo_out_valid ? SRAMChain_io_addrIo_out_bits : idx;
  Cache_metaMem metaMem (
    .CLK(clk),
    .W0A(idx_reg),
    .W0E(T320),
    .W0I(T26),
    .R1A(T316),
    .R1E(T314),
    .R1O(T24)
  );
  assign T26 = T27;
  assign T27 = {wmeta_dirty, wmeta_tag};
  assign wmeta_tag = tag_reg;
  assign wmeta_dirty = T28;
  assign T28 = is_alloc ^ 1'h1;
  assign is_alloc = T33 & read_wrap_out;
  assign read_wrap_out = T32 & T29;
  assign T29 = read_count == 1'h1;
  assign T317 = host__reset ? 1'h0 : T318;
  assign T318 = fire_pin ? T319 : read_count;
  assign T319 = host__reset ? 1'h0 : T30;
  assign T30 = T32 ? T31 : read_count;
  assign T31 = read_count + 1'h1;
  assign T32 = io_nasti_r_ready & io_nasti_r_valid;
  assign T33 = state == 3'h5;
  assign T320 = wen & fire_pin;
  assign wen = T34 | is_alloc;
  assign T34 = T36 & T35;
  assign T35 = io_cpu_abort ^ 1'h1;
  assign T36 = is_write & T37;
  assign T37 = hit | is_allocd;
  assign T321 = fire_pin ? is_alloc : is_allocd;
  assign is_write = state == 3'h2;
  assign idx_reg = addr_reg[4'hb:3'h4];
  assign T322 = T314 ? T316 : R38;
  assign T43 = v[idx_reg];
  assign T323 = host__reset ? 256'h0 : T324;
  assign T324 = fire_pin ? T325 : v;
  assign T325 = host__reset ? 256'h0 : T44;
  assign T44 = wen ? T45 : v;
  assign T45 = T49 | T46;
  assign T46 = T326 & T47;
  assign T47 = 1'h1 << idx_reg;
  assign T326 = T48 ? 256'hffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff : 256'h0;
  assign T48 = 1'h1;
  assign T49 = v & T50;
  assign T50 = ~ T47;
  assign T51 = 3'h1 == state;
  assign T52 = T19 & T53;
  assign T53 = io_cpu_req_valid ^ 1'h1;
  assign T54 = T56 & T55;
  assign T55 = io_nasti_aw_ready & io_nasti_aw_valid;
  assign T56 = T51 & T57;
  assign T57 = hit ^ 1'h1;
  assign T58 = T56 & T59;
  assign T59 = T61 & T60;
  assign T60 = io_nasti_ar_ready & io_nasti_ar_valid;
  assign T61 = T55 ^ 1'h1;
  assign T62 = T65 & T63;
  assign T63 = T64 | io_cpu_abort;
  assign T64 = hit | is_allocd;
  assign T65 = 3'h2 == state;
  assign T66 = T68 & T67;
  assign T67 = io_nasti_aw_ready & io_nasti_aw_valid;
  assign T68 = T65 & T69;
  assign T69 = T63 ^ 1'h1;
  assign T70 = T68 & T71;
  assign T71 = T73 & T72;
  assign T72 = io_nasti_ar_ready & io_nasti_ar_valid;
  assign T73 = T67 ^ 1'h1;
  assign T74 = T79 & write_wrap_out;
  assign write_wrap_out = T78 & T75;
  assign T75 = write_count == 1'h1;
  assign T327 = host__reset ? 1'h0 : T328;
  assign T328 = fire_pin ? T329 : write_count;
  assign T329 = host__reset ? 1'h0 : T76;
  assign T76 = T78 ? T77 : write_count;
  assign T77 = write_count + 1'h1;
  assign T78 = io_nasti_w_ready & io_nasti_w_valid;
  assign T79 = 3'h3 == state;
  assign T80 = T82 & T81;
  assign T81 = io_nasti_ar_ready & io_nasti_ar_valid;
  assign T82 = 3'h4 == state;
  assign T83 = T84 ? 3'h2 : 3'h0;
  assign T84 = cpu_mask != 4'h0;
  assign T330 = T331 ? io_cpu_req_bits_mask : cpu_mask;
  assign T331 = io_cpu_resp_valid & fire_pin;
  assign T86 = T87 & read_wrap_out;
  assign T87 = 3'h5 == state;
  assign is_idle = state == 3'h0;
  assign T42 = wen ^ 1'h1;
  Cache_dataMem_0 dataMem_0 (
    .CLK(clk),
    .W0A(idx_reg),
    .W0E(T340),
    .W0I(T151),
    .W0M(T133),
    .R1A(T306),
    .R1E(T307),
    .R1O(T131)
  );
  assign T133 = T134;
  assign T134 = {T146, T135};
  assign T135 = {T144, T136};
  assign T136 = 8'h0 - T332;
  assign T332 = {7'h0, T137};
  assign T137 = T138[1'h0];
  assign T138 = wmask[2'h3:1'h0];
  assign wmask = T143 ? T139 : 20'hfffff;
  assign T139 = T140;
  assign T140 = {1'h0, T141};
  assign T141 = cpu_mask << T142;
  assign T142 = {off_reg, 2'h0};
  assign off_reg = addr_reg[2'h3:2'h2];
  assign T143 = is_alloc ^ 1'h1;
  assign T144 = 8'h0 - T333;
  assign T333 = {7'h0, T145};
  assign T145 = T138[1'h1];
  assign T146 = {T149, T147};
  assign T147 = 8'h0 - T334;
  assign T334 = {7'h0, T148};
  assign T148 = T138[2'h2];
  assign T149 = 8'h0 - T335;
  assign T335 = {7'h0, T150};
  assign T150 = T138[2'h3];
  assign T151 = T152;
  assign T152 = {T161, T153};
  assign T153 = {T160, T154};
  assign T154 = wdata[3'h7:1'h0];
  assign wdata = T159 ? T156 : T155;
  assign T155 = {io_nasti_r_bits_data, rdata_buf_0};
  assign T336 = T337 ? io_nasti_r_bits_data : rdata_buf_0;
  assign T337 = T117 & fire_pin;
  assign T117 = T121 & T118;
  assign T118 = T119[1'h0];
  assign T119 = 1'h1 << T120;
  assign T120 = read_count;
  assign T121 = io_nasti_r_ready & io_nasti_r_valid;
  assign T156 = {T157, T157};
  assign T157 = {cpu_data, cpu_data};
  assign T338 = T339 ? io_cpu_req_bits_data : cpu_data;
  assign T339 = io_cpu_resp_valid & fire_pin;
  assign T159 = is_alloc ^ 1'h1;
  assign T160 = wdata[4'hf:4'h8];
  assign T161 = {T163, T162};
  assign T162 = wdata[5'h17:5'h10];
  assign T163 = wdata[5'h1f:5'h18];
  assign T340 = wen & fire_pin;
  assign T341 = fire_pin ^ 1'h1;
  assign T342 = T344 ? T343 : R197;
  assign T343 = SRAMChain_3_io_addrIo_out_valid ? SRAMChain_3_io_addrIo_out_bits : idx;
  assign T344 = SRAMChain_3_io_addrIo_out_valid | T345;
  assign T345 = ren & fire_pin;
  Cache_dataMem_0 dataMem_1 (
    .CLK(clk),
    .W0A(idx_reg),
    .W0E(T350),
    .W0I(T189),
    .W0M(T176),
    .R1A(T343),
    .R1E(T344),
    .R1O(T174)
  );
  assign T176 = T177;
  assign T177 = {T184, T178};
  assign T178 = {T182, T179};
  assign T179 = 8'h0 - T346;
  assign T346 = {7'h0, T180};
  assign T180 = T181[1'h0];
  assign T181 = wmask[3'h7:3'h4];
  assign T182 = 8'h0 - T347;
  assign T347 = {7'h0, T183};
  assign T183 = T181[1'h1];
  assign T184 = {T187, T185};
  assign T185 = 8'h0 - T348;
  assign T348 = {7'h0, T186};
  assign T186 = T181[2'h2];
  assign T187 = 8'h0 - T349;
  assign T349 = {7'h0, T188};
  assign T188 = T181[2'h3];
  assign T189 = T190;
  assign T190 = {T194, T191};
  assign T191 = {T193, T192};
  assign T192 = wdata[6'h27:6'h20];
  assign T193 = wdata[6'h2f:6'h28];
  assign T194 = {T196, T195};
  assign T195 = wdata[6'h37:6'h30];
  assign T196 = wdata[6'h3f:6'h38];
  assign T350 = wen & fire_pin;
  assign T351 = fire_pin ^ 1'h1;
  assign T352 = T354 ? T353 : R231;
  assign T353 = SRAMChain_2_io_addrIo_out_valid ? SRAMChain_2_io_addrIo_out_bits : idx;
  assign T354 = SRAMChain_2_io_addrIo_out_valid | T355;
  assign T355 = ren & fire_pin;
  Cache_dataMem_0 dataMem_2 (
    .CLK(clk),
    .W0A(idx_reg),
    .W0E(T360),
    .W0I(T223),
    .W0M(T210),
    .R1A(T353),
    .R1E(T354),
    .R1O(T208)
  );
  assign T210 = T211;
  assign T211 = {T218, T212};
  assign T212 = {T216, T213};
  assign T213 = 8'h0 - T356;
  assign T356 = {7'h0, T214};
  assign T214 = T215[1'h0];
  assign T215 = wmask[4'hb:4'h8];
  assign T216 = 8'h0 - T357;
  assign T357 = {7'h0, T217};
  assign T217 = T215[1'h1];
  assign T218 = {T221, T219};
  assign T219 = 8'h0 - T358;
  assign T358 = {7'h0, T220};
  assign T220 = T215[2'h2];
  assign T221 = 8'h0 - T359;
  assign T359 = {7'h0, T222};
  assign T222 = T215[2'h3];
  assign T223 = T224;
  assign T224 = {T228, T225};
  assign T225 = {T227, T226};
  assign T226 = wdata[7'h47:7'h40];
  assign T227 = wdata[7'h4f:7'h48];
  assign T228 = {T230, T229};
  assign T229 = wdata[7'h57:7'h50];
  assign T230 = wdata[7'h5f:7'h58];
  assign T360 = wen & fire_pin;
  assign T361 = fire_pin ^ 1'h1;
  assign T362 = T364 ? T363 : R264;
  assign T363 = SRAMChain_1_io_addrIo_out_valid ? SRAMChain_1_io_addrIo_out_bits : idx;
  assign T364 = SRAMChain_1_io_addrIo_out_valid | T365;
  assign T365 = ren & fire_pin;
  Cache_dataMem_0 dataMem_3 (
    .CLK(clk),
    .W0A(idx_reg),
    .W0E(T370),
    .W0I(T256),
    .W0M(T243),
    .R1A(T363),
    .R1E(T364),
    .R1O(T241)
  );
  assign T243 = T244;
  assign T244 = {T251, T245};
  assign T245 = {T249, T246};
  assign T246 = 8'h0 - T366;
  assign T366 = {7'h0, T247};
  assign T247 = T248[1'h0];
  assign T248 = wmask[4'hf:4'hc];
  assign T249 = 8'h0 - T367;
  assign T367 = {7'h0, T250};
  assign T250 = T248[1'h1];
  assign T251 = {T254, T252};
  assign T252 = 8'h0 - T368;
  assign T368 = {7'h0, T253};
  assign T253 = T248[2'h2];
  assign T254 = 8'h0 - T369;
  assign T369 = {7'h0, T255};
  assign T255 = T248[2'h3];
  assign T256 = T257;
  assign T257 = {T261, T258};
  assign T258 = {T260, T259};
  assign T259 = wdata[7'h67:7'h60];
  assign T260 = wdata[7'h6f:7'h68];
  assign T261 = {T263, T262};
  assign T262 = wdata[7'h77:7'h70];
  assign T263 = wdata[7'h7f:7'h78];
  assign T370 = wen & fire_pin;
  assign T371 = fire_pin ^ 1'h1;
  assign T372 = {T24, 11'h0};
  assign T373 = fire_pin ^ 1'h1;
  assign T374 = {T375, 25'h0};
  assign T375 = cpu_data[3'h6:1'h0];
  assign T376 = {T378, T377};
  assign T377 = cpu_data[5'h1f:3'h7];
  assign T378 = T131[3'h6:1'h0];
  assign T379 = {T381, T380};
  assign T380 = T131[5'h1f:3'h7];
  assign T381 = R164[3'h6:1'h0];
  assign T382 = {T384, T383};
  assign T383 = R164[3'h7];
  assign T384 = T174[5'h1e:1'h0];
  assign T385 = {T388, T386};
  assign T386 = {R197, T387};
  assign T387 = T174[5'h1f];
  assign T388 = T208[5'h16:1'h0];
  assign T389 = {T392, T390};
  assign T390 = {R231, T391};
  assign T391 = T208[5'h1f:5'h17];
  assign T392 = T241[4'he:1'h0];
  assign T393 = {T396, T394};
  assign T394 = {R264, T395};
  assign T395 = T241[5'h1f:4'hf];
  assign T396 = {T397, read_count};
  assign T397 = rdata_buf_0[3'h5:1'h0];
  assign T398 = rdata_buf_0[6'h25:3'h6];
  assign T399 = {T401, T400};
  assign T400 = rdata_buf_0[6'h3f:6'h26];
  assign T401 = rdata_buf_1[3'h5:1'h0];
  assign T402 = T403 ? io_nasti_r_bits_data : rdata_buf_1;
  assign T403 = T123 & fire_pin;
  assign T123 = T121 & T124;
  assign T124 = T119[1'h1];
  assign T404 = rdata_buf_1[6'h25:3'h6];
  assign T405 = {T408, T406};
  assign T406 = {cpu_mask, T407};
  assign T407 = rdata_buf_1[6'h3f:6'h26];
  assign T408 = addr_reg[1'h1:1'h0];
  assign T409 = {T412, T410};
  assign T410 = {write_count, T411};
  assign T411 = addr_reg[5'h1f:2'h2];
  assign T412 = T24[1'h0];
  assign T413 = {T416, T414};
  assign T414 = {R38, T415};
  assign T415 = T24[5'h14:1'h1];
  assign T416 = v[2'h3:1'h0];
  assign T417 = v[6'h23:3'h4];
  assign T418 = v[7'h43:6'h24];
  assign T419 = v[7'h63:7'h44];
  assign T420 = v[8'h83:7'h64];
  assign T421 = v[8'ha3:8'h84];
  assign T422 = v[8'hc3:8'ha4];
  assign T423 = v[8'he3:8'hc4];
  assign T424 = {state, T425};
  assign T425 = {is_allocd, T426};
  assign T426 = v[8'hff:8'he4];
  assign T427 = fire_pin ^ 1'h1;
  assign io_daisy_sram_0_out_bits = SRAMChain_io_dataIo_out_bits;
  assign io_daisy_sram_0_out_valid = SRAMChain_io_dataIo_out_valid;
  assign io_daisy_sram_0_in_ready = SRAMChain_4_io_dataIo_in_ready;
  assign io_daisy_regs_out_bits = RegChain_io_dataIo_out_bits;
  assign io_daisy_regs_out_valid = RegChain_io_dataIo_out_valid;
  assign io_daisy_regs_in_ready = RegChain_io_dataIo_in_ready;
  assign io_nasti_r_ready = T0;
  assign T0 = state == 3'h5;
  assign io_nasti_ar_bits_user = T88;
  assign T88 = 1'h0;
  assign io_nasti_ar_bits_id = T89;
  assign T89 = 5'h0;
  assign io_nasti_ar_bits_region = T90;
  assign T90 = 4'h0;
  assign io_nasti_ar_bits_qos = T91;
  assign T91 = 4'h0;
  assign io_nasti_ar_bits_prot = T92;
  assign T92 = 3'h0;
  assign io_nasti_ar_bits_cache = T93;
  assign T93 = 4'h0;
  assign io_nasti_ar_bits_lock = T94;
  assign T94 = 1'h0;
  assign io_nasti_ar_bits_burst = T95;
  assign T95 = 2'h1;
  assign io_nasti_ar_bits_size = T96;
  assign T96 = 3'h3;
  assign io_nasti_ar_bits_len = T97;
  assign T97 = 8'h1;
  assign io_nasti_ar_bits_addr = T98;
  assign T98 = T99;
  assign T99 = T100 << 3'h4;
  assign T100 = {tag_reg, idx_reg};
  assign io_nasti_ar_valid = T101;
  assign T101 = T82 ? 1'h1 : T102;
  assign T102 = T68 ? T107 : T103;
  assign T103 = T56 ? T104 : 1'h0;
  assign T104 = is_dirty ^ 1'h1;
  assign is_dirty = T106 & T105;
  assign T105 = T24[5'h14];
  assign T106 = v[idx_reg];
  assign T107 = is_dirty ^ 1'h1;
  assign io_nasti_b_ready = 1'h1;
  assign io_nasti_w_bits_user = T108;
  assign T108 = 1'h0;
  assign io_nasti_w_bits_strb = T109;
  assign T109 = 8'hff;
  assign io_nasti_w_bits_last = T110;
  assign T110 = write_wrap_out;
  assign io_nasti_w_bits_data = T111;
  assign T111 = T112;
  assign T112 = T272 ? T271 : T113;
  assign T113 = rdata[6'h3f:1'h0];
  assign rdata = T270 ? T125 : T114;
  assign T114 = T115;
  assign T115 = {rdata_buf_1, rdata_buf_0};
  assign T125 = {T203, T126};
  assign T126 = {T170, T127};
  assign T127 = T128;
  assign T128 = {T167, T129};
  assign T129 = {T166, T130};
  assign T130 = T131[3'h7:1'h0];
  assign T166 = T131[4'hf:4'h8];
  assign T167 = {T169, T168};
  assign T168 = T131[5'h17:5'h10];
  assign T169 = T131[5'h1f:5'h18];
  assign T170 = T171;
  assign T171 = {T200, T172};
  assign T172 = {T199, T173};
  assign T173 = T174[3'h7:1'h0];
  assign T199 = T174[4'hf:4'h8];
  assign T200 = {T202, T201};
  assign T201 = T174[5'h17:5'h10];
  assign T202 = T174[5'h1f:5'h18];
  assign T203 = {T237, T204};
  assign T204 = T205;
  assign T205 = {T234, T206};
  assign T206 = {T233, T207};
  assign T207 = T208[3'h7:1'h0];
  assign T233 = T208[4'hf:4'h8];
  assign T234 = {T236, T235};
  assign T235 = T208[5'h17:5'h10];
  assign T236 = T208[5'h1f:5'h18];
  assign T237 = T238;
  assign T238 = {T267, T239};
  assign T239 = {T266, T240};
  assign T240 = T241[3'h7:1'h0];
  assign T266 = T241[4'hf:4'h8];
  assign T267 = {T269, T268};
  assign T268 = T241[5'h17:5'h10];
  assign T269 = T241[5'h1f:5'h18];
  assign T270 = is_allocd ^ 1'h1;
  assign T271 = rdata[7'h7f:7'h40];
  assign T272 = write_count;
  assign io_nasti_w_valid = T79;
  assign io_nasti_aw_bits_user = T273;
  assign T273 = 1'h0;
  assign io_nasti_aw_bits_id = T274;
  assign T274 = 5'h0;
  assign io_nasti_aw_bits_region = T275;
  assign T275 = 4'h0;
  assign io_nasti_aw_bits_qos = T276;
  assign T276 = 4'h0;
  assign io_nasti_aw_bits_prot = T277;
  assign T277 = 3'h0;
  assign io_nasti_aw_bits_cache = T278;
  assign T278 = 4'h0;
  assign io_nasti_aw_bits_lock = T279;
  assign T279 = 1'h0;
  assign io_nasti_aw_bits_burst = T280;
  assign T280 = 2'h1;
  assign io_nasti_aw_bits_size = T281;
  assign T281 = 3'h3;
  assign io_nasti_aw_bits_len = T282;
  assign T282 = 8'h1;
  assign io_nasti_aw_bits_addr = T283;
  assign T283 = T284;
  assign T284 = T285 << 3'h4;
  assign T285 = {T23, idx_reg};
  assign io_nasti_aw_valid = T286;
  assign T286 = T68 ? is_dirty : T287;
  assign T287 = T56 ? is_dirty : 1'h0;
  assign io_cpu_resp_bits_data = T288;
  assign T288 = T298 ? T294 : T289;
  assign T289 = T292 ? T291 : T290;
  assign T290 = rdata[5'h1f:1'h0];
  assign T291 = rdata[6'h3f:6'h20];
  assign T292 = T293[1'h0];
  assign T293 = off_reg;
  assign T294 = T297 ? T296 : T295;
  assign T295 = rdata[7'h5f:7'h40];
  assign T296 = rdata[7'h7f:7'h60];
  assign T297 = T293[1'h0];
  assign T298 = T293[1'h1];
  assign io_cpu_resp_valid = T299;
  assign T299 = T303 | T300;
  assign T300 = is_allocd & T301;
  assign T301 = T302 ^ 1'h1;
  assign T302 = cpu_mask != 4'h0;
  assign T303 = is_idle | T304;
  assign T304 = is_read & hit;
  RegChain_0 RegChain(.clk(clk), .reset(daisy__rst),
       .io_stall( T427 ),
       .io_dataIo_in_ready( RegChain_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_daisy_regs_in_valid ),
       .io_dataIo_in_bits( io_daisy_regs_in_bits ),
       .io_dataIo_out_ready( io_daisy_regs_out_ready ),
       .io_dataIo_out_valid( RegChain_io_dataIo_out_valid ),
       .io_dataIo_out_bits( RegChain_io_dataIo_out_bits ),
       .io_dataIo_data_20( T424 ),
       .io_dataIo_data_19( T423 ),
       .io_dataIo_data_18( T422 ),
       .io_dataIo_data_17( T421 ),
       .io_dataIo_data_16( T420 ),
       .io_dataIo_data_15( T419 ),
       .io_dataIo_data_14( T418 ),
       .io_dataIo_data_13( T417 ),
       .io_dataIo_data_12( T413 ),
       .io_dataIo_data_11( T409 ),
       .io_dataIo_data_10( T405 ),
       .io_dataIo_data_9( T404 ),
       .io_dataIo_data_8( T399 ),
       .io_dataIo_data_7( T398 ),
       .io_dataIo_data_6( T393 ),
       .io_dataIo_data_5( T389 ),
       .io_dataIo_data_4( T385 ),
       .io_dataIo_data_3( T382 ),
       .io_dataIo_data_2( T379 ),
       .io_dataIo_data_1( T376 ),
       .io_dataIo_data_0( T374 )
  );
  SRAMChain SRAMChain(.clk(clk), .reset(daisy__rst),
       .io_stall( T373 ),
       .io_dataIo_in_ready( SRAMChain_io_dataIo_in_ready ),
       .io_dataIo_in_valid( SRAMChain_1_io_dataIo_out_valid ),
       .io_dataIo_in_bits( SRAMChain_1_io_dataIo_out_bits ),
       .io_dataIo_out_ready( io_daisy_sram_0_out_ready ),
       .io_dataIo_out_valid( SRAMChain_io_dataIo_out_valid ),
       .io_dataIo_out_bits( SRAMChain_io_dataIo_out_bits ),
       .io_dataIo_data_0( T372 ),
       .io_restart( io_daisy_sram_0_restart ),
       .io_addrIo_in( R38 ),
       .io_addrIo_out_valid( SRAMChain_io_addrIo_out_valid ),
       .io_addrIo_out_bits( SRAMChain_io_addrIo_out_bits )
  );
  SRAMChain SRAMChain_1(.clk(clk), .reset(daisy__rst),
       .io_stall( T371 ),
       .io_dataIo_in_ready( SRAMChain_1_io_dataIo_in_ready ),
       .io_dataIo_in_valid( SRAMChain_2_io_dataIo_out_valid ),
       .io_dataIo_in_bits( SRAMChain_2_io_dataIo_out_bits ),
       .io_dataIo_out_ready( SRAMChain_io_dataIo_in_ready ),
       .io_dataIo_out_valid( SRAMChain_1_io_dataIo_out_valid ),
       .io_dataIo_out_bits( SRAMChain_1_io_dataIo_out_bits ),
       .io_dataIo_data_0( T241 ),
       .io_restart( io_daisy_sram_0_restart ),
       .io_addrIo_in( R264 ),
       .io_addrIo_out_valid( SRAMChain_1_io_addrIo_out_valid ),
       .io_addrIo_out_bits( SRAMChain_1_io_addrIo_out_bits )
  );
  SRAMChain SRAMChain_2(.clk(clk), .reset(daisy__rst),
       .io_stall( T361 ),
       .io_dataIo_in_ready( SRAMChain_2_io_dataIo_in_ready ),
       .io_dataIo_in_valid( SRAMChain_3_io_dataIo_out_valid ),
       .io_dataIo_in_bits( SRAMChain_3_io_dataIo_out_bits ),
       .io_dataIo_out_ready( SRAMChain_1_io_dataIo_in_ready ),
       .io_dataIo_out_valid( SRAMChain_2_io_dataIo_out_valid ),
       .io_dataIo_out_bits( SRAMChain_2_io_dataIo_out_bits ),
       .io_dataIo_data_0( T208 ),
       .io_restart( io_daisy_sram_0_restart ),
       .io_addrIo_in( R231 ),
       .io_addrIo_out_valid( SRAMChain_2_io_addrIo_out_valid ),
       .io_addrIo_out_bits( SRAMChain_2_io_addrIo_out_bits )
  );
  SRAMChain SRAMChain_3(.clk(clk), .reset(daisy__rst),
       .io_stall( T351 ),
       .io_dataIo_in_ready( SRAMChain_3_io_dataIo_in_ready ),
       .io_dataIo_in_valid( SRAMChain_4_io_dataIo_out_valid ),
       .io_dataIo_in_bits( SRAMChain_4_io_dataIo_out_bits ),
       .io_dataIo_out_ready( SRAMChain_2_io_dataIo_in_ready ),
       .io_dataIo_out_valid( SRAMChain_3_io_dataIo_out_valid ),
       .io_dataIo_out_bits( SRAMChain_3_io_dataIo_out_bits ),
       .io_dataIo_data_0( T174 ),
       .io_restart( io_daisy_sram_0_restart ),
       .io_addrIo_in( R197 ),
       .io_addrIo_out_valid( SRAMChain_3_io_addrIo_out_valid ),
       .io_addrIo_out_bits( SRAMChain_3_io_addrIo_out_bits )
  );
  SRAMChain SRAMChain_4(.clk(clk), .reset(daisy__rst),
       .io_stall( T341 ),
       .io_dataIo_in_ready( SRAMChain_4_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_daisy_sram_0_in_valid ),
       .io_dataIo_in_bits( io_daisy_sram_0_in_bits ),
       .io_dataIo_out_ready( SRAMChain_3_io_dataIo_in_ready ),
       .io_dataIo_out_valid( SRAMChain_4_io_dataIo_out_valid ),
       .io_dataIo_out_bits( SRAMChain_4_io_dataIo_out_bits ),
       .io_dataIo_data_0( T131 ),
       .io_restart( io_daisy_sram_0_restart ),
       .io_addrIo_in( R164 ),
       .io_addrIo_out_valid( SRAMChain_4_io_addrIo_out_valid ),
       .io_addrIo_out_bits( SRAMChain_4_io_addrIo_out_bits )
  );

  always @(posedge clk) begin
    if(T307) begin
      R164 <= T306;
    end
    if(host__reset) begin
      state <= 3'h0;
    end else if(fire_pin) begin
      state <= T311;
    end
    if(T313) begin
      addr_reg <= io_cpu_req_bits_addr;
    end
    if(host__reset) begin
      read_count <= 1'h0;
    end else if(fire_pin) begin
      read_count <= T319;
    end
    if(fire_pin) begin
      is_allocd <= is_alloc;
    end
    if(T314) begin
      R38 <= T316;
    end
    if(host__reset) begin
      v <= 256'h0;
    end else if(fire_pin) begin
      v <= T325;
    end
    if(host__reset) begin
      write_count <= 1'h0;
    end else if(fire_pin) begin
      write_count <= T329;
    end
    if(T331) begin
      cpu_mask <= io_cpu_req_bits_mask;
    end
    if(T337) begin
      rdata_buf_0 <= io_nasti_r_bits_data;
    end
    if(T339) begin
      cpu_data <= io_cpu_req_bits_data;
    end
    if(T344) begin
      R197 <= T343;
    end
    if(T354) begin
      R231 <= T353;
    end
    if(T364) begin
      R264 <= T363;
    end
    if(T403) begin
      rdata_buf_1 <= io_nasti_r_bits_data;
    end
  end
endmodule

module RegChainControl_1(input clk, input reset,
    input  io_stall,
    output io_ctrlIo_copyCond,
    output io_ctrlIo_readCond,
    output io_ctrlIo_cntrNotZero,
    input  io_ctrlIo_outFire,
    input  io_ctrlIo_inValid
);

  wire T0;
  reg  counter;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  reg  copied;
  wire T18;
  reg  R19;
  wire T20;
  wire T21;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    counter = {1{$random}};
    copied = {1{$random}};
    R19 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_ctrlIo_cntrNotZero = T0;
  assign T0 = counter != 1'h0;
  assign T1 = reset ? 1'h0 : T2;
  assign T2 = T9 ? T8 : T3;
  assign T3 = T6 ? 1'h1 : T4;
  assign T4 = T5 ? 1'h0 : counter;
  assign T5 = io_stall ^ 1'h1;
  assign T6 = T7 & io_ctrlIo_copyCond;
  assign T7 = T5 ^ 1'h1;
  assign T8 = counter - 1'h1;
  assign T9 = T13 & T10;
  assign T10 = T12 & T11;
  assign T11 = io_ctrlIo_inValid ^ 1'h1;
  assign T12 = io_ctrlIo_readCond & io_ctrlIo_outFire;
  assign T13 = T14 ^ 1'h1;
  assign T14 = T5 | io_ctrlIo_copyCond;
  assign io_ctrlIo_readCond = T15;
  assign T15 = T17 & T16;
  assign T16 = counter != 1'h0;
  assign T17 = io_stall & copied;
  assign io_ctrlIo_copyCond = T18;
  assign T18 = T20 | R19;
  assign T20 = io_stall & T21;
  assign T21 = copied ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      counter <= 1'h0;
    end else if(T9) begin
      counter <= T8;
    end else if(T6) begin
      counter <= 1'h1;
    end else if(T5) begin
      counter <= 1'h0;
    end
    copied <= io_stall;
    R19 <= reset;
  end
endmodule

module RegChain_1(input clk, input reset,
    input  io_stall,
    output io_dataIo_in_ready,
    input  io_dataIo_in_valid,
    input [31:0] io_dataIo_in_bits,
    input  io_dataIo_out_ready,
    output io_dataIo_out_valid,
    output[31:0] io_dataIo_out_bits,
    input [31:0] io_dataIo_data_0
);

  wire datapath_io_dataIo_in_ready;
  wire datapath_io_dataIo_out_valid;
  wire[31:0] datapath_io_dataIo_out_bits;
  wire datapath_io_ctrlIo_outFire;
  wire datapath_io_ctrlIo_inValid;
  wire control_io_ctrlIo_copyCond;
  wire control_io_ctrlIo_readCond;
  wire control_io_ctrlIo_cntrNotZero;


  assign io_dataIo_out_bits = datapath_io_dataIo_out_bits;
  assign io_dataIo_out_valid = datapath_io_dataIo_out_valid;
  assign io_dataIo_in_ready = datapath_io_dataIo_in_ready;
  DaisyDatapath_1 datapath(.clk(clk),
       .io_dataIo_in_ready( datapath_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_dataIo_in_valid ),
       .io_dataIo_in_bits( io_dataIo_in_bits ),
       .io_dataIo_out_ready( io_dataIo_out_ready ),
       .io_dataIo_out_valid( datapath_io_dataIo_out_valid ),
       .io_dataIo_out_bits( datapath_io_dataIo_out_bits ),
       .io_dataIo_data_0( io_dataIo_data_0 ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
  RegChainControl_1 control(.clk(clk), .reset(reset),
       .io_stall( io_stall ),
       .io_ctrlIo_copyCond( control_io_ctrlIo_copyCond ),
       .io_ctrlIo_readCond( control_io_ctrlIo_readCond ),
       .io_ctrlIo_cntrNotZero( control_io_ctrlIo_cntrNotZero ),
       .io_ctrlIo_outFire( datapath_io_ctrlIo_outFire ),
       .io_ctrlIo_inValid( datapath_io_ctrlIo_inValid )
  );
endmodule

module MemArbiter_1(input clk, input host__reset,
    //output io_icache_aw_ready
    input  io_icache_aw_valid,
    input [31:0] io_icache_aw_bits_addr,
    input [7:0] io_icache_aw_bits_len,
    input [2:0] io_icache_aw_bits_size,
    input [1:0] io_icache_aw_bits_burst,
    input  io_icache_aw_bits_lock,
    input [3:0] io_icache_aw_bits_cache,
    input [2:0] io_icache_aw_bits_prot,
    input [3:0] io_icache_aw_bits_qos,
    input [3:0] io_icache_aw_bits_region,
    input [4:0] io_icache_aw_bits_id,
    input  io_icache_aw_bits_user,
    //output io_icache_w_ready
    input  io_icache_w_valid,
    input [63:0] io_icache_w_bits_data,
    input  io_icache_w_bits_last,
    input [7:0] io_icache_w_bits_strb,
    input  io_icache_w_bits_user,
    input  io_icache_b_ready,
    //output io_icache_b_valid
    //output[1:0] io_icache_b_bits_resp
    //output[4:0] io_icache_b_bits_id
    //output io_icache_b_bits_user
    output io_icache_ar_ready,
    input  io_icache_ar_valid,
    input [31:0] io_icache_ar_bits_addr,
    input [7:0] io_icache_ar_bits_len,
    input [2:0] io_icache_ar_bits_size,
    input [1:0] io_icache_ar_bits_burst,
    input  io_icache_ar_bits_lock,
    input [3:0] io_icache_ar_bits_cache,
    input [2:0] io_icache_ar_bits_prot,
    input [3:0] io_icache_ar_bits_qos,
    input [3:0] io_icache_ar_bits_region,
    input [4:0] io_icache_ar_bits_id,
    input  io_icache_ar_bits_user,
    input  io_icache_r_ready,
    output io_icache_r_valid,
    output[1:0] io_icache_r_bits_resp,
    output[63:0] io_icache_r_bits_data,
    output io_icache_r_bits_last,
    output[4:0] io_icache_r_bits_id,
    output io_icache_r_bits_user,
    output io_dcache_aw_ready,
    input  io_dcache_aw_valid,
    input [31:0] io_dcache_aw_bits_addr,
    input [7:0] io_dcache_aw_bits_len,
    input [2:0] io_dcache_aw_bits_size,
    input [1:0] io_dcache_aw_bits_burst,
    input  io_dcache_aw_bits_lock,
    input [3:0] io_dcache_aw_bits_cache,
    input [2:0] io_dcache_aw_bits_prot,
    input [3:0] io_dcache_aw_bits_qos,
    input [3:0] io_dcache_aw_bits_region,
    input [4:0] io_dcache_aw_bits_id,
    input  io_dcache_aw_bits_user,
    output io_dcache_w_ready,
    input  io_dcache_w_valid,
    input [63:0] io_dcache_w_bits_data,
    input  io_dcache_w_bits_last,
    input [7:0] io_dcache_w_bits_strb,
    input  io_dcache_w_bits_user,
    input  io_dcache_b_ready,
    //output io_dcache_b_valid
    //output[1:0] io_dcache_b_bits_resp
    //output[4:0] io_dcache_b_bits_id
    //output io_dcache_b_bits_user
    output io_dcache_ar_ready,
    input  io_dcache_ar_valid,
    input [31:0] io_dcache_ar_bits_addr,
    input [7:0] io_dcache_ar_bits_len,
    input [2:0] io_dcache_ar_bits_size,
    input [1:0] io_dcache_ar_bits_burst,
    input  io_dcache_ar_bits_lock,
    input [3:0] io_dcache_ar_bits_cache,
    input [2:0] io_dcache_ar_bits_prot,
    input [3:0] io_dcache_ar_bits_qos,
    input [3:0] io_dcache_ar_bits_region,
    input [4:0] io_dcache_ar_bits_id,
    input  io_dcache_ar_bits_user,
    input  io_dcache_r_ready,
    output io_dcache_r_valid,
    output[1:0] io_dcache_r_bits_resp,
    output[63:0] io_dcache_r_bits_data,
    output io_dcache_r_bits_last,
    output[4:0] io_dcache_r_bits_id,
    output io_dcache_r_bits_user,
    input  io_nasti_aw_ready,
    output io_nasti_aw_valid,
    output[31:0] io_nasti_aw_bits_addr,
    output[7:0] io_nasti_aw_bits_len,
    output[2:0] io_nasti_aw_bits_size,
    output[1:0] io_nasti_aw_bits_burst,
    output io_nasti_aw_bits_lock,
    output[3:0] io_nasti_aw_bits_cache,
    output[2:0] io_nasti_aw_bits_prot,
    output[3:0] io_nasti_aw_bits_qos,
    output[3:0] io_nasti_aw_bits_region,
    output[4:0] io_nasti_aw_bits_id,
    output io_nasti_aw_bits_user,
    input  io_nasti_w_ready,
    output io_nasti_w_valid,
    output[63:0] io_nasti_w_bits_data,
    output io_nasti_w_bits_last,
    output[7:0] io_nasti_w_bits_strb,
    output io_nasti_w_bits_user,
    output io_nasti_b_ready,
    input  io_nasti_b_valid,
    input [1:0] io_nasti_b_bits_resp,
    input [4:0] io_nasti_b_bits_id,
    //input  io_nasti_b_bits_user
    input  io_nasti_ar_ready,
    output io_nasti_ar_valid,
    output[31:0] io_nasti_ar_bits_addr,
    output[7:0] io_nasti_ar_bits_len,
    output[2:0] io_nasti_ar_bits_size,
    output[1:0] io_nasti_ar_bits_burst,
    output io_nasti_ar_bits_lock,
    output[3:0] io_nasti_ar_bits_cache,
    output[2:0] io_nasti_ar_bits_prot,
    output[3:0] io_nasti_ar_bits_qos,
    output[3:0] io_nasti_ar_bits_region,
    output[4:0] io_nasti_ar_bits_id,
    output io_nasti_ar_bits_user,
    output io_nasti_r_ready,
    input  io_nasti_r_valid,
    input [1:0] io_nasti_r_bits_resp,
    input [63:0] io_nasti_r_bits_data,
    input  io_nasti_r_bits_last,
    input [4:0] io_nasti_r_bits_id,
    input  io_nasti_r_bits_user,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  wire[31:0] T73;
  reg [1:0] state;
  wire[1:0] T74;
  wire[1:0] T75;
  wire[1:0] T76;
  wire[1:0] T3;
  wire[1:0] T4;
  wire[1:0] T5;
  wire[1:0] T6;
  wire[1:0] T7;
  wire[1:0] T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T77;
  wire T0;
  wire T1;
  wire T2;
  wire T33;
  wire T34;
  wire T35;
  wire[4:0] T36;
  wire[4:0] T37;
  wire[3:0] T38;
  wire[3:0] T39;
  wire[2:0] T40;
  wire[3:0] T41;
  wire T42;
  wire[1:0] T43;
  wire[2:0] T44;
  wire[2:0] T45;
  wire[7:0] T46;
  wire[7:0] T47;
  wire[31:0] T48;
  wire[31:0] T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire T72;
  wire RegChain_io_dataIo_in_ready;
  wire RegChain_io_dataIo_out_valid;
  wire[31:0] RegChain_io_dataIo_out_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
//  assign io_dcache_b_bits_user = {1{$random}};
//  assign io_dcache_b_bits_id = {1{$random}};
//  assign io_dcache_b_bits_resp = {1{$random}};
//  assign io_dcache_b_valid = {1{$random}};
//  assign io_icache_b_bits_user = {1{$random}};
//  assign io_icache_b_bits_id = {1{$random}};
//  assign io_icache_b_bits_resp = {1{$random}};
//  assign io_icache_b_valid = {1{$random}};
//  assign io_icache_w_ready = {1{$random}};
//  assign io_icache_aw_ready = {1{$random}};
// synthesis translate_on
`endif
  assign T73 = {state, 30'h0};
  assign T74 = host__reset ? 2'h0 : T75;
  assign T75 = fire_pin ? T76 : state;
  assign T76 = host__reset ? 2'h0 : T3;
  assign T3 = T29 ? 2'h0 : T4;
  assign T4 = T25 ? 2'h0 : T5;
  assign T5 = T21 ? 2'h0 : T6;
  assign T6 = T16 ? 2'h1 : T7;
  assign T7 = T12 ? 2'h2 : T8;
  assign T8 = T9 ? 2'h3 : state;
  assign T9 = T11 & T10;
  assign T10 = io_dcache_aw_ready & io_dcache_aw_valid;
  assign T11 = 2'h0 == state;
  assign T12 = T11 & T13;
  assign T13 = T15 & T14;
  assign T14 = io_dcache_ar_ready & io_dcache_ar_valid;
  assign T15 = T10 ^ 1'h1;
  assign T16 = T11 & T17;
  assign T17 = T19 & T18;
  assign T18 = io_icache_ar_ready & io_icache_ar_valid;
  assign T19 = T20 ^ 1'h1;
  assign T20 = T10 | T14;
  assign T21 = T24 & T22;
  assign T22 = T23 & io_nasti_r_bits_last;
  assign T23 = io_nasti_r_ready & io_nasti_r_valid;
  assign T24 = 2'h1 == state;
  assign T25 = T28 & T26;
  assign T26 = T27 & io_nasti_r_bits_last;
  assign T27 = io_nasti_r_ready & io_nasti_r_valid;
  assign T28 = 2'h2 == state;
  assign T29 = T32 & T30;
  assign T30 = T31 & io_dcache_w_bits_last;
  assign T31 = io_dcache_w_ready & io_dcache_w_valid;
  assign T32 = 2'h3 == state;
  assign T77 = fire_pin ^ 1'h1;
  assign io_daisy_regs_out_bits = RegChain_io_dataIo_out_bits;
  assign io_daisy_regs_out_valid = RegChain_io_dataIo_out_valid;
  assign io_daisy_regs_in_ready = RegChain_io_dataIo_in_ready;
  assign io_nasti_r_ready = T0;
  assign T0 = T33 | T1;
  assign T1 = io_dcache_r_ready & T2;
  assign T2 = state == 2'h2;
  assign T33 = io_icache_r_ready & T34;
  assign T34 = state == 2'h1;
  assign io_nasti_ar_bits_user = T35;
  assign T35 = 1'h0;
  assign io_nasti_ar_bits_id = T36;
  assign T36 = T37;
  assign T37 = io_dcache_ar_valid ? io_dcache_ar_bits_id : io_icache_ar_bits_id;
  assign io_nasti_ar_bits_region = T38;
  assign T38 = 4'h0;
  assign io_nasti_ar_bits_qos = T39;
  assign T39 = 4'h0;
  assign io_nasti_ar_bits_prot = T40;
  assign T40 = 3'h0;
  assign io_nasti_ar_bits_cache = T41;
  assign T41 = 4'h0;
  assign io_nasti_ar_bits_lock = T42;
  assign T42 = 1'h0;
  assign io_nasti_ar_bits_burst = T43;
  assign T43 = 2'h1;
  assign io_nasti_ar_bits_size = T44;
  assign T44 = T45;
  assign T45 = io_dcache_ar_valid ? io_dcache_ar_bits_size : io_icache_ar_bits_size;
  assign io_nasti_ar_bits_len = T46;
  assign T46 = T47;
  assign T47 = io_dcache_ar_valid ? io_dcache_ar_bits_len : io_icache_ar_bits_len;
  assign io_nasti_ar_bits_addr = T48;
  assign T48 = T49;
  assign T49 = io_dcache_ar_valid ? io_dcache_ar_bits_addr : io_icache_ar_bits_addr;
  assign io_nasti_ar_valid = T50;
  assign T50 = T52 & T51;
  assign T51 = state == 2'h0;
  assign T52 = T54 & T53;
  assign T53 = io_nasti_aw_valid ^ 1'h1;
  assign T54 = io_icache_ar_valid | io_dcache_ar_valid;
  assign io_nasti_b_ready = 1'h1;
  assign io_nasti_w_bits_user = io_dcache_w_bits_user;
  assign io_nasti_w_bits_strb = io_dcache_w_bits_strb;
  assign io_nasti_w_bits_last = io_dcache_w_bits_last;
  assign io_nasti_w_bits_data = io_dcache_w_bits_data;
  assign io_nasti_w_valid = T55;
  assign T55 = io_dcache_w_valid & T56;
  assign T56 = state == 2'h3;
  assign io_nasti_aw_bits_user = io_dcache_aw_bits_user;
  assign io_nasti_aw_bits_id = io_dcache_aw_bits_id;
  assign io_nasti_aw_bits_region = io_dcache_aw_bits_region;
  assign io_nasti_aw_bits_qos = io_dcache_aw_bits_qos;
  assign io_nasti_aw_bits_prot = io_dcache_aw_bits_prot;
  assign io_nasti_aw_bits_cache = io_dcache_aw_bits_cache;
  assign io_nasti_aw_bits_lock = io_dcache_aw_bits_lock;
  assign io_nasti_aw_bits_burst = io_dcache_aw_bits_burst;
  assign io_nasti_aw_bits_size = io_dcache_aw_bits_size;
  assign io_nasti_aw_bits_len = io_dcache_aw_bits_len;
  assign io_nasti_aw_bits_addr = io_dcache_aw_bits_addr;
  assign io_nasti_aw_valid = T57;
  assign T57 = io_dcache_aw_valid & T58;
  assign T58 = state == 2'h0;
  assign io_dcache_r_bits_user = io_nasti_r_bits_user;
  assign io_dcache_r_bits_id = io_nasti_r_bits_id;
  assign io_dcache_r_bits_last = io_nasti_r_bits_last;
  assign io_dcache_r_bits_data = io_nasti_r_bits_data;
  assign io_dcache_r_bits_resp = io_nasti_r_bits_resp;
  assign io_dcache_r_valid = T59;
  assign T59 = io_nasti_r_valid & T60;
  assign T60 = state == 2'h2;
  assign io_dcache_ar_ready = T61;
  assign T61 = T63 & T62;
  assign T62 = state == 2'h0;
  assign T63 = io_nasti_ar_ready & T64;
  assign T64 = io_nasti_aw_valid ^ 1'h1;
  assign io_dcache_w_ready = T65;
  assign T65 = io_nasti_w_ready & T66;
  assign T66 = state == 2'h3;
  assign io_dcache_aw_ready = T67;
  assign T67 = io_nasti_aw_ready & T68;
  assign T68 = state == 2'h0;
  assign io_icache_r_bits_user = io_nasti_r_bits_user;
  assign io_icache_r_bits_id = io_nasti_r_bits_id;
  assign io_icache_r_bits_last = io_nasti_r_bits_last;
  assign io_icache_r_bits_data = io_nasti_r_bits_data;
  assign io_icache_r_bits_resp = io_nasti_r_bits_resp;
  assign io_icache_r_valid = T69;
  assign T69 = io_nasti_r_valid & T70;
  assign T70 = state == 2'h1;
  assign io_icache_ar_ready = T71;
  assign T71 = io_dcache_ar_ready & T72;
  assign T72 = io_dcache_ar_valid ^ 1'h1;
  RegChain_1 RegChain(.clk(clk), .reset(daisy__rst),
       .io_stall( T77 ),
       .io_dataIo_in_ready( RegChain_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_daisy_regs_in_valid ),
       .io_dataIo_in_bits( io_daisy_regs_in_bits ),
       .io_dataIo_out_ready( io_daisy_regs_out_ready ),
       .io_dataIo_out_valid( RegChain_io_dataIo_out_valid ),
       .io_dataIo_out_bits( RegChain_io_dataIo_out_bits ),
       .io_dataIo_data_0( T73 )
  );

  always @(posedge clk) begin
    if(host__reset) begin
      state <= 2'h0;
    end else if(fire_pin) begin
      state <= T76;
    end
  end
endmodule

module Queue_16(input clk, input host__reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [4:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[4:0] io_deq_bits,
    output[1:0] io_count,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  wire[31:0] T15;
  wire[20:0] T16;
  wire[19:0] T17;
  reg  R4;
  wire T18;
  wire T19;
  wire T20;
  wire T5;
  wire T6;
  wire do_enq;
  reg  maybe_full;
  wire T21;
  wire T22;
  wire T23;
  wire T8;
  wire T9;
  wire do_deq;
  wire[10:0] T24;
  wire[5:0] T25;
  reg  R1;
  wire T26;
  wire T27;
  wire T28;
  wire T2;
  wire T3;
  wire[4:0] T29;
  reg [4:0] ram [1:0];
  wire[4:0] T11;
  wire T30;
  wire[4:0] T31;
  wire T32;
  wire[1:0] T0;
  wire ptr_diff;
  wire T7;
  wire ptr_match;
  wire[4:0] T10;
  wire T12;
  wire empty;
  wire T13;
  wire T14;
  wire full;
  wire RegChain_io_dataIo_in_ready;
  wire RegChain_io_dataIo_out_valid;
  wire[31:0] RegChain_io_dataIo_out_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R4 = {1{$random}};
    maybe_full = {1{$random}};
    R1 = {1{$random}};
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign T15 = {T24, T16};
  assign T16 = {maybe_full, T17};
  assign T17 = {R4, 19'h0};
  assign T18 = host__reset ? 1'h0 : T19;
  assign T19 = fire_pin ? T20 : R4;
  assign T20 = host__reset ? 1'h0 : T5;
  assign T5 = do_enq ? T6 : R4;
  assign T6 = R4 + 1'h1;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T21 = host__reset ? 1'h0 : T22;
  assign T22 = fire_pin ? T23 : maybe_full;
  assign T23 = host__reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T24 = {T31, T25};
  assign T25 = {T29, R1};
  assign T26 = host__reset ? 1'h0 : T27;
  assign T27 = fire_pin ? T28 : R1;
  assign T28 = host__reset ? 1'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 1'h1;
  assign T29 = ram[1'h1];
  assign T30 = do_enq & fire_pin;
  assign T31 = ram[1'h0];
  assign T32 = fire_pin ^ 1'h1;
  assign io_daisy_regs_out_bits = RegChain_io_dataIo_out_bits;
  assign io_daisy_regs_out_valid = RegChain_io_dataIo_out_valid;
  assign io_daisy_regs_in_ready = RegChain_io_dataIo_in_ready;
  assign io_count = T0;
  assign T0 = {T7, ptr_diff};
  assign ptr_diff = R4 - R1;
  assign T7 = maybe_full & ptr_match;
  assign ptr_match = R4 == R1;
  assign io_deq_bits = T10;
  assign T10 = ram[R1];
  assign io_deq_valid = T12;
  assign T12 = empty ^ 1'h1;
  assign empty = ptr_match & T13;
  assign T13 = maybe_full ^ 1'h1;
  assign io_enq_ready = T14;
  assign T14 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;
  RegChain_1 RegChain(.clk(clk), .reset(daisy__rst),
       .io_stall( T32 ),
       .io_dataIo_in_ready( RegChain_io_dataIo_in_ready ),
       .io_dataIo_in_valid( io_daisy_regs_in_valid ),
       .io_dataIo_in_bits( io_daisy_regs_in_bits ),
       .io_dataIo_out_ready( io_daisy_regs_out_ready ),
       .io_dataIo_out_valid( RegChain_io_dataIo_out_valid ),
       .io_dataIo_out_bits( RegChain_io_dataIo_out_bits ),
       .io_dataIo_data_0( T15 )
  );

  always @(posedge clk) begin
    if(host__reset) begin
      R4 <= 1'h0;
    end else if(fire_pin) begin
      R4 <= T20;
    end
    if(host__reset) begin
      maybe_full <= 1'h0;
    end else if(fire_pin) begin
      maybe_full <= T23;
    end
    if(host__reset) begin
      R1 <= 1'h0;
    end else if(fire_pin) begin
      R1 <= T28;
    end
    if (T30)
      ram[R4] <= io_enq_bits;
  end
endmodule

module MemIONastiIOConverter(input clk, input host__reset,
    output io_nasti_aw_ready,
    input  io_nasti_aw_valid,
    input [31:0] io_nasti_aw_bits_addr,
    input [7:0] io_nasti_aw_bits_len,
    input [2:0] io_nasti_aw_bits_size,
    input [1:0] io_nasti_aw_bits_burst,
    input  io_nasti_aw_bits_lock,
    input [3:0] io_nasti_aw_bits_cache,
    input [2:0] io_nasti_aw_bits_prot,
    input [3:0] io_nasti_aw_bits_qos,
    input [3:0] io_nasti_aw_bits_region,
    input [4:0] io_nasti_aw_bits_id,
    input  io_nasti_aw_bits_user,
    output io_nasti_w_ready,
    input  io_nasti_w_valid,
    input [63:0] io_nasti_w_bits_data,
    input  io_nasti_w_bits_last,
    input [7:0] io_nasti_w_bits_strb,
    input  io_nasti_w_bits_user,
    input  io_nasti_b_ready,
    output io_nasti_b_valid,
    output[1:0] io_nasti_b_bits_resp,
    output[4:0] io_nasti_b_bits_id,
    //output io_nasti_b_bits_user
    output io_nasti_ar_ready,
    input  io_nasti_ar_valid,
    input [31:0] io_nasti_ar_bits_addr,
    input [7:0] io_nasti_ar_bits_len,
    input [2:0] io_nasti_ar_bits_size,
    input [1:0] io_nasti_ar_bits_burst,
    input  io_nasti_ar_bits_lock,
    input [3:0] io_nasti_ar_bits_cache,
    input [2:0] io_nasti_ar_bits_prot,
    input [3:0] io_nasti_ar_bits_qos,
    input [3:0] io_nasti_ar_bits_region,
    input [4:0] io_nasti_ar_bits_id,
    input  io_nasti_ar_bits_user,
    input  io_nasti_r_ready,
    output io_nasti_r_valid,
    output[1:0] io_nasti_r_bits_resp,
    output[63:0] io_nasti_r_bits_data,
    output io_nasti_r_bits_last,
    output[4:0] io_nasti_r_bits_id,
    //output io_nasti_r_bits_user
    input  io_mem_req_cmd_ready,
    output io_mem_req_cmd_valid,
    output[31:0] io_mem_req_cmd_bits_addr,
    output[4:0] io_mem_req_cmd_bits_tag,
    output io_mem_req_cmd_bits_rw,
    input  io_mem_req_data_ready,
    output io_mem_req_data_valid,
    output[63:0] io_mem_req_data_bits_data,
    output io_mem_resp_ready,
    input  io_mem_resp_valid,
    input [63:0] io_mem_resp_bits_data,
    input [4:0] io_mem_resp_bits_tag,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    //output io_daisy_sram_0_in_ready
    //input  io_daisy_sram_0_in_valid
    //input [31:0] io_daisy_sram_0_in_bits
    //input  io_daisy_sram_0_out_ready
    //output io_daisy_sram_0_out_valid
    //output[31:0] io_daisy_sram_0_out_bits
    //input  io_daisy_sram_0_restart
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  wire T45;
  wire T46;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T47;
  wire T48;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T49;
  wire T50;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T51;
  wire T52;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T53;
  wire T54;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  reg  T0;
  reg  T5;
  reg  T10;
  reg  T15;
  reg  T20;
  wire[31:0] T55;
  wire[30:0] T56;
  reg  mif_cnt_out;
  wire T57;
  wire T58;
  wire T59;
  wire T38;
  wire T39;
  wire T40;
  reg  b_ok;
  wire T60;
  wire T61;
  wire T62;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T63;
  wire T25;
  wire T31;
  wire[4:0] T32;
  wire[31:0] T64;
  wire[27:0] T33;
  wire[31:0] T34;
  wire T35;
  wire T36;
  wire mif_wrap_out;
  wire T37;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire RegChain_io_dataIo_in_ready;
  wire RegChain_io_dataIo_out_valid;
  wire[31:0] RegChain_io_dataIo_out_bits;
  wire id_q_io_enq_ready;
  wire id_q_io_deq_valid;
  wire[4:0] id_q_io_deq_bits;
  wire id_q_io_daisy_regs_in_ready;
  wire id_q_io_daisy_regs_out_valid;
  wire[31:0] id_q_io_daisy_regs_out_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    T0 = 1'b0;
    T5 = 1'b0;
    T10 = 1'b0;
    T15 = 1'b0;
    T20 = 1'b0;
    mif_cnt_out = {1{$random}};
    b_ok = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_0_out_bits = {1{$random}};
//  assign io_daisy_sram_0_out_valid = {1{$random}};
//  assign io_daisy_sram_0_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
//  assign io_nasti_r_bits_user = {1{$random}};
//  assign io_nasti_b_bits_user = {1{$random}};
// synthesis translate_on
`endif
  assign T45 = T1 | T46;
  assign T46 = fire_pin ^ 1'h1;
  assign T1 = T2 | host__reset;
  assign T2 = T4 | T3;
  assign T3 = io_nasti_w_bits_strb == 8'hff;
  assign T4 = io_nasti_w_valid ^ 1'h1;
  assign T47 = T6 | T48;
  assign T48 = fire_pin ^ 1'h1;
  assign T6 = T7 | host__reset;
  assign T7 = T9 | T8;
  assign T8 = io_nasti_ar_bits_len == 8'h1;
  assign T9 = io_nasti_ar_valid ^ 1'h1;
  assign T49 = T11 | T50;
  assign T50 = fire_pin ^ 1'h1;
  assign T11 = T12 | host__reset;
  assign T12 = T14 | T13;
  assign T13 = io_nasti_aw_bits_len == 8'h1;
  assign T14 = io_nasti_aw_valid ^ 1'h1;
  assign T51 = T16 | T52;
  assign T52 = fire_pin ^ 1'h1;
  assign T16 = T17 | host__reset;
  assign T17 = T19 | T18;
  assign T18 = io_nasti_ar_bits_size == 3'h3;
  assign T19 = io_nasti_ar_valid ^ 1'h1;
  assign T53 = T21 | T54;
  assign T54 = fire_pin ^ 1'h1;
  assign T21 = T22 | host__reset;
  assign T22 = T24 | T23;
  assign T23 = io_nasti_aw_bits_size == 3'h3;
  assign T24 = io_nasti_aw_valid ^ 1'h1;
  assign T55 = {b_ok, T56};
  assign T56 = {mif_cnt_out, 30'h0};
  assign T57 = host__reset ? 1'h0 : T58;
  assign T58 = fire_pin ? T59 : mif_cnt_out;
  assign T59 = host__reset ? 1'h0 : T38;
  assign T38 = T40 ? T39 : mif_cnt_out;
  assign T39 = mif_cnt_out + 1'h1;
  assign T40 = io_mem_resp_ready & io_mem_resp_valid;
  assign T60 = host__reset ? 1'h1 : T61;
  assign T61 = fire_pin ? T62 : b_ok;
  assign T62 = host__reset ? 1'h1 : T26;
  assign T26 = T29 ? 1'h1 : T27;
  assign T27 = T28 ? 1'h0 : b_ok;
  assign T28 = io_nasti_aw_ready & io_nasti_aw_valid;
  assign T29 = T30 & io_nasti_w_bits_last;
  assign T30 = io_nasti_w_ready & io_nasti_w_valid;
  assign T63 = fire_pin ^ 1'h1;
  assign T25 = io_nasti_b_ready & b_ok;
  assign T31 = io_nasti_aw_valid & io_mem_req_cmd_ready;
  assign io_daisy_regs_out_bits = RegChain_io_dataIo_out_bits;
  assign io_daisy_regs_out_valid = RegChain_io_dataIo_out_valid;
  assign io_daisy_regs_in_ready = id_q_io_daisy_regs_in_ready;
  assign io_mem_resp_ready = io_nasti_r_ready;
  assign io_mem_req_data_bits_data = io_nasti_w_bits_data;
  assign io_mem_req_data_valid = io_nasti_w_valid;
  assign io_mem_req_cmd_bits_rw = io_nasti_aw_valid;
  assign io_mem_req_cmd_bits_tag = T32;
  assign T32 = io_nasti_aw_valid ? io_nasti_aw_bits_id : io_nasti_ar_bits_id;
  assign io_mem_req_cmd_bits_addr = T64;
  assign T64 = {4'h0, T33};
  assign T33 = T34 >> 3'h4;
  assign T34 = io_nasti_aw_valid ? io_nasti_aw_bits_addr : io_nasti_ar_bits_addr;
  assign io_mem_req_cmd_valid = T35;
  assign T35 = T36 | io_nasti_ar_valid;
  assign T36 = io_nasti_aw_valid & id_q_io_enq_ready;
  assign io_nasti_r_bits_id = io_mem_resp_bits_tag;
  assign io_nasti_r_bits_last = mif_wrap_out;
  assign mif_wrap_out = T40 & T37;
  assign T37 = mif_cnt_out == 1'h1;
  assign io_nasti_r_bits_data = io_mem_resp_bits_data;
  assign io_nasti_r_bits_resp = 2'h0;
  assign io_nasti_r_valid = io_mem_resp_valid;
  assign io_nasti_ar_ready = T41;
  assign T41 = io_mem_req_cmd_ready & T42;
  assign T42 = io_nasti_aw_valid ^ 1'h1;
  assign io_nasti_b_bits_id = id_q_io_deq_bits;
  assign io_nasti_b_bits_resp = 2'h0;
  assign io_nasti_b_valid = T43;
  assign T43 = id_q_io_deq_valid & b_ok;
  assign io_nasti_w_ready = io_mem_req_data_ready;
  assign io_nasti_aw_ready = T44;
  assign T44 = io_mem_req_cmd_ready & id_q_io_enq_ready;
  Queue_16 id_q(.clk(clk), .host__reset(host__reset),
       .io_enq_ready( id_q_io_enq_ready ),
       .io_enq_valid( T31 ),
       .io_enq_bits( io_nasti_aw_bits_id ),
       .io_deq_ready( T25 ),
       .io_deq_valid( id_q_io_deq_valid ),
       .io_deq_bits( id_q_io_deq_bits ),
       //.io_count(  )
       .io_daisy_regs_in_ready( id_q_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( io_daisy_regs_in_valid ),
       .io_daisy_regs_in_bits( io_daisy_regs_in_bits ),
       .io_daisy_regs_out_ready( RegChain_io_dataIo_in_ready ),
       .io_daisy_regs_out_valid( id_q_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( id_q_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
  RegChain_1 RegChain(.clk(clk), .reset(daisy__rst),
       .io_stall( T63 ),
       .io_dataIo_in_ready( RegChain_io_dataIo_in_ready ),
       .io_dataIo_in_valid( id_q_io_daisy_regs_out_valid ),
       .io_dataIo_in_bits( id_q_io_daisy_regs_out_bits ),
       .io_dataIo_out_ready( io_daisy_regs_out_ready ),
       .io_dataIo_out_valid( RegChain_io_dataIo_out_valid ),
       .io_dataIo_out_bits( RegChain_io_dataIo_out_bits ),
       .io_dataIo_data_0( T55 )
  );

  always @(posedge clk) begin
`ifndef SYNTHESIS
// synthesis translate_off
  if(host__reset) T20 <= 1'b1;
  if(!T53 && T20 && !host__reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "Nasti data size does not match MemIO data size");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(host__reset) T15 <= 1'b1;
  if(!T51 && T15 && !host__reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "Nasti data size does not match MemIO data size");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(host__reset) T10 <= 1'b1;
  if(!T49 && T10 && !host__reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "Nasti length does not match number of MemIO beats");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(host__reset) T5 <= 1'b1;
  if(!T47 && T5 && !host__reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "Nasti length does not match number of MemIO beats");
    $finish;
  end
// synthesis translate_on
`endif
`ifndef SYNTHESIS
// synthesis translate_off
  if(host__reset) T0 <= 1'b1;
  if(!T45 && T0 && !host__reset) begin
    $fwrite(32'h80000002, "ASSERTION FAILED: %s\n", "MemIO must write full cache line");
    $finish;
  end
// synthesis translate_on
`endif
    if(host__reset) begin
      mif_cnt_out <= 1'h0;
    end else if(fire_pin) begin
      mif_cnt_out <= T59;
    end
    if(host__reset) begin
      b_ok <= 1'h1;
    end else if(fire_pin) begin
      b_ok <= T62;
    end
  end
endmodule

module Tile(input clk, input host__reset,
    input  io_htif_host_fromhost_valid,
    input [31:0] io_htif_host_fromhost_bits,
    output[31:0] io_htif_host_tohost,
    input  io_mem_req_cmd_ready,
    output io_mem_req_cmd_valid,
    output[31:0] io_mem_req_cmd_bits_addr,
    output[4:0] io_mem_req_cmd_bits_tag,
    output io_mem_req_cmd_bits_rw,
    input  io_mem_req_data_ready,
    output io_mem_req_data_valid,
    output[63:0] io_mem_req_data_bits_data,
    output io_mem_resp_ready,
    input  io_mem_resp_valid,
    input [63:0] io_mem_resp_bits_data,
    input [4:0] io_mem_resp_bits_tag,
    input  io_nasti_aw_ready,
    //output io_nasti_aw_valid
    //output[31:0] io_nasti_aw_bits_addr
    //output[7:0] io_nasti_aw_bits_len
    //output[2:0] io_nasti_aw_bits_size
    //output[1:0] io_nasti_aw_bits_burst
    //output io_nasti_aw_bits_lock
    //output[3:0] io_nasti_aw_bits_cache
    //output[2:0] io_nasti_aw_bits_prot
    //output[3:0] io_nasti_aw_bits_qos
    //output[3:0] io_nasti_aw_bits_region
    //output[4:0] io_nasti_aw_bits_id
    //output io_nasti_aw_bits_user
    input  io_nasti_w_ready,
    //output io_nasti_w_valid
    //output[63:0] io_nasti_w_bits_data
    //output io_nasti_w_bits_last
    //output[7:0] io_nasti_w_bits_strb
    //output io_nasti_w_bits_user
    //output io_nasti_b_ready
    input  io_nasti_b_valid,
    input [1:0] io_nasti_b_bits_resp,
    input [4:0] io_nasti_b_bits_id,
    input  io_nasti_b_bits_user,
    input  io_nasti_ar_ready,
    //output io_nasti_ar_valid
    //output[31:0] io_nasti_ar_bits_addr
    //output[7:0] io_nasti_ar_bits_len
    //output[2:0] io_nasti_ar_bits_size
    //output[1:0] io_nasti_ar_bits_burst
    //output io_nasti_ar_bits_lock
    //output[3:0] io_nasti_ar_bits_cache
    //output[2:0] io_nasti_ar_bits_prot
    //output[3:0] io_nasti_ar_bits_qos
    //output[3:0] io_nasti_ar_bits_region
    //output[4:0] io_nasti_ar_bits_id
    //output io_nasti_ar_bits_user
    //output io_nasti_r_ready
    input  io_nasti_r_valid,
    input [1:0] io_nasti_r_bits_resp,
    input [63:0] io_nasti_r_bits_data,
    input  io_nasti_r_bits_last,
    input [4:0] io_nasti_r_bits_id,
    input  io_nasti_r_bits_user,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    //input  io_daisy_trace_in_valid
    //input [31:0] io_daisy_trace_in_bits
    //input  io_daisy_trace_out_ready
    //output io_daisy_trace_out_valid
    //output[31:0] io_daisy_trace_out_bits
    //output io_daisy_sram_1_in_ready
    //input  io_daisy_sram_1_in_valid
    //input [31:0] io_daisy_sram_1_in_bits
    //input  io_daisy_sram_1_out_ready
    //output io_daisy_sram_1_out_valid
    //output[31:0] io_daisy_sram_1_out_bits
    //input  io_daisy_sram_1_restart
    output io_daisy_sram_0_in_ready,
    input  io_daisy_sram_0_in_valid,
    input [31:0] io_daisy_sram_0_in_bits,
    input  io_daisy_sram_0_out_ready,
    output io_daisy_sram_0_out_valid,
    output[31:0] io_daisy_sram_0_out_bits,
    input  io_daisy_sram_0_restart,
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    //input  io_daisy_cntr_out_ready
    //output io_daisy_cntr_out_valid
    //output[31:0] io_daisy_cntr_out_bits
    input  fire_pin,
    input  daisy__rst
);

  wire icache_io_cpu_resp_valid;
  wire[31:0] icache_io_cpu_resp_bits_data;
  wire icache_io_nasti_aw_valid;
  wire[31:0] icache_io_nasti_aw_bits_addr;
  wire[7:0] icache_io_nasti_aw_bits_len;
  wire[2:0] icache_io_nasti_aw_bits_size;
  wire[1:0] icache_io_nasti_aw_bits_burst;
  wire icache_io_nasti_aw_bits_lock;
  wire[3:0] icache_io_nasti_aw_bits_cache;
  wire[2:0] icache_io_nasti_aw_bits_prot;
  wire[3:0] icache_io_nasti_aw_bits_qos;
  wire[3:0] icache_io_nasti_aw_bits_region;
  wire[4:0] icache_io_nasti_aw_bits_id;
  wire icache_io_nasti_aw_bits_user;
  wire icache_io_nasti_w_valid;
  wire[63:0] icache_io_nasti_w_bits_data;
  wire icache_io_nasti_w_bits_last;
  wire[7:0] icache_io_nasti_w_bits_strb;
  wire icache_io_nasti_w_bits_user;
  wire icache_io_nasti_b_ready;
  wire icache_io_nasti_ar_valid;
  wire[31:0] icache_io_nasti_ar_bits_addr;
  wire[7:0] icache_io_nasti_ar_bits_len;
  wire[2:0] icache_io_nasti_ar_bits_size;
  wire[1:0] icache_io_nasti_ar_bits_burst;
  wire icache_io_nasti_ar_bits_lock;
  wire[3:0] icache_io_nasti_ar_bits_cache;
  wire[2:0] icache_io_nasti_ar_bits_prot;
  wire[3:0] icache_io_nasti_ar_bits_qos;
  wire[3:0] icache_io_nasti_ar_bits_region;
  wire[4:0] icache_io_nasti_ar_bits_id;
  wire icache_io_nasti_ar_bits_user;
  wire icache_io_nasti_r_ready;
  wire icache_io_daisy_regs_in_ready;
  wire icache_io_daisy_regs_out_valid;
  wire[31:0] icache_io_daisy_regs_out_bits;
  wire icache_io_daisy_sram_0_in_ready;
  wire icache_io_daisy_sram_0_out_valid;
  wire[31:0] icache_io_daisy_sram_0_out_bits;
  wire dcache_io_cpu_resp_valid;
  wire[31:0] dcache_io_cpu_resp_bits_data;
  wire dcache_io_nasti_aw_valid;
  wire[31:0] dcache_io_nasti_aw_bits_addr;
  wire[7:0] dcache_io_nasti_aw_bits_len;
  wire[2:0] dcache_io_nasti_aw_bits_size;
  wire[1:0] dcache_io_nasti_aw_bits_burst;
  wire dcache_io_nasti_aw_bits_lock;
  wire[3:0] dcache_io_nasti_aw_bits_cache;
  wire[2:0] dcache_io_nasti_aw_bits_prot;
  wire[3:0] dcache_io_nasti_aw_bits_qos;
  wire[3:0] dcache_io_nasti_aw_bits_region;
  wire[4:0] dcache_io_nasti_aw_bits_id;
  wire dcache_io_nasti_aw_bits_user;
  wire dcache_io_nasti_w_valid;
  wire[63:0] dcache_io_nasti_w_bits_data;
  wire dcache_io_nasti_w_bits_last;
  wire[7:0] dcache_io_nasti_w_bits_strb;
  wire dcache_io_nasti_w_bits_user;
  wire dcache_io_nasti_b_ready;
  wire dcache_io_nasti_ar_valid;
  wire[31:0] dcache_io_nasti_ar_bits_addr;
  wire[7:0] dcache_io_nasti_ar_bits_len;
  wire[2:0] dcache_io_nasti_ar_bits_size;
  wire[1:0] dcache_io_nasti_ar_bits_burst;
  wire dcache_io_nasti_ar_bits_lock;
  wire[3:0] dcache_io_nasti_ar_bits_cache;
  wire[2:0] dcache_io_nasti_ar_bits_prot;
  wire[3:0] dcache_io_nasti_ar_bits_qos;
  wire[3:0] dcache_io_nasti_ar_bits_region;
  wire[4:0] dcache_io_nasti_ar_bits_id;
  wire dcache_io_nasti_ar_bits_user;
  wire dcache_io_nasti_r_ready;
  wire dcache_io_daisy_regs_in_ready;
  wire dcache_io_daisy_regs_out_valid;
  wire[31:0] dcache_io_daisy_regs_out_bits;
  wire dcache_io_daisy_sram_0_in_ready;
  wire dcache_io_daisy_sram_0_out_valid;
  wire[31:0] dcache_io_daisy_sram_0_out_bits;
  wire arb_io_icache_ar_ready;
  wire arb_io_icache_r_valid;
  wire[1:0] arb_io_icache_r_bits_resp;
  wire[63:0] arb_io_icache_r_bits_data;
  wire arb_io_icache_r_bits_last;
  wire[4:0] arb_io_icache_r_bits_id;
  wire arb_io_icache_r_bits_user;
  wire arb_io_dcache_aw_ready;
  wire arb_io_dcache_w_ready;
  wire arb_io_dcache_ar_ready;
  wire arb_io_dcache_r_valid;
  wire[1:0] arb_io_dcache_r_bits_resp;
  wire[63:0] arb_io_dcache_r_bits_data;
  wire arb_io_dcache_r_bits_last;
  wire[4:0] arb_io_dcache_r_bits_id;
  wire arb_io_dcache_r_bits_user;
  wire arb_io_nasti_aw_valid;
  wire[31:0] arb_io_nasti_aw_bits_addr;
  wire[7:0] arb_io_nasti_aw_bits_len;
  wire[2:0] arb_io_nasti_aw_bits_size;
  wire[1:0] arb_io_nasti_aw_bits_burst;
  wire arb_io_nasti_aw_bits_lock;
  wire[3:0] arb_io_nasti_aw_bits_cache;
  wire[2:0] arb_io_nasti_aw_bits_prot;
  wire[3:0] arb_io_nasti_aw_bits_qos;
  wire[3:0] arb_io_nasti_aw_bits_region;
  wire[4:0] arb_io_nasti_aw_bits_id;
  wire arb_io_nasti_aw_bits_user;
  wire arb_io_nasti_w_valid;
  wire[63:0] arb_io_nasti_w_bits_data;
  wire arb_io_nasti_w_bits_last;
  wire[7:0] arb_io_nasti_w_bits_strb;
  wire arb_io_nasti_w_bits_user;
  wire arb_io_nasti_b_ready;
  wire arb_io_nasti_ar_valid;
  wire[31:0] arb_io_nasti_ar_bits_addr;
  wire[7:0] arb_io_nasti_ar_bits_len;
  wire[2:0] arb_io_nasti_ar_bits_size;
  wire[1:0] arb_io_nasti_ar_bits_burst;
  wire arb_io_nasti_ar_bits_lock;
  wire[3:0] arb_io_nasti_ar_bits_cache;
  wire[2:0] arb_io_nasti_ar_bits_prot;
  wire[3:0] arb_io_nasti_ar_bits_qos;
  wire[3:0] arb_io_nasti_ar_bits_region;
  wire[4:0] arb_io_nasti_ar_bits_id;
  wire arb_io_nasti_ar_bits_user;
  wire arb_io_nasti_r_ready;
  wire arb_io_daisy_regs_in_ready;
  wire arb_io_daisy_regs_out_valid;
  wire[31:0] arb_io_daisy_regs_out_bits;
  wire MemIONastiIOConverter_io_nasti_aw_ready;
  wire MemIONastiIOConverter_io_nasti_w_ready;
  wire MemIONastiIOConverter_io_nasti_b_valid;
  wire[1:0] MemIONastiIOConverter_io_nasti_b_bits_resp;
  wire[4:0] MemIONastiIOConverter_io_nasti_b_bits_id;
  wire MemIONastiIOConverter_io_nasti_ar_ready;
  wire MemIONastiIOConverter_io_nasti_r_valid;
  wire[1:0] MemIONastiIOConverter_io_nasti_r_bits_resp;
  wire[63:0] MemIONastiIOConverter_io_nasti_r_bits_data;
  wire MemIONastiIOConverter_io_nasti_r_bits_last;
  wire[4:0] MemIONastiIOConverter_io_nasti_r_bits_id;
  wire MemIONastiIOConverter_io_mem_req_cmd_valid;
  wire[31:0] MemIONastiIOConverter_io_mem_req_cmd_bits_addr;
  wire[4:0] MemIONastiIOConverter_io_mem_req_cmd_bits_tag;
  wire MemIONastiIOConverter_io_mem_req_cmd_bits_rw;
  wire MemIONastiIOConverter_io_mem_req_data_valid;
  wire[63:0] MemIONastiIOConverter_io_mem_req_data_bits_data;
  wire MemIONastiIOConverter_io_mem_resp_ready;
  wire MemIONastiIOConverter_io_daisy_regs_in_ready;
  wire MemIONastiIOConverter_io_daisy_regs_out_valid;
  wire[31:0] MemIONastiIOConverter_io_daisy_regs_out_bits;
  wire[31:0] core_io_host_tohost;
  wire core_io_icache_abort;
  wire core_io_icache_req_valid;
  wire[31:0] core_io_icache_req_bits_addr;
  wire[31:0] core_io_icache_req_bits_data;
  wire[3:0] core_io_icache_req_bits_mask;
  wire core_io_dcache_abort;
  wire core_io_dcache_req_valid;
  wire[31:0] core_io_dcache_req_bits_addr;
  wire[31:0] core_io_dcache_req_bits_data;
  wire[3:0] core_io_dcache_req_bits_mask;
  wire core_io_daisy_regs_in_ready;
  wire core_io_daisy_regs_out_valid;
  wire[31:0] core_io_daisy_regs_out_bits;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_out_bits = {1{$random}};
//  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
//  assign io_daisy_sram_1_out_bits = {1{$random}};
//  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
//  assign io_daisy_trace_out_bits = {1{$random}};
//  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
//  assign io_nasti_r_ready = {1{$random}};
//  assign io_nasti_ar_bits_user = {1{$random}};
//  assign io_nasti_ar_bits_id = {1{$random}};
//  assign io_nasti_ar_bits_region = {1{$random}};
//  assign io_nasti_ar_bits_qos = {1{$random}};
//  assign io_nasti_ar_bits_prot = {1{$random}};
//  assign io_nasti_ar_bits_cache = {1{$random}};
//  assign io_nasti_ar_bits_lock = {1{$random}};
//  assign io_nasti_ar_bits_burst = {1{$random}};
//  assign io_nasti_ar_bits_size = {1{$random}};
//  assign io_nasti_ar_bits_len = {1{$random}};
//  assign io_nasti_ar_bits_addr = {1{$random}};
//  assign io_nasti_ar_valid = {1{$random}};
//  assign io_nasti_b_ready = {1{$random}};
//  assign io_nasti_w_bits_user = {1{$random}};
//  assign io_nasti_w_bits_strb = {1{$random}};
//  assign io_nasti_w_bits_last = {1{$random}};
//  assign io_nasti_w_bits_data = {2{$random}};
//  assign io_nasti_w_valid = {1{$random}};
//  assign io_nasti_aw_bits_user = {1{$random}};
//  assign io_nasti_aw_bits_id = {1{$random}};
//  assign io_nasti_aw_bits_region = {1{$random}};
//  assign io_nasti_aw_bits_qos = {1{$random}};
//  assign io_nasti_aw_bits_prot = {1{$random}};
//  assign io_nasti_aw_bits_cache = {1{$random}};
//  assign io_nasti_aw_bits_lock = {1{$random}};
//  assign io_nasti_aw_bits_burst = {1{$random}};
//  assign io_nasti_aw_bits_size = {1{$random}};
//  assign io_nasti_aw_bits_len = {1{$random}};
//  assign io_nasti_aw_bits_addr = {1{$random}};
//  assign io_nasti_aw_valid = {1{$random}};
// synthesis translate_on
`endif
  assign io_daisy_sram_0_out_bits = icache_io_daisy_sram_0_out_bits;
  assign io_daisy_sram_0_out_valid = icache_io_daisy_sram_0_out_valid;
  assign io_daisy_sram_0_in_ready = dcache_io_daisy_sram_0_in_ready;
  assign io_daisy_regs_out_bits = core_io_daisy_regs_out_bits;
  assign io_daisy_regs_out_valid = core_io_daisy_regs_out_valid;
  assign io_daisy_regs_in_ready = MemIONastiIOConverter_io_daisy_regs_in_ready;
  assign io_mem_resp_ready = MemIONastiIOConverter_io_mem_resp_ready;
  assign io_mem_req_data_bits_data = MemIONastiIOConverter_io_mem_req_data_bits_data;
  assign io_mem_req_data_valid = MemIONastiIOConverter_io_mem_req_data_valid;
  assign io_mem_req_cmd_bits_rw = MemIONastiIOConverter_io_mem_req_cmd_bits_rw;
  assign io_mem_req_cmd_bits_tag = MemIONastiIOConverter_io_mem_req_cmd_bits_tag;
  assign io_mem_req_cmd_bits_addr = MemIONastiIOConverter_io_mem_req_cmd_bits_addr;
  assign io_mem_req_cmd_valid = MemIONastiIOConverter_io_mem_req_cmd_valid;
  assign io_htif_host_tohost = core_io_host_tohost;
  Core core(.clk(clk), .host__reset(host__reset),
       .io_host_fromhost_valid( io_htif_host_fromhost_valid ),
       .io_host_fromhost_bits( io_htif_host_fromhost_bits ),
       .io_host_tohost( core_io_host_tohost ),
       .io_icache_abort( core_io_icache_abort ),
       .io_icache_req_valid( core_io_icache_req_valid ),
       .io_icache_req_bits_addr( core_io_icache_req_bits_addr ),
       .io_icache_req_bits_data( core_io_icache_req_bits_data ),
       .io_icache_req_bits_mask( core_io_icache_req_bits_mask ),
       .io_icache_resp_valid( icache_io_cpu_resp_valid ),
       .io_icache_resp_bits_data( icache_io_cpu_resp_bits_data ),
       .io_dcache_abort( core_io_dcache_abort ),
       .io_dcache_req_valid( core_io_dcache_req_valid ),
       .io_dcache_req_bits_addr( core_io_dcache_req_bits_addr ),
       .io_dcache_req_bits_data( core_io_dcache_req_bits_data ),
       .io_dcache_req_bits_mask( core_io_dcache_req_bits_mask ),
       .io_dcache_resp_valid( dcache_io_cpu_resp_valid ),
       .io_dcache_resp_bits_data( dcache_io_cpu_resp_bits_data ),
       .io_daisy_regs_in_ready( core_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( icache_io_daisy_regs_out_valid ),
       .io_daisy_regs_in_bits( icache_io_daisy_regs_out_bits ),
       .io_daisy_regs_out_ready( io_daisy_regs_out_ready ),
       .io_daisy_regs_out_valid( core_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( core_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
  Cache icache(.clk(clk), .host__reset(host__reset),
       .io_cpu_abort( core_io_icache_abort ),
       .io_cpu_req_valid( core_io_icache_req_valid ),
       .io_cpu_req_bits_addr( core_io_icache_req_bits_addr ),
       .io_cpu_req_bits_data( core_io_icache_req_bits_data ),
       .io_cpu_req_bits_mask( core_io_icache_req_bits_mask ),
       .io_cpu_resp_valid( icache_io_cpu_resp_valid ),
       .io_cpu_resp_bits_data( icache_io_cpu_resp_bits_data ),
       //.io_nasti_aw_ready(  )
       .io_nasti_aw_valid( icache_io_nasti_aw_valid ),
       .io_nasti_aw_bits_addr( icache_io_nasti_aw_bits_addr ),
       .io_nasti_aw_bits_len( icache_io_nasti_aw_bits_len ),
       .io_nasti_aw_bits_size( icache_io_nasti_aw_bits_size ),
       .io_nasti_aw_bits_burst( icache_io_nasti_aw_bits_burst ),
       .io_nasti_aw_bits_lock( icache_io_nasti_aw_bits_lock ),
       .io_nasti_aw_bits_cache( icache_io_nasti_aw_bits_cache ),
       .io_nasti_aw_bits_prot( icache_io_nasti_aw_bits_prot ),
       .io_nasti_aw_bits_qos( icache_io_nasti_aw_bits_qos ),
       .io_nasti_aw_bits_region( icache_io_nasti_aw_bits_region ),
       .io_nasti_aw_bits_id( icache_io_nasti_aw_bits_id ),
       .io_nasti_aw_bits_user( icache_io_nasti_aw_bits_user ),
       //.io_nasti_w_ready(  )
       .io_nasti_w_valid( icache_io_nasti_w_valid ),
       .io_nasti_w_bits_data( icache_io_nasti_w_bits_data ),
       .io_nasti_w_bits_last( icache_io_nasti_w_bits_last ),
       .io_nasti_w_bits_strb( icache_io_nasti_w_bits_strb ),
       .io_nasti_w_bits_user( icache_io_nasti_w_bits_user ),
       .io_nasti_b_ready( icache_io_nasti_b_ready ),
       //.io_nasti_b_valid(  )
       //.io_nasti_b_bits_resp(  )
       //.io_nasti_b_bits_id(  )
       //.io_nasti_b_bits_user(  )
       .io_nasti_ar_ready( arb_io_icache_ar_ready ),
       .io_nasti_ar_valid( icache_io_nasti_ar_valid ),
       .io_nasti_ar_bits_addr( icache_io_nasti_ar_bits_addr ),
       .io_nasti_ar_bits_len( icache_io_nasti_ar_bits_len ),
       .io_nasti_ar_bits_size( icache_io_nasti_ar_bits_size ),
       .io_nasti_ar_bits_burst( icache_io_nasti_ar_bits_burst ),
       .io_nasti_ar_bits_lock( icache_io_nasti_ar_bits_lock ),
       .io_nasti_ar_bits_cache( icache_io_nasti_ar_bits_cache ),
       .io_nasti_ar_bits_prot( icache_io_nasti_ar_bits_prot ),
       .io_nasti_ar_bits_qos( icache_io_nasti_ar_bits_qos ),
       .io_nasti_ar_bits_region( icache_io_nasti_ar_bits_region ),
       .io_nasti_ar_bits_id( icache_io_nasti_ar_bits_id ),
       .io_nasti_ar_bits_user( icache_io_nasti_ar_bits_user ),
       .io_nasti_r_ready( icache_io_nasti_r_ready ),
       .io_nasti_r_valid( arb_io_icache_r_valid ),
       .io_nasti_r_bits_resp( arb_io_icache_r_bits_resp ),
       .io_nasti_r_bits_data( arb_io_icache_r_bits_data ),
       .io_nasti_r_bits_last( arb_io_icache_r_bits_last ),
       .io_nasti_r_bits_id( arb_io_icache_r_bits_id ),
       .io_nasti_r_bits_user( arb_io_icache_r_bits_user ),
       .io_daisy_regs_in_ready( icache_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( dcache_io_daisy_regs_out_valid ),
       .io_daisy_regs_in_bits( dcache_io_daisy_regs_out_bits ),
       .io_daisy_regs_out_ready( core_io_daisy_regs_in_ready ),
       .io_daisy_regs_out_valid( icache_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( icache_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       .io_daisy_sram_0_in_ready( icache_io_daisy_sram_0_in_ready ),
       .io_daisy_sram_0_in_valid( dcache_io_daisy_sram_0_out_valid ),
       .io_daisy_sram_0_in_bits( dcache_io_daisy_sram_0_out_bits ),
       .io_daisy_sram_0_out_ready( io_daisy_sram_0_out_ready ),
       .io_daisy_sram_0_out_valid( icache_io_daisy_sram_0_out_valid ),
       .io_daisy_sram_0_out_bits( icache_io_daisy_sram_0_out_bits ),
       .io_daisy_sram_0_restart( io_daisy_sram_0_restart ),
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign icache.io_nasti_aw_ready = {1{$random}};
    assign icache.io_nasti_w_ready = {1{$random}};
// synthesis translate_on
`endif
  Cache dcache(.clk(clk), .host__reset(host__reset),
       .io_cpu_abort( core_io_dcache_abort ),
       .io_cpu_req_valid( core_io_dcache_req_valid ),
       .io_cpu_req_bits_addr( core_io_dcache_req_bits_addr ),
       .io_cpu_req_bits_data( core_io_dcache_req_bits_data ),
       .io_cpu_req_bits_mask( core_io_dcache_req_bits_mask ),
       .io_cpu_resp_valid( dcache_io_cpu_resp_valid ),
       .io_cpu_resp_bits_data( dcache_io_cpu_resp_bits_data ),
       .io_nasti_aw_ready( arb_io_dcache_aw_ready ),
       .io_nasti_aw_valid( dcache_io_nasti_aw_valid ),
       .io_nasti_aw_bits_addr( dcache_io_nasti_aw_bits_addr ),
       .io_nasti_aw_bits_len( dcache_io_nasti_aw_bits_len ),
       .io_nasti_aw_bits_size( dcache_io_nasti_aw_bits_size ),
       .io_nasti_aw_bits_burst( dcache_io_nasti_aw_bits_burst ),
       .io_nasti_aw_bits_lock( dcache_io_nasti_aw_bits_lock ),
       .io_nasti_aw_bits_cache( dcache_io_nasti_aw_bits_cache ),
       .io_nasti_aw_bits_prot( dcache_io_nasti_aw_bits_prot ),
       .io_nasti_aw_bits_qos( dcache_io_nasti_aw_bits_qos ),
       .io_nasti_aw_bits_region( dcache_io_nasti_aw_bits_region ),
       .io_nasti_aw_bits_id( dcache_io_nasti_aw_bits_id ),
       .io_nasti_aw_bits_user( dcache_io_nasti_aw_bits_user ),
       .io_nasti_w_ready( arb_io_dcache_w_ready ),
       .io_nasti_w_valid( dcache_io_nasti_w_valid ),
       .io_nasti_w_bits_data( dcache_io_nasti_w_bits_data ),
       .io_nasti_w_bits_last( dcache_io_nasti_w_bits_last ),
       .io_nasti_w_bits_strb( dcache_io_nasti_w_bits_strb ),
       .io_nasti_w_bits_user( dcache_io_nasti_w_bits_user ),
       .io_nasti_b_ready( dcache_io_nasti_b_ready ),
       //.io_nasti_b_valid(  )
       //.io_nasti_b_bits_resp(  )
       //.io_nasti_b_bits_id(  )
       //.io_nasti_b_bits_user(  )
       .io_nasti_ar_ready( arb_io_dcache_ar_ready ),
       .io_nasti_ar_valid( dcache_io_nasti_ar_valid ),
       .io_nasti_ar_bits_addr( dcache_io_nasti_ar_bits_addr ),
       .io_nasti_ar_bits_len( dcache_io_nasti_ar_bits_len ),
       .io_nasti_ar_bits_size( dcache_io_nasti_ar_bits_size ),
       .io_nasti_ar_bits_burst( dcache_io_nasti_ar_bits_burst ),
       .io_nasti_ar_bits_lock( dcache_io_nasti_ar_bits_lock ),
       .io_nasti_ar_bits_cache( dcache_io_nasti_ar_bits_cache ),
       .io_nasti_ar_bits_prot( dcache_io_nasti_ar_bits_prot ),
       .io_nasti_ar_bits_qos( dcache_io_nasti_ar_bits_qos ),
       .io_nasti_ar_bits_region( dcache_io_nasti_ar_bits_region ),
       .io_nasti_ar_bits_id( dcache_io_nasti_ar_bits_id ),
       .io_nasti_ar_bits_user( dcache_io_nasti_ar_bits_user ),
       .io_nasti_r_ready( dcache_io_nasti_r_ready ),
       .io_nasti_r_valid( arb_io_dcache_r_valid ),
       .io_nasti_r_bits_resp( arb_io_dcache_r_bits_resp ),
       .io_nasti_r_bits_data( arb_io_dcache_r_bits_data ),
       .io_nasti_r_bits_last( arb_io_dcache_r_bits_last ),
       .io_nasti_r_bits_id( arb_io_dcache_r_bits_id ),
       .io_nasti_r_bits_user( arb_io_dcache_r_bits_user ),
       .io_daisy_regs_in_ready( dcache_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( arb_io_daisy_regs_out_valid ),
       .io_daisy_regs_in_bits( arb_io_daisy_regs_out_bits ),
       .io_daisy_regs_out_ready( icache_io_daisy_regs_in_ready ),
       .io_daisy_regs_out_valid( dcache_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( dcache_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       .io_daisy_sram_0_in_ready( dcache_io_daisy_sram_0_in_ready ),
       .io_daisy_sram_0_in_valid( io_daisy_sram_0_in_valid ),
       .io_daisy_sram_0_in_bits( io_daisy_sram_0_in_bits ),
       .io_daisy_sram_0_out_ready( icache_io_daisy_sram_0_in_ready ),
       .io_daisy_sram_0_out_valid( dcache_io_daisy_sram_0_out_valid ),
       .io_daisy_sram_0_out_bits( dcache_io_daisy_sram_0_out_bits ),
       .io_daisy_sram_0_restart( io_daisy_sram_0_restart ),
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
  MemArbiter_1 arb(.clk(clk), .host__reset(host__reset),
       //.io_icache_aw_ready(  )
       .io_icache_aw_valid( icache_io_nasti_aw_valid ),
       .io_icache_aw_bits_addr( icache_io_nasti_aw_bits_addr ),
       .io_icache_aw_bits_len( icache_io_nasti_aw_bits_len ),
       .io_icache_aw_bits_size( icache_io_nasti_aw_bits_size ),
       .io_icache_aw_bits_burst( icache_io_nasti_aw_bits_burst ),
       .io_icache_aw_bits_lock( icache_io_nasti_aw_bits_lock ),
       .io_icache_aw_bits_cache( icache_io_nasti_aw_bits_cache ),
       .io_icache_aw_bits_prot( icache_io_nasti_aw_bits_prot ),
       .io_icache_aw_bits_qos( icache_io_nasti_aw_bits_qos ),
       .io_icache_aw_bits_region( icache_io_nasti_aw_bits_region ),
       .io_icache_aw_bits_id( icache_io_nasti_aw_bits_id ),
       .io_icache_aw_bits_user( icache_io_nasti_aw_bits_user ),
       //.io_icache_w_ready(  )
       .io_icache_w_valid( icache_io_nasti_w_valid ),
       .io_icache_w_bits_data( icache_io_nasti_w_bits_data ),
       .io_icache_w_bits_last( icache_io_nasti_w_bits_last ),
       .io_icache_w_bits_strb( icache_io_nasti_w_bits_strb ),
       .io_icache_w_bits_user( icache_io_nasti_w_bits_user ),
       .io_icache_b_ready( icache_io_nasti_b_ready ),
       //.io_icache_b_valid(  )
       //.io_icache_b_bits_resp(  )
       //.io_icache_b_bits_id(  )
       //.io_icache_b_bits_user(  )
       .io_icache_ar_ready( arb_io_icache_ar_ready ),
       .io_icache_ar_valid( icache_io_nasti_ar_valid ),
       .io_icache_ar_bits_addr( icache_io_nasti_ar_bits_addr ),
       .io_icache_ar_bits_len( icache_io_nasti_ar_bits_len ),
       .io_icache_ar_bits_size( icache_io_nasti_ar_bits_size ),
       .io_icache_ar_bits_burst( icache_io_nasti_ar_bits_burst ),
       .io_icache_ar_bits_lock( icache_io_nasti_ar_bits_lock ),
       .io_icache_ar_bits_cache( icache_io_nasti_ar_bits_cache ),
       .io_icache_ar_bits_prot( icache_io_nasti_ar_bits_prot ),
       .io_icache_ar_bits_qos( icache_io_nasti_ar_bits_qos ),
       .io_icache_ar_bits_region( icache_io_nasti_ar_bits_region ),
       .io_icache_ar_bits_id( icache_io_nasti_ar_bits_id ),
       .io_icache_ar_bits_user( icache_io_nasti_ar_bits_user ),
       .io_icache_r_ready( icache_io_nasti_r_ready ),
       .io_icache_r_valid( arb_io_icache_r_valid ),
       .io_icache_r_bits_resp( arb_io_icache_r_bits_resp ),
       .io_icache_r_bits_data( arb_io_icache_r_bits_data ),
       .io_icache_r_bits_last( arb_io_icache_r_bits_last ),
       .io_icache_r_bits_id( arb_io_icache_r_bits_id ),
       .io_icache_r_bits_user( arb_io_icache_r_bits_user ),
       .io_dcache_aw_ready( arb_io_dcache_aw_ready ),
       .io_dcache_aw_valid( dcache_io_nasti_aw_valid ),
       .io_dcache_aw_bits_addr( dcache_io_nasti_aw_bits_addr ),
       .io_dcache_aw_bits_len( dcache_io_nasti_aw_bits_len ),
       .io_dcache_aw_bits_size( dcache_io_nasti_aw_bits_size ),
       .io_dcache_aw_bits_burst( dcache_io_nasti_aw_bits_burst ),
       .io_dcache_aw_bits_lock( dcache_io_nasti_aw_bits_lock ),
       .io_dcache_aw_bits_cache( dcache_io_nasti_aw_bits_cache ),
       .io_dcache_aw_bits_prot( dcache_io_nasti_aw_bits_prot ),
       .io_dcache_aw_bits_qos( dcache_io_nasti_aw_bits_qos ),
       .io_dcache_aw_bits_region( dcache_io_nasti_aw_bits_region ),
       .io_dcache_aw_bits_id( dcache_io_nasti_aw_bits_id ),
       .io_dcache_aw_bits_user( dcache_io_nasti_aw_bits_user ),
       .io_dcache_w_ready( arb_io_dcache_w_ready ),
       .io_dcache_w_valid( dcache_io_nasti_w_valid ),
       .io_dcache_w_bits_data( dcache_io_nasti_w_bits_data ),
       .io_dcache_w_bits_last( dcache_io_nasti_w_bits_last ),
       .io_dcache_w_bits_strb( dcache_io_nasti_w_bits_strb ),
       .io_dcache_w_bits_user( dcache_io_nasti_w_bits_user ),
       .io_dcache_b_ready( dcache_io_nasti_b_ready ),
       //.io_dcache_b_valid(  )
       //.io_dcache_b_bits_resp(  )
       //.io_dcache_b_bits_id(  )
       //.io_dcache_b_bits_user(  )
       .io_dcache_ar_ready( arb_io_dcache_ar_ready ),
       .io_dcache_ar_valid( dcache_io_nasti_ar_valid ),
       .io_dcache_ar_bits_addr( dcache_io_nasti_ar_bits_addr ),
       .io_dcache_ar_bits_len( dcache_io_nasti_ar_bits_len ),
       .io_dcache_ar_bits_size( dcache_io_nasti_ar_bits_size ),
       .io_dcache_ar_bits_burst( dcache_io_nasti_ar_bits_burst ),
       .io_dcache_ar_bits_lock( dcache_io_nasti_ar_bits_lock ),
       .io_dcache_ar_bits_cache( dcache_io_nasti_ar_bits_cache ),
       .io_dcache_ar_bits_prot( dcache_io_nasti_ar_bits_prot ),
       .io_dcache_ar_bits_qos( dcache_io_nasti_ar_bits_qos ),
       .io_dcache_ar_bits_region( dcache_io_nasti_ar_bits_region ),
       .io_dcache_ar_bits_id( dcache_io_nasti_ar_bits_id ),
       .io_dcache_ar_bits_user( dcache_io_nasti_ar_bits_user ),
       .io_dcache_r_ready( dcache_io_nasti_r_ready ),
       .io_dcache_r_valid( arb_io_dcache_r_valid ),
       .io_dcache_r_bits_resp( arb_io_dcache_r_bits_resp ),
       .io_dcache_r_bits_data( arb_io_dcache_r_bits_data ),
       .io_dcache_r_bits_last( arb_io_dcache_r_bits_last ),
       .io_dcache_r_bits_id( arb_io_dcache_r_bits_id ),
       .io_dcache_r_bits_user( arb_io_dcache_r_bits_user ),
       .io_nasti_aw_ready( MemIONastiIOConverter_io_nasti_aw_ready ),
       .io_nasti_aw_valid( arb_io_nasti_aw_valid ),
       .io_nasti_aw_bits_addr( arb_io_nasti_aw_bits_addr ),
       .io_nasti_aw_bits_len( arb_io_nasti_aw_bits_len ),
       .io_nasti_aw_bits_size( arb_io_nasti_aw_bits_size ),
       .io_nasti_aw_bits_burst( arb_io_nasti_aw_bits_burst ),
       .io_nasti_aw_bits_lock( arb_io_nasti_aw_bits_lock ),
       .io_nasti_aw_bits_cache( arb_io_nasti_aw_bits_cache ),
       .io_nasti_aw_bits_prot( arb_io_nasti_aw_bits_prot ),
       .io_nasti_aw_bits_qos( arb_io_nasti_aw_bits_qos ),
       .io_nasti_aw_bits_region( arb_io_nasti_aw_bits_region ),
       .io_nasti_aw_bits_id( arb_io_nasti_aw_bits_id ),
       .io_nasti_aw_bits_user( arb_io_nasti_aw_bits_user ),
       .io_nasti_w_ready( MemIONastiIOConverter_io_nasti_w_ready ),
       .io_nasti_w_valid( arb_io_nasti_w_valid ),
       .io_nasti_w_bits_data( arb_io_nasti_w_bits_data ),
       .io_nasti_w_bits_last( arb_io_nasti_w_bits_last ),
       .io_nasti_w_bits_strb( arb_io_nasti_w_bits_strb ),
       .io_nasti_w_bits_user( arb_io_nasti_w_bits_user ),
       .io_nasti_b_ready( arb_io_nasti_b_ready ),
       .io_nasti_b_valid( MemIONastiIOConverter_io_nasti_b_valid ),
       .io_nasti_b_bits_resp( MemIONastiIOConverter_io_nasti_b_bits_resp ),
       .io_nasti_b_bits_id( MemIONastiIOConverter_io_nasti_b_bits_id ),
       //.io_nasti_b_bits_user(  )
       .io_nasti_ar_ready( MemIONastiIOConverter_io_nasti_ar_ready ),
       .io_nasti_ar_valid( arb_io_nasti_ar_valid ),
       .io_nasti_ar_bits_addr( arb_io_nasti_ar_bits_addr ),
       .io_nasti_ar_bits_len( arb_io_nasti_ar_bits_len ),
       .io_nasti_ar_bits_size( arb_io_nasti_ar_bits_size ),
       .io_nasti_ar_bits_burst( arb_io_nasti_ar_bits_burst ),
       .io_nasti_ar_bits_lock( arb_io_nasti_ar_bits_lock ),
       .io_nasti_ar_bits_cache( arb_io_nasti_ar_bits_cache ),
       .io_nasti_ar_bits_prot( arb_io_nasti_ar_bits_prot ),
       .io_nasti_ar_bits_qos( arb_io_nasti_ar_bits_qos ),
       .io_nasti_ar_bits_region( arb_io_nasti_ar_bits_region ),
       .io_nasti_ar_bits_id( arb_io_nasti_ar_bits_id ),
       .io_nasti_ar_bits_user( arb_io_nasti_ar_bits_user ),
       .io_nasti_r_ready( arb_io_nasti_r_ready ),
       .io_nasti_r_valid( MemIONastiIOConverter_io_nasti_r_valid ),
       .io_nasti_r_bits_resp( MemIONastiIOConverter_io_nasti_r_bits_resp ),
       .io_nasti_r_bits_data( MemIONastiIOConverter_io_nasti_r_bits_data ),
       .io_nasti_r_bits_last( MemIONastiIOConverter_io_nasti_r_bits_last ),
       .io_nasti_r_bits_id( MemIONastiIOConverter_io_nasti_r_bits_id ),
       //.io_nasti_r_bits_user(  )
       .io_daisy_regs_in_ready( arb_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( MemIONastiIOConverter_io_daisy_regs_out_valid ),
       .io_daisy_regs_in_bits( MemIONastiIOConverter_io_daisy_regs_out_bits ),
       .io_daisy_regs_out_ready( dcache_io_daisy_regs_in_ready ),
       .io_daisy_regs_out_valid( arb_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( arb_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign arb.io_nasti_r_bits_user = {1{$random}};
// synthesis translate_on
`endif
  MemIONastiIOConverter MemIONastiIOConverter(.clk(clk), .host__reset(host__reset),
       .io_nasti_aw_ready( MemIONastiIOConverter_io_nasti_aw_ready ),
       .io_nasti_aw_valid( arb_io_nasti_aw_valid ),
       .io_nasti_aw_bits_addr( arb_io_nasti_aw_bits_addr ),
       .io_nasti_aw_bits_len( arb_io_nasti_aw_bits_len ),
       .io_nasti_aw_bits_size( arb_io_nasti_aw_bits_size ),
       .io_nasti_aw_bits_burst( arb_io_nasti_aw_bits_burst ),
       .io_nasti_aw_bits_lock( arb_io_nasti_aw_bits_lock ),
       .io_nasti_aw_bits_cache( arb_io_nasti_aw_bits_cache ),
       .io_nasti_aw_bits_prot( arb_io_nasti_aw_bits_prot ),
       .io_nasti_aw_bits_qos( arb_io_nasti_aw_bits_qos ),
       .io_nasti_aw_bits_region( arb_io_nasti_aw_bits_region ),
       .io_nasti_aw_bits_id( arb_io_nasti_aw_bits_id ),
       .io_nasti_aw_bits_user( arb_io_nasti_aw_bits_user ),
       .io_nasti_w_ready( MemIONastiIOConverter_io_nasti_w_ready ),
       .io_nasti_w_valid( arb_io_nasti_w_valid ),
       .io_nasti_w_bits_data( arb_io_nasti_w_bits_data ),
       .io_nasti_w_bits_last( arb_io_nasti_w_bits_last ),
       .io_nasti_w_bits_strb( arb_io_nasti_w_bits_strb ),
       .io_nasti_w_bits_user( arb_io_nasti_w_bits_user ),
       .io_nasti_b_ready( arb_io_nasti_b_ready ),
       .io_nasti_b_valid( MemIONastiIOConverter_io_nasti_b_valid ),
       .io_nasti_b_bits_resp( MemIONastiIOConverter_io_nasti_b_bits_resp ),
       .io_nasti_b_bits_id( MemIONastiIOConverter_io_nasti_b_bits_id ),
       //.io_nasti_b_bits_user(  )
       .io_nasti_ar_ready( MemIONastiIOConverter_io_nasti_ar_ready ),
       .io_nasti_ar_valid( arb_io_nasti_ar_valid ),
       .io_nasti_ar_bits_addr( arb_io_nasti_ar_bits_addr ),
       .io_nasti_ar_bits_len( arb_io_nasti_ar_bits_len ),
       .io_nasti_ar_bits_size( arb_io_nasti_ar_bits_size ),
       .io_nasti_ar_bits_burst( arb_io_nasti_ar_bits_burst ),
       .io_nasti_ar_bits_lock( arb_io_nasti_ar_bits_lock ),
       .io_nasti_ar_bits_cache( arb_io_nasti_ar_bits_cache ),
       .io_nasti_ar_bits_prot( arb_io_nasti_ar_bits_prot ),
       .io_nasti_ar_bits_qos( arb_io_nasti_ar_bits_qos ),
       .io_nasti_ar_bits_region( arb_io_nasti_ar_bits_region ),
       .io_nasti_ar_bits_id( arb_io_nasti_ar_bits_id ),
       .io_nasti_ar_bits_user( arb_io_nasti_ar_bits_user ),
       .io_nasti_r_ready( arb_io_nasti_r_ready ),
       .io_nasti_r_valid( MemIONastiIOConverter_io_nasti_r_valid ),
       .io_nasti_r_bits_resp( MemIONastiIOConverter_io_nasti_r_bits_resp ),
       .io_nasti_r_bits_data( MemIONastiIOConverter_io_nasti_r_bits_data ),
       .io_nasti_r_bits_last( MemIONastiIOConverter_io_nasti_r_bits_last ),
       .io_nasti_r_bits_id( MemIONastiIOConverter_io_nasti_r_bits_id ),
       //.io_nasti_r_bits_user(  )
       .io_mem_req_cmd_ready( io_mem_req_cmd_ready ),
       .io_mem_req_cmd_valid( MemIONastiIOConverter_io_mem_req_cmd_valid ),
       .io_mem_req_cmd_bits_addr( MemIONastiIOConverter_io_mem_req_cmd_bits_addr ),
       .io_mem_req_cmd_bits_tag( MemIONastiIOConverter_io_mem_req_cmd_bits_tag ),
       .io_mem_req_cmd_bits_rw( MemIONastiIOConverter_io_mem_req_cmd_bits_rw ),
       .io_mem_req_data_ready( io_mem_req_data_ready ),
       .io_mem_req_data_valid( MemIONastiIOConverter_io_mem_req_data_valid ),
       .io_mem_req_data_bits_data( MemIONastiIOConverter_io_mem_req_data_bits_data ),
       .io_mem_resp_ready( MemIONastiIOConverter_io_mem_resp_ready ),
       .io_mem_resp_valid( io_mem_resp_valid ),
       .io_mem_resp_bits_data( io_mem_resp_bits_data ),
       .io_mem_resp_bits_tag( io_mem_resp_bits_tag ),
       .io_daisy_regs_in_ready( MemIONastiIOConverter_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( io_daisy_regs_in_valid ),
       .io_daisy_regs_in_bits( io_daisy_regs_in_bits ),
       .io_daisy_regs_out_ready( arb_io_daisy_regs_in_ready ),
       .io_daisy_regs_out_valid( MemIONastiIOConverter_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( MemIONastiIOConverter_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       //.io_daisy_sram_0_in_ready(  )
       //.io_daisy_sram_0_in_valid(  )
       //.io_daisy_sram_0_in_bits(  )
       //.io_daisy_sram_0_out_ready(  )
       //.io_daisy_sram_0_out_valid(  )
       //.io_daisy_sram_0_out_bits(  )
       //.io_daisy_sram_0_restart(  )
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( fire_pin ),
       .daisy__rst( daisy__rst )
  );
endmodule

module Queue_6(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits,
    output[4:0] io_count
);

  wire[4:0] T0;
  wire[3:0] ptr_diff;
  reg [3:0] R1;
  wire[3:0] T15;
  wire[3:0] T2;
  wire[3:0] T3;
  wire do_deq;
  reg [3:0] R4;
  wire[3:0] T16;
  wire[3:0] T5;
  wire[3:0] T6;
  wire do_enq;
  wire T7;
  wire ptr_match;
  reg  maybe_full;
  wire T17;
  wire T8;
  wire T9;
  wire T10;
  reg  ram [15:0];
  wire T11;
  wire T12;
  wire empty;
  wire T13;
  wire T14;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    R4 = {1{$random}};
    maybe_full = {1{$random}};
    for (initvar = 0; initvar < 16; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T7, ptr_diff};
  assign ptr_diff = R4 - R1;
  assign T15 = reset ? 4'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 4'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T16 = reset ? 4'h0 : T5;
  assign T5 = do_enq ? T6 : R4;
  assign T6 = R4 + 4'h1;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T7 = maybe_full & ptr_match;
  assign ptr_match = R4 == R1;
  assign T17 = reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign io_deq_bits = T10;
  assign T10 = ram[R1];
  assign io_deq_valid = T12;
  assign T12 = empty ^ 1'h1;
  assign empty = ptr_match & T13;
  assign T13 = maybe_full ^ 1'h1;
  assign io_enq_ready = T14;
  assign T14 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 4'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      R4 <= 4'h0;
    end else if(do_enq) begin
      R4 <= T6;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if (do_enq)
      ram[R4] <= io_enq_bits;
  end
endmodule

module TraceQueue_0(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits,
    //output[10:0] io_count
    input [10:0] io_limit
);

  wire T0;
  wire T1;
  wire ren;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire atLeastTwo;
  wire T22;
  wire[10:0] T23;
  reg [10:0] deq_ptr;
  wire[10:0] T29;
  wire[10:0] T11;
  wire[10:0] T12;
  wire[10:0] T13;
  wire deq_wrap;
  wire do_deq;
  wire T14;
  wire do_flow;
  wire T4;
  wire T15;
  reg [10:0] enq_ptr;
  wire[10:0] T30;
  wire[10:0] T6;
  wire[10:0] T7;
  wire[10:0] T8;
  wire enq_wrap;
  wire do_enq;
  wire T3;
  wire T5;
  wire full;
  reg  maybe_full;
  wire T31;
  wire T24;
  wire T25;
  wire ptr_match;
  wire[9:0] T32;
  wire[10:0] raddr;
  wire[10:0] T16;
  wire[10:0] T17;
  wire T2;
  wire[9:0] T33;
  reg [10:0] R9;
  wire[10:0] T10;
  wire empty;
  wire T26;
  wire T27;
  reg  ram_out_valid;
  wire T28;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    deq_ptr = {1{$random}};
    enq_ptr = {1{$random}};
    maybe_full = {1{$random}};
    R9 = {1{$random}};
    ram_out_valid = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_count = {1{$random}};
// synthesis translate_on
`endif
  assign io_deq_bits = T0;
  assign T0 = empty ? io_enq_bits : T1;
  assign ren = io_deq_ready & T18;
  assign T18 = atLeastTwo | T19;
  assign T19 = T21 & T20;
  assign T20 = empty ^ 1'h1;
  assign T21 = io_deq_valid ^ 1'h1;
  assign atLeastTwo = full | T22;
  assign T22 = 11'h2 <= T23;
  assign T23 = enq_ptr - deq_ptr;
  assign T29 = reset ? 11'h0 : T11;
  assign T11 = do_deq ? T12 : deq_ptr;
  assign T12 = deq_wrap ? 11'h0 : T13;
  assign T13 = deq_ptr + 11'h1;
  assign deq_wrap = deq_ptr == io_limit;
  assign do_deq = T15 & T14;
  assign T14 = do_flow ^ 1'h1;
  assign do_flow = T4;
  assign T4 = empty & io_deq_ready;
  assign T15 = io_deq_ready & io_deq_valid;
  assign T30 = reset ? 11'h0 : T6;
  assign T6 = do_enq ? T7 : enq_ptr;
  assign T7 = enq_wrap ? 11'h0 : T8;
  assign T8 = enq_ptr + 11'h1;
  assign enq_wrap = enq_ptr == io_limit;
  assign do_enq = T5 & T3;
  assign T3 = do_flow ^ 1'h1;
  assign T5 = io_enq_ready & io_enq_valid;
  assign full = ptr_match & maybe_full;
  assign T31 = reset ? 1'h0 : T24;
  assign T24 = T25 ? do_enq : maybe_full;
  assign T25 = do_enq != do_deq;
  assign ptr_match = enq_ptr == deq_ptr;
  assign T32 = raddr[4'h9:1'h0];
  assign raddr = io_deq_valid ? T16 : deq_ptr;
  assign T16 = deq_wrap ? 11'h0 : T17;
  assign T17 = deq_ptr + 11'h1;
  TraceQueue_ram ram (
    .CLK(clk),
    .W0A(T33),
    .W0E(do_enq),
    .W0I(io_enq_bits),
    .R1A(T32),
    .R1E(ren),
    .R1O(T1)
  );
  assign T33 = enq_ptr[4'h9:1'h0];
  assign T10 = ren ? raddr : R9;
  assign empty = ptr_match & T26;
  assign T26 = maybe_full ^ 1'h1;
  assign io_deq_valid = T27;
  assign T27 = empty ? io_enq_valid : ram_out_valid;
  assign io_enq_ready = T28;
  assign T28 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      deq_ptr <= 11'h0;
    end else if(do_deq) begin
      deq_ptr <= T12;
    end
    if(reset) begin
      enq_ptr <= 11'h0;
    end else if(do_enq) begin
      enq_ptr <= T7;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T25) begin
      maybe_full <= do_enq;
    end
    if(ren) begin
      R9 <= raddr;
    end
    ram_out_valid <= ren;
  end
endmodule

module Queue_10(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits,
    output io_count
);

  wire T8;
  wire[1:0] T0;
  reg  full;
  wire T9;
  wire T1;
  wire do_enq;
  wire T2;
  wire do_deq;
  wire T3;
  reg  ram [0:0];
  wire T4;
  wire T5;
  wire empty;
  wire T6;
  wire T7;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    full = {1{$random}};
    for (initvar = 0; initvar < 1; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T8;
  assign T8 = T0[1'h0];
  assign T0 = {full, 1'h0};
  assign T9 = reset ? 1'h0 : T1;
  assign T1 = T2 ? do_enq : full;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T2 = do_enq != do_deq;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign io_deq_bits = T3;
  assign T3 = ram[1'h0];
  assign io_deq_valid = T5;
  assign T5 = empty ^ 1'h1;
  assign empty = full ^ 1'h1;
  assign io_enq_ready = T6;
  assign T6 = T7 | io_deq_ready;
  assign T7 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      full <= 1'h0;
    end else if(T2) begin
      full <= do_enq;
    end
    if (do_enq)
      ram[1'h0] <= io_enq_bits;
  end
endmodule

module Channel_3(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input  io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output io_out_bits,
    input  io_trace_ready,
    output io_trace_valid,
    output io_trace_bits,
    input [10:0] io_traceLen
);

  wire T0;
  wire T1;
  wire tokens_io_enq_ready;
  wire tokens_io_deq_valid;
  wire tokens_io_deq_bits;
  wire trace_io_enq_ready;
  wire trace_io_deq_valid;
  wire trace_io_deq_bits;
  wire Queue_io_enq_ready;
  wire Queue_io_deq_valid;
  wire Queue_io_deq_bits;


  assign T0 = T1 & trace_io_enq_ready;
  assign T1 = io_out_ready & io_out_valid;
  assign io_trace_bits = Queue_io_deq_bits;
  assign io_trace_valid = Queue_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_in_ready = tokens_io_enq_ready;
  Queue_6 tokens(.clk(clk), .reset(reset),
       .io_enq_ready( tokens_io_enq_ready ),
       .io_enq_valid( io_in_valid ),
       .io_enq_bits( io_in_bits ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( tokens_io_deq_valid ),
       .io_deq_bits( tokens_io_deq_bits )
       //.io_count(  )
  );
  TraceQueue_0 trace(.clk(clk), .reset(reset),
       .io_enq_ready( trace_io_enq_ready ),
       .io_enq_valid( T0 ),
       .io_enq_bits( io_out_bits ),
       .io_deq_ready( Queue_io_enq_ready ),
       .io_deq_valid( trace_io_deq_valid ),
       .io_deq_bits( trace_io_deq_bits ),
       //.io_count(  )
       .io_limit( io_traceLen )
  );
  Queue_10 Queue(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_io_enq_ready ),
       .io_enq_valid( trace_io_deq_valid ),
       .io_enq_bits( trace_io_deq_bits ),
       .io_deq_ready( io_trace_ready ),
       .io_deq_valid( Queue_io_deq_valid ),
       .io_deq_bits( Queue_io_deq_bits )
       //.io_count(  )
  );
endmodule

module Queue_4(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits,
    output[4:0] io_count
);

  wire[4:0] T0;
  wire[3:0] ptr_diff;
  reg [3:0] R1;
  wire[3:0] T15;
  wire[3:0] T2;
  wire[3:0] T3;
  wire do_deq;
  reg [3:0] R4;
  wire[3:0] T16;
  wire[3:0] T5;
  wire[3:0] T6;
  wire do_enq;
  wire T7;
  wire ptr_match;
  reg  maybe_full;
  wire T17;
  wire T8;
  wire T9;
  wire[31:0] T10;
  reg [31:0] ram [15:0];
  wire[31:0] T11;
  wire T12;
  wire empty;
  wire T13;
  wire T14;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    R4 = {1{$random}};
    maybe_full = {1{$random}};
    for (initvar = 0; initvar < 16; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T7, ptr_diff};
  assign ptr_diff = R4 - R1;
  assign T15 = reset ? 4'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 4'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T16 = reset ? 4'h0 : T5;
  assign T5 = do_enq ? T6 : R4;
  assign T6 = R4 + 4'h1;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T7 = maybe_full & ptr_match;
  assign ptr_match = R4 == R1;
  assign T17 = reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign io_deq_bits = T10;
  assign T10 = ram[R1];
  assign io_deq_valid = T12;
  assign T12 = empty ^ 1'h1;
  assign empty = ptr_match & T13;
  assign T13 = maybe_full ^ 1'h1;
  assign io_enq_ready = T14;
  assign T14 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 4'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      R4 <= 4'h0;
    end else if(do_enq) begin
      R4 <= T6;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if (do_enq)
      ram[R4] <= io_enq_bits;
  end
endmodule

module TraceQueue_1(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits,
    //output[10:0] io_count
    input [10:0] io_limit
);

  wire[31:0] T0;
  wire[31:0] T1;
  wire ren;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire atLeastTwo;
  wire T22;
  wire[10:0] T23;
  reg [10:0] deq_ptr;
  wire[10:0] T29;
  wire[10:0] T11;
  wire[10:0] T12;
  wire[10:0] T13;
  wire deq_wrap;
  wire do_deq;
  wire T14;
  wire do_flow;
  wire T4;
  wire T15;
  reg [10:0] enq_ptr;
  wire[10:0] T30;
  wire[10:0] T6;
  wire[10:0] T7;
  wire[10:0] T8;
  wire enq_wrap;
  wire do_enq;
  wire T3;
  wire T5;
  wire full;
  reg  maybe_full;
  wire T31;
  wire T24;
  wire T25;
  wire ptr_match;
  wire[9:0] T32;
  wire[10:0] raddr;
  wire[10:0] T16;
  wire[10:0] T17;
  wire[31:0] T2;
  wire[9:0] T33;
  reg [10:0] R9;
  wire[10:0] T10;
  wire empty;
  wire T26;
  wire T27;
  reg  ram_out_valid;
  wire T28;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    deq_ptr = {1{$random}};
    enq_ptr = {1{$random}};
    maybe_full = {1{$random}};
    R9 = {1{$random}};
    ram_out_valid = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_count = {1{$random}};
// synthesis translate_on
`endif
  assign io_deq_bits = T0;
  assign T0 = empty ? io_enq_bits : T1;
  assign ren = io_deq_ready & T18;
  assign T18 = atLeastTwo | T19;
  assign T19 = T21 & T20;
  assign T20 = empty ^ 1'h1;
  assign T21 = io_deq_valid ^ 1'h1;
  assign atLeastTwo = full | T22;
  assign T22 = 11'h2 <= T23;
  assign T23 = enq_ptr - deq_ptr;
  assign T29 = reset ? 11'h0 : T11;
  assign T11 = do_deq ? T12 : deq_ptr;
  assign T12 = deq_wrap ? 11'h0 : T13;
  assign T13 = deq_ptr + 11'h1;
  assign deq_wrap = deq_ptr == io_limit;
  assign do_deq = T15 & T14;
  assign T14 = do_flow ^ 1'h1;
  assign do_flow = T4;
  assign T4 = empty & io_deq_ready;
  assign T15 = io_deq_ready & io_deq_valid;
  assign T30 = reset ? 11'h0 : T6;
  assign T6 = do_enq ? T7 : enq_ptr;
  assign T7 = enq_wrap ? 11'h0 : T8;
  assign T8 = enq_ptr + 11'h1;
  assign enq_wrap = enq_ptr == io_limit;
  assign do_enq = T5 & T3;
  assign T3 = do_flow ^ 1'h1;
  assign T5 = io_enq_ready & io_enq_valid;
  assign full = ptr_match & maybe_full;
  assign T31 = reset ? 1'h0 : T24;
  assign T24 = T25 ? do_enq : maybe_full;
  assign T25 = do_enq != do_deq;
  assign ptr_match = enq_ptr == deq_ptr;
  assign T32 = raddr[4'h9:1'h0];
  assign raddr = io_deq_valid ? T16 : deq_ptr;
  assign T16 = deq_wrap ? 11'h0 : T17;
  assign T17 = deq_ptr + 11'h1;
  TraceQueue_ram_1 ram (
    .CLK(clk),
    .W0A(T33),
    .W0E(do_enq),
    .W0I(io_enq_bits),
    .R1A(T32),
    .R1E(ren),
    .R1O(T1)
  );
  assign T33 = enq_ptr[4'h9:1'h0];
  assign T10 = ren ? raddr : R9;
  assign empty = ptr_match & T26;
  assign T26 = maybe_full ^ 1'h1;
  assign io_deq_valid = T27;
  assign T27 = empty ? io_enq_valid : ram_out_valid;
  assign io_enq_ready = T28;
  assign T28 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      deq_ptr <= 11'h0;
    end else if(do_deq) begin
      deq_ptr <= T12;
    end
    if(reset) begin
      enq_ptr <= 11'h0;
    end else if(do_enq) begin
      enq_ptr <= T7;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T25) begin
      maybe_full <= do_enq;
    end
    if(ren) begin
      R9 <= raddr;
    end
    ram_out_valid <= ren;
  end
endmodule

module Queue_11(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits,
    output io_count
);

  wire T8;
  wire[1:0] T0;
  reg  full;
  wire T9;
  wire T1;
  wire do_enq;
  wire T2;
  wire do_deq;
  wire[31:0] T3;
  reg [31:0] ram [0:0];
  wire[31:0] T4;
  wire T5;
  wire empty;
  wire T6;
  wire T7;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    full = {1{$random}};
    for (initvar = 0; initvar < 1; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T8;
  assign T8 = T0[1'h0];
  assign T0 = {full, 1'h0};
  assign T9 = reset ? 1'h0 : T1;
  assign T1 = T2 ? do_enq : full;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T2 = do_enq != do_deq;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign io_deq_bits = T3;
  assign T3 = ram[1'h0];
  assign io_deq_valid = T5;
  assign T5 = empty ^ 1'h1;
  assign empty = full ^ 1'h1;
  assign io_enq_ready = T6;
  assign T6 = T7 | io_deq_ready;
  assign T7 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      full <= 1'h0;
    end else if(T2) begin
      full <= do_enq;
    end
    if (do_enq)
      ram[1'h0] <= io_enq_bits;
  end
endmodule

module Channel_4(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output[31:0] io_out_bits,
    input  io_trace_ready,
    output io_trace_valid,
    output[31:0] io_trace_bits,
    input [10:0] io_traceLen
);

  wire T0;
  wire T1;
  wire tokens_io_enq_ready;
  wire tokens_io_deq_valid;
  wire[31:0] tokens_io_deq_bits;
  wire trace_io_enq_ready;
  wire trace_io_deq_valid;
  wire[31:0] trace_io_deq_bits;
  wire Queue_io_enq_ready;
  wire Queue_io_deq_valid;
  wire[31:0] Queue_io_deq_bits;


  assign T0 = T1 & trace_io_enq_ready;
  assign T1 = io_out_ready & io_out_valid;
  assign io_trace_bits = Queue_io_deq_bits;
  assign io_trace_valid = Queue_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_in_ready = tokens_io_enq_ready;
  Queue_4 tokens(.clk(clk), .reset(reset),
       .io_enq_ready( tokens_io_enq_ready ),
       .io_enq_valid( io_in_valid ),
       .io_enq_bits( io_in_bits ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( tokens_io_deq_valid ),
       .io_deq_bits( tokens_io_deq_bits )
       //.io_count(  )
  );
  TraceQueue_1 trace(.clk(clk), .reset(reset),
       .io_enq_ready( trace_io_enq_ready ),
       .io_enq_valid( T0 ),
       .io_enq_bits( io_out_bits ),
       .io_deq_ready( Queue_io_enq_ready ),
       .io_deq_valid( trace_io_deq_valid ),
       .io_deq_bits( trace_io_deq_bits ),
       //.io_count(  )
       .io_limit( io_traceLen )
  );
  Queue_11 Queue(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_io_enq_ready ),
       .io_enq_valid( trace_io_deq_valid ),
       .io_enq_bits( trace_io_deq_bits ),
       .io_deq_ready( io_trace_ready ),
       .io_deq_valid( Queue_io_deq_valid ),
       .io_deq_bits( Queue_io_deq_bits )
       //.io_count(  )
  );
endmodule

module Queue_5(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [4:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[4:0] io_deq_bits,
    output[4:0] io_count
);

  wire[4:0] T0;
  wire[3:0] ptr_diff;
  reg [3:0] R1;
  wire[3:0] T15;
  wire[3:0] T2;
  wire[3:0] T3;
  wire do_deq;
  reg [3:0] R4;
  wire[3:0] T16;
  wire[3:0] T5;
  wire[3:0] T6;
  wire do_enq;
  wire T7;
  wire ptr_match;
  reg  maybe_full;
  wire T17;
  wire T8;
  wire T9;
  wire[4:0] T10;
  reg [4:0] ram [15:0];
  wire[4:0] T11;
  wire T12;
  wire empty;
  wire T13;
  wire T14;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    R4 = {1{$random}};
    maybe_full = {1{$random}};
    for (initvar = 0; initvar < 16; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T7, ptr_diff};
  assign ptr_diff = R4 - R1;
  assign T15 = reset ? 4'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 4'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T16 = reset ? 4'h0 : T5;
  assign T5 = do_enq ? T6 : R4;
  assign T6 = R4 + 4'h1;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T7 = maybe_full & ptr_match;
  assign ptr_match = R4 == R1;
  assign T17 = reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign io_deq_bits = T10;
  assign T10 = ram[R1];
  assign io_deq_valid = T12;
  assign T12 = empty ^ 1'h1;
  assign empty = ptr_match & T13;
  assign T13 = maybe_full ^ 1'h1;
  assign io_enq_ready = T14;
  assign T14 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 4'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      R4 <= 4'h0;
    end else if(do_enq) begin
      R4 <= T6;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if (do_enq)
      ram[R4] <= io_enq_bits;
  end
endmodule

module TraceQueue_2(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [4:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[4:0] io_deq_bits,
    //output[10:0] io_count
    input [10:0] io_limit
);

  wire[4:0] T0;
  wire[4:0] T1;
  wire ren;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire atLeastTwo;
  wire T22;
  wire[10:0] T23;
  reg [10:0] deq_ptr;
  wire[10:0] T29;
  wire[10:0] T11;
  wire[10:0] T12;
  wire[10:0] T13;
  wire deq_wrap;
  wire do_deq;
  wire T14;
  wire do_flow;
  wire T4;
  wire T15;
  reg [10:0] enq_ptr;
  wire[10:0] T30;
  wire[10:0] T6;
  wire[10:0] T7;
  wire[10:0] T8;
  wire enq_wrap;
  wire do_enq;
  wire T3;
  wire T5;
  wire full;
  reg  maybe_full;
  wire T31;
  wire T24;
  wire T25;
  wire ptr_match;
  wire[9:0] T32;
  wire[10:0] raddr;
  wire[10:0] T16;
  wire[10:0] T17;
  wire[4:0] T2;
  wire[9:0] T33;
  reg [10:0] R9;
  wire[10:0] T10;
  wire empty;
  wire T26;
  wire T27;
  reg  ram_out_valid;
  wire T28;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    deq_ptr = {1{$random}};
    enq_ptr = {1{$random}};
    maybe_full = {1{$random}};
    R9 = {1{$random}};
    ram_out_valid = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_count = {1{$random}};
// synthesis translate_on
`endif
  assign io_deq_bits = T0;
  assign T0 = empty ? io_enq_bits : T1;
  assign ren = io_deq_ready & T18;
  assign T18 = atLeastTwo | T19;
  assign T19 = T21 & T20;
  assign T20 = empty ^ 1'h1;
  assign T21 = io_deq_valid ^ 1'h1;
  assign atLeastTwo = full | T22;
  assign T22 = 11'h2 <= T23;
  assign T23 = enq_ptr - deq_ptr;
  assign T29 = reset ? 11'h0 : T11;
  assign T11 = do_deq ? T12 : deq_ptr;
  assign T12 = deq_wrap ? 11'h0 : T13;
  assign T13 = deq_ptr + 11'h1;
  assign deq_wrap = deq_ptr == io_limit;
  assign do_deq = T15 & T14;
  assign T14 = do_flow ^ 1'h1;
  assign do_flow = T4;
  assign T4 = empty & io_deq_ready;
  assign T15 = io_deq_ready & io_deq_valid;
  assign T30 = reset ? 11'h0 : T6;
  assign T6 = do_enq ? T7 : enq_ptr;
  assign T7 = enq_wrap ? 11'h0 : T8;
  assign T8 = enq_ptr + 11'h1;
  assign enq_wrap = enq_ptr == io_limit;
  assign do_enq = T5 & T3;
  assign T3 = do_flow ^ 1'h1;
  assign T5 = io_enq_ready & io_enq_valid;
  assign full = ptr_match & maybe_full;
  assign T31 = reset ? 1'h0 : T24;
  assign T24 = T25 ? do_enq : maybe_full;
  assign T25 = do_enq != do_deq;
  assign ptr_match = enq_ptr == deq_ptr;
  assign T32 = raddr[4'h9:1'h0];
  assign raddr = io_deq_valid ? T16 : deq_ptr;
  assign T16 = deq_wrap ? 11'h0 : T17;
  assign T17 = deq_ptr + 11'h1;
  TraceQueue_ram_2 ram (
    .CLK(clk),
    .W0A(T33),
    .W0E(do_enq),
    .W0I(io_enq_bits),
    .R1A(T32),
    .R1E(ren),
    .R1O(T1)
  );
  assign T33 = enq_ptr[4'h9:1'h0];
  assign T10 = ren ? raddr : R9;
  assign empty = ptr_match & T26;
  assign T26 = maybe_full ^ 1'h1;
  assign io_deq_valid = T27;
  assign T27 = empty ? io_enq_valid : ram_out_valid;
  assign io_enq_ready = T28;
  assign T28 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      deq_ptr <= 11'h0;
    end else if(do_deq) begin
      deq_ptr <= T12;
    end
    if(reset) begin
      enq_ptr <= 11'h0;
    end else if(do_enq) begin
      enq_ptr <= T7;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T25) begin
      maybe_full <= do_enq;
    end
    if(ren) begin
      R9 <= raddr;
    end
    ram_out_valid <= ren;
  end
endmodule

module Queue_12(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [4:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[4:0] io_deq_bits,
    output io_count
);

  wire T8;
  wire[1:0] T0;
  reg  full;
  wire T9;
  wire T1;
  wire do_enq;
  wire T2;
  wire do_deq;
  wire[4:0] T3;
  reg [4:0] ram [0:0];
  wire[4:0] T4;
  wire T5;
  wire empty;
  wire T6;
  wire T7;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    full = {1{$random}};
    for (initvar = 0; initvar < 1; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T8;
  assign T8 = T0[1'h0];
  assign T0 = {full, 1'h0};
  assign T9 = reset ? 1'h0 : T1;
  assign T1 = T2 ? do_enq : full;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T2 = do_enq != do_deq;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign io_deq_bits = T3;
  assign T3 = ram[1'h0];
  assign io_deq_valid = T5;
  assign T5 = empty ^ 1'h1;
  assign empty = full ^ 1'h1;
  assign io_enq_ready = T6;
  assign T6 = T7 | io_deq_ready;
  assign T7 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      full <= 1'h0;
    end else if(T2) begin
      full <= do_enq;
    end
    if (do_enq)
      ram[1'h0] <= io_enq_bits;
  end
endmodule

module Channel_5(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [4:0] io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output[4:0] io_out_bits,
    input  io_trace_ready,
    output io_trace_valid,
    output[4:0] io_trace_bits,
    input [10:0] io_traceLen
);

  wire T0;
  wire T1;
  wire tokens_io_enq_ready;
  wire tokens_io_deq_valid;
  wire[4:0] tokens_io_deq_bits;
  wire trace_io_enq_ready;
  wire trace_io_deq_valid;
  wire[4:0] trace_io_deq_bits;
  wire Queue_io_enq_ready;
  wire Queue_io_deq_valid;
  wire[4:0] Queue_io_deq_bits;


  assign T0 = T1 & trace_io_enq_ready;
  assign T1 = io_out_ready & io_out_valid;
  assign io_trace_bits = Queue_io_deq_bits;
  assign io_trace_valid = Queue_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_in_ready = tokens_io_enq_ready;
  Queue_5 tokens(.clk(clk), .reset(reset),
       .io_enq_ready( tokens_io_enq_ready ),
       .io_enq_valid( io_in_valid ),
       .io_enq_bits( io_in_bits ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( tokens_io_deq_valid ),
       .io_deq_bits( tokens_io_deq_bits )
       //.io_count(  )
  );
  TraceQueue_2 trace(.clk(clk), .reset(reset),
       .io_enq_ready( trace_io_enq_ready ),
       .io_enq_valid( T0 ),
       .io_enq_bits( io_out_bits ),
       .io_deq_ready( Queue_io_enq_ready ),
       .io_deq_valid( trace_io_deq_valid ),
       .io_deq_bits( trace_io_deq_bits ),
       //.io_count(  )
       .io_limit( io_traceLen )
  );
  Queue_12 Queue(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_io_enq_ready ),
       .io_enq_valid( trace_io_deq_valid ),
       .io_enq_bits( trace_io_deq_bits ),
       .io_deq_ready( io_trace_ready ),
       .io_deq_valid( Queue_io_deq_valid ),
       .io_deq_bits( Queue_io_deq_bits )
       //.io_count(  )
  );
endmodule

module Queue_13(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [1:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[1:0] io_deq_bits,
    output[4:0] io_count
);

  wire[4:0] T0;
  wire[3:0] ptr_diff;
  reg [3:0] R1;
  wire[3:0] T15;
  wire[3:0] T2;
  wire[3:0] T3;
  wire do_deq;
  reg [3:0] R4;
  wire[3:0] T16;
  wire[3:0] T5;
  wire[3:0] T6;
  wire do_enq;
  wire T7;
  wire ptr_match;
  reg  maybe_full;
  wire T17;
  wire T8;
  wire T9;
  wire[1:0] T10;
  reg [1:0] ram [15:0];
  wire[1:0] T11;
  wire T12;
  wire empty;
  wire T13;
  wire T14;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    R4 = {1{$random}};
    maybe_full = {1{$random}};
    for (initvar = 0; initvar < 16; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T7, ptr_diff};
  assign ptr_diff = R4 - R1;
  assign T15 = reset ? 4'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 4'h1;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign T16 = reset ? 4'h0 : T5;
  assign T5 = do_enq ? T6 : R4;
  assign T6 = R4 + 4'h1;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T7 = maybe_full & ptr_match;
  assign ptr_match = R4 == R1;
  assign T17 = reset ? 1'h0 : T8;
  assign T8 = T9 ? do_enq : maybe_full;
  assign T9 = do_enq != do_deq;
  assign io_deq_bits = T10;
  assign T10 = ram[R1];
  assign io_deq_valid = T12;
  assign T12 = empty ^ 1'h1;
  assign empty = ptr_match & T13;
  assign T13 = maybe_full ^ 1'h1;
  assign io_enq_ready = T14;
  assign T14 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 4'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      R4 <= 4'h0;
    end else if(do_enq) begin
      R4 <= T6;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if (do_enq)
      ram[R4] <= io_enq_bits;
  end
endmodule

module TraceQueue_3(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [1:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[1:0] io_deq_bits,
    //output[10:0] io_count
    input [10:0] io_limit
);

  wire[1:0] T0;
  wire[1:0] T1;
  wire ren;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire atLeastTwo;
  wire T22;
  wire[10:0] T23;
  reg [10:0] deq_ptr;
  wire[10:0] T29;
  wire[10:0] T11;
  wire[10:0] T12;
  wire[10:0] T13;
  wire deq_wrap;
  wire do_deq;
  wire T14;
  wire do_flow;
  wire T4;
  wire T15;
  reg [10:0] enq_ptr;
  wire[10:0] T30;
  wire[10:0] T6;
  wire[10:0] T7;
  wire[10:0] T8;
  wire enq_wrap;
  wire do_enq;
  wire T3;
  wire T5;
  wire full;
  reg  maybe_full;
  wire T31;
  wire T24;
  wire T25;
  wire ptr_match;
  wire[9:0] T32;
  wire[10:0] raddr;
  wire[10:0] T16;
  wire[10:0] T17;
  wire[1:0] T2;
  wire[9:0] T33;
  reg [10:0] R9;
  wire[10:0] T10;
  wire empty;
  wire T26;
  wire T27;
  reg  ram_out_valid;
  wire T28;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    deq_ptr = {1{$random}};
    enq_ptr = {1{$random}};
    maybe_full = {1{$random}};
    R9 = {1{$random}};
    ram_out_valid = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_count = {1{$random}};
// synthesis translate_on
`endif
  assign io_deq_bits = T0;
  assign T0 = empty ? io_enq_bits : T1;
  assign ren = io_deq_ready & T18;
  assign T18 = atLeastTwo | T19;
  assign T19 = T21 & T20;
  assign T20 = empty ^ 1'h1;
  assign T21 = io_deq_valid ^ 1'h1;
  assign atLeastTwo = full | T22;
  assign T22 = 11'h2 <= T23;
  assign T23 = enq_ptr - deq_ptr;
  assign T29 = reset ? 11'h0 : T11;
  assign T11 = do_deq ? T12 : deq_ptr;
  assign T12 = deq_wrap ? 11'h0 : T13;
  assign T13 = deq_ptr + 11'h1;
  assign deq_wrap = deq_ptr == io_limit;
  assign do_deq = T15 & T14;
  assign T14 = do_flow ^ 1'h1;
  assign do_flow = T4;
  assign T4 = empty & io_deq_ready;
  assign T15 = io_deq_ready & io_deq_valid;
  assign T30 = reset ? 11'h0 : T6;
  assign T6 = do_enq ? T7 : enq_ptr;
  assign T7 = enq_wrap ? 11'h0 : T8;
  assign T8 = enq_ptr + 11'h1;
  assign enq_wrap = enq_ptr == io_limit;
  assign do_enq = T5 & T3;
  assign T3 = do_flow ^ 1'h1;
  assign T5 = io_enq_ready & io_enq_valid;
  assign full = ptr_match & maybe_full;
  assign T31 = reset ? 1'h0 : T24;
  assign T24 = T25 ? do_enq : maybe_full;
  assign T25 = do_enq != do_deq;
  assign ptr_match = enq_ptr == deq_ptr;
  assign T32 = raddr[4'h9:1'h0];
  assign raddr = io_deq_valid ? T16 : deq_ptr;
  assign T16 = deq_wrap ? 11'h0 : T17;
  assign T17 = deq_ptr + 11'h1;
  TraceQueue_ram_3 ram (
    .CLK(clk),
    .W0A(T33),
    .W0E(do_enq),
    .W0I(io_enq_bits),
    .R1A(T32),
    .R1E(ren),
    .R1O(T1)
  );
  assign T33 = enq_ptr[4'h9:1'h0];
  assign T10 = ren ? raddr : R9;
  assign empty = ptr_match & T26;
  assign T26 = maybe_full ^ 1'h1;
  assign io_deq_valid = T27;
  assign T27 = empty ? io_enq_valid : ram_out_valid;
  assign io_enq_ready = T28;
  assign T28 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      deq_ptr <= 11'h0;
    end else if(do_deq) begin
      deq_ptr <= T12;
    end
    if(reset) begin
      enq_ptr <= 11'h0;
    end else if(do_enq) begin
      enq_ptr <= T7;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T25) begin
      maybe_full <= do_enq;
    end
    if(ren) begin
      R9 <= raddr;
    end
    ram_out_valid <= ren;
  end
endmodule

module Queue_14(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [1:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[1:0] io_deq_bits,
    output io_count
);

  wire T8;
  wire[1:0] T0;
  reg  full;
  wire T9;
  wire T1;
  wire do_enq;
  wire T2;
  wire do_deq;
  wire[1:0] T3;
  reg [1:0] ram [0:0];
  wire[1:0] T4;
  wire T5;
  wire empty;
  wire T6;
  wire T7;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    full = {1{$random}};
    for (initvar = 0; initvar < 1; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T8;
  assign T8 = T0[1'h0];
  assign T0 = {full, 1'h0};
  assign T9 = reset ? 1'h0 : T1;
  assign T1 = T2 ? do_enq : full;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T2 = do_enq != do_deq;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign io_deq_bits = T3;
  assign T3 = ram[1'h0];
  assign io_deq_valid = T5;
  assign T5 = empty ^ 1'h1;
  assign empty = full ^ 1'h1;
  assign io_enq_ready = T6;
  assign T6 = T7 | io_deq_ready;
  assign T7 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      full <= 1'h0;
    end else if(T2) begin
      full <= do_enq;
    end
    if (do_enq)
      ram[1'h0] <= io_enq_bits;
  end
endmodule

module Channel_6(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [1:0] io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output[1:0] io_out_bits,
    input  io_trace_ready,
    output io_trace_valid,
    output[1:0] io_trace_bits,
    input [10:0] io_traceLen
);

  wire T0;
  wire T1;
  wire tokens_io_enq_ready;
  wire tokens_io_deq_valid;
  wire[1:0] tokens_io_deq_bits;
  wire trace_io_enq_ready;
  wire trace_io_deq_valid;
  wire[1:0] trace_io_deq_bits;
  wire Queue_io_enq_ready;
  wire Queue_io_deq_valid;
  wire[1:0] Queue_io_deq_bits;


  assign T0 = T1 & trace_io_enq_ready;
  assign T1 = io_out_ready & io_out_valid;
  assign io_trace_bits = Queue_io_deq_bits;
  assign io_trace_valid = Queue_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_in_ready = tokens_io_enq_ready;
  Queue_13 tokens(.clk(clk), .reset(reset),
       .io_enq_ready( tokens_io_enq_ready ),
       .io_enq_valid( io_in_valid ),
       .io_enq_bits( io_in_bits ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( tokens_io_deq_valid ),
       .io_deq_bits( tokens_io_deq_bits )
       //.io_count(  )
  );
  TraceQueue_3 trace(.clk(clk), .reset(reset),
       .io_enq_ready( trace_io_enq_ready ),
       .io_enq_valid( T0 ),
       .io_enq_bits( io_out_bits ),
       .io_deq_ready( Queue_io_enq_ready ),
       .io_deq_valid( trace_io_deq_valid ),
       .io_deq_bits( trace_io_deq_bits ),
       //.io_count(  )
       .io_limit( io_traceLen )
  );
  Queue_14 Queue(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_io_enq_ready ),
       .io_enq_valid( trace_io_deq_valid ),
       .io_enq_bits( trace_io_deq_bits ),
       .io_deq_ready( io_trace_ready ),
       .io_deq_valid( Queue_io_deq_valid ),
       .io_deq_bits( Queue_io_deq_bits )
       //.io_count(  )
  );
endmodule

module SimWrapper(input clk, input reset,
    output io_nasti_r_bits_user_channel_0_ready,
    input  io_nasti_r_bits_user_channel_0_valid,
    input  io_nasti_r_bits_user_channel_0_bits,
    output io_nasti_r_bits_id_channel_0_ready,
    input  io_nasti_r_bits_id_channel_0_valid,
    input [4:0] io_nasti_r_bits_id_channel_0_bits,
    output io_nasti_r_bits_last_channel_0_ready,
    input  io_nasti_r_bits_last_channel_0_valid,
    input  io_nasti_r_bits_last_channel_0_bits,
    output io_nasti_r_bits_data_channel_1_ready,
    input  io_nasti_r_bits_data_channel_1_valid,
    input [31:0] io_nasti_r_bits_data_channel_1_bits,
    output io_nasti_r_bits_data_channel_0_ready,
    input  io_nasti_r_bits_data_channel_0_valid,
    input [31:0] io_nasti_r_bits_data_channel_0_bits,
    output io_nasti_r_bits_resp_channel_0_ready,
    input  io_nasti_r_bits_resp_channel_0_valid,
    input [1:0] io_nasti_r_bits_resp_channel_0_bits,
    output io_nasti_r_valid_channel_0_ready,
    input  io_nasti_r_valid_channel_0_valid,
    input  io_nasti_r_valid_channel_0_bits,
    output io_nasti_ar_ready_channel_0_ready,
    input  io_nasti_ar_ready_channel_0_valid,
    input  io_nasti_ar_ready_channel_0_bits,
    output io_nasti_b_bits_user_channel_0_ready,
    input  io_nasti_b_bits_user_channel_0_valid,
    input  io_nasti_b_bits_user_channel_0_bits,
    output io_nasti_b_bits_id_channel_0_ready,
    input  io_nasti_b_bits_id_channel_0_valid,
    input [4:0] io_nasti_b_bits_id_channel_0_bits,
    output io_nasti_b_bits_resp_channel_0_ready,
    input  io_nasti_b_bits_resp_channel_0_valid,
    input [1:0] io_nasti_b_bits_resp_channel_0_bits,
    output io_nasti_b_valid_channel_0_ready,
    input  io_nasti_b_valid_channel_0_valid,
    input  io_nasti_b_valid_channel_0_bits,
    output io_nasti_w_ready_channel_0_ready,
    input  io_nasti_w_ready_channel_0_valid,
    input  io_nasti_w_ready_channel_0_bits,
    output io_nasti_aw_ready_channel_0_ready,
    input  io_nasti_aw_ready_channel_0_valid,
    input  io_nasti_aw_ready_channel_0_bits,
    output io_mem_resp_bits_tag_channel_0_ready,
    input  io_mem_resp_bits_tag_channel_0_valid,
    input [4:0] io_mem_resp_bits_tag_channel_0_bits,
    output io_mem_resp_bits_data_channel_1_ready,
    input  io_mem_resp_bits_data_channel_1_valid,
    input [31:0] io_mem_resp_bits_data_channel_1_bits,
    output io_mem_resp_bits_data_channel_0_ready,
    input  io_mem_resp_bits_data_channel_0_valid,
    input [31:0] io_mem_resp_bits_data_channel_0_bits,
    output io_mem_resp_valid_channel_0_ready,
    input  io_mem_resp_valid_channel_0_valid,
    input  io_mem_resp_valid_channel_0_bits,
    output io_mem_req_data_ready_channel_0_ready,
    input  io_mem_req_data_ready_channel_0_valid,
    input  io_mem_req_data_ready_channel_0_bits,
    output io_mem_req_cmd_ready_channel_0_ready,
    input  io_mem_req_cmd_ready_channel_0_valid,
    input  io_mem_req_cmd_ready_channel_0_bits,
    output io_htif_host_fromhost_bits_channel_0_ready,
    input  io_htif_host_fromhost_bits_channel_0_valid,
    input [31:0] io_htif_host_fromhost_bits_channel_0_bits,
    output io_htif_host_fromhost_valid_channel_0_ready,
    input  io_htif_host_fromhost_valid_channel_0_valid,
    input  io_htif_host_fromhost_valid_channel_0_bits,
    input  io_mem_resp_ready_channel_0_ready,
    output io_mem_resp_ready_channel_0_valid,
    output io_mem_resp_ready_channel_0_bits,
    input  io_mem_req_data_bits_data_channel_1_ready,
    output io_mem_req_data_bits_data_channel_1_valid,
    output[31:0] io_mem_req_data_bits_data_channel_1_bits,
    input  io_mem_req_data_bits_data_channel_0_ready,
    output io_mem_req_data_bits_data_channel_0_valid,
    output[31:0] io_mem_req_data_bits_data_channel_0_bits,
    input  io_mem_req_data_valid_channel_0_ready,
    output io_mem_req_data_valid_channel_0_valid,
    output io_mem_req_data_valid_channel_0_bits,
    input  io_mem_req_cmd_bits_rw_channel_0_ready,
    output io_mem_req_cmd_bits_rw_channel_0_valid,
    output io_mem_req_cmd_bits_rw_channel_0_bits,
    input  io_mem_req_cmd_bits_tag_channel_0_ready,
    output io_mem_req_cmd_bits_tag_channel_0_valid,
    output[4:0] io_mem_req_cmd_bits_tag_channel_0_bits,
    input  io_mem_req_cmd_bits_addr_channel_0_ready,
    output io_mem_req_cmd_bits_addr_channel_0_valid,
    output[31:0] io_mem_req_cmd_bits_addr_channel_0_bits,
    input  io_mem_req_cmd_valid_channel_0_ready,
    output io_mem_req_cmd_valid_channel_0_valid,
    output io_mem_req_cmd_valid_channel_0_bits,
    input  io_htif_host_tohost_channel_0_ready,
    output io_htif_host_tohost_channel_0_valid,
    output[31:0] io_htif_host_tohost_channel_0_bits,
    input  io_nasti_r_bits_user_trace_0_ready,
    output io_nasti_r_bits_user_trace_0_valid,
    output io_nasti_r_bits_user_trace_0_bits,
    input  io_nasti_r_bits_id_trace_0_ready,
    output io_nasti_r_bits_id_trace_0_valid,
    output[4:0] io_nasti_r_bits_id_trace_0_bits,
    input  io_nasti_r_bits_last_trace_0_ready,
    output io_nasti_r_bits_last_trace_0_valid,
    output io_nasti_r_bits_last_trace_0_bits,
    input  io_nasti_r_bits_data_trace_1_ready,
    output io_nasti_r_bits_data_trace_1_valid,
    output[31:0] io_nasti_r_bits_data_trace_1_bits,
    input  io_nasti_r_bits_data_trace_0_ready,
    output io_nasti_r_bits_data_trace_0_valid,
    output[31:0] io_nasti_r_bits_data_trace_0_bits,
    input  io_nasti_r_bits_resp_trace_0_ready,
    output io_nasti_r_bits_resp_trace_0_valid,
    output[1:0] io_nasti_r_bits_resp_trace_0_bits,
    input  io_nasti_r_valid_trace_0_ready,
    output io_nasti_r_valid_trace_0_valid,
    output io_nasti_r_valid_trace_0_bits,
    input  io_nasti_ar_ready_trace_0_ready,
    output io_nasti_ar_ready_trace_0_valid,
    output io_nasti_ar_ready_trace_0_bits,
    input  io_nasti_b_bits_user_trace_0_ready,
    output io_nasti_b_bits_user_trace_0_valid,
    output io_nasti_b_bits_user_trace_0_bits,
    input  io_nasti_b_bits_id_trace_0_ready,
    output io_nasti_b_bits_id_trace_0_valid,
    output[4:0] io_nasti_b_bits_id_trace_0_bits,
    input  io_nasti_b_bits_resp_trace_0_ready,
    output io_nasti_b_bits_resp_trace_0_valid,
    output[1:0] io_nasti_b_bits_resp_trace_0_bits,
    input  io_nasti_b_valid_trace_0_ready,
    output io_nasti_b_valid_trace_0_valid,
    output io_nasti_b_valid_trace_0_bits,
    input  io_nasti_w_ready_trace_0_ready,
    output io_nasti_w_ready_trace_0_valid,
    output io_nasti_w_ready_trace_0_bits,
    input  io_nasti_aw_ready_trace_0_ready,
    output io_nasti_aw_ready_trace_0_valid,
    output io_nasti_aw_ready_trace_0_bits,
    input  io_mem_resp_bits_tag_trace_0_ready,
    output io_mem_resp_bits_tag_trace_0_valid,
    output[4:0] io_mem_resp_bits_tag_trace_0_bits,
    input  io_mem_resp_bits_data_trace_1_ready,
    output io_mem_resp_bits_data_trace_1_valid,
    output[31:0] io_mem_resp_bits_data_trace_1_bits,
    input  io_mem_resp_bits_data_trace_0_ready,
    output io_mem_resp_bits_data_trace_0_valid,
    output[31:0] io_mem_resp_bits_data_trace_0_bits,
    input  io_mem_resp_valid_trace_0_ready,
    output io_mem_resp_valid_trace_0_valid,
    output io_mem_resp_valid_trace_0_bits,
    input  io_mem_req_data_ready_trace_0_ready,
    output io_mem_req_data_ready_trace_0_valid,
    output io_mem_req_data_ready_trace_0_bits,
    input  io_mem_req_cmd_ready_trace_0_ready,
    output io_mem_req_cmd_ready_trace_0_valid,
    output io_mem_req_cmd_ready_trace_0_bits,
    input  io_htif_host_fromhost_bits_trace_0_ready,
    output io_htif_host_fromhost_bits_trace_0_valid,
    output[31:0] io_htif_host_fromhost_bits_trace_0_bits,
    input  io_htif_host_fromhost_valid_trace_0_ready,
    output io_htif_host_fromhost_valid_trace_0_valid,
    output io_htif_host_fromhost_valid_trace_0_bits,
    input  io_mem_resp_ready_trace_0_ready,
    output io_mem_resp_ready_trace_0_valid,
    output io_mem_resp_ready_trace_0_bits,
    input  io_mem_req_data_bits_data_trace_1_ready,
    output io_mem_req_data_bits_data_trace_1_valid,
    output[31:0] io_mem_req_data_bits_data_trace_1_bits,
    input  io_mem_req_data_bits_data_trace_0_ready,
    output io_mem_req_data_bits_data_trace_0_valid,
    output[31:0] io_mem_req_data_bits_data_trace_0_bits,
    input  io_mem_req_data_valid_trace_0_ready,
    output io_mem_req_data_valid_trace_0_valid,
    output io_mem_req_data_valid_trace_0_bits,
    input  io_mem_req_cmd_bits_rw_trace_0_ready,
    output io_mem_req_cmd_bits_rw_trace_0_valid,
    output io_mem_req_cmd_bits_rw_trace_0_bits,
    input  io_mem_req_cmd_bits_tag_trace_0_ready,
    output io_mem_req_cmd_bits_tag_trace_0_valid,
    output[4:0] io_mem_req_cmd_bits_tag_trace_0_bits,
    input  io_mem_req_cmd_bits_addr_trace_0_ready,
    output io_mem_req_cmd_bits_addr_trace_0_valid,
    output[31:0] io_mem_req_cmd_bits_addr_trace_0_bits,
    input  io_mem_req_cmd_valid_trace_0_ready,
    output io_mem_req_cmd_valid_trace_0_valid,
    output io_mem_req_cmd_valid_trace_0_bits,
    input  io_htif_host_tohost_trace_0_ready,
    output io_htif_host_tohost_trace_0_valid,
    output[31:0] io_htif_host_tohost_trace_0_bits,
    output io_daisy_regs_in_ready,
    input  io_daisy_regs_in_valid,
    input [31:0] io_daisy_regs_in_bits,
    input  io_daisy_regs_out_ready,
    output io_daisy_regs_out_valid,
    output[31:0] io_daisy_regs_out_bits,
    //output io_daisy_trace_in_ready
    input  io_daisy_trace_in_valid,
    input [31:0] io_daisy_trace_in_bits,
    input  io_daisy_trace_out_ready,
    output io_daisy_trace_out_valid,
    output[31:0] io_daisy_trace_out_bits,
    //output io_daisy_sram_1_in_ready
    input  io_daisy_sram_1_in_valid,
    input [31:0] io_daisy_sram_1_in_bits,
    input  io_daisy_sram_1_out_ready,
    output io_daisy_sram_1_out_valid,
    output[31:0] io_daisy_sram_1_out_bits,
    input  io_daisy_sram_1_restart,
    output io_daisy_sram_0_in_ready,
    input  io_daisy_sram_0_in_valid,
    input [31:0] io_daisy_sram_0_in_bits,
    input  io_daisy_sram_0_out_ready,
    output io_daisy_sram_0_out_valid,
    output[31:0] io_daisy_sram_0_out_bits,
    input  io_daisy_sram_0_restart,
    //output io_daisy_cntr_in_ready
    //input  io_daisy_cntr_in_valid
    //input [31:0] io_daisy_cntr_in_bits
    input  io_daisy_cntr_out_ready,
    output io_daisy_cntr_out_valid,
    output[31:0] io_daisy_cntr_out_bits,
    output io_traceLen_ready,
    input  io_traceLen_valid,
    input [10:0] io_traceLen_bits
);

  reg [63:0] cycles;
  wire[63:0] T156;
  wire[63:0] T0;
  wire[63:0] T1;
  wire fire;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  reg [10:0] traceLen;
  wire[10:0] T157;
  wire[10:0] T32;
  wire[10:0] T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  reg  R38;
  reg  fireNext;
  wire[31:0] T39;
  wire[63:0] T40;
  wire T41;
  reg  R42;
  wire[31:0] T158;
  wire[63:0] T43;
  wire[63:0] T44;
  wire T45;
  reg  R46;
  wire T47;
  wire T48;
  wire T49;
  reg  R50;
  wire T51;
  wire T52;
  wire T53;
  reg  R54;
  wire[4:0] T55;
  wire[4:0] T56;
  wire T57;
  reg  R58;
  wire[31:0] T59;
  wire[31:0] T60;
  wire T61;
  reg  R62;
  wire T63;
  wire T64;
  wire T65;
  reg  R66;
  wire[31:0] T67;
  wire[31:0] T68;
  wire T69;
  reg  R70;
  wire T159;
  wire T71;
  reg  R72;
  wire T73;
  wire T74;
  wire[4:0] T75;
  reg [4:0] R76;
  wire[4:0] T77;
  wire[4:0] T78;
  wire T79;
  reg  R80;
  wire T81;
  wire T82;
  wire[63:0] T83;
  reg [63:0] R84;
  wire[63:0] T85;
  wire[63:0] T86;
  wire[63:0] T87;
  wire[1:0] T88;
  reg [1:0] R89;
  wire[1:0] T90;
  wire[1:0] T91;
  wire T92;
  reg  R93;
  wire T94;
  wire T95;
  wire T96;
  reg  R97;
  wire T98;
  wire T99;
  wire T100;
  reg  R101;
  wire T102;
  wire T103;
  wire[4:0] T104;
  reg [4:0] R105;
  wire[4:0] T106;
  wire[4:0] T107;
  wire[1:0] T108;
  reg [1:0] R109;
  wire[1:0] T110;
  wire[1:0] T111;
  wire T112;
  reg  R113;
  wire T114;
  wire T115;
  wire T116;
  reg  R117;
  wire T118;
  wire T119;
  wire T120;
  reg  R121;
  wire T122;
  wire T123;
  wire[4:0] T124;
  reg [4:0] R125;
  wire[4:0] T126;
  wire[4:0] T127;
  wire[63:0] T128;
  reg [63:0] R129;
  wire[63:0] T130;
  wire[63:0] T131;
  wire[63:0] T132;
  wire T133;
  reg  R134;
  wire T135;
  wire T136;
  wire T137;
  reg  R138;
  wire T139;
  wire T140;
  wire T141;
  reg  R142;
  wire T143;
  wire T144;
  wire[31:0] T145;
  reg [31:0] R146;
  wire[31:0] T147;
  wire[31:0] T148;
  wire T149;
  reg  R150;
  wire T151;
  wire T152;
  wire T153;
  wire T154;
  wire T155;
  wire Channel_htif_host_fromhost_valid_0_io_in_ready;
  wire Channel_htif_host_fromhost_valid_0_io_out_valid;
  wire Channel_htif_host_fromhost_valid_0_io_out_bits;
  wire Channel_htif_host_fromhost_valid_0_io_trace_valid;
  wire Channel_htif_host_fromhost_valid_0_io_trace_bits;
  wire Channel_htif_host_fromhost_bits_0_io_in_ready;
  wire Channel_htif_host_fromhost_bits_0_io_out_valid;
  wire[31:0] Channel_htif_host_fromhost_bits_0_io_out_bits;
  wire Channel_htif_host_fromhost_bits_0_io_trace_valid;
  wire[31:0] Channel_htif_host_fromhost_bits_0_io_trace_bits;
  wire Channel_mem_req_cmd_ready_0_io_in_ready;
  wire Channel_mem_req_cmd_ready_0_io_out_valid;
  wire Channel_mem_req_cmd_ready_0_io_out_bits;
  wire Channel_mem_req_cmd_ready_0_io_trace_valid;
  wire Channel_mem_req_cmd_ready_0_io_trace_bits;
  wire Channel_mem_req_data_ready_0_io_in_ready;
  wire Channel_mem_req_data_ready_0_io_out_valid;
  wire Channel_mem_req_data_ready_0_io_out_bits;
  wire Channel_mem_req_data_ready_0_io_trace_valid;
  wire Channel_mem_req_data_ready_0_io_trace_bits;
  wire Channel_mem_resp_valid_0_io_in_ready;
  wire Channel_mem_resp_valid_0_io_out_valid;
  wire Channel_mem_resp_valid_0_io_out_bits;
  wire Channel_mem_resp_valid_0_io_trace_valid;
  wire Channel_mem_resp_valid_0_io_trace_bits;
  wire Channel_mem_resp_bits_data_0_io_in_ready;
  wire Channel_mem_resp_bits_data_0_io_out_valid;
  wire[31:0] Channel_mem_resp_bits_data_0_io_out_bits;
  wire Channel_mem_resp_bits_data_0_io_trace_valid;
  wire[31:0] Channel_mem_resp_bits_data_0_io_trace_bits;
  wire Channel_mem_resp_bits_data_1_io_in_ready;
  wire Channel_mem_resp_bits_data_1_io_out_valid;
  wire[31:0] Channel_mem_resp_bits_data_1_io_out_bits;
  wire Channel_mem_resp_bits_data_1_io_trace_valid;
  wire[31:0] Channel_mem_resp_bits_data_1_io_trace_bits;
  wire Channel_mem_resp_bits_tag_0_io_in_ready;
  wire Channel_mem_resp_bits_tag_0_io_out_valid;
  wire[4:0] Channel_mem_resp_bits_tag_0_io_out_bits;
  wire Channel_mem_resp_bits_tag_0_io_trace_valid;
  wire[4:0] Channel_mem_resp_bits_tag_0_io_trace_bits;
  wire Channel_nasti_aw_ready_0_io_in_ready;
  wire Channel_nasti_aw_ready_0_io_out_valid;
  wire Channel_nasti_aw_ready_0_io_out_bits;
  wire Channel_nasti_aw_ready_0_io_trace_valid;
  wire Channel_nasti_aw_ready_0_io_trace_bits;
  wire Channel_nasti_w_ready_0_io_in_ready;
  wire Channel_nasti_w_ready_0_io_out_valid;
  wire Channel_nasti_w_ready_0_io_out_bits;
  wire Channel_nasti_w_ready_0_io_trace_valid;
  wire Channel_nasti_w_ready_0_io_trace_bits;
  wire Channel_nasti_b_valid_0_io_in_ready;
  wire Channel_nasti_b_valid_0_io_out_valid;
  wire Channel_nasti_b_valid_0_io_out_bits;
  wire Channel_nasti_b_valid_0_io_trace_valid;
  wire Channel_nasti_b_valid_0_io_trace_bits;
  wire Channel_nasti_b_bits_resp_0_io_in_ready;
  wire Channel_nasti_b_bits_resp_0_io_out_valid;
  wire[1:0] Channel_nasti_b_bits_resp_0_io_out_bits;
  wire Channel_nasti_b_bits_resp_0_io_trace_valid;
  wire[1:0] Channel_nasti_b_bits_resp_0_io_trace_bits;
  wire Channel_nasti_b_bits_id_0_io_in_ready;
  wire Channel_nasti_b_bits_id_0_io_out_valid;
  wire[4:0] Channel_nasti_b_bits_id_0_io_out_bits;
  wire Channel_nasti_b_bits_id_0_io_trace_valid;
  wire[4:0] Channel_nasti_b_bits_id_0_io_trace_bits;
  wire Channel_nasti_b_bits_user_0_io_in_ready;
  wire Channel_nasti_b_bits_user_0_io_out_valid;
  wire Channel_nasti_b_bits_user_0_io_out_bits;
  wire Channel_nasti_b_bits_user_0_io_trace_valid;
  wire Channel_nasti_b_bits_user_0_io_trace_bits;
  wire Channel_nasti_ar_ready_0_io_in_ready;
  wire Channel_nasti_ar_ready_0_io_out_valid;
  wire Channel_nasti_ar_ready_0_io_out_bits;
  wire Channel_nasti_ar_ready_0_io_trace_valid;
  wire Channel_nasti_ar_ready_0_io_trace_bits;
  wire Channel_nasti_r_valid_0_io_in_ready;
  wire Channel_nasti_r_valid_0_io_out_valid;
  wire Channel_nasti_r_valid_0_io_out_bits;
  wire Channel_nasti_r_valid_0_io_trace_valid;
  wire Channel_nasti_r_valid_0_io_trace_bits;
  wire Channel_nasti_r_bits_resp_0_io_in_ready;
  wire Channel_nasti_r_bits_resp_0_io_out_valid;
  wire[1:0] Channel_nasti_r_bits_resp_0_io_out_bits;
  wire Channel_nasti_r_bits_resp_0_io_trace_valid;
  wire[1:0] Channel_nasti_r_bits_resp_0_io_trace_bits;
  wire Channel_nasti_r_bits_data_0_io_in_ready;
  wire Channel_nasti_r_bits_data_0_io_out_valid;
  wire[31:0] Channel_nasti_r_bits_data_0_io_out_bits;
  wire Channel_nasti_r_bits_data_0_io_trace_valid;
  wire[31:0] Channel_nasti_r_bits_data_0_io_trace_bits;
  wire Channel_nasti_r_bits_data_1_io_in_ready;
  wire Channel_nasti_r_bits_data_1_io_out_valid;
  wire[31:0] Channel_nasti_r_bits_data_1_io_out_bits;
  wire Channel_nasti_r_bits_data_1_io_trace_valid;
  wire[31:0] Channel_nasti_r_bits_data_1_io_trace_bits;
  wire Channel_nasti_r_bits_last_0_io_in_ready;
  wire Channel_nasti_r_bits_last_0_io_out_valid;
  wire Channel_nasti_r_bits_last_0_io_out_bits;
  wire Channel_nasti_r_bits_last_0_io_trace_valid;
  wire Channel_nasti_r_bits_last_0_io_trace_bits;
  wire Channel_nasti_r_bits_id_0_io_in_ready;
  wire Channel_nasti_r_bits_id_0_io_out_valid;
  wire[4:0] Channel_nasti_r_bits_id_0_io_out_bits;
  wire Channel_nasti_r_bits_id_0_io_trace_valid;
  wire[4:0] Channel_nasti_r_bits_id_0_io_trace_bits;
  wire Channel_nasti_r_bits_user_0_io_in_ready;
  wire Channel_nasti_r_bits_user_0_io_out_valid;
  wire Channel_nasti_r_bits_user_0_io_out_bits;
  wire Channel_nasti_r_bits_user_0_io_trace_valid;
  wire Channel_nasti_r_bits_user_0_io_trace_bits;
  wire Channel_htif_host_tohost_0_io_in_ready;
  wire Channel_htif_host_tohost_0_io_out_valid;
  wire[31:0] Channel_htif_host_tohost_0_io_out_bits;
  wire Channel_htif_host_tohost_0_io_trace_valid;
  wire[31:0] Channel_htif_host_tohost_0_io_trace_bits;
  wire Channel_mem_req_cmd_valid_0_io_in_ready;
  wire Channel_mem_req_cmd_valid_0_io_out_valid;
  wire Channel_mem_req_cmd_valid_0_io_out_bits;
  wire Channel_mem_req_cmd_valid_0_io_trace_valid;
  wire Channel_mem_req_cmd_valid_0_io_trace_bits;
  wire Channel_mem_req_cmd_bits_addr_0_io_in_ready;
  wire Channel_mem_req_cmd_bits_addr_0_io_out_valid;
  wire[31:0] Channel_mem_req_cmd_bits_addr_0_io_out_bits;
  wire Channel_mem_req_cmd_bits_addr_0_io_trace_valid;
  wire[31:0] Channel_mem_req_cmd_bits_addr_0_io_trace_bits;
  wire Channel_mem_req_cmd_bits_tag_0_io_in_ready;
  wire Channel_mem_req_cmd_bits_tag_0_io_out_valid;
  wire[4:0] Channel_mem_req_cmd_bits_tag_0_io_out_bits;
  wire Channel_mem_req_cmd_bits_tag_0_io_trace_valid;
  wire[4:0] Channel_mem_req_cmd_bits_tag_0_io_trace_bits;
  wire Channel_mem_req_cmd_bits_rw_0_io_in_ready;
  wire Channel_mem_req_cmd_bits_rw_0_io_out_valid;
  wire Channel_mem_req_cmd_bits_rw_0_io_out_bits;
  wire Channel_mem_req_cmd_bits_rw_0_io_trace_valid;
  wire Channel_mem_req_cmd_bits_rw_0_io_trace_bits;
  wire Channel_mem_req_data_valid_0_io_in_ready;
  wire Channel_mem_req_data_valid_0_io_out_valid;
  wire Channel_mem_req_data_valid_0_io_out_bits;
  wire Channel_mem_req_data_valid_0_io_trace_valid;
  wire Channel_mem_req_data_valid_0_io_trace_bits;
  wire Channel_mem_req_data_bits_data_0_io_in_ready;
  wire Channel_mem_req_data_bits_data_0_io_out_valid;
  wire[31:0] Channel_mem_req_data_bits_data_0_io_out_bits;
  wire Channel_mem_req_data_bits_data_0_io_trace_valid;
  wire[31:0] Channel_mem_req_data_bits_data_0_io_trace_bits;
  wire Channel_mem_req_data_bits_data_1_io_in_ready;
  wire Channel_mem_req_data_bits_data_1_io_out_valid;
  wire[31:0] Channel_mem_req_data_bits_data_1_io_out_bits;
  wire Channel_mem_req_data_bits_data_1_io_trace_valid;
  wire[31:0] Channel_mem_req_data_bits_data_1_io_trace_bits;
  wire Channel_mem_resp_ready_0_io_in_ready;
  wire Channel_mem_resp_ready_0_io_out_valid;
  wire Channel_mem_resp_ready_0_io_out_bits;
  wire Channel_mem_resp_ready_0_io_trace_valid;
  wire Channel_mem_resp_ready_0_io_trace_bits;
  wire[31:0] target_io_htif_host_tohost;
  wire target_io_mem_req_cmd_valid;
  wire[31:0] target_io_mem_req_cmd_bits_addr;
  wire[4:0] target_io_mem_req_cmd_bits_tag;
  wire target_io_mem_req_cmd_bits_rw;
  wire target_io_mem_req_data_valid;
  wire[63:0] target_io_mem_req_data_bits_data;
  wire target_io_mem_resp_ready;
  wire target_io_daisy_regs_in_ready;
  wire target_io_daisy_regs_out_valid;
  wire[31:0] target_io_daisy_regs_out_bits;
  wire target_io_daisy_sram_0_in_ready;
  wire target_io_daisy_sram_0_out_valid;
  wire[31:0] target_io_daisy_sram_0_out_bits;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    cycles = {2{$random}};
    traceLen = {1{$random}};
    R38 = {1{$random}};
    fireNext = {1{$random}};
    R42 = {1{$random}};
    R46 = {1{$random}};
    R50 = {1{$random}};
    R54 = {1{$random}};
    R58 = {1{$random}};
    R62 = {1{$random}};
    R66 = {1{$random}};
    R70 = {1{$random}};
    R72 = {1{$random}};
    R76 = {1{$random}};
    R80 = {1{$random}};
    R84 = {2{$random}};
    R89 = {1{$random}};
    R93 = {1{$random}};
    R97 = {1{$random}};
    R101 = {1{$random}};
    R105 = {1{$random}};
    R109 = {1{$random}};
    R113 = {1{$random}};
    R117 = {1{$random}};
    R121 = {1{$random}};
    R125 = {1{$random}};
    R129 = {2{$random}};
    R134 = {1{$random}};
    R138 = {1{$random}};
    R142 = {1{$random}};
    R146 = {1{$random}};
    R150 = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
  assign io_daisy_cntr_out_bits = {1{$random}};
  assign io_daisy_cntr_out_valid = {1{$random}};
//  assign io_daisy_cntr_in_ready = {1{$random}};
  assign io_daisy_sram_1_out_bits = {1{$random}};
  assign io_daisy_sram_1_out_valid = {1{$random}};
//  assign io_daisy_sram_1_in_ready = {1{$random}};
  assign io_daisy_trace_out_bits = {1{$random}};
  assign io_daisy_trace_out_valid = {1{$random}};
//  assign io_daisy_trace_in_ready = {1{$random}};
// synthesis translate_on
`endif
  assign T156 = reset ? 64'h0 : T0;
  assign T0 = fire ? T1 : cycles;
  assign T1 = cycles + 64'h1;
  assign fire = T2;
  assign T2 = T11 & T3;
  assign T3 = T4 & Channel_mem_resp_ready_0_io_in_ready;
  assign T4 = T5 & Channel_mem_req_data_bits_data_1_io_in_ready;
  assign T5 = T6 & Channel_mem_req_data_bits_data_0_io_in_ready;
  assign T6 = T7 & Channel_mem_req_data_valid_0_io_in_ready;
  assign T7 = T8 & Channel_mem_req_cmd_bits_rw_0_io_in_ready;
  assign T8 = T9 & Channel_mem_req_cmd_bits_tag_0_io_in_ready;
  assign T9 = T10 & Channel_mem_req_cmd_bits_addr_0_io_in_ready;
  assign T10 = Channel_htif_host_tohost_0_io_in_ready & Channel_mem_req_cmd_valid_0_io_in_ready;
  assign T11 = T12 & Channel_nasti_r_bits_user_0_io_out_valid;
  assign T12 = T13 & Channel_nasti_r_bits_id_0_io_out_valid;
  assign T13 = T14 & Channel_nasti_r_bits_last_0_io_out_valid;
  assign T14 = T15 & Channel_nasti_r_bits_data_1_io_out_valid;
  assign T15 = T16 & Channel_nasti_r_bits_data_0_io_out_valid;
  assign T16 = T17 & Channel_nasti_r_bits_resp_0_io_out_valid;
  assign T17 = T18 & Channel_nasti_r_valid_0_io_out_valid;
  assign T18 = T19 & Channel_nasti_ar_ready_0_io_out_valid;
  assign T19 = T20 & Channel_nasti_b_bits_user_0_io_out_valid;
  assign T20 = T21 & Channel_nasti_b_bits_id_0_io_out_valid;
  assign T21 = T22 & Channel_nasti_b_bits_resp_0_io_out_valid;
  assign T22 = T23 & Channel_nasti_b_valid_0_io_out_valid;
  assign T23 = T24 & Channel_nasti_w_ready_0_io_out_valid;
  assign T24 = T25 & Channel_nasti_aw_ready_0_io_out_valid;
  assign T25 = T26 & Channel_mem_resp_bits_tag_0_io_out_valid;
  assign T26 = T27 & Channel_mem_resp_bits_data_1_io_out_valid;
  assign T27 = T28 & Channel_mem_resp_bits_data_0_io_out_valid;
  assign T28 = T29 & Channel_mem_resp_valid_0_io_out_valid;
  assign T29 = T30 & Channel_mem_req_data_ready_0_io_out_valid;
  assign T30 = T31 & Channel_mem_req_cmd_ready_0_io_out_valid;
  assign T31 = Channel_htif_host_fromhost_valid_0_io_out_valid & Channel_htif_host_fromhost_bits_0_io_out_valid;
  assign T157 = reset ? 11'h3fe : T32;
  assign T32 = T34 ? T33 : traceLen;
  assign T33 = io_traceLen_bits - 11'h2;
  assign T34 = io_traceLen_ready & io_traceLen_valid;
  assign T35 = T36 >> 1'h0;
  assign T36 = target_io_mem_resp_ready;
  assign T37 = fireNext | R38;
  assign T39 = T40 >> 6'h20;
  assign T40 = target_io_mem_req_data_bits_data;
  assign T41 = fireNext | R42;
  assign T158 = T43[5'h1f:1'h0];
  assign T43 = T44 >> 1'h0;
  assign T44 = target_io_mem_req_data_bits_data;
  assign T45 = fireNext | R46;
  assign T47 = T48 >> 1'h0;
  assign T48 = target_io_mem_req_data_valid;
  assign T49 = fireNext | R50;
  assign T51 = T52 >> 1'h0;
  assign T52 = target_io_mem_req_cmd_bits_rw;
  assign T53 = fireNext | R54;
  assign T55 = T56 >> 1'h0;
  assign T56 = target_io_mem_req_cmd_bits_tag;
  assign T57 = fireNext | R58;
  assign T59 = T60 >> 1'h0;
  assign T60 = target_io_mem_req_cmd_bits_addr;
  assign T61 = fireNext | R62;
  assign T63 = T64 >> 1'h0;
  assign T64 = target_io_mem_req_cmd_valid;
  assign T65 = fireNext | R66;
  assign T67 = T68 >> 1'h0;
  assign T68 = target_io_htif_host_tohost;
  assign T69 = fireNext | R70;
  assign T159 = fire | reset;
  assign T71 = fire ? T74 : R72;
  assign T73 = fire ? T74 : R72;
  assign T74 = Channel_nasti_r_bits_user_0_io_out_bits;
  assign T75 = fire ? T78 : R76;
  assign T77 = fire ? T78 : R76;
  assign T78 = Channel_nasti_r_bits_id_0_io_out_bits;
  assign T79 = fire ? T82 : R80;
  assign T81 = fire ? T82 : R80;
  assign T82 = Channel_nasti_r_bits_last_0_io_out_bits;
  assign T83 = fire ? T86 : R84;
  assign T85 = fire ? T86 : R84;
  assign T86 = T87;
  assign T87 = {Channel_nasti_r_bits_data_1_io_out_bits, Channel_nasti_r_bits_data_0_io_out_bits};
  assign T88 = fire ? T91 : R89;
  assign T90 = fire ? T91 : R89;
  assign T91 = Channel_nasti_r_bits_resp_0_io_out_bits;
  assign T92 = fire ? T95 : R93;
  assign T94 = fire ? T95 : R93;
  assign T95 = Channel_nasti_r_valid_0_io_out_bits;
  assign T96 = fire ? T99 : R97;
  assign T98 = fire ? T99 : R97;
  assign T99 = Channel_nasti_ar_ready_0_io_out_bits;
  assign T100 = fire ? T103 : R101;
  assign T102 = fire ? T103 : R101;
  assign T103 = Channel_nasti_b_bits_user_0_io_out_bits;
  assign T104 = fire ? T107 : R105;
  assign T106 = fire ? T107 : R105;
  assign T107 = Channel_nasti_b_bits_id_0_io_out_bits;
  assign T108 = fire ? T111 : R109;
  assign T110 = fire ? T111 : R109;
  assign T111 = Channel_nasti_b_bits_resp_0_io_out_bits;
  assign T112 = fire ? T115 : R113;
  assign T114 = fire ? T115 : R113;
  assign T115 = Channel_nasti_b_valid_0_io_out_bits;
  assign T116 = fire ? T119 : R117;
  assign T118 = fire ? T119 : R117;
  assign T119 = Channel_nasti_w_ready_0_io_out_bits;
  assign T120 = fire ? T123 : R121;
  assign T122 = fire ? T123 : R121;
  assign T123 = Channel_nasti_aw_ready_0_io_out_bits;
  assign T124 = fire ? T127 : R125;
  assign T126 = fire ? T127 : R125;
  assign T127 = Channel_mem_resp_bits_tag_0_io_out_bits;
  assign T128 = fire ? T131 : R129;
  assign T130 = fire ? T131 : R129;
  assign T131 = T132;
  assign T132 = {Channel_mem_resp_bits_data_1_io_out_bits, Channel_mem_resp_bits_data_0_io_out_bits};
  assign T133 = fire ? T136 : R134;
  assign T135 = fire ? T136 : R134;
  assign T136 = Channel_mem_resp_valid_0_io_out_bits;
  assign T137 = fire ? T140 : R138;
  assign T139 = fire ? T140 : R138;
  assign T140 = Channel_mem_req_data_ready_0_io_out_bits;
  assign T141 = fire ? T144 : R142;
  assign T143 = fire ? T144 : R142;
  assign T144 = Channel_mem_req_cmd_ready_0_io_out_bits;
  assign T145 = fire ? T148 : R146;
  assign T147 = fire ? T148 : R146;
  assign T148 = Channel_htif_host_fromhost_bits_0_io_out_bits;
  assign T149 = fire ? T152 : R150;
  assign T151 = fire ? T152 : R150;
  assign T152 = Channel_htif_host_fromhost_valid_0_io_out_bits;
  assign io_traceLen_ready = T153;
  assign T153 = T155 & T154;
  assign T154 = fireNext ^ 1'h1;
  assign T155 = fire ^ 1'h1;
  assign io_daisy_sram_0_out_bits = target_io_daisy_sram_0_out_bits;
  assign io_daisy_sram_0_out_valid = target_io_daisy_sram_0_out_valid;
  assign io_daisy_sram_0_in_ready = target_io_daisy_sram_0_in_ready;
  assign io_daisy_regs_out_bits = target_io_daisy_regs_out_bits;
  assign io_daisy_regs_out_valid = target_io_daisy_regs_out_valid;
  assign io_daisy_regs_in_ready = target_io_daisy_regs_in_ready;
  assign io_htif_host_tohost_trace_0_bits = Channel_htif_host_tohost_0_io_trace_bits;
  assign io_htif_host_tohost_trace_0_valid = Channel_htif_host_tohost_0_io_trace_valid;
  assign io_mem_req_cmd_valid_trace_0_bits = Channel_mem_req_cmd_valid_0_io_trace_bits;
  assign io_mem_req_cmd_valid_trace_0_valid = Channel_mem_req_cmd_valid_0_io_trace_valid;
  assign io_mem_req_cmd_bits_addr_trace_0_bits = Channel_mem_req_cmd_bits_addr_0_io_trace_bits;
  assign io_mem_req_cmd_bits_addr_trace_0_valid = Channel_mem_req_cmd_bits_addr_0_io_trace_valid;
  assign io_mem_req_cmd_bits_tag_trace_0_bits = Channel_mem_req_cmd_bits_tag_0_io_trace_bits;
  assign io_mem_req_cmd_bits_tag_trace_0_valid = Channel_mem_req_cmd_bits_tag_0_io_trace_valid;
  assign io_mem_req_cmd_bits_rw_trace_0_bits = Channel_mem_req_cmd_bits_rw_0_io_trace_bits;
  assign io_mem_req_cmd_bits_rw_trace_0_valid = Channel_mem_req_cmd_bits_rw_0_io_trace_valid;
  assign io_mem_req_data_valid_trace_0_bits = Channel_mem_req_data_valid_0_io_trace_bits;
  assign io_mem_req_data_valid_trace_0_valid = Channel_mem_req_data_valid_0_io_trace_valid;
  assign io_mem_req_data_bits_data_trace_0_bits = Channel_mem_req_data_bits_data_0_io_trace_bits;
  assign io_mem_req_data_bits_data_trace_0_valid = Channel_mem_req_data_bits_data_0_io_trace_valid;
  assign io_mem_req_data_bits_data_trace_1_bits = Channel_mem_req_data_bits_data_1_io_trace_bits;
  assign io_mem_req_data_bits_data_trace_1_valid = Channel_mem_req_data_bits_data_1_io_trace_valid;
  assign io_mem_resp_ready_trace_0_bits = Channel_mem_resp_ready_0_io_trace_bits;
  assign io_mem_resp_ready_trace_0_valid = Channel_mem_resp_ready_0_io_trace_valid;
  assign io_htif_host_fromhost_valid_trace_0_bits = Channel_htif_host_fromhost_valid_0_io_trace_bits;
  assign io_htif_host_fromhost_valid_trace_0_valid = Channel_htif_host_fromhost_valid_0_io_trace_valid;
  assign io_htif_host_fromhost_bits_trace_0_bits = Channel_htif_host_fromhost_bits_0_io_trace_bits;
  assign io_htif_host_fromhost_bits_trace_0_valid = Channel_htif_host_fromhost_bits_0_io_trace_valid;
  assign io_mem_req_cmd_ready_trace_0_bits = Channel_mem_req_cmd_ready_0_io_trace_bits;
  assign io_mem_req_cmd_ready_trace_0_valid = Channel_mem_req_cmd_ready_0_io_trace_valid;
  assign io_mem_req_data_ready_trace_0_bits = Channel_mem_req_data_ready_0_io_trace_bits;
  assign io_mem_req_data_ready_trace_0_valid = Channel_mem_req_data_ready_0_io_trace_valid;
  assign io_mem_resp_valid_trace_0_bits = Channel_mem_resp_valid_0_io_trace_bits;
  assign io_mem_resp_valid_trace_0_valid = Channel_mem_resp_valid_0_io_trace_valid;
  assign io_mem_resp_bits_data_trace_0_bits = Channel_mem_resp_bits_data_0_io_trace_bits;
  assign io_mem_resp_bits_data_trace_0_valid = Channel_mem_resp_bits_data_0_io_trace_valid;
  assign io_mem_resp_bits_data_trace_1_bits = Channel_mem_resp_bits_data_1_io_trace_bits;
  assign io_mem_resp_bits_data_trace_1_valid = Channel_mem_resp_bits_data_1_io_trace_valid;
  assign io_mem_resp_bits_tag_trace_0_bits = Channel_mem_resp_bits_tag_0_io_trace_bits;
  assign io_mem_resp_bits_tag_trace_0_valid = Channel_mem_resp_bits_tag_0_io_trace_valid;
  assign io_nasti_aw_ready_trace_0_bits = Channel_nasti_aw_ready_0_io_trace_bits;
  assign io_nasti_aw_ready_trace_0_valid = Channel_nasti_aw_ready_0_io_trace_valid;
  assign io_nasti_w_ready_trace_0_bits = Channel_nasti_w_ready_0_io_trace_bits;
  assign io_nasti_w_ready_trace_0_valid = Channel_nasti_w_ready_0_io_trace_valid;
  assign io_nasti_b_valid_trace_0_bits = Channel_nasti_b_valid_0_io_trace_bits;
  assign io_nasti_b_valid_trace_0_valid = Channel_nasti_b_valid_0_io_trace_valid;
  assign io_nasti_b_bits_resp_trace_0_bits = Channel_nasti_b_bits_resp_0_io_trace_bits;
  assign io_nasti_b_bits_resp_trace_0_valid = Channel_nasti_b_bits_resp_0_io_trace_valid;
  assign io_nasti_b_bits_id_trace_0_bits = Channel_nasti_b_bits_id_0_io_trace_bits;
  assign io_nasti_b_bits_id_trace_0_valid = Channel_nasti_b_bits_id_0_io_trace_valid;
  assign io_nasti_b_bits_user_trace_0_bits = Channel_nasti_b_bits_user_0_io_trace_bits;
  assign io_nasti_b_bits_user_trace_0_valid = Channel_nasti_b_bits_user_0_io_trace_valid;
  assign io_nasti_ar_ready_trace_0_bits = Channel_nasti_ar_ready_0_io_trace_bits;
  assign io_nasti_ar_ready_trace_0_valid = Channel_nasti_ar_ready_0_io_trace_valid;
  assign io_nasti_r_valid_trace_0_bits = Channel_nasti_r_valid_0_io_trace_bits;
  assign io_nasti_r_valid_trace_0_valid = Channel_nasti_r_valid_0_io_trace_valid;
  assign io_nasti_r_bits_resp_trace_0_bits = Channel_nasti_r_bits_resp_0_io_trace_bits;
  assign io_nasti_r_bits_resp_trace_0_valid = Channel_nasti_r_bits_resp_0_io_trace_valid;
  assign io_nasti_r_bits_data_trace_0_bits = Channel_nasti_r_bits_data_0_io_trace_bits;
  assign io_nasti_r_bits_data_trace_0_valid = Channel_nasti_r_bits_data_0_io_trace_valid;
  assign io_nasti_r_bits_data_trace_1_bits = Channel_nasti_r_bits_data_1_io_trace_bits;
  assign io_nasti_r_bits_data_trace_1_valid = Channel_nasti_r_bits_data_1_io_trace_valid;
  assign io_nasti_r_bits_last_trace_0_bits = Channel_nasti_r_bits_last_0_io_trace_bits;
  assign io_nasti_r_bits_last_trace_0_valid = Channel_nasti_r_bits_last_0_io_trace_valid;
  assign io_nasti_r_bits_id_trace_0_bits = Channel_nasti_r_bits_id_0_io_trace_bits;
  assign io_nasti_r_bits_id_trace_0_valid = Channel_nasti_r_bits_id_0_io_trace_valid;
  assign io_nasti_r_bits_user_trace_0_bits = Channel_nasti_r_bits_user_0_io_trace_bits;
  assign io_nasti_r_bits_user_trace_0_valid = Channel_nasti_r_bits_user_0_io_trace_valid;
  assign io_htif_host_tohost_channel_0_bits = Channel_htif_host_tohost_0_io_out_bits;
  assign io_htif_host_tohost_channel_0_valid = Channel_htif_host_tohost_0_io_out_valid;
  assign io_mem_req_cmd_valid_channel_0_bits = Channel_mem_req_cmd_valid_0_io_out_bits;
  assign io_mem_req_cmd_valid_channel_0_valid = Channel_mem_req_cmd_valid_0_io_out_valid;
  assign io_mem_req_cmd_bits_addr_channel_0_bits = Channel_mem_req_cmd_bits_addr_0_io_out_bits;
  assign io_mem_req_cmd_bits_addr_channel_0_valid = Channel_mem_req_cmd_bits_addr_0_io_out_valid;
  assign io_mem_req_cmd_bits_tag_channel_0_bits = Channel_mem_req_cmd_bits_tag_0_io_out_bits;
  assign io_mem_req_cmd_bits_tag_channel_0_valid = Channel_mem_req_cmd_bits_tag_0_io_out_valid;
  assign io_mem_req_cmd_bits_rw_channel_0_bits = Channel_mem_req_cmd_bits_rw_0_io_out_bits;
  assign io_mem_req_cmd_bits_rw_channel_0_valid = Channel_mem_req_cmd_bits_rw_0_io_out_valid;
  assign io_mem_req_data_valid_channel_0_bits = Channel_mem_req_data_valid_0_io_out_bits;
  assign io_mem_req_data_valid_channel_0_valid = Channel_mem_req_data_valid_0_io_out_valid;
  assign io_mem_req_data_bits_data_channel_0_bits = Channel_mem_req_data_bits_data_0_io_out_bits;
  assign io_mem_req_data_bits_data_channel_0_valid = Channel_mem_req_data_bits_data_0_io_out_valid;
  assign io_mem_req_data_bits_data_channel_1_bits = Channel_mem_req_data_bits_data_1_io_out_bits;
  assign io_mem_req_data_bits_data_channel_1_valid = Channel_mem_req_data_bits_data_1_io_out_valid;
  assign io_mem_resp_ready_channel_0_bits = Channel_mem_resp_ready_0_io_out_bits;
  assign io_mem_resp_ready_channel_0_valid = Channel_mem_resp_ready_0_io_out_valid;
  assign io_htif_host_fromhost_valid_channel_0_ready = Channel_htif_host_fromhost_valid_0_io_in_ready;
  assign io_htif_host_fromhost_bits_channel_0_ready = Channel_htif_host_fromhost_bits_0_io_in_ready;
  assign io_mem_req_cmd_ready_channel_0_ready = Channel_mem_req_cmd_ready_0_io_in_ready;
  assign io_mem_req_data_ready_channel_0_ready = Channel_mem_req_data_ready_0_io_in_ready;
  assign io_mem_resp_valid_channel_0_ready = Channel_mem_resp_valid_0_io_in_ready;
  assign io_mem_resp_bits_data_channel_0_ready = Channel_mem_resp_bits_data_0_io_in_ready;
  assign io_mem_resp_bits_data_channel_1_ready = Channel_mem_resp_bits_data_1_io_in_ready;
  assign io_mem_resp_bits_tag_channel_0_ready = Channel_mem_resp_bits_tag_0_io_in_ready;
  assign io_nasti_aw_ready_channel_0_ready = Channel_nasti_aw_ready_0_io_in_ready;
  assign io_nasti_w_ready_channel_0_ready = Channel_nasti_w_ready_0_io_in_ready;
  assign io_nasti_b_valid_channel_0_ready = Channel_nasti_b_valid_0_io_in_ready;
  assign io_nasti_b_bits_resp_channel_0_ready = Channel_nasti_b_bits_resp_0_io_in_ready;
  assign io_nasti_b_bits_id_channel_0_ready = Channel_nasti_b_bits_id_0_io_in_ready;
  assign io_nasti_b_bits_user_channel_0_ready = Channel_nasti_b_bits_user_0_io_in_ready;
  assign io_nasti_ar_ready_channel_0_ready = Channel_nasti_ar_ready_0_io_in_ready;
  assign io_nasti_r_valid_channel_0_ready = Channel_nasti_r_valid_0_io_in_ready;
  assign io_nasti_r_bits_resp_channel_0_ready = Channel_nasti_r_bits_resp_0_io_in_ready;
  assign io_nasti_r_bits_data_channel_0_ready = Channel_nasti_r_bits_data_0_io_in_ready;
  assign io_nasti_r_bits_data_channel_1_ready = Channel_nasti_r_bits_data_1_io_in_ready;
  assign io_nasti_r_bits_last_channel_0_ready = Channel_nasti_r_bits_last_0_io_in_ready;
  assign io_nasti_r_bits_id_channel_0_ready = Channel_nasti_r_bits_id_0_io_in_ready;
  assign io_nasti_r_bits_user_channel_0_ready = Channel_nasti_r_bits_user_0_io_in_ready;
  Tile target(.clk(clk), .host__reset(reset),
       .io_htif_host_fromhost_valid( T149 ),
       .io_htif_host_fromhost_bits( T145 ),
       .io_htif_host_tohost( target_io_htif_host_tohost ),
       .io_mem_req_cmd_ready( T141 ),
       .io_mem_req_cmd_valid( target_io_mem_req_cmd_valid ),
       .io_mem_req_cmd_bits_addr( target_io_mem_req_cmd_bits_addr ),
       .io_mem_req_cmd_bits_tag( target_io_mem_req_cmd_bits_tag ),
       .io_mem_req_cmd_bits_rw( target_io_mem_req_cmd_bits_rw ),
       .io_mem_req_data_ready( T137 ),
       .io_mem_req_data_valid( target_io_mem_req_data_valid ),
       .io_mem_req_data_bits_data( target_io_mem_req_data_bits_data ),
       .io_mem_resp_ready( target_io_mem_resp_ready ),
       .io_mem_resp_valid( T133 ),
       .io_mem_resp_bits_data( T128 ),
       .io_mem_resp_bits_tag( T124 ),
       .io_nasti_aw_ready( T120 ),
       //.io_nasti_aw_valid(  )
       //.io_nasti_aw_bits_addr(  )
       //.io_nasti_aw_bits_len(  )
       //.io_nasti_aw_bits_size(  )
       //.io_nasti_aw_bits_burst(  )
       //.io_nasti_aw_bits_lock(  )
       //.io_nasti_aw_bits_cache(  )
       //.io_nasti_aw_bits_prot(  )
       //.io_nasti_aw_bits_qos(  )
       //.io_nasti_aw_bits_region(  )
       //.io_nasti_aw_bits_id(  )
       //.io_nasti_aw_bits_user(  )
       .io_nasti_w_ready( T116 ),
       //.io_nasti_w_valid(  )
       //.io_nasti_w_bits_data(  )
       //.io_nasti_w_bits_last(  )
       //.io_nasti_w_bits_strb(  )
       //.io_nasti_w_bits_user(  )
       //.io_nasti_b_ready(  )
       .io_nasti_b_valid( T112 ),
       .io_nasti_b_bits_resp( T108 ),
       .io_nasti_b_bits_id( T104 ),
       .io_nasti_b_bits_user( T100 ),
       .io_nasti_ar_ready( T96 ),
       //.io_nasti_ar_valid(  )
       //.io_nasti_ar_bits_addr(  )
       //.io_nasti_ar_bits_len(  )
       //.io_nasti_ar_bits_size(  )
       //.io_nasti_ar_bits_burst(  )
       //.io_nasti_ar_bits_lock(  )
       //.io_nasti_ar_bits_cache(  )
       //.io_nasti_ar_bits_prot(  )
       //.io_nasti_ar_bits_qos(  )
       //.io_nasti_ar_bits_region(  )
       //.io_nasti_ar_bits_id(  )
       //.io_nasti_ar_bits_user(  )
       //.io_nasti_r_ready(  )
       .io_nasti_r_valid( T92 ),
       .io_nasti_r_bits_resp( T88 ),
       .io_nasti_r_bits_data( T83 ),
       .io_nasti_r_bits_last( T79 ),
       .io_nasti_r_bits_id( T75 ),
       .io_nasti_r_bits_user( T71 ),
       .io_daisy_regs_in_ready( target_io_daisy_regs_in_ready ),
       .io_daisy_regs_in_valid( io_daisy_regs_in_valid ),
       .io_daisy_regs_in_bits( io_daisy_regs_in_bits ),
       .io_daisy_regs_out_ready( io_daisy_regs_out_ready ),
       .io_daisy_regs_out_valid( target_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( target_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       //.io_daisy_trace_in_valid(  )
       //.io_daisy_trace_in_bits(  )
       //.io_daisy_trace_out_ready(  )
       //.io_daisy_trace_out_valid(  )
       //.io_daisy_trace_out_bits(  )
       //.io_daisy_sram_1_in_ready(  )
       //.io_daisy_sram_1_in_valid(  )
       //.io_daisy_sram_1_in_bits(  )
       //.io_daisy_sram_1_out_ready(  )
       //.io_daisy_sram_1_out_valid(  )
       //.io_daisy_sram_1_out_bits(  )
       //.io_daisy_sram_1_restart(  )
       .io_daisy_sram_0_in_ready( target_io_daisy_sram_0_in_ready ),
       .io_daisy_sram_0_in_valid( io_daisy_sram_0_in_valid ),
       .io_daisy_sram_0_in_bits( io_daisy_sram_0_in_bits ),
       .io_daisy_sram_0_out_ready( io_daisy_sram_0_out_ready ),
       .io_daisy_sram_0_out_valid( target_io_daisy_sram_0_out_valid ),
       .io_daisy_sram_0_out_bits( target_io_daisy_sram_0_out_bits ),
       .io_daisy_sram_0_restart( io_daisy_sram_0_restart ),
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       //.io_daisy_cntr_out_ready(  )
       //.io_daisy_cntr_out_valid(  )
       //.io_daisy_cntr_out_bits(  )
       .fire_pin( T159 ),
       .daisy__rst( reset )
  );
  Channel_3 Channel_htif_host_fromhost_valid_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_htif_host_fromhost_valid_0_io_in_ready ),
       .io_in_valid( io_htif_host_fromhost_valid_channel_0_valid ),
       .io_in_bits( io_htif_host_fromhost_valid_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_htif_host_fromhost_valid_0_io_out_valid ),
       .io_out_bits( Channel_htif_host_fromhost_valid_0_io_out_bits ),
       .io_trace_ready( io_htif_host_fromhost_valid_trace_0_ready ),
       .io_trace_valid( Channel_htif_host_fromhost_valid_0_io_trace_valid ),
       .io_trace_bits( Channel_htif_host_fromhost_valid_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_htif_host_fromhost_bits_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_htif_host_fromhost_bits_0_io_in_ready ),
       .io_in_valid( io_htif_host_fromhost_bits_channel_0_valid ),
       .io_in_bits( io_htif_host_fromhost_bits_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_htif_host_fromhost_bits_0_io_out_valid ),
       .io_out_bits( Channel_htif_host_fromhost_bits_0_io_out_bits ),
       .io_trace_ready( io_htif_host_fromhost_bits_trace_0_ready ),
       .io_trace_valid( Channel_htif_host_fromhost_bits_0_io_trace_valid ),
       .io_trace_bits( Channel_htif_host_fromhost_bits_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_mem_req_cmd_ready_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_cmd_ready_0_io_in_ready ),
       .io_in_valid( io_mem_req_cmd_ready_channel_0_valid ),
       .io_in_bits( io_mem_req_cmd_ready_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_mem_req_cmd_ready_0_io_out_valid ),
       .io_out_bits( Channel_mem_req_cmd_ready_0_io_out_bits ),
       .io_trace_ready( io_mem_req_cmd_ready_trace_0_ready ),
       .io_trace_valid( Channel_mem_req_cmd_ready_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_cmd_ready_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_mem_req_data_ready_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_data_ready_0_io_in_ready ),
       .io_in_valid( io_mem_req_data_ready_channel_0_valid ),
       .io_in_bits( io_mem_req_data_ready_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_mem_req_data_ready_0_io_out_valid ),
       .io_out_bits( Channel_mem_req_data_ready_0_io_out_bits ),
       .io_trace_ready( io_mem_req_data_ready_trace_0_ready ),
       .io_trace_valid( Channel_mem_req_data_ready_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_data_ready_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_mem_resp_valid_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_resp_valid_0_io_in_ready ),
       .io_in_valid( io_mem_resp_valid_channel_0_valid ),
       .io_in_bits( io_mem_resp_valid_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_mem_resp_valid_0_io_out_valid ),
       .io_out_bits( Channel_mem_resp_valid_0_io_out_bits ),
       .io_trace_ready( io_mem_resp_valid_trace_0_ready ),
       .io_trace_valid( Channel_mem_resp_valid_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_resp_valid_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_mem_resp_bits_data_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_resp_bits_data_0_io_in_ready ),
       .io_in_valid( io_mem_resp_bits_data_channel_0_valid ),
       .io_in_bits( io_mem_resp_bits_data_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_mem_resp_bits_data_0_io_out_valid ),
       .io_out_bits( Channel_mem_resp_bits_data_0_io_out_bits ),
       .io_trace_ready( io_mem_resp_bits_data_trace_0_ready ),
       .io_trace_valid( Channel_mem_resp_bits_data_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_resp_bits_data_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_mem_resp_bits_data_1(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_resp_bits_data_1_io_in_ready ),
       .io_in_valid( io_mem_resp_bits_data_channel_1_valid ),
       .io_in_bits( io_mem_resp_bits_data_channel_1_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_mem_resp_bits_data_1_io_out_valid ),
       .io_out_bits( Channel_mem_resp_bits_data_1_io_out_bits ),
       .io_trace_ready( io_mem_resp_bits_data_trace_1_ready ),
       .io_trace_valid( Channel_mem_resp_bits_data_1_io_trace_valid ),
       .io_trace_bits( Channel_mem_resp_bits_data_1_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_5 Channel_mem_resp_bits_tag_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_resp_bits_tag_0_io_in_ready ),
       .io_in_valid( io_mem_resp_bits_tag_channel_0_valid ),
       .io_in_bits( io_mem_resp_bits_tag_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_mem_resp_bits_tag_0_io_out_valid ),
       .io_out_bits( Channel_mem_resp_bits_tag_0_io_out_bits ),
       .io_trace_ready( io_mem_resp_bits_tag_trace_0_ready ),
       .io_trace_valid( Channel_mem_resp_bits_tag_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_resp_bits_tag_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_nasti_aw_ready_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_aw_ready_0_io_in_ready ),
       .io_in_valid( io_nasti_aw_ready_channel_0_valid ),
       .io_in_bits( io_nasti_aw_ready_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_aw_ready_0_io_out_valid ),
       .io_out_bits( Channel_nasti_aw_ready_0_io_out_bits ),
       .io_trace_ready( io_nasti_aw_ready_trace_0_ready ),
       .io_trace_valid( Channel_nasti_aw_ready_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_aw_ready_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_nasti_w_ready_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_w_ready_0_io_in_ready ),
       .io_in_valid( io_nasti_w_ready_channel_0_valid ),
       .io_in_bits( io_nasti_w_ready_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_w_ready_0_io_out_valid ),
       .io_out_bits( Channel_nasti_w_ready_0_io_out_bits ),
       .io_trace_ready( io_nasti_w_ready_trace_0_ready ),
       .io_trace_valid( Channel_nasti_w_ready_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_w_ready_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_nasti_b_valid_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_b_valid_0_io_in_ready ),
       .io_in_valid( io_nasti_b_valid_channel_0_valid ),
       .io_in_bits( io_nasti_b_valid_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_b_valid_0_io_out_valid ),
       .io_out_bits( Channel_nasti_b_valid_0_io_out_bits ),
       .io_trace_ready( io_nasti_b_valid_trace_0_ready ),
       .io_trace_valid( Channel_nasti_b_valid_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_b_valid_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_6 Channel_nasti_b_bits_resp_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_b_bits_resp_0_io_in_ready ),
       .io_in_valid( io_nasti_b_bits_resp_channel_0_valid ),
       .io_in_bits( io_nasti_b_bits_resp_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_b_bits_resp_0_io_out_valid ),
       .io_out_bits( Channel_nasti_b_bits_resp_0_io_out_bits ),
       .io_trace_ready( io_nasti_b_bits_resp_trace_0_ready ),
       .io_trace_valid( Channel_nasti_b_bits_resp_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_b_bits_resp_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_5 Channel_nasti_b_bits_id_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_b_bits_id_0_io_in_ready ),
       .io_in_valid( io_nasti_b_bits_id_channel_0_valid ),
       .io_in_bits( io_nasti_b_bits_id_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_b_bits_id_0_io_out_valid ),
       .io_out_bits( Channel_nasti_b_bits_id_0_io_out_bits ),
       .io_trace_ready( io_nasti_b_bits_id_trace_0_ready ),
       .io_trace_valid( Channel_nasti_b_bits_id_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_b_bits_id_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_nasti_b_bits_user_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_b_bits_user_0_io_in_ready ),
       .io_in_valid( io_nasti_b_bits_user_channel_0_valid ),
       .io_in_bits( io_nasti_b_bits_user_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_b_bits_user_0_io_out_valid ),
       .io_out_bits( Channel_nasti_b_bits_user_0_io_out_bits ),
       .io_trace_ready( io_nasti_b_bits_user_trace_0_ready ),
       .io_trace_valid( Channel_nasti_b_bits_user_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_b_bits_user_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_nasti_ar_ready_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_ar_ready_0_io_in_ready ),
       .io_in_valid( io_nasti_ar_ready_channel_0_valid ),
       .io_in_bits( io_nasti_ar_ready_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_ar_ready_0_io_out_valid ),
       .io_out_bits( Channel_nasti_ar_ready_0_io_out_bits ),
       .io_trace_ready( io_nasti_ar_ready_trace_0_ready ),
       .io_trace_valid( Channel_nasti_ar_ready_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_ar_ready_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_nasti_r_valid_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_r_valid_0_io_in_ready ),
       .io_in_valid( io_nasti_r_valid_channel_0_valid ),
       .io_in_bits( io_nasti_r_valid_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_r_valid_0_io_out_valid ),
       .io_out_bits( Channel_nasti_r_valid_0_io_out_bits ),
       .io_trace_ready( io_nasti_r_valid_trace_0_ready ),
       .io_trace_valid( Channel_nasti_r_valid_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_r_valid_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_6 Channel_nasti_r_bits_resp_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_r_bits_resp_0_io_in_ready ),
       .io_in_valid( io_nasti_r_bits_resp_channel_0_valid ),
       .io_in_bits( io_nasti_r_bits_resp_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_r_bits_resp_0_io_out_valid ),
       .io_out_bits( Channel_nasti_r_bits_resp_0_io_out_bits ),
       .io_trace_ready( io_nasti_r_bits_resp_trace_0_ready ),
       .io_trace_valid( Channel_nasti_r_bits_resp_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_r_bits_resp_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_nasti_r_bits_data_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_r_bits_data_0_io_in_ready ),
       .io_in_valid( io_nasti_r_bits_data_channel_0_valid ),
       .io_in_bits( io_nasti_r_bits_data_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_r_bits_data_0_io_out_valid ),
       .io_out_bits( Channel_nasti_r_bits_data_0_io_out_bits ),
       .io_trace_ready( io_nasti_r_bits_data_trace_0_ready ),
       .io_trace_valid( Channel_nasti_r_bits_data_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_r_bits_data_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_nasti_r_bits_data_1(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_r_bits_data_1_io_in_ready ),
       .io_in_valid( io_nasti_r_bits_data_channel_1_valid ),
       .io_in_bits( io_nasti_r_bits_data_channel_1_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_r_bits_data_1_io_out_valid ),
       .io_out_bits( Channel_nasti_r_bits_data_1_io_out_bits ),
       .io_trace_ready( io_nasti_r_bits_data_trace_1_ready ),
       .io_trace_valid( Channel_nasti_r_bits_data_1_io_trace_valid ),
       .io_trace_bits( Channel_nasti_r_bits_data_1_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_nasti_r_bits_last_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_r_bits_last_0_io_in_ready ),
       .io_in_valid( io_nasti_r_bits_last_channel_0_valid ),
       .io_in_bits( io_nasti_r_bits_last_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_r_bits_last_0_io_out_valid ),
       .io_out_bits( Channel_nasti_r_bits_last_0_io_out_bits ),
       .io_trace_ready( io_nasti_r_bits_last_trace_0_ready ),
       .io_trace_valid( Channel_nasti_r_bits_last_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_r_bits_last_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_5 Channel_nasti_r_bits_id_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_r_bits_id_0_io_in_ready ),
       .io_in_valid( io_nasti_r_bits_id_channel_0_valid ),
       .io_in_bits( io_nasti_r_bits_id_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_r_bits_id_0_io_out_valid ),
       .io_out_bits( Channel_nasti_r_bits_id_0_io_out_bits ),
       .io_trace_ready( io_nasti_r_bits_id_trace_0_ready ),
       .io_trace_valid( Channel_nasti_r_bits_id_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_r_bits_id_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_nasti_r_bits_user_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_nasti_r_bits_user_0_io_in_ready ),
       .io_in_valid( io_nasti_r_bits_user_channel_0_valid ),
       .io_in_bits( io_nasti_r_bits_user_channel_0_bits ),
       .io_out_ready( fire ),
       .io_out_valid( Channel_nasti_r_bits_user_0_io_out_valid ),
       .io_out_bits( Channel_nasti_r_bits_user_0_io_out_bits ),
       .io_trace_ready( io_nasti_r_bits_user_trace_0_ready ),
       .io_trace_valid( Channel_nasti_r_bits_user_0_io_trace_valid ),
       .io_trace_bits( Channel_nasti_r_bits_user_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_htif_host_tohost_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_htif_host_tohost_0_io_in_ready ),
       .io_in_valid( T69 ),
       .io_in_bits( T67 ),
       .io_out_ready( io_htif_host_tohost_channel_0_ready ),
       .io_out_valid( Channel_htif_host_tohost_0_io_out_valid ),
       .io_out_bits( Channel_htif_host_tohost_0_io_out_bits ),
       .io_trace_ready( io_htif_host_tohost_trace_0_ready ),
       .io_trace_valid( Channel_htif_host_tohost_0_io_trace_valid ),
       .io_trace_bits( Channel_htif_host_tohost_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_mem_req_cmd_valid_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_cmd_valid_0_io_in_ready ),
       .io_in_valid( T65 ),
       .io_in_bits( T63 ),
       .io_out_ready( io_mem_req_cmd_valid_channel_0_ready ),
       .io_out_valid( Channel_mem_req_cmd_valid_0_io_out_valid ),
       .io_out_bits( Channel_mem_req_cmd_valid_0_io_out_bits ),
       .io_trace_ready( io_mem_req_cmd_valid_trace_0_ready ),
       .io_trace_valid( Channel_mem_req_cmd_valid_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_cmd_valid_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_mem_req_cmd_bits_addr_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_cmd_bits_addr_0_io_in_ready ),
       .io_in_valid( T61 ),
       .io_in_bits( T59 ),
       .io_out_ready( io_mem_req_cmd_bits_addr_channel_0_ready ),
       .io_out_valid( Channel_mem_req_cmd_bits_addr_0_io_out_valid ),
       .io_out_bits( Channel_mem_req_cmd_bits_addr_0_io_out_bits ),
       .io_trace_ready( io_mem_req_cmd_bits_addr_trace_0_ready ),
       .io_trace_valid( Channel_mem_req_cmd_bits_addr_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_cmd_bits_addr_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_5 Channel_mem_req_cmd_bits_tag_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_cmd_bits_tag_0_io_in_ready ),
       .io_in_valid( T57 ),
       .io_in_bits( T55 ),
       .io_out_ready( io_mem_req_cmd_bits_tag_channel_0_ready ),
       .io_out_valid( Channel_mem_req_cmd_bits_tag_0_io_out_valid ),
       .io_out_bits( Channel_mem_req_cmd_bits_tag_0_io_out_bits ),
       .io_trace_ready( io_mem_req_cmd_bits_tag_trace_0_ready ),
       .io_trace_valid( Channel_mem_req_cmd_bits_tag_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_cmd_bits_tag_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_mem_req_cmd_bits_rw_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_cmd_bits_rw_0_io_in_ready ),
       .io_in_valid( T53 ),
       .io_in_bits( T51 ),
       .io_out_ready( io_mem_req_cmd_bits_rw_channel_0_ready ),
       .io_out_valid( Channel_mem_req_cmd_bits_rw_0_io_out_valid ),
       .io_out_bits( Channel_mem_req_cmd_bits_rw_0_io_out_bits ),
       .io_trace_ready( io_mem_req_cmd_bits_rw_trace_0_ready ),
       .io_trace_valid( Channel_mem_req_cmd_bits_rw_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_cmd_bits_rw_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_mem_req_data_valid_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_data_valid_0_io_in_ready ),
       .io_in_valid( T49 ),
       .io_in_bits( T47 ),
       .io_out_ready( io_mem_req_data_valid_channel_0_ready ),
       .io_out_valid( Channel_mem_req_data_valid_0_io_out_valid ),
       .io_out_bits( Channel_mem_req_data_valid_0_io_out_bits ),
       .io_trace_ready( io_mem_req_data_valid_trace_0_ready ),
       .io_trace_valid( Channel_mem_req_data_valid_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_data_valid_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_mem_req_data_bits_data_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_data_bits_data_0_io_in_ready ),
       .io_in_valid( T45 ),
       .io_in_bits( T158 ),
       .io_out_ready( io_mem_req_data_bits_data_channel_0_ready ),
       .io_out_valid( Channel_mem_req_data_bits_data_0_io_out_valid ),
       .io_out_bits( Channel_mem_req_data_bits_data_0_io_out_bits ),
       .io_trace_ready( io_mem_req_data_bits_data_trace_0_ready ),
       .io_trace_valid( Channel_mem_req_data_bits_data_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_data_bits_data_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_4 Channel_mem_req_data_bits_data_1(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_req_data_bits_data_1_io_in_ready ),
       .io_in_valid( T41 ),
       .io_in_bits( T39 ),
       .io_out_ready( io_mem_req_data_bits_data_channel_1_ready ),
       .io_out_valid( Channel_mem_req_data_bits_data_1_io_out_valid ),
       .io_out_bits( Channel_mem_req_data_bits_data_1_io_out_bits ),
       .io_trace_ready( io_mem_req_data_bits_data_trace_1_ready ),
       .io_trace_valid( Channel_mem_req_data_bits_data_1_io_trace_valid ),
       .io_trace_bits( Channel_mem_req_data_bits_data_1_io_trace_bits ),
       .io_traceLen( traceLen )
  );
  Channel_3 Channel_mem_resp_ready_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_mem_resp_ready_0_io_in_ready ),
       .io_in_valid( T37 ),
       .io_in_bits( T35 ),
       .io_out_ready( io_mem_resp_ready_channel_0_ready ),
       .io_out_valid( Channel_mem_resp_ready_0_io_out_valid ),
       .io_out_bits( Channel_mem_resp_ready_0_io_out_bits ),
       .io_trace_ready( io_mem_resp_ready_trace_0_ready ),
       .io_trace_valid( Channel_mem_resp_ready_0_io_trace_valid ),
       .io_trace_bits( Channel_mem_resp_ready_0_io_trace_bits ),
       .io_traceLen( traceLen )
  );

  always @(posedge clk) begin
    if(reset) begin
      cycles <= 64'h0;
    end else if(fire) begin
      cycles <= T1;
    end
    if(reset) begin
      traceLen <= 11'h3fe;
    end else if(T34) begin
      traceLen <= T33;
    end
    R38 <= reset;
    fireNext <= fire;
    R42 <= reset;
    R46 <= reset;
    R50 <= reset;
    R54 <= reset;
    R58 <= reset;
    R62 <= reset;
    R66 <= reset;
    R70 <= reset;
    if(fire) begin
      R72 <= T74;
    end
    if(fire) begin
      R76 <= T78;
    end
    if(fire) begin
      R80 <= T82;
    end
    if(fire) begin
      R84 <= T86;
    end
    if(fire) begin
      R89 <= T91;
    end
    if(fire) begin
      R93 <= T95;
    end
    if(fire) begin
      R97 <= T99;
    end
    if(fire) begin
      R101 <= T103;
    end
    if(fire) begin
      R105 <= T107;
    end
    if(fire) begin
      R109 <= T111;
    end
    if(fire) begin
      R113 <= T115;
    end
    if(fire) begin
      R117 <= T119;
    end
    if(fire) begin
      R121 <= T123;
    end
    if(fire) begin
      R125 <= T127;
    end
    if(fire) begin
      R129 <= T131;
    end
    if(fire) begin
      R134 <= T136;
    end
    if(fire) begin
      R138 <= T140;
    end
    if(fire) begin
      R142 <= T144;
    end
    if(fire) begin
      R146 <= T148;
    end
    if(fire) begin
      R150 <= T152;
    end
  end
endmodule

module Queue_0(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits,
    output[1:0] io_count
);

  wire[1:0] T0;
  wire ptr_diff;
  reg  R1;
  wire T21;
  wire T2;
  wire T3;
  wire do_deq;
  wire T4;
  wire do_flow;
  wire empty;
  wire T5;
  reg  maybe_full;
  wire T22;
  wire T6;
  wire do_enq;
  wire T7;
  wire T8;
  wire T9;
  wire ptr_match;
  wire T10;
  reg  R11;
  wire T23;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  reg  ram [1:0];
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    maybe_full = {1{$random}};
    R11 = {1{$random}};
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T14, ptr_diff};
  assign ptr_diff = R11 - R1;
  assign T21 = reset ? 1'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 1'h1;
  assign do_deq = T10 & T4;
  assign T4 = do_flow ^ 1'h1;
  assign do_flow = empty & io_deq_ready;
  assign empty = ptr_match & T5;
  assign T5 = maybe_full ^ 1'h1;
  assign T22 = reset ? 1'h0 : T6;
  assign T6 = T9 ? do_enq : maybe_full;
  assign do_enq = T8 & T7;
  assign T7 = do_flow ^ 1'h1;
  assign T8 = io_enq_ready & io_enq_valid;
  assign T9 = do_enq != do_deq;
  assign ptr_match = R11 == R1;
  assign T10 = io_deq_ready & io_deq_valid;
  assign T23 = reset ? 1'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 1'h1;
  assign T14 = maybe_full & ptr_match;
  assign io_deq_bits = T15;
  assign T15 = empty ? io_enq_bits : T16;
  assign T16 = ram[R1];
  assign io_deq_valid = T18;
  assign T18 = T19 | io_enq_valid;
  assign T19 = empty ^ 1'h1;
  assign io_enq_ready = T20;
  assign T20 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 1'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R11 <= 1'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if (do_enq)
      ram[R11] <= io_enq_bits;
  end
endmodule

module Queue_1(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits,
    output[1:0] io_count
);

  wire[1:0] T0;
  wire ptr_diff;
  reg  R1;
  wire T21;
  wire T2;
  wire T3;
  wire do_deq;
  wire T4;
  wire do_flow;
  wire empty;
  wire T5;
  reg  maybe_full;
  wire T22;
  wire T6;
  wire do_enq;
  wire T7;
  wire T8;
  wire T9;
  wire ptr_match;
  wire T10;
  reg  R11;
  wire T23;
  wire T12;
  wire T13;
  wire T14;
  wire[31:0] T15;
  wire[31:0] T16;
  reg [31:0] ram [1:0];
  wire[31:0] T17;
  wire T18;
  wire T19;
  wire T20;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    maybe_full = {1{$random}};
    R11 = {1{$random}};
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T14, ptr_diff};
  assign ptr_diff = R11 - R1;
  assign T21 = reset ? 1'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 1'h1;
  assign do_deq = T10 & T4;
  assign T4 = do_flow ^ 1'h1;
  assign do_flow = empty & io_deq_ready;
  assign empty = ptr_match & T5;
  assign T5 = maybe_full ^ 1'h1;
  assign T22 = reset ? 1'h0 : T6;
  assign T6 = T9 ? do_enq : maybe_full;
  assign do_enq = T8 & T7;
  assign T7 = do_flow ^ 1'h1;
  assign T8 = io_enq_ready & io_enq_valid;
  assign T9 = do_enq != do_deq;
  assign ptr_match = R11 == R1;
  assign T10 = io_deq_ready & io_deq_valid;
  assign T23 = reset ? 1'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 1'h1;
  assign T14 = maybe_full & ptr_match;
  assign io_deq_bits = T15;
  assign T15 = empty ? io_enq_bits : T16;
  assign T16 = ram[R1];
  assign io_deq_valid = T18;
  assign T18 = T19 | io_enq_valid;
  assign T19 = empty ^ 1'h1;
  assign io_enq_ready = T20;
  assign T20 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 1'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R11 <= 1'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if (do_enq)
      ram[R11] <= io_enq_bits;
  end
endmodule

module Queue_2(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [1:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[1:0] io_deq_bits,
    output[1:0] io_count
);

  wire[1:0] T0;
  wire ptr_diff;
  reg  R1;
  wire T21;
  wire T2;
  wire T3;
  wire do_deq;
  wire T4;
  wire do_flow;
  wire empty;
  wire T5;
  reg  maybe_full;
  wire T22;
  wire T6;
  wire do_enq;
  wire T7;
  wire T8;
  wire T9;
  wire ptr_match;
  wire T10;
  reg  R11;
  wire T23;
  wire T12;
  wire T13;
  wire T14;
  wire[1:0] T15;
  wire[1:0] T16;
  reg [1:0] ram [1:0];
  wire[1:0] T17;
  wire T18;
  wire T19;
  wire T20;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    maybe_full = {1{$random}};
    R11 = {1{$random}};
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T14, ptr_diff};
  assign ptr_diff = R11 - R1;
  assign T21 = reset ? 1'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 1'h1;
  assign do_deq = T10 & T4;
  assign T4 = do_flow ^ 1'h1;
  assign do_flow = empty & io_deq_ready;
  assign empty = ptr_match & T5;
  assign T5 = maybe_full ^ 1'h1;
  assign T22 = reset ? 1'h0 : T6;
  assign T6 = T9 ? do_enq : maybe_full;
  assign do_enq = T8 & T7;
  assign T7 = do_flow ^ 1'h1;
  assign T8 = io_enq_ready & io_enq_valid;
  assign T9 = do_enq != do_deq;
  assign ptr_match = R11 == R1;
  assign T10 = io_deq_ready & io_deq_valid;
  assign T23 = reset ? 1'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 1'h1;
  assign T14 = maybe_full & ptr_match;
  assign io_deq_bits = T15;
  assign T15 = empty ? io_enq_bits : T16;
  assign T16 = ram[R1];
  assign io_deq_valid = T18;
  assign T18 = T19 | io_enq_valid;
  assign T19 = empty ^ 1'h1;
  assign io_enq_ready = T20;
  assign T20 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 1'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R11 <= 1'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if (do_enq)
      ram[R11] <= io_enq_bits;
  end
endmodule

module Queue_3(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [4:0] io_enq_bits,
    input  io_deq_ready,
    output io_deq_valid,
    output[4:0] io_deq_bits,
    output[1:0] io_count
);

  wire[1:0] T0;
  wire ptr_diff;
  reg  R1;
  wire T21;
  wire T2;
  wire T3;
  wire do_deq;
  wire T4;
  wire do_flow;
  wire empty;
  wire T5;
  reg  maybe_full;
  wire T22;
  wire T6;
  wire do_enq;
  wire T7;
  wire T8;
  wire T9;
  wire ptr_match;
  wire T10;
  reg  R11;
  wire T23;
  wire T12;
  wire T13;
  wire T14;
  wire[4:0] T15;
  wire[4:0] T16;
  reg [4:0] ram [1:0];
  wire[4:0] T17;
  wire T18;
  wire T19;
  wire T20;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    maybe_full = {1{$random}};
    R11 = {1{$random}};
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T14, ptr_diff};
  assign ptr_diff = R11 - R1;
  assign T21 = reset ? 1'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 1'h1;
  assign do_deq = T10 & T4;
  assign T4 = do_flow ^ 1'h1;
  assign do_flow = empty & io_deq_ready;
  assign empty = ptr_match & T5;
  assign T5 = maybe_full ^ 1'h1;
  assign T22 = reset ? 1'h0 : T6;
  assign T6 = T9 ? do_enq : maybe_full;
  assign do_enq = T8 & T7;
  assign T7 = do_flow ^ 1'h1;
  assign T8 = io_enq_ready & io_enq_valid;
  assign T9 = do_enq != do_deq;
  assign ptr_match = R11 == R1;
  assign T10 = io_deq_ready & io_deq_valid;
  assign T23 = reset ? 1'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 1'h1;
  assign T14 = maybe_full & ptr_match;
  assign io_deq_bits = T15;
  assign T15 = empty ? io_enq_bits : T16;
  assign T16 = ram[R1];
  assign io_deq_valid = T18;
  assign T18 = T19 | io_enq_valid;
  assign T19 = empty ^ 1'h1;
  assign io_enq_ready = T20;
  assign T20 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 1'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R11 <= 1'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if (do_enq)
      ram[R11] <= io_enq_bits;
  end
endmodule

module MemArbiter(input clk, input reset,
    output io_ins_1_req_cmd_ready,
    input  io_ins_1_req_cmd_valid,
    input [31:0] io_ins_1_req_cmd_bits_addr,
    input [4:0] io_ins_1_req_cmd_bits_tag,
    input  io_ins_1_req_cmd_bits_rw,
    output io_ins_1_req_data_ready,
    input  io_ins_1_req_data_valid,
    input [63:0] io_ins_1_req_data_bits_data,
    input  io_ins_1_resp_ready,
    output io_ins_1_resp_valid,
    output[63:0] io_ins_1_resp_bits_data,
    output[4:0] io_ins_1_resp_bits_tag,
    output io_ins_0_req_cmd_ready,
    input  io_ins_0_req_cmd_valid,
    input [31:0] io_ins_0_req_cmd_bits_addr,
    input [4:0] io_ins_0_req_cmd_bits_tag,
    input  io_ins_0_req_cmd_bits_rw,
    output io_ins_0_req_data_ready,
    input  io_ins_0_req_data_valid,
    input [63:0] io_ins_0_req_data_bits_data,
    input  io_ins_0_resp_ready,
    output io_ins_0_resp_valid,
    output[63:0] io_ins_0_resp_bits_data,
    output[4:0] io_ins_0_resp_bits_tag,
    input  io_out_req_cmd_ready,
    output io_out_req_cmd_valid,
    output[31:0] io_out_req_cmd_bits_addr,
    output[4:0] io_out_req_cmd_bits_tag,
    output io_out_req_cmd_bits_rw,
    input  io_out_req_data_ready,
    output io_out_req_data_valid,
    output[63:0] io_out_req_data_bits_data,
    output io_out_resp_ready,
    input  io_out_resp_valid,
    input [63:0] io_out_resp_bits_data,
    input [4:0] io_out_resp_bits_tag
);

  wire T0;
  wire T1;
  reg  chosen;
  wire T54;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  reg [1:0] state;
  wire[1:0] T55;
  wire[1:0] T13;
  wire[1:0] T14;
  wire[1:0] T15;
  wire[1:0] T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire[1:0] T23;
  wire resp_wrap;
  wire T24;
  reg  resp_cnt;
  wire T56;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire[1:0] T29;
  wire data_wrap;
  wire T30;
  reg  data_cnt;
  wire T57;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire[63:0] T35;
  wire T36;
  wire T37;
  wire[4:0] T38;
  wire[31:0] T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    chosen = {1{$random}};
    state = {1{$random}};
    resp_cnt = {1{$random}};
    data_cnt = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_out_resp_ready = T0;
  assign T0 = T1 ? io_ins_1_resp_ready : io_ins_0_resp_ready;
  assign T1 = chosen;
  assign T54 = reset ? 1'h1 : T2;
  assign T2 = T6 ? T3 : chosen;
  assign T3 = T5 ? T4 : 1'h1;
  assign T4 = chosen - 1'h1;
  assign T5 = chosen != 1'h0;
  assign T6 = T12 & T7;
  assign T7 = T10 & T8;
  assign T8 = T9 ^ 1'h1;
  assign T9 = T1 ? io_ins_1_req_data_valid : io_ins_0_req_data_valid;
  assign T10 = T11 ^ 1'h1;
  assign T11 = T1 ? io_ins_1_req_cmd_valid : io_ins_0_req_cmd_valid;
  assign T12 = 2'h0 == state;
  assign T55 = reset ? 2'h0 : T13;
  assign T13 = T34 ? T29 : T14;
  assign T14 = T28 ? T23 : T15;
  assign T15 = T18 ? T16 : state;
  assign T16 = T17 ? 2'h2 : 2'h1;
  assign T17 = T1 ? io_ins_1_req_cmd_bits_rw : io_ins_0_req_cmd_bits_rw;
  assign T18 = T12 & T19;
  assign T19 = T22 & T20;
  assign T20 = T21 & T11;
  assign T21 = T1 ? io_ins_1_req_cmd_ready : io_ins_0_req_cmd_ready;
  assign T22 = T7 ^ 1'h1;
  assign T23 = resp_wrap ? 2'h0 : 2'h1;
  assign resp_wrap = T27 & T24;
  assign T24 = resp_cnt == 1'h1;
  assign T56 = reset ? 1'h0 : T25;
  assign T25 = T27 ? T26 : resp_cnt;
  assign T26 = resp_cnt + 1'h1;
  assign T27 = io_out_resp_ready & io_out_resp_valid;
  assign T28 = 2'h1 == state;
  assign T29 = data_wrap ? 2'h0 : 2'h2;
  assign data_wrap = T33 & T30;
  assign T30 = data_cnt == 1'h1;
  assign T57 = reset ? 1'h0 : T31;
  assign T31 = T33 ? T32 : data_cnt;
  assign T32 = data_cnt + 1'h1;
  assign T33 = io_out_req_data_ready & io_out_req_data_valid;
  assign T34 = 2'h2 == state;
  assign io_out_req_data_bits_data = T35;
  assign T35 = T1 ? io_ins_1_req_data_bits_data : io_ins_0_req_data_bits_data;
  assign io_out_req_data_valid = T36;
  assign T36 = T9 & T37;
  assign T37 = state != 2'h1;
  assign io_out_req_cmd_bits_rw = T17;
  assign io_out_req_cmd_bits_tag = T38;
  assign T38 = T1 ? io_ins_1_req_cmd_bits_tag : io_ins_0_req_cmd_bits_tag;
  assign io_out_req_cmd_bits_addr = T39;
  assign T39 = T1 ? io_ins_1_req_cmd_bits_addr : io_ins_0_req_cmd_bits_addr;
  assign io_out_req_cmd_valid = T40;
  assign T40 = T11 & T41;
  assign T41 = state == 2'h0;
  assign io_ins_0_resp_bits_tag = io_out_resp_bits_tag;
  assign io_ins_0_resp_bits_data = io_out_resp_bits_data;
  assign io_ins_0_resp_valid = T42;
  assign T42 = io_out_resp_valid & T43;
  assign T43 = chosen == 1'h0;
  assign io_ins_0_req_data_ready = T44;
  assign T44 = io_out_req_data_ready & T45;
  assign T45 = chosen == 1'h0;
  assign io_ins_0_req_cmd_ready = T46;
  assign T46 = io_out_req_cmd_ready & T47;
  assign T47 = chosen == 1'h0;
  assign io_ins_1_resp_bits_tag = io_out_resp_bits_tag;
  assign io_ins_1_resp_bits_data = io_out_resp_bits_data;
  assign io_ins_1_resp_valid = T48;
  assign T48 = io_out_resp_valid & T49;
  assign T49 = chosen == 1'h1;
  assign io_ins_1_req_data_ready = T50;
  assign T50 = io_out_req_data_ready & T51;
  assign T51 = chosen == 1'h1;
  assign io_ins_1_req_cmd_ready = T52;
  assign T52 = io_out_req_cmd_ready & T53;
  assign T53 = chosen == 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      chosen <= 1'h1;
    end else if(T6) begin
      chosen <= T3;
    end
    if(reset) begin
      state <= 2'h0;
    end else if(T34) begin
      state <= T29;
    end else if(T28) begin
      state <= T23;
    end else if(T18) begin
      state <= T16;
    end
    if(reset) begin
      resp_cnt <= 1'h0;
    end else if(T27) begin
      resp_cnt <= T26;
    end
    if(reset) begin
      data_cnt <= 1'h0;
    end else if(T33) begin
      data_cnt <= T32;
    end
  end
endmodule

module NastiMasterHandler(input clk, input reset,
    output io_nasti_aw_ready,
    input  io_nasti_aw_valid,
    input [31:0] io_nasti_aw_bits_addr,
    input [7:0] io_nasti_aw_bits_len,
    input [2:0] io_nasti_aw_bits_size,
    input [1:0] io_nasti_aw_bits_burst,
    input  io_nasti_aw_bits_lock,
    input [3:0] io_nasti_aw_bits_cache,
    input [2:0] io_nasti_aw_bits_prot,
    input [3:0] io_nasti_aw_bits_qos,
    input [3:0] io_nasti_aw_bits_region,
    input [11:0] io_nasti_aw_bits_id,
    input  io_nasti_aw_bits_user,
    output io_nasti_w_ready,
    input  io_nasti_w_valid,
    input [31:0] io_nasti_w_bits_data,
    input  io_nasti_w_bits_last,
    input [3:0] io_nasti_w_bits_strb,
    input  io_nasti_w_bits_user,
    input  io_nasti_b_ready,
    output io_nasti_b_valid,
    output[1:0] io_nasti_b_bits_resp,
    output[11:0] io_nasti_b_bits_id,
    output io_nasti_b_bits_user,
    output io_nasti_ar_ready,
    input  io_nasti_ar_valid,
    input [31:0] io_nasti_ar_bits_addr,
    input [7:0] io_nasti_ar_bits_len,
    input [2:0] io_nasti_ar_bits_size,
    input [1:0] io_nasti_ar_bits_burst,
    input  io_nasti_ar_bits_lock,
    input [3:0] io_nasti_ar_bits_cache,
    input [2:0] io_nasti_ar_bits_prot,
    input [3:0] io_nasti_ar_bits_qos,
    input [3:0] io_nasti_ar_bits_region,
    input [11:0] io_nasti_ar_bits_id,
    input  io_nasti_ar_bits_user,
    input  io_nasti_r_ready,
    output io_nasti_r_valid,
    output[1:0] io_nasti_r_bits_resp,
    output[31:0] io_nasti_r_bits_data,
    output io_nasti_r_bits_last,
    output[11:0] io_nasti_r_bits_id,
    output io_nasti_r_bits_user,
    input  io_step_ready,
    output io_step_valid,
    output[31:0] io_step_bits,
    input  io_len_ready,
    output io_len_valid,
    output[31:0] io_len_bits,
    input  io_lat_ready,
    output io_lat_valid,
    output[31:0] io_lat_bits,
    output io_fin_ready,
    input  io_fin_valid,
    input [31:0] io_fin_bits,
    input  io_ins_15_ready,
    output io_ins_15_valid,
    output io_ins_15_bits,
    input  io_ins_14_ready,
    output io_ins_14_valid,
    output[4:0] io_ins_14_bits,
    input  io_ins_13_ready,
    output io_ins_13_valid,
    output io_ins_13_bits,
    input  io_ins_12_ready,
    output io_ins_12_valid,
    output[31:0] io_ins_12_bits,
    input  io_ins_11_ready,
    output io_ins_11_valid,
    output[31:0] io_ins_11_bits,
    input  io_ins_10_ready,
    output io_ins_10_valid,
    output[1:0] io_ins_10_bits,
    input  io_ins_9_ready,
    output io_ins_9_valid,
    output io_ins_9_bits,
    input  io_ins_8_ready,
    output io_ins_8_valid,
    output io_ins_8_bits,
    input  io_ins_7_ready,
    output io_ins_7_valid,
    output io_ins_7_bits,
    input  io_ins_6_ready,
    output io_ins_6_valid,
    output[4:0] io_ins_6_bits,
    input  io_ins_5_ready,
    output io_ins_5_valid,
    output[1:0] io_ins_5_bits,
    input  io_ins_4_ready,
    output io_ins_4_valid,
    output io_ins_4_bits,
    input  io_ins_3_ready,
    output io_ins_3_valid,
    output io_ins_3_bits,
    input  io_ins_2_ready,
    output io_ins_2_valid,
    output io_ins_2_bits,
    input  io_ins_1_ready,
    output io_ins_1_valid,
    output[31:0] io_ins_1_bits,
    input  io_ins_0_ready,
    output io_ins_0_valid,
    output io_ins_0_bits,
    output io_outs_0_ready,
    input  io_outs_0_valid,
    input [31:0] io_outs_0_bits,
    output io_inT_21_ready,
    input  io_inT_21_valid,
    input  io_inT_21_bits,
    output io_inT_20_ready,
    input  io_inT_20_valid,
    input [4:0] io_inT_20_bits,
    output io_inT_19_ready,
    input  io_inT_19_valid,
    input  io_inT_19_bits,
    output io_inT_18_ready,
    input  io_inT_18_valid,
    input [31:0] io_inT_18_bits,
    output io_inT_17_ready,
    input  io_inT_17_valid,
    input [31:0] io_inT_17_bits,
    output io_inT_16_ready,
    input  io_inT_16_valid,
    input [1:0] io_inT_16_bits,
    output io_inT_15_ready,
    input  io_inT_15_valid,
    input  io_inT_15_bits,
    output io_inT_14_ready,
    input  io_inT_14_valid,
    input  io_inT_14_bits,
    output io_inT_13_ready,
    input  io_inT_13_valid,
    input  io_inT_13_bits,
    output io_inT_12_ready,
    input  io_inT_12_valid,
    input [4:0] io_inT_12_bits,
    output io_inT_11_ready,
    input  io_inT_11_valid,
    input [1:0] io_inT_11_bits,
    output io_inT_10_ready,
    input  io_inT_10_valid,
    input  io_inT_10_bits,
    output io_inT_9_ready,
    input  io_inT_9_valid,
    input  io_inT_9_bits,
    output io_inT_8_ready,
    input  io_inT_8_valid,
    input  io_inT_8_bits,
    output io_inT_7_ready,
    input  io_inT_7_valid,
    input [4:0] io_inT_7_bits,
    output io_inT_6_ready,
    input  io_inT_6_valid,
    input [31:0] io_inT_6_bits,
    output io_inT_5_ready,
    input  io_inT_5_valid,
    input [31:0] io_inT_5_bits,
    output io_inT_4_ready,
    input  io_inT_4_valid,
    input  io_inT_4_bits,
    output io_inT_3_ready,
    input  io_inT_3_valid,
    input  io_inT_3_bits,
    output io_inT_2_ready,
    input  io_inT_2_valid,
    input  io_inT_2_bits,
    output io_inT_1_ready,
    input  io_inT_1_valid,
    input [31:0] io_inT_1_bits,
    output io_inT_0_ready,
    input  io_inT_0_valid,
    input  io_inT_0_bits,
    output io_outT_8_ready,
    input  io_outT_8_valid,
    input  io_outT_8_bits,
    output io_outT_7_ready,
    input  io_outT_7_valid,
    input [31:0] io_outT_7_bits,
    output io_outT_6_ready,
    input  io_outT_6_valid,
    input [31:0] io_outT_6_bits,
    output io_outT_5_ready,
    input  io_outT_5_valid,
    input  io_outT_5_bits,
    output io_outT_4_ready,
    input  io_outT_4_valid,
    input  io_outT_4_bits,
    output io_outT_3_ready,
    input  io_outT_3_valid,
    input [4:0] io_outT_3_bits,
    output io_outT_2_ready,
    input  io_outT_2_valid,
    input [31:0] io_outT_2_bits,
    output io_outT_1_ready,
    input  io_outT_1_valid,
    input  io_outT_1_bits,
    output io_outT_0_ready,
    input  io_outT_0_valid,
    input [31:0] io_outT_0_bits,
    //input  io_daisy_regs_in_ready
    output io_daisy_regs_in_valid,
    output[31:0] io_daisy_regs_in_bits,
    output io_daisy_regs_out_ready,
    input  io_daisy_regs_out_valid,
    input [31:0] io_daisy_regs_out_bits,
    //input  io_daisy_trace_in_ready
    output io_daisy_trace_in_valid,
    output[31:0] io_daisy_trace_in_bits,
    output io_daisy_trace_out_ready,
    input  io_daisy_trace_out_valid,
    input [31:0] io_daisy_trace_out_bits,
    //input  io_daisy_sram_1_in_ready
    output io_daisy_sram_1_in_valid,
    output[31:0] io_daisy_sram_1_in_bits,
    output io_daisy_sram_1_out_ready,
    input  io_daisy_sram_1_out_valid,
    input [31:0] io_daisy_sram_1_out_bits,
    output io_daisy_sram_1_restart,
    //input  io_daisy_sram_0_in_ready
    output io_daisy_sram_0_in_valid,
    output[31:0] io_daisy_sram_0_in_bits,
    output io_daisy_sram_0_out_ready,
    input  io_daisy_sram_0_out_valid,
    input [31:0] io_daisy_sram_0_out_bits,
    output io_daisy_sram_0_restart,
    //input  io_daisy_cntr_in_ready
    //output io_daisy_cntr_in_valid
    //output[31:0] io_daisy_cntr_in_bits
    output io_daisy_cntr_out_ready,
    input  io_daisy_cntr_out_valid,
    input [31:0] io_daisy_cntr_out_bits,
    output io_reset_t,
    input  io_req_cmd_rw_channel_0_ready,
    output io_req_cmd_rw_channel_0_valid,
    output io_req_cmd_rw_channel_0_bits,
    input  io_req_cmd_tag_channel_0_ready,
    output io_req_cmd_tag_channel_0_valid,
    output[4:0] io_req_cmd_tag_channel_0_bits,
    input  io_req_cmd_addr_channel_0_ready,
    output io_req_cmd_addr_channel_0_valid,
    output[31:0] io_req_cmd_addr_channel_0_bits,
    input  io_req_data_data_channel_1_ready,
    output io_req_data_data_channel_1_valid,
    output[31:0] io_req_data_data_channel_1_bits,
    input  io_req_data_data_channel_0_ready,
    output io_req_data_data_channel_0_valid,
    output[31:0] io_req_data_data_channel_0_bits,
    output io_resp_tag_channel_0_ready,
    input  io_resp_tag_channel_0_valid,
    input [4:0] io_resp_tag_channel_0_bits,
    output io_resp_data_channel_1_ready,
    input  io_resp_data_channel_1_valid,
    input [31:0] io_resp_data_channel_1_bits,
    output io_resp_data_channel_0_ready,
    input  io_resp_data_channel_0_valid,
    input [31:0] io_resp_data_channel_0_bits
);

  wire T0;
  wire do_read;
  reg  st_rd;
  wire T384;
  wire T1;
  wire T2;
  wire T3;
  wire T4;
  wire T5;
  wire T6;
  wire T7;
  reg [9:0] raddr_r;
  wire[9:0] T385;
  wire[29:0] T8;
  wire[29:0] T386;
  wire[29:0] T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire do_write;
  reg [1:0] st_wr;
  wire[1:0] T387;
  wire[1:0] T15;
  wire[1:0] T16;
  wire[1:0] T17;
  wire T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  reg [9:0] waddr_r;
  wire[9:0] T388;
  wire[29:0] T24;
  wire[29:0] T389;
  wire[29:0] T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire[4:0] T36;
  wire[4:0] T390;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire T45;
  wire T46;
  wire T47;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire T72;
  wire T73;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire[4:0] T391;
  wire T85;
  wire T86;
  wire T392;
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
  wire T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire T129;
  wire T130;
  wire T131;
  wire T132;
  wire T133;
  wire T134;
  wire T135;
  wire T136;
  wire T137;
  wire T138;
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
  wire T165;
  wire T166;
  wire T167;
  wire T168;
  wire T393;
  wire T169;
  wire T170;
  wire T171;
  wire T172;
  wire T394;
  wire T173;
  wire T174;
  wire T395;
  wire T175;
  wire T176;
  wire T396;
  wire T177;
  wire T178;
  wire[1:0] T397;
  wire T179;
  wire T180;
  wire[4:0] T398;
  wire T181;
  wire T182;
  wire T399;
  wire T183;
  wire T184;
  wire T400;
  wire T185;
  wire T186;
  wire T401;
  wire T187;
  wire T188;
  wire[1:0] T402;
  wire T189;
  wire T190;
  wire T191;
  wire T192;
  wire T193;
  wire T194;
  wire T403;
  wire T195;
  wire T196;
  wire[4:0] T404;
  wire T197;
  wire T198;
  wire T405;
  wire T199;
  wire T200;
  wire T201;
  wire T202;
  wire T203;
  wire T204;
  wire T205;
  wire T206;
  wire T207;
  wire T208;
  wire T209;
  wire[11:0] T210;
  reg [11:0] arid_r;
  wire[11:0] T211;
  wire T212;
  wire T213;
  wire T214;
  wire T215;
  wire T216;
  wire T217;
  wire T218;
  wire T219;
  wire T220;
  wire[5:0] T221;
  wire[5:0] T406;
  wire T222;
  wire T223;
  wire T224;
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
  wire T236;
  wire T237;
  wire T238;
  wire T239;
  wire T240;
  wire T241;
  wire T242;
  wire T243;
  wire T244;
  wire T245;
  wire T246;
  wire T247;
  wire T248;
  wire T249;
  wire T250;
  wire T251;
  wire T252;
  wire T253;
  wire T254;
  wire T255;
  wire T256;
  wire T257;
  wire T258;
  wire T259;
  wire T260;
  wire T261;
  wire T262;
  wire T263;
  wire T264;
  wire T265;
  wire T266;
  wire T267;
  wire T268;
  wire T269;
  wire T270;
  wire T271;
  wire T272;
  wire T273;
  wire T274;
  wire T275;
  wire T276;
  wire T277;
  wire T278;
  wire T279;
  wire T280;
  wire T281;
  wire T282;
  wire T283;
  wire T284;
  wire T285;
  wire T286;
  wire T287;
  wire T288;
  wire T289;
  wire T290;
  wire T291;
  wire T292;
  wire T293;
  wire T294;
  wire[31:0] T295;
  wire[31:0] T296;
  wire[31:0] T297;
  wire[31:0] T298;
  wire[31:0] T299;
  wire[31:0] T300;
  wire[31:0] T301;
  wire T302;
  wire[5:0] T303;
  wire[5:0] T407;
  wire[31:0] T304;
  wire[31:0] T408;
  wire T305;
  wire T306;
  wire[31:0] T307;
  wire[31:0] T409;
  wire T308;
  wire T309;
  wire[31:0] T310;
  wire[31:0] T410;
  wire T311;
  wire T312;
  wire T313;
  wire[31:0] T314;
  wire[31:0] T315;
  wire[31:0] T316;
  wire[31:0] T411;
  wire T317;
  wire[31:0] T412;
  wire T318;
  wire T319;
  wire T320;
  wire[31:0] T413;
  wire[4:0] T321;
  wire[4:0] T414;
  wire[1:0] T322;
  wire[1:0] T415;
  wire T323;
  wire[4:0] T324;
  wire[4:0] T416;
  wire T325;
  wire T326;
  wire T327;
  wire T328;
  wire[31:0] T329;
  wire[31:0] T330;
  wire[31:0] T331;
  wire[31:0] T417;
  wire T332;
  wire T333;
  wire[31:0] T334;
  wire[31:0] T418;
  wire T335;
  wire T336;
  wire[31:0] T337;
  wire[31:0] T338;
  wire[31:0] T419;
  wire T339;
  wire[31:0] T420;
  wire[4:0] T340;
  wire[4:0] T421;
  wire T341;
  wire T342;
  wire T343;
  wire[31:0] T344;
  wire[31:0] T345;
  wire[31:0] T346;
  wire[31:0] T422;
  wire T347;
  wire[31:0] T348;
  wire[31:0] T423;
  wire T349;
  wire T350;
  wire[31:0] T351;
  wire[31:0] T424;
  wire T352;
  wire T353;
  wire[31:0] T354;
  wire T355;
  wire T356;
  wire T357;
  wire T358;
  wire T359;
  wire[31:0] T360;
  wire[31:0] T361;
  wire[31:0] T362;
  wire[31:0] T363;
  wire[31:0] T425;
  wire T364;
  wire[31:0] T365;
  wire[31:0] T426;
  wire T366;
  wire T367;
  wire[31:0] T368;
  wire[31:0] T369;
  wire T370;
  wire[31:0] T371;
  wire T372;
  wire T373;
  wire T374;
  wire T375;
  wire T376;
  wire[1:0] T377;
  wire T378;
  wire T379;
  wire[11:0] T380;
  reg [11:0] awid_r;
  wire[11:0] T381;
  wire[1:0] T382;
  wire T383;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    st_rd = {1{$random}};
    raddr_r = {1{$random}};
    st_wr = {1{$random}};
    waddr_r = {1{$random}};
    arid_r = {1{$random}};
    awid_r = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_daisy_cntr_in_bits = {1{$random}};
//  assign io_daisy_cntr_in_valid = {1{$random}};
// synthesis translate_on
`endif
  assign io_resp_data_channel_0_ready = T0;
  assign T0 = T7 & do_read;
  assign do_read = st_rd == 1'h1;
  assign T384 = reset ? 1'h0 : T1;
  assign T1 = T5 ? 1'h0 : T2;
  assign T2 = T3 ? 1'h1 : st_rd;
  assign T3 = T4 & io_nasti_ar_valid;
  assign T4 = 1'h0 == st_rd;
  assign T5 = T6 & io_nasti_r_ready;
  assign T6 = 1'h1 == st_rd;
  assign T7 = raddr_r == 10'h21;
  assign T385 = T8[4'h9:1'h0];
  assign T8 = T3 ? T9 : T386;
  assign T386 = {20'h0, raddr_r};
  assign T9 = io_nasti_ar_bits_addr >> 2'h2;
  assign io_resp_data_channel_1_ready = T10;
  assign T10 = T11 & do_read;
  assign T11 = raddr_r == 10'h22;
  assign io_resp_tag_channel_0_ready = T12;
  assign T12 = T13 & do_read;
  assign T13 = raddr_r == 10'h23;
  assign io_req_data_data_channel_0_bits = io_nasti_w_bits_data;
  assign io_req_data_data_channel_0_valid = T14;
  assign T14 = T80 & do_write;
  assign do_write = st_wr == 2'h1;
  assign T387 = reset ? 2'h0 : T15;
  assign T15 = T78 ? 2'h0 : T16;
  assign T16 = T21 ? 2'h2 : T17;
  assign T17 = T18 ? 2'h1 : st_wr;
  assign T18 = T20 & T19;
  assign T19 = io_nasti_aw_valid & io_nasti_w_valid;
  assign T20 = 2'h0 == st_wr;
  assign T21 = T77 & T22;
  assign T22 = T26 | T23;
  assign T23 = waddr_r == 10'h3fd;
  assign T388 = T24[4'h9:1'h0];
  assign T24 = T18 ? T25 : T389;
  assign T389 = {20'h0, waddr_r};
  assign T25 = io_nasti_aw_bits_addr >> 2'h2;
  assign T26 = T28 | T27;
  assign T27 = waddr_r == 10'h3fe;
  assign T28 = T30 | T29;
  assign T29 = waddr_r == 10'h3ff;
  assign T30 = T76 ? T62 : T31;
  assign T31 = T61 ? T47 : T32;
  assign T32 = T46 ? T40 : T33;
  assign T33 = T39 ? T37 : T34;
  assign T34 = T35 ? io_ins_0_ready : io_step_ready;
  assign T35 = T36[1'h0];
  assign T36 = T390;
  assign T390 = waddr_r[3'h4:1'h0];
  assign T37 = T38 ? io_ins_2_ready : io_ins_1_ready;
  assign T38 = T36[1'h0];
  assign T39 = T36[1'h1];
  assign T40 = T45 ? T43 : T41;
  assign T41 = T42 ? io_ins_4_ready : io_ins_3_ready;
  assign T42 = T36[1'h0];
  assign T43 = T44 ? io_ins_6_ready : io_ins_5_ready;
  assign T44 = T36[1'h0];
  assign T45 = T36[1'h1];
  assign T46 = T36[2'h2];
  assign T47 = T60 ? T54 : T48;
  assign T48 = T53 ? T51 : T49;
  assign T49 = T50 ? io_ins_8_ready : io_ins_7_ready;
  assign T50 = T36[1'h0];
  assign T51 = T52 ? io_ins_10_ready : io_ins_9_ready;
  assign T52 = T36[1'h0];
  assign T53 = T36[1'h1];
  assign T54 = T59 ? T57 : T55;
  assign T55 = T56 ? io_ins_12_ready : io_ins_11_ready;
  assign T56 = T36[1'h0];
  assign T57 = T58 ? io_ins_14_ready : io_ins_13_ready;
  assign T58 = T36[1'h0];
  assign T59 = T36[1'h1];
  assign T60 = T36[2'h2];
  assign T61 = T36[2'h3];
  assign T62 = T75 ? T69 : T63;
  assign T63 = T68 ? T66 : T64;
  assign T64 = T65 ? io_req_cmd_addr_channel_0_ready : io_ins_15_ready;
  assign T65 = T36[1'h0];
  assign T66 = T67 ? io_req_cmd_rw_channel_0_ready : io_req_cmd_tag_channel_0_ready;
  assign T67 = T36[1'h0];
  assign T68 = T36[1'h1];
  assign T69 = T74 ? T72 : T70;
  assign T70 = T71 ? io_req_data_data_channel_1_ready : io_req_data_data_channel_0_ready;
  assign T71 = T36[1'h0];
  assign T72 = T73 ? io_lat_ready : io_len_ready;
  assign T73 = T36[1'h0];
  assign T74 = T36[1'h1];
  assign T75 = T36[2'h2];
  assign T76 = T36[3'h4];
  assign T77 = 2'h1 == st_wr;
  assign T78 = T79 & io_nasti_b_ready;
  assign T79 = 2'h2 == st_wr;
  assign T80 = waddr_r == 10'h14;
  assign io_req_data_data_channel_1_bits = io_nasti_w_bits_data;
  assign io_req_data_data_channel_1_valid = T81;
  assign T81 = T82 & do_write;
  assign T82 = waddr_r == 10'h15;
  assign io_req_cmd_addr_channel_0_bits = io_nasti_w_bits_data;
  assign io_req_cmd_addr_channel_0_valid = T83;
  assign T83 = T84 & do_write;
  assign T84 = waddr_r == 10'h11;
  assign io_req_cmd_tag_channel_0_bits = T391;
  assign T391 = io_nasti_w_bits_data[3'h4:1'h0];
  assign io_req_cmd_tag_channel_0_valid = T85;
  assign T85 = T86 & do_write;
  assign T86 = waddr_r == 10'h12;
  assign io_req_cmd_rw_channel_0_bits = T392;
  assign T392 = io_nasti_w_bits_data[1'h0];
  assign io_req_cmd_rw_channel_0_valid = T87;
  assign T87 = T88 & do_write;
  assign T88 = waddr_r == 10'h13;
  assign io_reset_t = T89;
  assign T89 = do_write & T90;
  assign T90 = waddr_r == 10'h3ff;
  assign io_daisy_cntr_out_ready = T91;
  assign T91 = T92 & do_read;
  assign T92 = raddr_r == 10'h28;
  assign io_daisy_sram_0_restart = T93;
  assign T93 = do_write & T94;
  assign T94 = waddr_r == 10'h3fe;
  assign io_daisy_sram_0_out_ready = T95;
  assign T95 = T96 & do_read;
  assign T96 = raddr_r == 10'h26;
  assign io_daisy_sram_0_in_bits = 32'h0;
  assign io_daisy_sram_0_in_valid = 1'h0;
  assign io_daisy_sram_1_restart = T97;
  assign T97 = do_write & T98;
  assign T98 = waddr_r == 10'h3fd;
  assign io_daisy_sram_1_out_ready = T99;
  assign T99 = T100 & do_read;
  assign T100 = raddr_r == 10'h27;
  assign io_daisy_sram_1_in_bits = 32'h0;
  assign io_daisy_sram_1_in_valid = 1'h0;
  assign io_daisy_trace_out_ready = T101;
  assign T101 = T102 & do_read;
  assign T102 = raddr_r == 10'h24;
  assign io_daisy_trace_in_bits = 32'h0;
  assign io_daisy_trace_in_valid = 1'h0;
  assign io_daisy_regs_out_ready = T103;
  assign T103 = T104 & do_read;
  assign T104 = raddr_r == 10'h25;
  assign io_daisy_regs_in_bits = 32'h0;
  assign io_daisy_regs_in_valid = 1'h0;
  assign io_outT_0_ready = T105;
  assign T105 = T106 & do_read;
  assign T106 = raddr_r == 10'h18;
  assign io_outT_1_ready = T107;
  assign T107 = T108 & do_read;
  assign T108 = raddr_r == 10'h19;
  assign io_outT_2_ready = T109;
  assign T109 = T110 & do_read;
  assign T110 = raddr_r == 10'h1a;
  assign io_outT_3_ready = T111;
  assign T111 = T112 & do_read;
  assign T112 = raddr_r == 10'h1b;
  assign io_outT_4_ready = T113;
  assign T113 = T114 & do_read;
  assign T114 = raddr_r == 10'h1c;
  assign io_outT_5_ready = T115;
  assign T115 = T116 & do_read;
  assign T116 = raddr_r == 10'h1d;
  assign io_outT_6_ready = T117;
  assign T117 = T118 & do_read;
  assign T118 = raddr_r == 10'h1e;
  assign io_outT_7_ready = T119;
  assign T119 = T120 & do_read;
  assign T120 = raddr_r == 10'h1f;
  assign io_outT_8_ready = T121;
  assign T121 = T122 & do_read;
  assign T122 = raddr_r == 10'h20;
  assign io_inT_0_ready = T123;
  assign T123 = T124 & do_read;
  assign T124 = raddr_r == 10'h2;
  assign io_inT_1_ready = T125;
  assign T125 = T126 & do_read;
  assign T126 = raddr_r == 10'h3;
  assign io_inT_2_ready = T127;
  assign T127 = T128 & do_read;
  assign T128 = raddr_r == 10'h4;
  assign io_inT_3_ready = T129;
  assign T129 = T130 & do_read;
  assign T130 = raddr_r == 10'h5;
  assign io_inT_4_ready = T131;
  assign T131 = T132 & do_read;
  assign T132 = raddr_r == 10'h6;
  assign io_inT_5_ready = T133;
  assign T133 = T134 & do_read;
  assign T134 = raddr_r == 10'h7;
  assign io_inT_6_ready = T135;
  assign T135 = T136 & do_read;
  assign T136 = raddr_r == 10'h8;
  assign io_inT_7_ready = T137;
  assign T137 = T138 & do_read;
  assign T138 = raddr_r == 10'h9;
  assign io_inT_8_ready = T139;
  assign T139 = T140 & do_read;
  assign T140 = raddr_r == 10'ha;
  assign io_inT_9_ready = T141;
  assign T141 = T142 & do_read;
  assign T142 = raddr_r == 10'hb;
  assign io_inT_10_ready = T143;
  assign T143 = T144 & do_read;
  assign T144 = raddr_r == 10'hc;
  assign io_inT_11_ready = T145;
  assign T145 = T146 & do_read;
  assign T146 = raddr_r == 10'hd;
  assign io_inT_12_ready = T147;
  assign T147 = T148 & do_read;
  assign T148 = raddr_r == 10'he;
  assign io_inT_13_ready = T149;
  assign T149 = T150 & do_read;
  assign T150 = raddr_r == 10'hf;
  assign io_inT_14_ready = T151;
  assign T151 = T152 & do_read;
  assign T152 = raddr_r == 10'h10;
  assign io_inT_15_ready = T153;
  assign T153 = T154 & do_read;
  assign T154 = raddr_r == 10'h11;
  assign io_inT_16_ready = T155;
  assign T155 = T156 & do_read;
  assign T156 = raddr_r == 10'h12;
  assign io_inT_17_ready = T157;
  assign T157 = T158 & do_read;
  assign T158 = raddr_r == 10'h13;
  assign io_inT_18_ready = T159;
  assign T159 = T160 & do_read;
  assign T160 = raddr_r == 10'h14;
  assign io_inT_19_ready = T161;
  assign T161 = T162 & do_read;
  assign T162 = raddr_r == 10'h15;
  assign io_inT_20_ready = T163;
  assign T163 = T164 & do_read;
  assign T164 = raddr_r == 10'h16;
  assign io_inT_21_ready = T165;
  assign T165 = T166 & do_read;
  assign T166 = raddr_r == 10'h17;
  assign io_outs_0_ready = T167;
  assign T167 = T168 & do_read;
  assign T168 = raddr_r == 10'h1;
  assign io_ins_0_bits = T393;
  assign T393 = io_nasti_w_bits_data[1'h0];
  assign io_ins_0_valid = T169;
  assign T169 = T170 & do_write;
  assign T170 = waddr_r == 10'h1;
  assign io_ins_1_bits = io_nasti_w_bits_data;
  assign io_ins_1_valid = T171;
  assign T171 = T172 & do_write;
  assign T172 = waddr_r == 10'h2;
  assign io_ins_2_bits = T394;
  assign T394 = io_nasti_w_bits_data[1'h0];
  assign io_ins_2_valid = T173;
  assign T173 = T174 & do_write;
  assign T174 = waddr_r == 10'h3;
  assign io_ins_3_bits = T395;
  assign T395 = io_nasti_w_bits_data[1'h0];
  assign io_ins_3_valid = T175;
  assign T175 = T176 & do_write;
  assign T176 = waddr_r == 10'h4;
  assign io_ins_4_bits = T396;
  assign T396 = io_nasti_w_bits_data[1'h0];
  assign io_ins_4_valid = T177;
  assign T177 = T178 & do_write;
  assign T178 = waddr_r == 10'h5;
  assign io_ins_5_bits = T397;
  assign T397 = io_nasti_w_bits_data[1'h1:1'h0];
  assign io_ins_5_valid = T179;
  assign T179 = T180 & do_write;
  assign T180 = waddr_r == 10'h6;
  assign io_ins_6_bits = T398;
  assign T398 = io_nasti_w_bits_data[3'h4:1'h0];
  assign io_ins_6_valid = T181;
  assign T181 = T182 & do_write;
  assign T182 = waddr_r == 10'h7;
  assign io_ins_7_bits = T399;
  assign T399 = io_nasti_w_bits_data[1'h0];
  assign io_ins_7_valid = T183;
  assign T183 = T184 & do_write;
  assign T184 = waddr_r == 10'h8;
  assign io_ins_8_bits = T400;
  assign T400 = io_nasti_w_bits_data[1'h0];
  assign io_ins_8_valid = T185;
  assign T185 = T186 & do_write;
  assign T186 = waddr_r == 10'h9;
  assign io_ins_9_bits = T401;
  assign T401 = io_nasti_w_bits_data[1'h0];
  assign io_ins_9_valid = T187;
  assign T187 = T188 & do_write;
  assign T188 = waddr_r == 10'ha;
  assign io_ins_10_bits = T402;
  assign T402 = io_nasti_w_bits_data[1'h1:1'h0];
  assign io_ins_10_valid = T189;
  assign T189 = T190 & do_write;
  assign T190 = waddr_r == 10'hb;
  assign io_ins_11_bits = io_nasti_w_bits_data;
  assign io_ins_11_valid = T191;
  assign T191 = T192 & do_write;
  assign T192 = waddr_r == 10'hc;
  assign io_ins_12_bits = io_nasti_w_bits_data;
  assign io_ins_12_valid = T193;
  assign T193 = T194 & do_write;
  assign T194 = waddr_r == 10'hd;
  assign io_ins_13_bits = T403;
  assign T403 = io_nasti_w_bits_data[1'h0];
  assign io_ins_13_valid = T195;
  assign T195 = T196 & do_write;
  assign T196 = waddr_r == 10'he;
  assign io_ins_14_bits = T404;
  assign T404 = io_nasti_w_bits_data[3'h4:1'h0];
  assign io_ins_14_valid = T197;
  assign T197 = T198 & do_write;
  assign T198 = waddr_r == 10'hf;
  assign io_ins_15_bits = T405;
  assign T405 = io_nasti_w_bits_data[1'h0];
  assign io_ins_15_valid = T199;
  assign T199 = T200 & do_write;
  assign T200 = waddr_r == 10'h10;
  assign io_fin_ready = T201;
  assign T201 = T202 & do_read;
  assign T202 = raddr_r == 10'h0;
  assign io_lat_bits = io_nasti_w_bits_data;
  assign io_lat_valid = T203;
  assign T203 = T204 & do_write;
  assign T204 = waddr_r == 10'h17;
  assign io_len_bits = io_nasti_w_bits_data;
  assign io_len_valid = T205;
  assign T205 = T206 & do_write;
  assign T206 = waddr_r == 10'h16;
  assign io_step_bits = io_nasti_w_bits_data;
  assign io_step_valid = T207;
  assign T207 = T208 & do_write;
  assign T208 = waddr_r == 10'h0;
  assign io_nasti_r_bits_user = T209;
  assign T209 = 1'h0;
  assign io_nasti_r_bits_id = T210;
  assign T210 = arid_r;
  assign T211 = T3 ? io_nasti_ar_bits_id : arid_r;
  assign io_nasti_r_bits_last = T212;
  assign T212 = T213;
  assign T213 = T214 & do_read;
  assign T214 = T294 ? T278 : T215;
  assign T215 = T277 ? T247 : T216;
  assign T216 = T246 ? T232 : T217;
  assign T217 = T231 ? T225 : T218;
  assign T218 = T224 ? T222 : T219;
  assign T219 = T220 ? io_outs_0_valid : io_fin_valid;
  assign T220 = T221[1'h0];
  assign T221 = T406;
  assign T406 = raddr_r[3'h5:1'h0];
  assign T222 = T223 ? io_inT_1_valid : io_inT_0_valid;
  assign T223 = T221[1'h0];
  assign T224 = T221[1'h1];
  assign T225 = T230 ? T228 : T226;
  assign T226 = T227 ? io_inT_3_valid : io_inT_2_valid;
  assign T227 = T221[1'h0];
  assign T228 = T229 ? io_inT_5_valid : io_inT_4_valid;
  assign T229 = T221[1'h0];
  assign T230 = T221[1'h1];
  assign T231 = T221[2'h2];
  assign T232 = T245 ? T239 : T233;
  assign T233 = T238 ? T236 : T234;
  assign T234 = T235 ? io_inT_7_valid : io_inT_6_valid;
  assign T235 = T221[1'h0];
  assign T236 = T237 ? io_inT_9_valid : io_inT_8_valid;
  assign T237 = T221[1'h0];
  assign T238 = T221[1'h1];
  assign T239 = T244 ? T242 : T240;
  assign T240 = T241 ? io_inT_11_valid : io_inT_10_valid;
  assign T241 = T221[1'h0];
  assign T242 = T243 ? io_inT_13_valid : io_inT_12_valid;
  assign T243 = T221[1'h0];
  assign T244 = T221[1'h1];
  assign T245 = T221[2'h2];
  assign T246 = T221[2'h3];
  assign T247 = T276 ? T262 : T248;
  assign T248 = T261 ? T255 : T249;
  assign T249 = T254 ? T252 : T250;
  assign T250 = T251 ? io_inT_15_valid : io_inT_14_valid;
  assign T251 = T221[1'h0];
  assign T252 = T253 ? io_inT_17_valid : io_inT_16_valid;
  assign T253 = T221[1'h0];
  assign T254 = T221[1'h1];
  assign T255 = T260 ? T258 : T256;
  assign T256 = T257 ? io_inT_19_valid : io_inT_18_valid;
  assign T257 = T221[1'h0];
  assign T258 = T259 ? io_inT_21_valid : io_inT_20_valid;
  assign T259 = T221[1'h0];
  assign T260 = T221[1'h1];
  assign T261 = T221[2'h2];
  assign T262 = T275 ? T269 : T263;
  assign T263 = T268 ? T266 : T264;
  assign T264 = T265 ? io_outT_1_valid : io_outT_0_valid;
  assign T265 = T221[1'h0];
  assign T266 = T267 ? io_outT_3_valid : io_outT_2_valid;
  assign T267 = T221[1'h0];
  assign T268 = T221[1'h1];
  assign T269 = T274 ? T272 : T270;
  assign T270 = T271 ? io_outT_5_valid : io_outT_4_valid;
  assign T271 = T221[1'h0];
  assign T272 = T273 ? io_outT_7_valid : io_outT_6_valid;
  assign T273 = T221[1'h0];
  assign T274 = T221[1'h1];
  assign T275 = T221[2'h2];
  assign T276 = T221[2'h3];
  assign T277 = T221[3'h4];
  assign T278 = T293 ? io_daisy_cntr_out_valid : T279;
  assign T279 = T292 ? T286 : T280;
  assign T280 = T285 ? T283 : T281;
  assign T281 = T282 ? io_resp_data_channel_0_valid : io_outT_8_valid;
  assign T282 = T221[1'h0];
  assign T283 = T284 ? io_resp_tag_channel_0_valid : io_resp_data_channel_1_valid;
  assign T284 = T221[1'h0];
  assign T285 = T221[1'h1];
  assign T286 = T291 ? T289 : T287;
  assign T287 = T288 ? io_daisy_regs_out_valid : io_daisy_trace_out_valid;
  assign T288 = T221[1'h0];
  assign T289 = T290 ? io_daisy_sram_1_out_valid : io_daisy_sram_0_out_valid;
  assign T290 = T221[1'h0];
  assign T291 = T221[1'h1];
  assign T292 = T221[2'h2];
  assign T293 = T221[2'h3];
  assign T294 = T221[3'h5];
  assign io_nasti_r_bits_data = T295;
  assign T295 = T296;
  assign T296 = T376 ? T360 : T297;
  assign T297 = T359 ? T329 : T298;
  assign T298 = T328 ? T314 : T299;
  assign T299 = T313 ? T307 : T300;
  assign T300 = T306 ? T304 : T301;
  assign T301 = T302 ? io_outs_0_bits : io_fin_bits;
  assign T302 = T303[1'h0];
  assign T303 = T407;
  assign T407 = raddr_r[3'h5:1'h0];
  assign T304 = T305 ? io_inT_1_bits : T408;
  assign T408 = {31'h0, io_inT_0_bits};
  assign T305 = T303[1'h0];
  assign T306 = T303[1'h1];
  assign T307 = T312 ? T310 : T409;
  assign T409 = {31'h0, T308};
  assign T308 = T309 ? io_inT_3_bits : io_inT_2_bits;
  assign T309 = T303[1'h0];
  assign T310 = T311 ? io_inT_5_bits : T410;
  assign T410 = {31'h0, io_inT_4_bits};
  assign T311 = T303[1'h0];
  assign T312 = T303[1'h1];
  assign T313 = T303[2'h2];
  assign T314 = T327 ? T413 : T315;
  assign T315 = T320 ? T412 : T316;
  assign T316 = T317 ? T411 : io_inT_6_bits;
  assign T411 = {27'h0, io_inT_7_bits};
  assign T317 = T303[1'h0];
  assign T412 = {31'h0, T318};
  assign T318 = T319 ? io_inT_9_bits : io_inT_8_bits;
  assign T319 = T303[1'h0];
  assign T320 = T303[1'h1];
  assign T413 = {27'h0, T321};
  assign T321 = T326 ? T324 : T414;
  assign T414 = {3'h0, T322};
  assign T322 = T323 ? io_inT_11_bits : T415;
  assign T415 = {1'h0, io_inT_10_bits};
  assign T323 = T303[1'h0];
  assign T324 = T325 ? T416 : io_inT_12_bits;
  assign T416 = {4'h0, io_inT_13_bits};
  assign T325 = T303[1'h0];
  assign T326 = T303[1'h1];
  assign T327 = T303[2'h2];
  assign T328 = T303[2'h3];
  assign T329 = T358 ? T344 : T330;
  assign T330 = T343 ? T337 : T331;
  assign T331 = T336 ? T334 : T417;
  assign T417 = {31'h0, T332};
  assign T332 = T333 ? io_inT_15_bits : io_inT_14_bits;
  assign T333 = T303[1'h0];
  assign T334 = T335 ? io_inT_17_bits : T418;
  assign T418 = {30'h0, io_inT_16_bits};
  assign T335 = T303[1'h0];
  assign T336 = T303[1'h1];
  assign T337 = T342 ? T420 : T338;
  assign T338 = T339 ? T419 : io_inT_18_bits;
  assign T419 = {31'h0, io_inT_19_bits};
  assign T339 = T303[1'h0];
  assign T420 = {27'h0, T340};
  assign T340 = T341 ? T421 : io_inT_20_bits;
  assign T421 = {4'h0, io_inT_21_bits};
  assign T341 = T303[1'h0];
  assign T342 = T303[1'h1];
  assign T343 = T303[2'h2];
  assign T344 = T357 ? T351 : T345;
  assign T345 = T350 ? T348 : T346;
  assign T346 = T347 ? T422 : io_outT_0_bits;
  assign T422 = {31'h0, io_outT_1_bits};
  assign T347 = T303[1'h0];
  assign T348 = T349 ? T423 : io_outT_2_bits;
  assign T423 = {27'h0, io_outT_3_bits};
  assign T349 = T303[1'h0];
  assign T350 = T303[1'h1];
  assign T351 = T356 ? T354 : T424;
  assign T424 = {31'h0, T352};
  assign T352 = T353 ? io_outT_5_bits : io_outT_4_bits;
  assign T353 = T303[1'h0];
  assign T354 = T355 ? io_outT_7_bits : io_outT_6_bits;
  assign T355 = T303[1'h0];
  assign T356 = T303[1'h1];
  assign T357 = T303[2'h2];
  assign T358 = T303[2'h3];
  assign T359 = T303[3'h4];
  assign T360 = T375 ? io_daisy_cntr_out_bits : T361;
  assign T361 = T374 ? T368 : T362;
  assign T362 = T367 ? T365 : T363;
  assign T363 = T364 ? io_resp_data_channel_0_bits : T425;
  assign T425 = {31'h0, io_outT_8_bits};
  assign T364 = T303[1'h0];
  assign T365 = T366 ? T426 : io_resp_data_channel_1_bits;
  assign T426 = {27'h0, io_resp_tag_channel_0_bits};
  assign T366 = T303[1'h0];
  assign T367 = T303[1'h1];
  assign T368 = T373 ? T371 : T369;
  assign T369 = T370 ? io_daisy_regs_out_bits : io_daisy_trace_out_bits;
  assign T370 = T303[1'h0];
  assign T371 = T372 ? io_daisy_sram_1_out_bits : io_daisy_sram_0_out_bits;
  assign T372 = T303[1'h0];
  assign T373 = T303[1'h1];
  assign T374 = T303[2'h2];
  assign T375 = T303[2'h3];
  assign T376 = T303[3'h5];
  assign io_nasti_r_bits_resp = T377;
  assign T377 = 2'h0;
  assign io_nasti_r_valid = io_nasti_r_bits_last;
  assign io_nasti_ar_ready = T378;
  assign T378 = st_rd == 1'h0;
  assign io_nasti_b_bits_user = T379;
  assign T379 = 1'h0;
  assign io_nasti_b_bits_id = T380;
  assign T380 = awid_r;
  assign T381 = T18 ? io_nasti_aw_bits_id : awid_r;
  assign io_nasti_b_bits_resp = T382;
  assign T382 = 2'h0;
  assign io_nasti_b_valid = T383;
  assign T383 = st_wr == 2'h2;
  assign io_nasti_w_ready = do_write;
  assign io_nasti_aw_ready = do_write;

  always @(posedge clk) begin
    if(reset) begin
      st_rd <= 1'h0;
    end else if(T5) begin
      st_rd <= 1'h0;
    end else if(T3) begin
      st_rd <= 1'h1;
    end
    raddr_r <= T385;
    if(reset) begin
      st_wr <= 2'h0;
    end else if(T78) begin
      st_wr <= 2'h0;
    end else if(T21) begin
      st_wr <= 2'h2;
    end else if(T18) begin
      st_wr <= 2'h1;
    end
    waddr_r <= T388;
    if(T3) begin
      arid_r <= io_nasti_ar_bits_id;
    end
    if(T18) begin
      awid_r <= io_nasti_aw_bits_id;
    end
  end
endmodule

module NastiSlaveHandler(input clk, input reset,
    output io_mem_req_cmd_ready,
    input  io_mem_req_cmd_valid,
    input [31:0] io_mem_req_cmd_bits_addr,
    input [4:0] io_mem_req_cmd_bits_tag,
    input  io_mem_req_cmd_bits_rw,
    output io_mem_req_data_ready,
    input  io_mem_req_data_valid,
    input [63:0] io_mem_req_data_bits_data,
    input  io_mem_resp_ready,
    output io_mem_resp_valid,
    output[63:0] io_mem_resp_bits_data,
    output[4:0] io_mem_resp_bits_tag,
    input  io_nasti_aw_ready,
    output io_nasti_aw_valid,
    output[31:0] io_nasti_aw_bits_addr,
    output[7:0] io_nasti_aw_bits_len,
    output[2:0] io_nasti_aw_bits_size,
    output[1:0] io_nasti_aw_bits_burst,
    output io_nasti_aw_bits_lock,
    output[3:0] io_nasti_aw_bits_cache,
    output[2:0] io_nasti_aw_bits_prot,
    output[3:0] io_nasti_aw_bits_qos,
    output[3:0] io_nasti_aw_bits_region,
    output[5:0] io_nasti_aw_bits_id,
    output io_nasti_aw_bits_user,
    input  io_nasti_w_ready,
    output io_nasti_w_valid,
    output[63:0] io_nasti_w_bits_data,
    output io_nasti_w_bits_last,
    output[7:0] io_nasti_w_bits_strb,
    output io_nasti_w_bits_user,
    output io_nasti_b_ready,
    input  io_nasti_b_valid,
    input [1:0] io_nasti_b_bits_resp,
    input [5:0] io_nasti_b_bits_id,
    input  io_nasti_b_bits_user,
    input  io_nasti_ar_ready,
    output io_nasti_ar_valid,
    output[31:0] io_nasti_ar_bits_addr,
    output[7:0] io_nasti_ar_bits_len,
    output[2:0] io_nasti_ar_bits_size,
    output[1:0] io_nasti_ar_bits_burst,
    output io_nasti_ar_bits_lock,
    output[3:0] io_nasti_ar_bits_cache,
    output[2:0] io_nasti_ar_bits_prot,
    output[3:0] io_nasti_ar_bits_qos,
    output[3:0] io_nasti_ar_bits_region,
    output[5:0] io_nasti_ar_bits_id,
    output io_nasti_ar_bits_user,
    output io_nasti_r_ready,
    input  io_nasti_r_valid,
    input [1:0] io_nasti_r_bits_resp,
    input [63:0] io_nasti_r_bits_data,
    input  io_nasti_r_bits_last,
    input [5:0] io_nasti_r_bits_id,
    input  io_nasti_r_bits_user
);

  wire T0;
  wire[5:0] T1;
  wire[5:0] T60;
  wire[3:0] T2;
  wire[3:0] T3;
  wire[2:0] T4;
  wire[3:0] T5;
  wire T6;
  wire[1:0] T7;
  wire[2:0] T8;
  wire[7:0] T9;
  wire[31:0] T10;
  wire[31:0] T61;
  wire[35:0] T11;
  wire T12;
  reg [1:0] state_r;
  wire[1:0] T62;
  wire[1:0] T13;
  wire[1:0] T14;
  wire[1:0] T15;
  wire[1:0] T16;
  wire[1:0] T17;
  wire[1:0] T18;
  wire T19;
  wire T20;
  wire T21;
  wire T22;
  wire T23;
  wire[1:0] T24;
  wire T25;
  wire[1:0] T26;
  wire T27;
  wire T28;
  wire[1:0] T29;
  wire T30;
  wire T31;
  wire[7:0] T32;
  wire T33;
  wire T34;
  wire T35;
  reg  R36;
  wire T63;
  wire T37;
  wire T38;
  wire T39;
  wire[63:0] T40;
  wire T41;
  wire T42;
  wire T43;
  wire[5:0] T44;
  wire[3:0] T45;
  wire[3:0] T46;
  wire[2:0] T47;
  wire[3:0] T48;
  wire T49;
  wire[1:0] T50;
  wire[2:0] T51;
  wire[7:0] T52;
  wire[31:0] T53;
  wire T54;
  wire[4:0] T64;
  wire read_wrap_out;
  wire write_wrap_out;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    state_r = {1{$random}};
    R36 = {1{$random}};
  end
// synthesis translate_on
`endif

  assign io_nasti_r_ready = io_mem_resp_ready;
  assign io_nasti_ar_bits_user = T0;
  assign T0 = 1'h0;
  assign io_nasti_ar_bits_id = T1;
  assign T1 = T60;
  assign T60 = {1'h0, io_mem_req_cmd_bits_tag};
  assign io_nasti_ar_bits_region = T2;
  assign T2 = 4'h0;
  assign io_nasti_ar_bits_qos = T3;
  assign T3 = 4'h0;
  assign io_nasti_ar_bits_prot = T4;
  assign T4 = 3'h0;
  assign io_nasti_ar_bits_cache = T5;
  assign T5 = 4'h0;
  assign io_nasti_ar_bits_lock = T6;
  assign T6 = 1'h0;
  assign io_nasti_ar_bits_burst = T7;
  assign T7 = 2'h1;
  assign io_nasti_ar_bits_size = T8;
  assign T8 = 3'h3;
  assign io_nasti_ar_bits_len = T9;
  assign T9 = 8'h1;
  assign io_nasti_ar_bits_addr = T10;
  assign T10 = T61;
  assign T61 = T11[5'h1f:1'h0];
  assign T11 = io_mem_req_cmd_bits_addr << 3'h4;
  assign io_nasti_ar_valid = T12;
  assign T12 = state_r == 2'h1;
  assign T62 = reset ? 2'h0 : T13;
  assign T13 = T30 ? T29 : T14;
  assign T14 = T28 ? T26 : T15;
  assign T15 = T25 ? T24 : T16;
  assign T16 = T23 ? T17 : state_r;
  assign T17 = T21 ? 2'h2 : T18;
  assign T18 = T19 ? 2'h1 : 2'h0;
  assign T19 = io_mem_req_cmd_valid & T20;
  assign T20 = io_mem_req_cmd_bits_rw ^ 1'h1;
  assign T21 = T22 & io_mem_req_data_valid;
  assign T22 = io_mem_req_cmd_valid & io_mem_req_cmd_bits_rw;
  assign T23 = 2'h0 == state_r;
  assign T24 = io_nasti_ar_ready ? 2'h0 : 2'h1;
  assign T25 = 2'h1 == state_r;
  assign T26 = T27 ? 2'h3 : 2'h2;
  assign T27 = io_nasti_aw_ready & io_mem_req_data_valid;
  assign T28 = 2'h2 == state_r;
  assign T29 = io_nasti_w_bits_last ? 2'h0 : 2'h3;
  assign T30 = 2'h3 == state_r;
  assign io_nasti_b_ready = 1'h1;
  assign io_nasti_w_bits_user = T31;
  assign T31 = 1'h0;
  assign io_nasti_w_bits_strb = T32;
  assign T32 = 8'hff;
  assign io_nasti_w_bits_last = T33;
  assign T33 = T34;
  assign T34 = T39 & T35;
  assign T35 = R36 == 1'h1;
  assign T63 = reset ? 1'h0 : T37;
  assign T37 = T39 ? T38 : R36;
  assign T38 = R36 + 1'h1;
  assign T39 = io_nasti_w_ready & io_nasti_w_valid;
  assign io_nasti_w_bits_data = T40;
  assign T40 = io_mem_req_data_bits_data;
  assign io_nasti_w_valid = T41;
  assign T41 = io_mem_req_data_valid & T42;
  assign T42 = state_r == 2'h3;
  assign io_nasti_aw_bits_user = T43;
  assign T43 = 1'h0;
  assign io_nasti_aw_bits_id = T44;
  assign T44 = 6'h0;
  assign io_nasti_aw_bits_region = T45;
  assign T45 = 4'h0;
  assign io_nasti_aw_bits_qos = T46;
  assign T46 = 4'h0;
  assign io_nasti_aw_bits_prot = T47;
  assign T47 = 3'h0;
  assign io_nasti_aw_bits_cache = T48;
  assign T48 = 4'h0;
  assign io_nasti_aw_bits_lock = T49;
  assign T49 = 1'h0;
  assign io_nasti_aw_bits_burst = T50;
  assign T50 = 2'h1;
  assign io_nasti_aw_bits_size = T51;
  assign T51 = io_nasti_ar_bits_size;
  assign io_nasti_aw_bits_len = T52;
  assign T52 = io_nasti_ar_bits_len;
  assign io_nasti_aw_bits_addr = T53;
  assign T53 = io_nasti_ar_bits_addr;
  assign io_nasti_aw_valid = T54;
  assign T54 = state_r == 2'h2;
  assign io_mem_resp_bits_tag = T64;
  assign T64 = io_nasti_r_bits_id[3'h4:1'h0];
  assign io_mem_resp_bits_data = io_nasti_r_bits_data;
  assign io_mem_resp_valid = read_wrap_out;
  assign read_wrap_out = io_nasti_r_ready & io_nasti_r_valid;
  assign io_mem_req_data_ready = write_wrap_out;
  assign write_wrap_out = io_nasti_w_ready & io_nasti_w_valid;
  assign io_mem_req_cmd_ready = T55;
  assign T55 = T58 | T56;
  assign T56 = T57 & io_nasti_ar_ready;
  assign T57 = state_r == 2'h1;
  assign T58 = T59 & io_nasti_aw_ready;
  assign T59 = state_r == 2'h2;

  always @(posedge clk) begin
    if(reset) begin
      state_r <= 2'h0;
    end else if(T30) begin
      state_r <= T29;
    end else if(T28) begin
      state_r <= T26;
    end else if(T25) begin
      state_r <= T24;
    end else if(T23) begin
      state_r <= T17;
    end
    if(reset) begin
      R36 <= 1'h0;
    end else if(T39) begin
      R36 <= T38;
    end
  end
endmodule

module Channel_0(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [31:0] io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output[31:0] io_out_bits
    //input  io_trace_ready
    //output io_trace_valid
    //output[31:0] io_trace_bits
    //input [10:0] io_traceLen
);

  wire tokens_io_enq_ready;
  wire tokens_io_deq_valid;
  wire[31:0] tokens_io_deq_bits;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_trace_bits = {1{$random}};
//  assign io_trace_valid = {1{$random}};
// synthesis translate_on
`endif
  assign io_out_bits = tokens_io_deq_bits;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_in_ready = tokens_io_enq_ready;
  Queue_4 tokens(.clk(clk), .reset(reset),
       .io_enq_ready( tokens_io_enq_ready ),
       .io_enq_valid( io_in_valid ),
       .io_enq_bits( io_in_bits ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( tokens_io_deq_valid ),
       .io_deq_bits( tokens_io_deq_bits )
       //.io_count(  )
  );
endmodule

module Channel_1(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input [4:0] io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output[4:0] io_out_bits
    //input  io_trace_ready
    //output io_trace_valid
    //output[4:0] io_trace_bits
    //input [10:0] io_traceLen
);

  wire tokens_io_enq_ready;
  wire tokens_io_deq_valid;
  wire[4:0] tokens_io_deq_bits;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_trace_bits = {1{$random}};
//  assign io_trace_valid = {1{$random}};
// synthesis translate_on
`endif
  assign io_out_bits = tokens_io_deq_bits;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_in_ready = tokens_io_enq_ready;
  Queue_5 tokens(.clk(clk), .reset(reset),
       .io_enq_ready( tokens_io_enq_ready ),
       .io_enq_valid( io_in_valid ),
       .io_enq_bits( io_in_bits ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( tokens_io_deq_valid ),
       .io_deq_bits( tokens_io_deq_bits )
       //.io_count(  )
  );
endmodule

module Channel_2(input clk, input reset,
    output io_in_ready,
    input  io_in_valid,
    input  io_in_bits,
    input  io_out_ready,
    output io_out_valid,
    output io_out_bits
    //input  io_trace_ready
    //output io_trace_valid
    //output io_trace_bits
    //input [10:0] io_traceLen
);

  wire tokens_io_enq_ready;
  wire tokens_io_deq_valid;
  wire tokens_io_deq_bits;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_trace_bits = {1{$random}};
//  assign io_trace_valid = {1{$random}};
// synthesis translate_on
`endif
  assign io_out_bits = tokens_io_deq_bits;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_in_ready = tokens_io_enq_ready;
  Queue_6 tokens(.clk(clk), .reset(reset),
       .io_enq_ready( tokens_io_enq_ready ),
       .io_enq_valid( io_in_valid ),
       .io_enq_bits( io_in_bits ),
       .io_deq_ready( io_out_ready ),
       .io_deq_valid( tokens_io_deq_valid ),
       .io_deq_bits( tokens_io_deq_bits )
       //.io_count(  )
  );
endmodule

module Queue_7(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [31:0] io_enq_bits_addr,
    input [4:0] io_enq_bits_tag,
    input  io_enq_bits_rw,
    input  io_deq_ready,
    output io_deq_valid,
    output[31:0] io_deq_bits_addr,
    output[4:0] io_deq_bits_tag,
    output io_deq_bits_rw,
    output[1:0] io_count
);

  wire[1:0] T0;
  wire ptr_diff;
  reg  R1;
  wire T29;
  wire T2;
  wire T3;
  wire do_deq;
  wire T4;
  wire do_flow;
  wire empty;
  wire T5;
  reg  maybe_full;
  wire T30;
  wire T6;
  wire do_enq;
  wire T7;
  wire T8;
  wire T9;
  wire ptr_match;
  wire T10;
  reg  R11;
  wire T31;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire[37:0] T17;
  reg [37:0] ram [1:0];
  wire[37:0] T18;
  wire[37:0] T19;
  wire[37:0] T20;
  wire[5:0] T21;
  wire[4:0] T22;
  wire[4:0] T23;
  wire[31:0] T24;
  wire[31:0] T25;
  wire T26;
  wire T27;
  wire T28;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    maybe_full = {1{$random}};
    R11 = {1{$random}};
    for (initvar = 0; initvar < 2; initvar = initvar+1)
      ram[initvar] = {2{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T14, ptr_diff};
  assign ptr_diff = R11 - R1;
  assign T29 = reset ? 1'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 1'h1;
  assign do_deq = T10 & T4;
  assign T4 = do_flow ^ 1'h1;
  assign do_flow = empty & io_deq_ready;
  assign empty = ptr_match & T5;
  assign T5 = maybe_full ^ 1'h1;
  assign T30 = reset ? 1'h0 : T6;
  assign T6 = T9 ? do_enq : maybe_full;
  assign do_enq = T8 & T7;
  assign T7 = do_flow ^ 1'h1;
  assign T8 = io_enq_ready & io_enq_valid;
  assign T9 = do_enq != do_deq;
  assign ptr_match = R11 == R1;
  assign T10 = io_deq_ready & io_deq_valid;
  assign T31 = reset ? 1'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 1'h1;
  assign T14 = maybe_full & ptr_match;
  assign io_deq_bits_rw = T15;
  assign T15 = empty ? io_enq_bits_rw : T16;
  assign T16 = T17[1'h0];
  assign T17 = ram[R1];
  assign T19 = T20;
  assign T20 = {io_enq_bits_addr, T21};
  assign T21 = {io_enq_bits_tag, io_enq_bits_rw};
  assign io_deq_bits_tag = T22;
  assign T22 = empty ? io_enq_bits_tag : T23;
  assign T23 = T17[3'h5:1'h1];
  assign io_deq_bits_addr = T24;
  assign T24 = empty ? io_enq_bits_addr : T25;
  assign T25 = T17[6'h25:3'h6];
  assign io_deq_valid = T26;
  assign T26 = T27 | io_enq_valid;
  assign T27 = empty ^ 1'h1;
  assign io_enq_ready = T28;
  assign T28 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 1'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R11 <= 1'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if (do_enq)
      ram[R11] <= T19;
  end
endmodule

module Queue_8(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits_data,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits_data,
    output[2:0] io_count
);

  wire[2:0] T0;
  wire[1:0] ptr_diff;
  reg [1:0] R1;
  wire[1:0] T22;
  wire[1:0] T2;
  wire[1:0] T3;
  wire do_deq;
  wire T4;
  wire do_flow;
  wire empty;
  wire T5;
  reg  maybe_full;
  wire T23;
  wire T6;
  wire do_enq;
  wire T7;
  wire T8;
  wire T9;
  wire ptr_match;
  wire T10;
  reg [1:0] R11;
  wire[1:0] T24;
  wire[1:0] T12;
  wire[1:0] T13;
  wire T14;
  wire[63:0] T15;
  wire[63:0] T16;
  wire[63:0] T17;
  reg [63:0] ram [3:0];
  wire[63:0] T18;
  wire T19;
  wire T20;
  wire T21;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    maybe_full = {1{$random}};
    R11 = {1{$random}};
    for (initvar = 0; initvar < 4; initvar = initvar+1)
      ram[initvar] = {2{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T14, ptr_diff};
  assign ptr_diff = R11 - R1;
  assign T22 = reset ? 2'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 2'h1;
  assign do_deq = T10 & T4;
  assign T4 = do_flow ^ 1'h1;
  assign do_flow = empty & io_deq_ready;
  assign empty = ptr_match & T5;
  assign T5 = maybe_full ^ 1'h1;
  assign T23 = reset ? 1'h0 : T6;
  assign T6 = T9 ? do_enq : maybe_full;
  assign do_enq = T8 & T7;
  assign T7 = do_flow ^ 1'h1;
  assign T8 = io_enq_ready & io_enq_valid;
  assign T9 = do_enq != do_deq;
  assign ptr_match = R11 == R1;
  assign T10 = io_deq_ready & io_deq_valid;
  assign T24 = reset ? 2'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 2'h1;
  assign T14 = maybe_full & ptr_match;
  assign io_deq_bits_data = T15;
  assign T15 = empty ? io_enq_bits_data : T16;
  assign T16 = T17;
  assign T17 = ram[R1];
  assign io_deq_valid = T19;
  assign T19 = T20 | io_enq_valid;
  assign T20 = empty ^ 1'h1;
  assign io_enq_ready = T21;
  assign T21 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 2'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R11 <= 2'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if (do_enq)
      ram[R11] <= io_enq_bits_data;
  end
endmodule

module Queue_9(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input [63:0] io_enq_bits_data,
    input [4:0] io_enq_bits_tag,
    input  io_deq_ready,
    output io_deq_valid,
    output[63:0] io_deq_bits_data,
    output[4:0] io_deq_bits_tag,
    output[2:0] io_count
);

  wire[2:0] T0;
  wire[1:0] ptr_diff;
  reg [1:0] R1;
  wire[1:0] T26;
  wire[1:0] T2;
  wire[1:0] T3;
  wire do_deq;
  wire T4;
  wire do_flow;
  wire empty;
  wire T5;
  reg  maybe_full;
  wire T27;
  wire T6;
  wire do_enq;
  wire T7;
  wire T8;
  wire T9;
  wire ptr_match;
  wire T10;
  reg [1:0] R11;
  wire[1:0] T28;
  wire[1:0] T12;
  wire[1:0] T13;
  wire T14;
  wire[4:0] T15;
  wire[4:0] T16;
  wire[68:0] T17;
  reg [68:0] ram [3:0];
  wire[68:0] T18;
  wire[68:0] T19;
  wire[68:0] T20;
  wire[63:0] T21;
  wire[63:0] T22;
  wire T23;
  wire T24;
  wire T25;
  wire full;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    R1 = {1{$random}};
    maybe_full = {1{$random}};
    R11 = {1{$random}};
    for (initvar = 0; initvar < 4; initvar = initvar+1)
      ram[initvar] = {3{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T0;
  assign T0 = {T14, ptr_diff};
  assign ptr_diff = R11 - R1;
  assign T26 = reset ? 2'h0 : T2;
  assign T2 = do_deq ? T3 : R1;
  assign T3 = R1 + 2'h1;
  assign do_deq = T10 & T4;
  assign T4 = do_flow ^ 1'h1;
  assign do_flow = empty & io_deq_ready;
  assign empty = ptr_match & T5;
  assign T5 = maybe_full ^ 1'h1;
  assign T27 = reset ? 1'h0 : T6;
  assign T6 = T9 ? do_enq : maybe_full;
  assign do_enq = T8 & T7;
  assign T7 = do_flow ^ 1'h1;
  assign T8 = io_enq_ready & io_enq_valid;
  assign T9 = do_enq != do_deq;
  assign ptr_match = R11 == R1;
  assign T10 = io_deq_ready & io_deq_valid;
  assign T28 = reset ? 2'h0 : T12;
  assign T12 = do_enq ? T13 : R11;
  assign T13 = R11 + 2'h1;
  assign T14 = maybe_full & ptr_match;
  assign io_deq_bits_tag = T15;
  assign T15 = empty ? io_enq_bits_tag : T16;
  assign T16 = T17[3'h4:1'h0];
  assign T17 = ram[R1];
  assign T19 = T20;
  assign T20 = {io_enq_bits_data, io_enq_bits_tag};
  assign io_deq_bits_data = T21;
  assign T21 = empty ? io_enq_bits_data : T22;
  assign T22 = T17[7'h44:3'h5];
  assign io_deq_valid = T23;
  assign T23 = T24 | io_enq_valid;
  assign T24 = empty ^ 1'h1;
  assign io_enq_ready = T25;
  assign T25 = full ^ 1'h1;
  assign full = ptr_match & maybe_full;

  always @(posedge clk) begin
    if(reset) begin
      R1 <= 2'h0;
    end else if(do_deq) begin
      R1 <= T3;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T9) begin
      maybe_full <= do_enq;
    end
    if(reset) begin
      R11 <= 2'h0;
    end else if(do_enq) begin
      R11 <= T13;
    end
    if (do_enq)
      ram[R11] <= T19;
  end
endmodule

module HellaFlowQueue(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_valid,
    input [63:0] io_enq_bits_bits_data,
    input [4:0] io_enq_bits_bits_tag,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_valid,
    output[63:0] io_deq_bits_bits_data,
    output[4:0] io_deq_bits_bits_tag
    //output[8:0] io_count
);

  wire[4:0] T0;
  wire[4:0] T1;
  wire[69:0] T2;
  wire ren;
  wire T21;
  wire T22;
  wire T23;
  wire T24;
  wire atLeastTwo;
  wire T25;
  wire[7:0] T26;
  reg [7:0] deq_ptr;
  wire[7:0] T36;
  wire[7:0] T14;
  wire[7:0] T15;
  wire do_deq;
  wire T16;
  wire do_flow;
  wire T8;
  wire T17;
  reg [7:0] enq_ptr;
  wire[7:0] T37;
  wire[7:0] T10;
  wire[7:0] T11;
  wire do_enq;
  wire T7;
  wire T9;
  wire full;
  reg  maybe_full;
  wire T38;
  wire T27;
  wire T28;
  wire ptr_match;
  wire[7:0] raddr;
  wire[7:0] T18;
  wire[7:0] T19;
  wire deq_done;
  wire T20;
  wire[69:0] T3;
  wire[69:0] T4;
  wire[69:0] T5;
  wire[68:0] T6;
  reg [7:0] R12;
  wire[7:0] T13;
  wire empty;
  wire T29;
  wire[63:0] T30;
  wire[63:0] T31;
  wire T32;
  wire T33;
  wire T34;
  reg  ram_out_valid;
  wire T35;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    deq_ptr = {1{$random}};
    enq_ptr = {1{$random}};
    maybe_full = {1{$random}};
    R12 = {1{$random}};
    ram_out_valid = {1{$random}};
  end
// synthesis translate_on
`endif

`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_count = {1{$random}};
// synthesis translate_on
`endif
  assign io_deq_bits_bits_tag = T0;
  assign T0 = empty ? io_enq_bits_bits_tag : T1;
  assign T1 = T2[3'h4:1'h0];
  assign ren = io_deq_ready & T21;
  assign T21 = atLeastTwo | T22;
  assign T22 = T24 & T23;
  assign T23 = empty ^ 1'h1;
  assign T24 = io_deq_valid ^ 1'h1;
  assign atLeastTwo = full | T25;
  assign T25 = 8'h2 <= T26;
  assign T26 = enq_ptr - deq_ptr;
  assign T36 = reset ? 8'h0 : T14;
  assign T14 = do_deq ? T15 : deq_ptr;
  assign T15 = deq_ptr + 8'h1;
  assign do_deq = T17 & T16;
  assign T16 = do_flow ^ 1'h1;
  assign do_flow = T8;
  assign T8 = empty & io_deq_ready;
  assign T17 = io_deq_ready & io_deq_valid;
  assign T37 = reset ? 8'h0 : T10;
  assign T10 = do_enq ? T11 : enq_ptr;
  assign T11 = enq_ptr + 8'h1;
  assign do_enq = T9 & T7;
  assign T7 = do_flow ^ 1'h1;
  assign T9 = io_enq_ready & io_enq_valid;
  assign full = ptr_match & maybe_full;
  assign T38 = reset ? 1'h0 : T27;
  assign T27 = T28 ? do_enq : maybe_full;
  assign T28 = do_enq != do_deq;
  assign ptr_match = enq_ptr == deq_ptr;
  assign raddr = io_deq_valid ? T18 : deq_ptr;
  assign T18 = deq_done ? 8'h0 : T19;
  assign T19 = deq_ptr + 8'h1;
  assign deq_done = do_deq & T20;
  assign T20 = deq_ptr == 8'hff;
  HellaFlowQueue_ram ram (
    .CLK(clk),
    .W0A(enq_ptr),
    .W0E(do_enq),
    .W0I(T4),
    .R1A(raddr),
    .R1E(ren),
    .R1O(T2)
  );
  assign T4 = T5;
  assign T5 = {io_enq_bits_valid, T6};
  assign T6 = {io_enq_bits_bits_data, io_enq_bits_bits_tag};
  assign T13 = ren ? raddr : R12;
  assign empty = ptr_match & T29;
  assign T29 = maybe_full ^ 1'h1;
  assign io_deq_bits_bits_data = T30;
  assign T30 = empty ? io_enq_bits_bits_data : T31;
  assign T31 = T2[7'h44:3'h5];
  assign io_deq_bits_valid = T32;
  assign T32 = empty ? io_enq_bits_valid : T33;
  assign T33 = T2[7'h45];
  assign io_deq_valid = T34;
  assign T34 = empty ? io_enq_valid : ram_out_valid;
  assign io_enq_ready = T35;
  assign T35 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      deq_ptr <= 8'h0;
    end else if(do_deq) begin
      deq_ptr <= T15;
    end
    if(reset) begin
      enq_ptr <= 8'h0;
    end else if(do_enq) begin
      enq_ptr <= T11;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else if(T28) begin
      maybe_full <= do_enq;
    end
    if(ren) begin
      R12 <= raddr;
    end
    ram_out_valid <= ren;
  end
endmodule

module Queue_15(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_valid,
    input [63:0] io_enq_bits_bits_data,
    input [4:0] io_enq_bits_bits_tag,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_valid,
    output[63:0] io_deq_bits_bits_data,
    output[4:0] io_deq_bits_bits_tag,
    output io_count
);

  wire T14;
  wire[1:0] T0;
  reg  full;
  wire T15;
  wire T1;
  wire do_enq;
  wire T2;
  wire do_deq;
  wire[4:0] T3;
  wire[69:0] T4;
  reg [69:0] ram [0:0];
  wire[69:0] T5;
  wire[69:0] T6;
  wire[69:0] T7;
  wire[68:0] T8;
  wire[63:0] T9;
  wire T10;
  wire T11;
  wire empty;
  wire T12;
  wire T13;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    full = {1{$random}};
    for (initvar = 0; initvar < 1; initvar = initvar+1)
      ram[initvar] = {3{$random}};
  end
// synthesis translate_on
`endif

  assign io_count = T14;
  assign T14 = T0[1'h0];
  assign T0 = {full, 1'h0};
  assign T15 = reset ? 1'h0 : T1;
  assign T1 = T2 ? do_enq : full;
  assign do_enq = io_enq_ready & io_enq_valid;
  assign T2 = do_enq != do_deq;
  assign do_deq = io_deq_ready & io_deq_valid;
  assign io_deq_bits_bits_tag = T3;
  assign T3 = T4[3'h4:1'h0];
  assign T4 = ram[1'h0];
  assign T6 = T7;
  assign T7 = {io_enq_bits_valid, T8};
  assign T8 = {io_enq_bits_bits_data, io_enq_bits_bits_tag};
  assign io_deq_bits_bits_data = T9;
  assign T9 = T4[7'h44:3'h5];
  assign io_deq_bits_valid = T10;
  assign T10 = T4[7'h45];
  assign io_deq_valid = T11;
  assign T11 = empty ^ 1'h1;
  assign empty = full ^ 1'h1;
  assign io_enq_ready = T12;
  assign T12 = T13 | io_deq_ready;
  assign T13 = full ^ 1'h1;

  always @(posedge clk) begin
    if(reset) begin
      full <= 1'h0;
    end else if(T2) begin
      full <= do_enq;
    end
    if (do_enq)
      ram[1'h0] <= T6;
  end
endmodule

module HellaQueue(input clk, input reset,
    output io_enq_ready,
    input  io_enq_valid,
    input  io_enq_bits_valid,
    input [63:0] io_enq_bits_bits_data,
    input [4:0] io_enq_bits_bits_tag,
    input  io_deq_ready,
    output io_deq_valid,
    output io_deq_bits_valid,
    output[63:0] io_deq_bits_bits_data,
    output[4:0] io_deq_bits_bits_tag
    //output[8:0] io_count
);

  wire fq_io_enq_ready;
  wire fq_io_deq_valid;
  wire fq_io_deq_bits_valid;
  wire[63:0] fq_io_deq_bits_bits_data;
  wire[4:0] fq_io_deq_bits_bits_tag;
  wire Queue_io_enq_ready;
  wire Queue_io_deq_valid;
  wire Queue_io_deq_bits_valid;
  wire[63:0] Queue_io_deq_bits_bits_data;
  wire[4:0] Queue_io_deq_bits_bits_tag;


`ifndef SYNTHESIS
// synthesis translate_off
//  assign io_count = {1{$random}};
// synthesis translate_on
`endif
  assign io_deq_bits_bits_tag = Queue_io_deq_bits_bits_tag;
  assign io_deq_bits_bits_data = Queue_io_deq_bits_bits_data;
  assign io_deq_bits_valid = Queue_io_deq_bits_valid;
  assign io_deq_valid = Queue_io_deq_valid;
  assign io_enq_ready = fq_io_enq_ready;
  HellaFlowQueue fq(.clk(clk), .reset(reset),
       .io_enq_ready( fq_io_enq_ready ),
       .io_enq_valid( io_enq_valid ),
       .io_enq_bits_valid( io_enq_bits_valid ),
       .io_enq_bits_bits_data( io_enq_bits_bits_data ),
       .io_enq_bits_bits_tag( io_enq_bits_bits_tag ),
       .io_deq_ready( Queue_io_enq_ready ),
       .io_deq_valid( fq_io_deq_valid ),
       .io_deq_bits_valid( fq_io_deq_bits_valid ),
       .io_deq_bits_bits_data( fq_io_deq_bits_bits_data ),
       .io_deq_bits_bits_tag( fq_io_deq_bits_bits_tag )
       //.io_count(  )
  );
  Queue_15 Queue(.clk(clk), .reset(reset),
       .io_enq_ready( Queue_io_enq_ready ),
       .io_enq_valid( fq_io_deq_valid ),
       .io_enq_bits_valid( fq_io_deq_bits_valid ),
       .io_enq_bits_bits_data( fq_io_deq_bits_bits_data ),
       .io_enq_bits_bits_tag( fq_io_deq_bits_bits_tag ),
       .io_deq_ready( io_deq_ready ),
       .io_deq_valid( Queue_io_deq_valid ),
       .io_deq_bits_valid( Queue_io_deq_bits_valid ),
       .io_deq_bits_bits_data( Queue_io_deq_bits_bits_data ),
       .io_deq_bits_bits_tag( Queue_io_deq_bits_bits_tag )
       //.io_count(  )
  );
endmodule

module ChannelMemIOConverter(input clk, input reset,
    output io_sim_mem_req_cmd_ready,
    input  io_sim_mem_req_cmd_valid,
    output io_sim_mem_req_cmd_target_ready,
    input  io_sim_mem_req_cmd_target_valid,
    input [31:0] io_sim_mem_req_cmd_target_bits_addr,
    input [4:0] io_sim_mem_req_cmd_target_bits_tag,
    input  io_sim_mem_req_cmd_target_bits_rw,
    output io_sim_mem_req_data_ready,
    input  io_sim_mem_req_data_valid,
    output io_sim_mem_req_data_target_ready,
    input  io_sim_mem_req_data_target_valid,
    input [63:0] io_sim_mem_req_data_target_bits_data,
    input  io_sim_mem_resp_ready,
    output io_sim_mem_resp_valid,
    input  io_sim_mem_resp_target_ready,
    output io_sim_mem_resp_target_valid,
    output[63:0] io_sim_mem_resp_target_bits_data,
    output[4:0] io_sim_mem_resp_target_bits_tag,
    input  io_host_mem_req_cmd_ready,
    output io_host_mem_req_cmd_valid,
    output[31:0] io_host_mem_req_cmd_bits_addr,
    output[4:0] io_host_mem_req_cmd_bits_tag,
    output io_host_mem_req_cmd_bits_rw,
    input  io_host_mem_req_data_ready,
    output io_host_mem_req_data_valid,
    output[63:0] io_host_mem_req_data_bits_data,
    output io_host_mem_resp_ready,
    input  io_host_mem_resp_valid,
    input [63:0] io_host_mem_resp_bits_data,
    input [4:0] io_host_mem_resp_bits_tag,
    output io_latency_ready,
    input  io_latency_valid,
    input [8:0] io_latency_bits
);

  wire T45;
  wire T46;
  wire T0;
  wire T1;
  reg [8:0] latency;
  wire[8:0] T47;
  wire[8:0] T2;
  wire T3;
  reg [8:0] counter;
  wire[8:0] T48;
  wire[8:0] T4;
  wire[8:0] T5;
  wire[8:0] T6;
  wire T7;
  wire T8;
  wire T9;
  wire T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire T15;
  wire T16;
  wire T17;
  wire T18;
  wire T19;
  wire T20;
  wire[4:0] T21;
  wire T22;
  wire[63:0] T23;
  wire T24;
  wire T25;
  wire T26;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  wire req_cmd_buf_io_enq_ready;
  wire req_cmd_buf_io_deq_valid;
  wire[31:0] req_cmd_buf_io_deq_bits_addr;
  wire[4:0] req_cmd_buf_io_deq_bits_tag;
  wire req_cmd_buf_io_deq_bits_rw;
  wire req_data_buf_io_enq_ready;
  wire req_data_buf_io_deq_valid;
  wire[63:0] req_data_buf_io_deq_bits_data;
  wire resp_buf_io_enq_ready;
  wire resp_buf_io_deq_valid;
  wire[63:0] resp_buf_io_deq_bits_data;
  wire[4:0] resp_buf_io_deq_bits_tag;
  wire latency_buf_io_enq_ready;
  wire latency_buf_io_deq_valid;
  wire latency_buf_io_deq_bits_valid;
  wire[63:0] latency_buf_io_deq_bits_bits_data;
  wire[4:0] latency_buf_io_deq_bits_bits_tag;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    latency = {1{$random}};
    counter = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T45 = reset | T46;
  assign T46 = io_latency_ready & io_latency_valid;
  assign T0 = T12 & T1;
  assign T1 = counter == latency;
  assign T47 = reset ? 9'h0 : T2;
  assign T2 = T3 ? io_latency_bits : latency;
  assign T3 = io_latency_ready & io_latency_valid;
  assign T48 = reset ? 9'h0 : T4;
  assign T4 = T7 ? T6 : T5;
  assign T5 = T3 ? 9'h0 : counter;
  assign T6 = counter + 9'h1;
  assign T7 = T11 & T8;
  assign T8 = T10 & T9;
  assign T9 = counter != latency;
  assign T10 = latency_buf_io_enq_ready & T13;
  assign T11 = T3 ^ 1'h1;
  assign T12 = io_sim_mem_resp_valid & io_sim_mem_resp_target_ready;
  assign T13 = T0 | T14;
  assign T14 = counter != latency;
  assign T15 = T17 ? T13 : T16;
  assign T16 = io_sim_mem_resp_ready & io_sim_mem_resp_target_ready;
  assign T17 = latency != 9'h0;
  assign T18 = io_sim_mem_req_data_target_valid & io_sim_mem_req_data_ready;
  assign T19 = io_sim_mem_req_cmd_target_valid & io_sim_mem_req_cmd_ready;
  assign io_latency_ready = T20;
  assign T20 = latency == counter;
  assign io_host_mem_resp_ready = resp_buf_io_enq_ready;
  assign io_host_mem_req_data_bits_data = req_data_buf_io_deq_bits_data;
  assign io_host_mem_req_data_valid = req_data_buf_io_deq_valid;
  assign io_host_mem_req_cmd_bits_rw = req_cmd_buf_io_deq_bits_rw;
  assign io_host_mem_req_cmd_bits_tag = req_cmd_buf_io_deq_bits_tag;
  assign io_host_mem_req_cmd_bits_addr = req_cmd_buf_io_deq_bits_addr;
  assign io_host_mem_req_cmd_valid = req_cmd_buf_io_deq_valid;
  assign io_sim_mem_resp_target_bits_tag = T21;
  assign T21 = T22 ? latency_buf_io_deq_bits_bits_tag : resp_buf_io_deq_bits_tag;
  assign T22 = latency != 9'h0;
  assign io_sim_mem_resp_target_bits_data = T23;
  assign T23 = T24 ? latency_buf_io_deq_bits_bits_data : resp_buf_io_deq_bits_data;
  assign T24 = latency != 9'h0;
  assign io_sim_mem_resp_target_valid = T25;
  assign T25 = T26 ? latency_buf_io_deq_bits_valid : resp_buf_io_deq_valid;
  assign T26 = latency != 9'h0;
  assign io_sim_mem_resp_valid = T27;
  assign T27 = io_sim_mem_resp_ready & T28;
  assign T28 = T32 | T29;
  assign T29 = io_sim_mem_req_cmd_ready & T30;
  assign T30 = T31 | io_sim_mem_req_cmd_target_bits_rw;
  assign T31 = io_sim_mem_req_cmd_target_valid ^ 1'h1;
  assign T32 = T35 | T33;
  assign T33 = latency_buf_io_deq_bits_valid & T34;
  assign T34 = counter == latency;
  assign T35 = resp_buf_io_enq_ready & io_host_mem_resp_valid;
  assign io_sim_mem_req_data_target_ready = 1'h1;
  assign io_sim_mem_req_data_ready = io_sim_mem_req_cmd_ready;
  assign io_sim_mem_req_cmd_target_ready = 1'h1;
  assign io_sim_mem_req_cmd_ready = T36;
  assign T36 = T42 & T37;
  assign T37 = T40 | T38;
  assign T38 = T39 ^ 1'h1;
  assign T39 = latency != 9'h0;
  assign T40 = latency_buf_io_deq_valid & T41;
  assign T41 = counter == latency;
  assign T42 = T43 & req_data_buf_io_enq_ready;
  assign T43 = T44 & io_sim_mem_req_data_valid;
  assign T44 = io_sim_mem_req_cmd_valid & req_cmd_buf_io_enq_ready;
  Queue_7 req_cmd_buf(.clk(clk), .reset(reset),
       .io_enq_ready( req_cmd_buf_io_enq_ready ),
       .io_enq_valid( T19 ),
       .io_enq_bits_addr( io_sim_mem_req_cmd_target_bits_addr ),
       .io_enq_bits_tag( io_sim_mem_req_cmd_target_bits_tag ),
       .io_enq_bits_rw( io_sim_mem_req_cmd_target_bits_rw ),
       .io_deq_ready( io_host_mem_req_cmd_ready ),
       .io_deq_valid( req_cmd_buf_io_deq_valid ),
       .io_deq_bits_addr( req_cmd_buf_io_deq_bits_addr ),
       .io_deq_bits_tag( req_cmd_buf_io_deq_bits_tag ),
       .io_deq_bits_rw( req_cmd_buf_io_deq_bits_rw )
       //.io_count(  )
  );
  Queue_8 req_data_buf(.clk(clk), .reset(reset),
       .io_enq_ready( req_data_buf_io_enq_ready ),
       .io_enq_valid( T18 ),
       .io_enq_bits_data( io_sim_mem_req_data_target_bits_data ),
       .io_deq_ready( io_host_mem_req_data_ready ),
       .io_deq_valid( req_data_buf_io_deq_valid ),
       .io_deq_bits_data( req_data_buf_io_deq_bits_data )
       //.io_count(  )
  );
  Queue_9 resp_buf(.clk(clk), .reset(reset),
       .io_enq_ready( resp_buf_io_enq_ready ),
       .io_enq_valid( io_host_mem_resp_valid ),
       .io_enq_bits_data( io_host_mem_resp_bits_data ),
       .io_enq_bits_tag( io_host_mem_resp_bits_tag ),
       .io_deq_ready( T15 ),
       .io_deq_valid( resp_buf_io_deq_valid ),
       .io_deq_bits_data( resp_buf_io_deq_bits_data ),
       .io_deq_bits_tag( resp_buf_io_deq_bits_tag )
       //.io_count(  )
  );
  HellaQueue latency_buf(.clk(clk), .reset(T45),
       .io_enq_ready( latency_buf_io_enq_ready ),
       .io_enq_valid( T13 ),
       .io_enq_bits_valid( resp_buf_io_deq_valid ),
       .io_enq_bits_bits_data( resp_buf_io_deq_bits_data ),
       .io_enq_bits_bits_tag( resp_buf_io_deq_bits_tag ),
       .io_deq_ready( T0 ),
       .io_deq_valid( latency_buf_io_deq_valid ),
       .io_deq_bits_valid( latency_buf_io_deq_bits_valid ),
       .io_deq_bits_bits_data( latency_buf_io_deq_bits_bits_data ),
       .io_deq_bits_bits_tag( latency_buf_io_deq_bits_bits_tag )
       //.io_count(  )
  );

  always @(posedge clk) begin
    if(reset) begin
      latency <= 9'h0;
    end else if(T3) begin
      latency <= io_latency_bits;
    end
    if(reset) begin
      counter <= 9'h0;
    end else if(T7) begin
      counter <= T6;
    end else if(T3) begin
      counter <= 9'h0;
    end
  end
endmodule

module NastiShim(input clk, input reset,
    output io_master_aw_ready,
    input  io_master_aw_valid,
    input [31:0] io_master_aw_bits_addr,
    input [7:0] io_master_aw_bits_len,
    input [2:0] io_master_aw_bits_size,
    input [1:0] io_master_aw_bits_burst,
    input  io_master_aw_bits_lock,
    input [3:0] io_master_aw_bits_cache,
    input [2:0] io_master_aw_bits_prot,
    input [3:0] io_master_aw_bits_qos,
    input [3:0] io_master_aw_bits_region,
    input [11:0] io_master_aw_bits_id,
    input  io_master_aw_bits_user,
    output io_master_w_ready,
    input  io_master_w_valid,
    input [31:0] io_master_w_bits_data,
    input  io_master_w_bits_last,
    input [3:0] io_master_w_bits_strb,
    input  io_master_w_bits_user,
    input  io_master_b_ready,
    output io_master_b_valid,
    output[1:0] io_master_b_bits_resp,
    output[11:0] io_master_b_bits_id,
    output io_master_b_bits_user,
    output io_master_ar_ready,
    input  io_master_ar_valid,
    input [31:0] io_master_ar_bits_addr,
    input [7:0] io_master_ar_bits_len,
    input [2:0] io_master_ar_bits_size,
    input [1:0] io_master_ar_bits_burst,
    input  io_master_ar_bits_lock,
    input [3:0] io_master_ar_bits_cache,
    input [2:0] io_master_ar_bits_prot,
    input [3:0] io_master_ar_bits_qos,
    input [3:0] io_master_ar_bits_region,
    input [11:0] io_master_ar_bits_id,
    input  io_master_ar_bits_user,
    input  io_master_r_ready,
    output io_master_r_valid,
    output[1:0] io_master_r_bits_resp,
    output[31:0] io_master_r_bits_data,
    output io_master_r_bits_last,
    output[11:0] io_master_r_bits_id,
    output io_master_r_bits_user,
    input  io_slave_aw_ready,
    output io_slave_aw_valid,
    output[31:0] io_slave_aw_bits_addr,
    output[7:0] io_slave_aw_bits_len,
    output[2:0] io_slave_aw_bits_size,
    output[1:0] io_slave_aw_bits_burst,
    output io_slave_aw_bits_lock,
    output[3:0] io_slave_aw_bits_cache,
    output[2:0] io_slave_aw_bits_prot,
    output[3:0] io_slave_aw_bits_qos,
    output[3:0] io_slave_aw_bits_region,
    output[5:0] io_slave_aw_bits_id,
    output io_slave_aw_bits_user,
    input  io_slave_w_ready,
    output io_slave_w_valid,
    output[63:0] io_slave_w_bits_data,
    output io_slave_w_bits_last,
    output[7:0] io_slave_w_bits_strb,
    output io_slave_w_bits_user,
    output io_slave_b_ready,
    input  io_slave_b_valid,
    input [1:0] io_slave_b_bits_resp,
    input [5:0] io_slave_b_bits_id,
    input  io_slave_b_bits_user,
    input  io_slave_ar_ready,
    output io_slave_ar_valid,
    output[31:0] io_slave_ar_bits_addr,
    output[7:0] io_slave_ar_bits_len,
    output[2:0] io_slave_ar_bits_size,
    output[1:0] io_slave_ar_bits_burst,
    output io_slave_ar_bits_lock,
    output[3:0] io_slave_ar_bits_cache,
    output[2:0] io_slave_ar_bits_prot,
    output[3:0] io_slave_ar_bits_qos,
    output[3:0] io_slave_ar_bits_region,
    output[5:0] io_slave_ar_bits_id,
    output io_slave_ar_bits_user,
    output io_slave_r_ready,
    input  io_slave_r_valid,
    input [1:0] io_slave_r_bits_resp,
    input [63:0] io_slave_r_bits_data,
    input  io_slave_r_bits_last,
    input [5:0] io_slave_r_bits_id,
    input  io_slave_r_bits_user
);

  wire[8:0] T135;
  wire T0;
  wire T1;
  wire T2;
  wire T3;
  wire[63:0] T4;
  wire[63:0] T5;
  wire T6;
  wire T7;
  wire T8;
  wire[4:0] T9;
  wire[31:0] T10;
  wire T11;
  wire T12;
  wire T13;
  wire T14;
  wire[4:0] T15;
  wire[4:0] T16;
  wire[31:0] T17;
  wire[63:0] T18;
  wire[31:0] T136;
  wire[63:0] T19;
  wire[63:0] T20;
  wire[31:0] T137;
  wire T21;
  wire T22;
  reg [31:0] tockCounter;
  wire[31:0] T138;
  wire[31:0] T23;
  wire[31:0] T24;
  wire[31:0] T25;
  wire[31:0] T26;
  wire tock;
  wire T27;
  wire T28;
  wire T29;
  wire T30;
  wire T31;
  wire T32;
  wire T33;
  wire T34;
  wire T35;
  wire T36;
  wire T37;
  wire T38;
  wire T39;
  wire T40;
  wire T41;
  wire T42;
  wire T43;
  wire T44;
  reg [31:0] tickCounter;
  wire[31:0] T139;
  wire[31:0] T45;
  wire[31:0] T46;
  wire[31:0] T47;
  wire tick;
  wire T48;
  wire T49;
  wire T50;
  wire T51;
  wire T52;
  wire T53;
  wire T54;
  wire T55;
  wire T56;
  wire T57;
  wire T58;
  wire T59;
  wire T60;
  wire T61;
  wire T62;
  wire T63;
  wire T64;
  wire T65;
  wire T66;
  wire T67;
  wire T68;
  wire T69;
  wire T70;
  wire T71;
  wire T72;
  wire T73;
  wire T74;
  wire T75;
  wire T76;
  wire T77;
  wire T78;
  wire T79;
  wire T80;
  wire T81;
  wire T82;
  wire T83;
  wire T84;
  wire T85;
  wire T86;
  wire[63:0] T87;
  wire[63:0] T88;
  wire T89;
  wire T90;
  wire[4:0] T91;
  wire[31:0] T92;
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
  wire T117;
  wire T118;
  wire T119;
  wire T120;
  wire T121;
  wire T122;
  wire T123;
  wire T124;
  wire T125;
  wire T126;
  wire T127;
  wire T128;
  wire[10:0] T140;
  wire[31:0] T141;
  wire[63:0] T129;
  wire[63:0] T130;
  wire[31:0] T131;
  wire[63:0] T132;
  wire[4:0] T133;
  wire[4:0] T134;
  wire in_buf_0_io_enq_ready;
  wire in_buf_0_io_deq_valid;
  wire in_buf_0_io_deq_bits;
  wire in_buf_1_io_enq_ready;
  wire in_buf_1_io_deq_valid;
  wire[31:0] in_buf_1_io_deq_bits;
  wire in_buf_2_io_enq_ready;
  wire in_buf_2_io_deq_valid;
  wire in_buf_2_io_deq_bits;
  wire in_buf_3_io_enq_ready;
  wire in_buf_3_io_deq_valid;
  wire in_buf_3_io_deq_bits;
  wire in_buf_4_io_enq_ready;
  wire in_buf_4_io_deq_valid;
  wire in_buf_4_io_deq_bits;
  wire in_buf_5_io_enq_ready;
  wire in_buf_5_io_deq_valid;
  wire[1:0] in_buf_5_io_deq_bits;
  wire in_buf_6_io_enq_ready;
  wire in_buf_6_io_deq_valid;
  wire[4:0] in_buf_6_io_deq_bits;
  wire in_buf_7_io_enq_ready;
  wire in_buf_7_io_deq_valid;
  wire in_buf_7_io_deq_bits;
  wire in_buf_8_io_enq_ready;
  wire in_buf_8_io_deq_valid;
  wire in_buf_8_io_deq_bits;
  wire in_buf_9_io_enq_ready;
  wire in_buf_9_io_deq_valid;
  wire in_buf_9_io_deq_bits;
  wire in_buf_10_io_enq_ready;
  wire in_buf_10_io_deq_valid;
  wire[1:0] in_buf_10_io_deq_bits;
  wire in_buf_11_io_enq_ready;
  wire in_buf_11_io_deq_valid;
  wire[31:0] in_buf_11_io_deq_bits;
  wire in_buf_12_io_enq_ready;
  wire in_buf_12_io_deq_valid;
  wire[31:0] in_buf_12_io_deq_bits;
  wire in_buf_13_io_enq_ready;
  wire in_buf_13_io_deq_valid;
  wire in_buf_13_io_deq_bits;
  wire in_buf_14_io_enq_ready;
  wire in_buf_14_io_deq_valid;
  wire[4:0] in_buf_14_io_deq_bits;
  wire in_buf_15_io_enq_ready;
  wire in_buf_15_io_deq_valid;
  wire in_buf_15_io_deq_bits;
  wire out_buf_0_io_enq_ready;
  wire out_buf_0_io_deq_valid;
  wire[31:0] out_buf_0_io_deq_bits;
  wire arb_io_ins_1_req_cmd_ready;
  wire arb_io_ins_1_req_data_ready;
  wire arb_io_ins_1_resp_valid;
  wire[63:0] arb_io_ins_1_resp_bits_data;
  wire[4:0] arb_io_ins_1_resp_bits_tag;
  wire arb_io_ins_0_req_cmd_ready;
  wire arb_io_ins_0_req_data_ready;
  wire arb_io_ins_0_resp_valid;
  wire[63:0] arb_io_ins_0_resp_bits_data;
  wire[4:0] arb_io_ins_0_resp_bits_tag;
  wire arb_io_out_req_cmd_valid;
  wire[31:0] arb_io_out_req_cmd_bits_addr;
  wire[4:0] arb_io_out_req_cmd_bits_tag;
  wire arb_io_out_req_cmd_bits_rw;
  wire arb_io_out_req_data_valid;
  wire[63:0] arb_io_out_req_data_bits_data;
  wire arb_io_out_resp_ready;
  wire master_io_nasti_aw_ready;
  wire master_io_nasti_w_ready;
  wire master_io_nasti_b_valid;
  wire[1:0] master_io_nasti_b_bits_resp;
  wire[11:0] master_io_nasti_b_bits_id;
  wire master_io_nasti_b_bits_user;
  wire master_io_nasti_ar_ready;
  wire master_io_nasti_r_valid;
  wire[1:0] master_io_nasti_r_bits_resp;
  wire[31:0] master_io_nasti_r_bits_data;
  wire master_io_nasti_r_bits_last;
  wire[11:0] master_io_nasti_r_bits_id;
  wire master_io_nasti_r_bits_user;
  wire master_io_step_valid;
  wire[31:0] master_io_step_bits;
  wire master_io_len_valid;
  wire[31:0] master_io_len_bits;
  wire master_io_lat_valid;
  wire[31:0] master_io_lat_bits;
  wire master_io_ins_15_valid;
  wire master_io_ins_15_bits;
  wire master_io_ins_14_valid;
  wire[4:0] master_io_ins_14_bits;
  wire master_io_ins_13_valid;
  wire master_io_ins_13_bits;
  wire master_io_ins_12_valid;
  wire[31:0] master_io_ins_12_bits;
  wire master_io_ins_11_valid;
  wire[31:0] master_io_ins_11_bits;
  wire master_io_ins_10_valid;
  wire[1:0] master_io_ins_10_bits;
  wire master_io_ins_9_valid;
  wire master_io_ins_9_bits;
  wire master_io_ins_8_valid;
  wire master_io_ins_8_bits;
  wire master_io_ins_7_valid;
  wire master_io_ins_7_bits;
  wire master_io_ins_6_valid;
  wire[4:0] master_io_ins_6_bits;
  wire master_io_ins_5_valid;
  wire[1:0] master_io_ins_5_bits;
  wire master_io_ins_4_valid;
  wire master_io_ins_4_bits;
  wire master_io_ins_3_valid;
  wire master_io_ins_3_bits;
  wire master_io_ins_2_valid;
  wire master_io_ins_2_bits;
  wire master_io_ins_1_valid;
  wire[31:0] master_io_ins_1_bits;
  wire master_io_ins_0_valid;
  wire master_io_ins_0_bits;
  wire master_io_outs_0_ready;
  wire master_io_inT_21_ready;
  wire master_io_inT_20_ready;
  wire master_io_inT_19_ready;
  wire master_io_inT_18_ready;
  wire master_io_inT_17_ready;
  wire master_io_inT_16_ready;
  wire master_io_inT_15_ready;
  wire master_io_inT_14_ready;
  wire master_io_inT_13_ready;
  wire master_io_inT_12_ready;
  wire master_io_inT_11_ready;
  wire master_io_inT_10_ready;
  wire master_io_inT_9_ready;
  wire master_io_inT_8_ready;
  wire master_io_inT_7_ready;
  wire master_io_inT_6_ready;
  wire master_io_inT_5_ready;
  wire master_io_inT_4_ready;
  wire master_io_inT_3_ready;
  wire master_io_inT_2_ready;
  wire master_io_inT_1_ready;
  wire master_io_inT_0_ready;
  wire master_io_outT_8_ready;
  wire master_io_outT_7_ready;
  wire master_io_outT_6_ready;
  wire master_io_outT_5_ready;
  wire master_io_outT_4_ready;
  wire master_io_outT_3_ready;
  wire master_io_outT_2_ready;
  wire master_io_outT_1_ready;
  wire master_io_outT_0_ready;
  wire master_io_daisy_regs_in_valid;
  wire[31:0] master_io_daisy_regs_in_bits;
  wire master_io_daisy_regs_out_ready;
  wire master_io_daisy_trace_in_valid;
  wire[31:0] master_io_daisy_trace_in_bits;
  wire master_io_daisy_trace_out_ready;
  wire master_io_daisy_sram_1_in_valid;
  wire[31:0] master_io_daisy_sram_1_in_bits;
  wire master_io_daisy_sram_1_out_ready;
  wire master_io_daisy_sram_1_restart;
  wire master_io_daisy_sram_0_in_valid;
  wire[31:0] master_io_daisy_sram_0_in_bits;
  wire master_io_daisy_sram_0_out_ready;
  wire master_io_daisy_sram_0_restart;
  wire master_io_daisy_cntr_out_ready;
  wire master_io_reset_t;
  wire master_io_req_cmd_rw_channel_0_valid;
  wire master_io_req_cmd_rw_channel_0_bits;
  wire master_io_req_cmd_tag_channel_0_valid;
  wire[4:0] master_io_req_cmd_tag_channel_0_bits;
  wire master_io_req_cmd_addr_channel_0_valid;
  wire[31:0] master_io_req_cmd_addr_channel_0_bits;
  wire master_io_req_data_data_channel_1_valid;
  wire[31:0] master_io_req_data_data_channel_1_bits;
  wire master_io_req_data_data_channel_0_valid;
  wire[31:0] master_io_req_data_data_channel_0_bits;
  wire master_io_resp_tag_channel_0_ready;
  wire master_io_resp_data_channel_1_ready;
  wire master_io_resp_data_channel_0_ready;
  wire slave_io_mem_req_cmd_ready;
  wire slave_io_mem_req_data_ready;
  wire slave_io_mem_resp_valid;
  wire[63:0] slave_io_mem_resp_bits_data;
  wire[4:0] slave_io_mem_resp_bits_tag;
  wire slave_io_nasti_aw_valid;
  wire[31:0] slave_io_nasti_aw_bits_addr;
  wire[7:0] slave_io_nasti_aw_bits_len;
  wire[2:0] slave_io_nasti_aw_bits_size;
  wire[1:0] slave_io_nasti_aw_bits_burst;
  wire slave_io_nasti_aw_bits_lock;
  wire[3:0] slave_io_nasti_aw_bits_cache;
  wire[2:0] slave_io_nasti_aw_bits_prot;
  wire[3:0] slave_io_nasti_aw_bits_qos;
  wire[3:0] slave_io_nasti_aw_bits_region;
  wire[5:0] slave_io_nasti_aw_bits_id;
  wire slave_io_nasti_aw_bits_user;
  wire slave_io_nasti_w_valid;
  wire[63:0] slave_io_nasti_w_bits_data;
  wire slave_io_nasti_w_bits_last;
  wire[7:0] slave_io_nasti_w_bits_strb;
  wire slave_io_nasti_w_bits_user;
  wire slave_io_nasti_b_ready;
  wire slave_io_nasti_ar_valid;
  wire[31:0] slave_io_nasti_ar_bits_addr;
  wire[7:0] slave_io_nasti_ar_bits_len;
  wire[2:0] slave_io_nasti_ar_bits_size;
  wire[1:0] slave_io_nasti_ar_bits_burst;
  wire slave_io_nasti_ar_bits_lock;
  wire[3:0] slave_io_nasti_ar_bits_cache;
  wire[2:0] slave_io_nasti_ar_bits_prot;
  wire[3:0] slave_io_nasti_ar_bits_qos;
  wire[3:0] slave_io_nasti_ar_bits_region;
  wire[5:0] slave_io_nasti_ar_bits_id;
  wire slave_io_nasti_ar_bits_user;
  wire slave_io_nasti_r_ready;
  wire Channel_req_cmd_addr_0_io_in_ready;
  wire Channel_req_cmd_addr_0_io_out_valid;
  wire[31:0] Channel_req_cmd_addr_0_io_out_bits;
  wire Channel_req_cmd_tag_0_io_in_ready;
  wire Channel_req_cmd_tag_0_io_out_valid;
  wire[4:0] Channel_req_cmd_tag_0_io_out_bits;
  wire Channel_req_cmd_rw_0_io_in_ready;
  wire Channel_req_cmd_rw_0_io_out_valid;
  wire Channel_req_cmd_rw_0_io_out_bits;
  wire Channel_req_data_data_0_io_in_ready;
  wire Channel_req_data_data_0_io_out_valid;
  wire[31:0] Channel_req_data_data_0_io_out_bits;
  wire Channel_req_data_data_1_io_in_ready;
  wire Channel_req_data_data_1_io_out_valid;
  wire[31:0] Channel_req_data_data_1_io_out_bits;
  wire Channel_resp_data_0_io_out_valid;
  wire[31:0] Channel_resp_data_0_io_out_bits;
  wire Channel_resp_data_1_io_out_valid;
  wire[31:0] Channel_resp_data_1_io_out_bits;
  wire Channel_resp_tag_0_io_out_valid;
  wire[4:0] Channel_resp_tag_0_io_out_bits;
  wire mem_conv_0_io_sim_mem_req_cmd_ready;
  wire mem_conv_0_io_sim_mem_req_cmd_target_ready;
  wire mem_conv_0_io_sim_mem_req_data_ready;
  wire mem_conv_0_io_sim_mem_req_data_target_ready;
  wire mem_conv_0_io_sim_mem_resp_valid;
  wire mem_conv_0_io_sim_mem_resp_target_valid;
  wire[63:0] mem_conv_0_io_sim_mem_resp_target_bits_data;
  wire[4:0] mem_conv_0_io_sim_mem_resp_target_bits_tag;
  wire mem_conv_0_io_host_mem_req_cmd_valid;
  wire[31:0] mem_conv_0_io_host_mem_req_cmd_bits_addr;
  wire[4:0] mem_conv_0_io_host_mem_req_cmd_bits_tag;
  wire mem_conv_0_io_host_mem_req_cmd_bits_rw;
  wire mem_conv_0_io_host_mem_req_data_valid;
  wire[63:0] mem_conv_0_io_host_mem_req_data_bits_data;
  wire mem_conv_0_io_host_mem_resp_ready;
  wire mem_conv_0_io_latency_ready;
  wire TileWrapper_io_nasti_r_bits_user_channel_0_ready;
  wire TileWrapper_io_nasti_r_bits_id_channel_0_ready;
  wire TileWrapper_io_nasti_r_bits_last_channel_0_ready;
  wire TileWrapper_io_nasti_r_bits_data_channel_1_ready;
  wire TileWrapper_io_nasti_r_bits_data_channel_0_ready;
  wire TileWrapper_io_nasti_r_bits_resp_channel_0_ready;
  wire TileWrapper_io_nasti_r_valid_channel_0_ready;
  wire TileWrapper_io_nasti_ar_ready_channel_0_ready;
  wire TileWrapper_io_nasti_b_bits_user_channel_0_ready;
  wire TileWrapper_io_nasti_b_bits_id_channel_0_ready;
  wire TileWrapper_io_nasti_b_bits_resp_channel_0_ready;
  wire TileWrapper_io_nasti_b_valid_channel_0_ready;
  wire TileWrapper_io_nasti_w_ready_channel_0_ready;
  wire TileWrapper_io_nasti_aw_ready_channel_0_ready;
  wire TileWrapper_io_mem_resp_bits_tag_channel_0_ready;
  wire TileWrapper_io_mem_resp_bits_data_channel_1_ready;
  wire TileWrapper_io_mem_resp_bits_data_channel_0_ready;
  wire TileWrapper_io_mem_resp_valid_channel_0_ready;
  wire TileWrapper_io_mem_req_data_ready_channel_0_ready;
  wire TileWrapper_io_mem_req_cmd_ready_channel_0_ready;
  wire TileWrapper_io_htif_host_fromhost_bits_channel_0_ready;
  wire TileWrapper_io_htif_host_fromhost_valid_channel_0_ready;
  wire TileWrapper_io_mem_resp_ready_channel_0_valid;
  wire TileWrapper_io_mem_resp_ready_channel_0_bits;
  wire TileWrapper_io_mem_req_data_bits_data_channel_1_valid;
  wire[31:0] TileWrapper_io_mem_req_data_bits_data_channel_1_bits;
  wire TileWrapper_io_mem_req_data_bits_data_channel_0_valid;
  wire[31:0] TileWrapper_io_mem_req_data_bits_data_channel_0_bits;
  wire TileWrapper_io_mem_req_data_valid_channel_0_valid;
  wire TileWrapper_io_mem_req_data_valid_channel_0_bits;
  wire TileWrapper_io_mem_req_cmd_bits_rw_channel_0_valid;
  wire TileWrapper_io_mem_req_cmd_bits_rw_channel_0_bits;
  wire TileWrapper_io_mem_req_cmd_bits_tag_channel_0_valid;
  wire[4:0] TileWrapper_io_mem_req_cmd_bits_tag_channel_0_bits;
  wire TileWrapper_io_mem_req_cmd_bits_addr_channel_0_valid;
  wire[31:0] TileWrapper_io_mem_req_cmd_bits_addr_channel_0_bits;
  wire TileWrapper_io_mem_req_cmd_valid_channel_0_valid;
  wire TileWrapper_io_mem_req_cmd_valid_channel_0_bits;
  wire TileWrapper_io_htif_host_tohost_channel_0_valid;
  wire[31:0] TileWrapper_io_htif_host_tohost_channel_0_bits;
  wire TileWrapper_io_nasti_r_bits_user_trace_0_valid;
  wire TileWrapper_io_nasti_r_bits_user_trace_0_bits;
  wire TileWrapper_io_nasti_r_bits_id_trace_0_valid;
  wire[4:0] TileWrapper_io_nasti_r_bits_id_trace_0_bits;
  wire TileWrapper_io_nasti_r_bits_last_trace_0_valid;
  wire TileWrapper_io_nasti_r_bits_last_trace_0_bits;
  wire TileWrapper_io_nasti_r_bits_data_trace_1_valid;
  wire[31:0] TileWrapper_io_nasti_r_bits_data_trace_1_bits;
  wire TileWrapper_io_nasti_r_bits_data_trace_0_valid;
  wire[31:0] TileWrapper_io_nasti_r_bits_data_trace_0_bits;
  wire TileWrapper_io_nasti_r_bits_resp_trace_0_valid;
  wire[1:0] TileWrapper_io_nasti_r_bits_resp_trace_0_bits;
  wire TileWrapper_io_nasti_r_valid_trace_0_valid;
  wire TileWrapper_io_nasti_r_valid_trace_0_bits;
  wire TileWrapper_io_nasti_ar_ready_trace_0_valid;
  wire TileWrapper_io_nasti_ar_ready_trace_0_bits;
  wire TileWrapper_io_nasti_b_bits_user_trace_0_valid;
  wire TileWrapper_io_nasti_b_bits_user_trace_0_bits;
  wire TileWrapper_io_nasti_b_bits_id_trace_0_valid;
  wire[4:0] TileWrapper_io_nasti_b_bits_id_trace_0_bits;
  wire TileWrapper_io_nasti_b_bits_resp_trace_0_valid;
  wire[1:0] TileWrapper_io_nasti_b_bits_resp_trace_0_bits;
  wire TileWrapper_io_nasti_b_valid_trace_0_valid;
  wire TileWrapper_io_nasti_b_valid_trace_0_bits;
  wire TileWrapper_io_nasti_w_ready_trace_0_valid;
  wire TileWrapper_io_nasti_w_ready_trace_0_bits;
  wire TileWrapper_io_nasti_aw_ready_trace_0_valid;
  wire TileWrapper_io_nasti_aw_ready_trace_0_bits;
  wire TileWrapper_io_mem_resp_bits_tag_trace_0_valid;
  wire[4:0] TileWrapper_io_mem_resp_bits_tag_trace_0_bits;
  wire TileWrapper_io_mem_resp_bits_data_trace_1_valid;
  wire[31:0] TileWrapper_io_mem_resp_bits_data_trace_1_bits;
  wire TileWrapper_io_mem_resp_bits_data_trace_0_valid;
  wire[31:0] TileWrapper_io_mem_resp_bits_data_trace_0_bits;
  wire TileWrapper_io_mem_resp_valid_trace_0_valid;
  wire TileWrapper_io_mem_resp_valid_trace_0_bits;
  wire TileWrapper_io_mem_req_data_ready_trace_0_valid;
  wire TileWrapper_io_mem_req_data_ready_trace_0_bits;
  wire TileWrapper_io_mem_req_cmd_ready_trace_0_valid;
  wire TileWrapper_io_mem_req_cmd_ready_trace_0_bits;
  wire TileWrapper_io_htif_host_fromhost_bits_trace_0_valid;
  wire[31:0] TileWrapper_io_htif_host_fromhost_bits_trace_0_bits;
  wire TileWrapper_io_htif_host_fromhost_valid_trace_0_valid;
  wire TileWrapper_io_htif_host_fromhost_valid_trace_0_bits;
  wire TileWrapper_io_mem_resp_ready_trace_0_valid;
  wire TileWrapper_io_mem_resp_ready_trace_0_bits;
  wire TileWrapper_io_mem_req_data_bits_data_trace_1_valid;
  wire[31:0] TileWrapper_io_mem_req_data_bits_data_trace_1_bits;
  wire TileWrapper_io_mem_req_data_bits_data_trace_0_valid;
  wire[31:0] TileWrapper_io_mem_req_data_bits_data_trace_0_bits;
  wire TileWrapper_io_mem_req_data_valid_trace_0_valid;
  wire TileWrapper_io_mem_req_data_valid_trace_0_bits;
  wire TileWrapper_io_mem_req_cmd_bits_rw_trace_0_valid;
  wire TileWrapper_io_mem_req_cmd_bits_rw_trace_0_bits;
  wire TileWrapper_io_mem_req_cmd_bits_tag_trace_0_valid;
  wire[4:0] TileWrapper_io_mem_req_cmd_bits_tag_trace_0_bits;
  wire TileWrapper_io_mem_req_cmd_bits_addr_trace_0_valid;
  wire[31:0] TileWrapper_io_mem_req_cmd_bits_addr_trace_0_bits;
  wire TileWrapper_io_mem_req_cmd_valid_trace_0_valid;
  wire TileWrapper_io_mem_req_cmd_valid_trace_0_bits;
  wire TileWrapper_io_htif_host_tohost_trace_0_valid;
  wire[31:0] TileWrapper_io_htif_host_tohost_trace_0_bits;
  wire TileWrapper_io_daisy_regs_out_valid;
  wire[31:0] TileWrapper_io_daisy_regs_out_bits;
  wire TileWrapper_io_daisy_trace_out_valid;
  wire[31:0] TileWrapper_io_daisy_trace_out_bits;
  wire TileWrapper_io_daisy_sram_1_out_valid;
  wire[31:0] TileWrapper_io_daisy_sram_1_out_bits;
  wire TileWrapper_io_daisy_sram_0_out_valid;
  wire[31:0] TileWrapper_io_daisy_sram_0_out_bits;
  wire TileWrapper_io_daisy_cntr_out_valid;
  wire[31:0] TileWrapper_io_daisy_cntr_out_bits;
  wire TileWrapper_io_traceLen_ready;

`ifndef SYNTHESIS
// synthesis translate_off
  integer initvar;
  initial begin
    #0.002;
    tockCounter = {1{$random}};
    tickCounter = {1{$random}};
  end
// synthesis translate_on
`endif

  assign T135 = master_io_lat_bits[4'h8:1'h0];
  assign T0 = T1 & TileWrapper_io_mem_resp_bits_tag_channel_0_ready;
  assign T1 = T2 & TileWrapper_io_mem_resp_bits_data_channel_1_ready;
  assign T2 = T3 & TileWrapper_io_mem_resp_bits_data_channel_0_ready;
  assign T3 = TileWrapper_io_mem_resp_ready_channel_0_valid & TileWrapper_io_mem_resp_valid_channel_0_ready;
  assign T4 = T5;
  assign T5 = {TileWrapper_io_mem_req_data_bits_data_channel_1_bits, TileWrapper_io_mem_req_data_bits_data_channel_0_bits};
  assign T6 = T7 & TileWrapper_io_mem_req_data_bits_data_channel_1_valid;
  assign T7 = T8 & TileWrapper_io_mem_req_data_bits_data_channel_0_valid;
  assign T8 = TileWrapper_io_mem_req_data_ready_channel_0_ready & TileWrapper_io_mem_req_data_valid_channel_0_valid;
  assign T9 = TileWrapper_io_mem_req_cmd_bits_tag_channel_0_bits;
  assign T10 = TileWrapper_io_mem_req_cmd_bits_addr_channel_0_bits;
  assign T11 = T12 & TileWrapper_io_mem_req_cmd_bits_rw_channel_0_valid;
  assign T12 = T13 & TileWrapper_io_mem_req_cmd_bits_tag_channel_0_valid;
  assign T13 = T14 & TileWrapper_io_mem_req_cmd_bits_addr_channel_0_valid;
  assign T14 = TileWrapper_io_mem_req_cmd_ready_channel_0_ready & TileWrapper_io_mem_req_cmd_valid_channel_0_valid;
  assign T15 = T16 >> 1'h0;
  assign T16 = arb_io_ins_1_resp_bits_tag;
  assign T17 = T18 >> 6'h20;
  assign T18 = arb_io_ins_1_resp_bits_data;
  assign T136 = T19[5'h1f:1'h0];
  assign T19 = T20 >> 1'h0;
  assign T20 = arb_io_ins_1_resp_bits_data;
  assign T137 = {31'h0, T21};
  assign T21 = T22 ^ 1'h1;
  assign T22 = tockCounter != 32'h0;
  assign T138 = reset ? 32'h0 : T23;
  assign T23 = T38 ? 32'h1 : T24;
  assign T24 = T37 ? master_io_step_bits : T25;
  assign T25 = tock ? T26 : tockCounter;
  assign T26 = tockCounter - 32'h1;
  assign tock = T35 & T27;
  assign T27 = T28 & TileWrapper_io_mem_resp_ready_channel_0_valid;
  assign T28 = T29 & TileWrapper_io_mem_req_data_bits_data_channel_1_valid;
  assign T29 = T30 & TileWrapper_io_mem_req_data_bits_data_channel_0_valid;
  assign T30 = T31 & TileWrapper_io_mem_req_data_valid_channel_0_valid;
  assign T31 = T32 & TileWrapper_io_mem_req_cmd_bits_rw_channel_0_valid;
  assign T32 = T33 & TileWrapper_io_mem_req_cmd_bits_tag_channel_0_valid;
  assign T33 = T34 & TileWrapper_io_mem_req_cmd_bits_addr_channel_0_valid;
  assign T34 = TileWrapper_io_htif_host_tohost_channel_0_valid & TileWrapper_io_mem_req_cmd_valid_channel_0_valid;
  assign T35 = out_buf_0_io_enq_ready | T36;
  assign T36 = tockCounter != 32'h0;
  assign T37 = T40 & master_io_step_valid;
  assign T38 = T39 & master_io_reset_t;
  assign T39 = T37 ^ 1'h1;
  assign T40 = T43 & T41;
  assign T41 = T42 ^ 1'h1;
  assign T42 = tockCounter != 32'h0;
  assign T43 = T44 ^ 1'h1;
  assign T44 = tickCounter != 32'h0;
  assign T139 = reset ? 32'h0 : T45;
  assign T45 = T37 ? master_io_step_bits : T46;
  assign T46 = tick ? T47 : tickCounter;
  assign T47 = tickCounter - 32'h1;
  assign tick = T69 & T48;
  assign T48 = T49 & TileWrapper_io_nasti_r_bits_user_channel_0_ready;
  assign T49 = T50 & TileWrapper_io_nasti_r_bits_id_channel_0_ready;
  assign T50 = T51 & TileWrapper_io_nasti_r_bits_last_channel_0_ready;
  assign T51 = T52 & TileWrapper_io_nasti_r_bits_data_channel_1_ready;
  assign T52 = T53 & TileWrapper_io_nasti_r_bits_data_channel_0_ready;
  assign T53 = T54 & TileWrapper_io_nasti_r_bits_resp_channel_0_ready;
  assign T54 = T55 & TileWrapper_io_nasti_r_valid_channel_0_ready;
  assign T55 = T56 & TileWrapper_io_nasti_ar_ready_channel_0_ready;
  assign T56 = T57 & TileWrapper_io_nasti_b_bits_user_channel_0_ready;
  assign T57 = T58 & TileWrapper_io_nasti_b_bits_id_channel_0_ready;
  assign T58 = T59 & TileWrapper_io_nasti_b_bits_resp_channel_0_ready;
  assign T59 = T60 & TileWrapper_io_nasti_b_valid_channel_0_ready;
  assign T60 = T61 & TileWrapper_io_nasti_w_ready_channel_0_ready;
  assign T61 = T62 & TileWrapper_io_nasti_aw_ready_channel_0_ready;
  assign T62 = T63 & TileWrapper_io_mem_resp_bits_tag_channel_0_ready;
  assign T63 = T64 & TileWrapper_io_mem_resp_bits_data_channel_1_ready;
  assign T64 = T65 & TileWrapper_io_mem_resp_bits_data_channel_0_ready;
  assign T65 = T66 & TileWrapper_io_mem_resp_valid_channel_0_ready;
  assign T66 = T67 & TileWrapper_io_mem_req_data_ready_channel_0_ready;
  assign T67 = T68 & TileWrapper_io_mem_req_cmd_ready_channel_0_ready;
  assign T68 = TileWrapper_io_htif_host_fromhost_valid_channel_0_ready & TileWrapper_io_htif_host_fromhost_bits_channel_0_ready;
  assign T69 = T70 & in_buf_15_io_deq_valid;
  assign T70 = T71 & in_buf_14_io_deq_valid;
  assign T71 = T72 & in_buf_13_io_deq_valid;
  assign T72 = T73 & in_buf_12_io_deq_valid;
  assign T73 = T74 & in_buf_11_io_deq_valid;
  assign T74 = T75 & in_buf_10_io_deq_valid;
  assign T75 = T76 & in_buf_9_io_deq_valid;
  assign T76 = T77 & in_buf_8_io_deq_valid;
  assign T77 = T78 & in_buf_7_io_deq_valid;
  assign T78 = T79 & in_buf_6_io_deq_valid;
  assign T79 = T80 & in_buf_5_io_deq_valid;
  assign T80 = T81 & in_buf_4_io_deq_valid;
  assign T81 = T82 & in_buf_3_io_deq_valid;
  assign T82 = T83 & in_buf_2_io_deq_valid;
  assign T83 = T84 & in_buf_1_io_deq_valid;
  assign T84 = T85 & in_buf_0_io_deq_valid;
  assign T85 = tickCounter != 32'h0;
  assign T86 = Channel_req_data_data_0_io_in_ready & Channel_req_data_data_1_io_in_ready;
  assign T87 = T88;
  assign T88 = {Channel_req_data_data_1_io_out_bits, Channel_req_data_data_0_io_out_bits};
  assign T89 = Channel_req_data_data_0_io_out_valid & Channel_req_data_data_1_io_out_valid;
  assign T90 = Channel_req_cmd_rw_0_io_out_bits;
  assign T91 = Channel_req_cmd_tag_0_io_out_bits;
  assign T92 = Channel_req_cmd_addr_0_io_out_bits;
  assign T93 = T94 & Channel_req_cmd_rw_0_io_out_valid;
  assign T94 = Channel_req_cmd_addr_0_io_out_valid & Channel_req_cmd_tag_0_io_out_valid;
  assign T95 = tock & T96;
  assign T96 = tockCounter == 32'h1;
  assign T97 = tick & T98;
  assign T98 = tickCounter == 32'h1;
  assign T99 = tick & T100;
  assign T100 = tickCounter == 32'h1;
  assign T101 = tick & T102;
  assign T102 = tickCounter == 32'h1;
  assign T103 = tick & T104;
  assign T104 = tickCounter == 32'h1;
  assign T105 = tick & T106;
  assign T106 = tickCounter == 32'h1;
  assign T107 = tick & T108;
  assign T108 = tickCounter == 32'h1;
  assign T109 = tick & T110;
  assign T110 = tickCounter == 32'h1;
  assign T111 = tick & T112;
  assign T112 = tickCounter == 32'h1;
  assign T113 = tick & T114;
  assign T114 = tickCounter == 32'h1;
  assign T115 = tick & T116;
  assign T116 = tickCounter == 32'h1;
  assign T117 = tick & T118;
  assign T118 = tickCounter == 32'h1;
  assign T119 = tick & T120;
  assign T120 = tickCounter == 32'h1;
  assign T121 = tick & T122;
  assign T122 = tickCounter == 32'h1;
  assign T123 = tick & T124;
  assign T124 = tickCounter == 32'h1;
  assign T125 = tick & T126;
  assign T126 = tickCounter == 32'h1;
  assign T127 = tick & T128;
  assign T128 = tickCounter == 32'h1;
  assign T140 = master_io_len_bits[4'ha:1'h0];
  assign T141 = T129[5'h1f:1'h0];
  assign T129 = T130 >> 1'h0;
  assign T130 = mem_conv_0_io_sim_mem_resp_target_bits_data;
  assign T131 = T132 >> 6'h20;
  assign T132 = mem_conv_0_io_sim_mem_resp_target_bits_data;
  assign T133 = T134 >> 1'h0;
  assign T134 = mem_conv_0_io_sim_mem_resp_target_bits_tag;
  assign io_slave_r_ready = slave_io_nasti_r_ready;
  assign io_slave_ar_bits_user = slave_io_nasti_ar_bits_user;
  assign io_slave_ar_bits_id = slave_io_nasti_ar_bits_id;
  assign io_slave_ar_bits_region = slave_io_nasti_ar_bits_region;
  assign io_slave_ar_bits_qos = slave_io_nasti_ar_bits_qos;
  assign io_slave_ar_bits_prot = slave_io_nasti_ar_bits_prot;
  assign io_slave_ar_bits_cache = slave_io_nasti_ar_bits_cache;
  assign io_slave_ar_bits_lock = slave_io_nasti_ar_bits_lock;
  assign io_slave_ar_bits_burst = slave_io_nasti_ar_bits_burst;
  assign io_slave_ar_bits_size = slave_io_nasti_ar_bits_size;
  assign io_slave_ar_bits_len = slave_io_nasti_ar_bits_len;
  assign io_slave_ar_bits_addr = slave_io_nasti_ar_bits_addr;
  assign io_slave_ar_valid = slave_io_nasti_ar_valid;
  assign io_slave_b_ready = slave_io_nasti_b_ready;
  assign io_slave_w_bits_user = slave_io_nasti_w_bits_user;
  assign io_slave_w_bits_strb = slave_io_nasti_w_bits_strb;
  assign io_slave_w_bits_last = slave_io_nasti_w_bits_last;
  assign io_slave_w_bits_data = slave_io_nasti_w_bits_data;
  assign io_slave_w_valid = slave_io_nasti_w_valid;
  assign io_slave_aw_bits_user = slave_io_nasti_aw_bits_user;
  assign io_slave_aw_bits_id = slave_io_nasti_aw_bits_id;
  assign io_slave_aw_bits_region = slave_io_nasti_aw_bits_region;
  assign io_slave_aw_bits_qos = slave_io_nasti_aw_bits_qos;
  assign io_slave_aw_bits_prot = slave_io_nasti_aw_bits_prot;
  assign io_slave_aw_bits_cache = slave_io_nasti_aw_bits_cache;
  assign io_slave_aw_bits_lock = slave_io_nasti_aw_bits_lock;
  assign io_slave_aw_bits_burst = slave_io_nasti_aw_bits_burst;
  assign io_slave_aw_bits_size = slave_io_nasti_aw_bits_size;
  assign io_slave_aw_bits_len = slave_io_nasti_aw_bits_len;
  assign io_slave_aw_bits_addr = slave_io_nasti_aw_bits_addr;
  assign io_slave_aw_valid = slave_io_nasti_aw_valid;
  assign io_master_r_bits_user = master_io_nasti_r_bits_user;
  assign io_master_r_bits_id = master_io_nasti_r_bits_id;
  assign io_master_r_bits_last = master_io_nasti_r_bits_last;
  assign io_master_r_bits_data = master_io_nasti_r_bits_data;
  assign io_master_r_bits_resp = master_io_nasti_r_bits_resp;
  assign io_master_r_valid = master_io_nasti_r_valid;
  assign io_master_ar_ready = master_io_nasti_ar_ready;
  assign io_master_b_bits_user = master_io_nasti_b_bits_user;
  assign io_master_b_bits_id = master_io_nasti_b_bits_id;
  assign io_master_b_bits_resp = master_io_nasti_b_bits_resp;
  assign io_master_b_valid = master_io_nasti_b_valid;
  assign io_master_w_ready = master_io_nasti_w_ready;
  assign io_master_aw_ready = master_io_nasti_aw_ready;
  SimWrapper TileWrapper(.clk(clk), .reset(master_io_reset_t),
       .io_nasti_r_bits_user_channel_0_ready( TileWrapper_io_nasti_r_bits_user_channel_0_ready ),
       .io_nasti_r_bits_user_channel_0_valid( tick ),
       .io_nasti_r_bits_user_channel_0_bits( in_buf_15_io_deq_bits ),
       .io_nasti_r_bits_id_channel_0_ready( TileWrapper_io_nasti_r_bits_id_channel_0_ready ),
       .io_nasti_r_bits_id_channel_0_valid( tick ),
       .io_nasti_r_bits_id_channel_0_bits( in_buf_14_io_deq_bits ),
       .io_nasti_r_bits_last_channel_0_ready( TileWrapper_io_nasti_r_bits_last_channel_0_ready ),
       .io_nasti_r_bits_last_channel_0_valid( tick ),
       .io_nasti_r_bits_last_channel_0_bits( in_buf_13_io_deq_bits ),
       .io_nasti_r_bits_data_channel_1_ready( TileWrapper_io_nasti_r_bits_data_channel_1_ready ),
       .io_nasti_r_bits_data_channel_1_valid( tick ),
       .io_nasti_r_bits_data_channel_1_bits( in_buf_12_io_deq_bits ),
       .io_nasti_r_bits_data_channel_0_ready( TileWrapper_io_nasti_r_bits_data_channel_0_ready ),
       .io_nasti_r_bits_data_channel_0_valid( tick ),
       .io_nasti_r_bits_data_channel_0_bits( in_buf_11_io_deq_bits ),
       .io_nasti_r_bits_resp_channel_0_ready( TileWrapper_io_nasti_r_bits_resp_channel_0_ready ),
       .io_nasti_r_bits_resp_channel_0_valid( tick ),
       .io_nasti_r_bits_resp_channel_0_bits( in_buf_10_io_deq_bits ),
       .io_nasti_r_valid_channel_0_ready( TileWrapper_io_nasti_r_valid_channel_0_ready ),
       .io_nasti_r_valid_channel_0_valid( tick ),
       .io_nasti_r_valid_channel_0_bits( in_buf_9_io_deq_bits ),
       .io_nasti_ar_ready_channel_0_ready( TileWrapper_io_nasti_ar_ready_channel_0_ready ),
       .io_nasti_ar_ready_channel_0_valid( tick ),
       .io_nasti_ar_ready_channel_0_bits( in_buf_8_io_deq_bits ),
       .io_nasti_b_bits_user_channel_0_ready( TileWrapper_io_nasti_b_bits_user_channel_0_ready ),
       .io_nasti_b_bits_user_channel_0_valid( tick ),
       .io_nasti_b_bits_user_channel_0_bits( in_buf_7_io_deq_bits ),
       .io_nasti_b_bits_id_channel_0_ready( TileWrapper_io_nasti_b_bits_id_channel_0_ready ),
       .io_nasti_b_bits_id_channel_0_valid( tick ),
       .io_nasti_b_bits_id_channel_0_bits( in_buf_6_io_deq_bits ),
       .io_nasti_b_bits_resp_channel_0_ready( TileWrapper_io_nasti_b_bits_resp_channel_0_ready ),
       .io_nasti_b_bits_resp_channel_0_valid( tick ),
       .io_nasti_b_bits_resp_channel_0_bits( in_buf_5_io_deq_bits ),
       .io_nasti_b_valid_channel_0_ready( TileWrapper_io_nasti_b_valid_channel_0_ready ),
       .io_nasti_b_valid_channel_0_valid( tick ),
       .io_nasti_b_valid_channel_0_bits( in_buf_4_io_deq_bits ),
       .io_nasti_w_ready_channel_0_ready( TileWrapper_io_nasti_w_ready_channel_0_ready ),
       .io_nasti_w_ready_channel_0_valid( tick ),
       .io_nasti_w_ready_channel_0_bits( in_buf_3_io_deq_bits ),
       .io_nasti_aw_ready_channel_0_ready( TileWrapper_io_nasti_aw_ready_channel_0_ready ),
       .io_nasti_aw_ready_channel_0_valid( tick ),
       .io_nasti_aw_ready_channel_0_bits( in_buf_2_io_deq_bits ),
       .io_mem_resp_bits_tag_channel_0_ready( TileWrapper_io_mem_resp_bits_tag_channel_0_ready ),
       .io_mem_resp_bits_tag_channel_0_valid( mem_conv_0_io_sim_mem_resp_valid ),
       .io_mem_resp_bits_tag_channel_0_bits( T133 ),
       .io_mem_resp_bits_data_channel_1_ready( TileWrapper_io_mem_resp_bits_data_channel_1_ready ),
       .io_mem_resp_bits_data_channel_1_valid( mem_conv_0_io_sim_mem_resp_valid ),
       .io_mem_resp_bits_data_channel_1_bits( T131 ),
       .io_mem_resp_bits_data_channel_0_ready( TileWrapper_io_mem_resp_bits_data_channel_0_ready ),
       .io_mem_resp_bits_data_channel_0_valid( mem_conv_0_io_sim_mem_resp_valid ),
       .io_mem_resp_bits_data_channel_0_bits( T141 ),
       .io_mem_resp_valid_channel_0_ready( TileWrapper_io_mem_resp_valid_channel_0_ready ),
       .io_mem_resp_valid_channel_0_valid( mem_conv_0_io_sim_mem_resp_valid ),
       .io_mem_resp_valid_channel_0_bits( mem_conv_0_io_sim_mem_resp_target_valid ),
       .io_mem_req_data_ready_channel_0_ready( TileWrapper_io_mem_req_data_ready_channel_0_ready ),
       .io_mem_req_data_ready_channel_0_valid( mem_conv_0_io_sim_mem_req_data_ready ),
       .io_mem_req_data_ready_channel_0_bits( mem_conv_0_io_sim_mem_req_data_target_ready ),
       .io_mem_req_cmd_ready_channel_0_ready( TileWrapper_io_mem_req_cmd_ready_channel_0_ready ),
       .io_mem_req_cmd_ready_channel_0_valid( mem_conv_0_io_sim_mem_req_cmd_ready ),
       .io_mem_req_cmd_ready_channel_0_bits( mem_conv_0_io_sim_mem_req_cmd_target_ready ),
       .io_htif_host_fromhost_bits_channel_0_ready( TileWrapper_io_htif_host_fromhost_bits_channel_0_ready ),
       .io_htif_host_fromhost_bits_channel_0_valid( tick ),
       .io_htif_host_fromhost_bits_channel_0_bits( in_buf_1_io_deq_bits ),
       .io_htif_host_fromhost_valid_channel_0_ready( TileWrapper_io_htif_host_fromhost_valid_channel_0_ready ),
       .io_htif_host_fromhost_valid_channel_0_valid( tick ),
       .io_htif_host_fromhost_valid_channel_0_bits( in_buf_0_io_deq_bits ),
       .io_mem_resp_ready_channel_0_ready( mem_conv_0_io_sim_mem_resp_valid ),
       .io_mem_resp_ready_channel_0_valid( TileWrapper_io_mem_resp_ready_channel_0_valid ),
       .io_mem_resp_ready_channel_0_bits( TileWrapper_io_mem_resp_ready_channel_0_bits ),
       .io_mem_req_data_bits_data_channel_1_ready( mem_conv_0_io_sim_mem_req_data_ready ),
       .io_mem_req_data_bits_data_channel_1_valid( TileWrapper_io_mem_req_data_bits_data_channel_1_valid ),
       .io_mem_req_data_bits_data_channel_1_bits( TileWrapper_io_mem_req_data_bits_data_channel_1_bits ),
       .io_mem_req_data_bits_data_channel_0_ready( mem_conv_0_io_sim_mem_req_data_ready ),
       .io_mem_req_data_bits_data_channel_0_valid( TileWrapper_io_mem_req_data_bits_data_channel_0_valid ),
       .io_mem_req_data_bits_data_channel_0_bits( TileWrapper_io_mem_req_data_bits_data_channel_0_bits ),
       .io_mem_req_data_valid_channel_0_ready( mem_conv_0_io_sim_mem_req_data_ready ),
       .io_mem_req_data_valid_channel_0_valid( TileWrapper_io_mem_req_data_valid_channel_0_valid ),
       .io_mem_req_data_valid_channel_0_bits( TileWrapper_io_mem_req_data_valid_channel_0_bits ),
       .io_mem_req_cmd_bits_rw_channel_0_ready( mem_conv_0_io_sim_mem_req_cmd_ready ),
       .io_mem_req_cmd_bits_rw_channel_0_valid( TileWrapper_io_mem_req_cmd_bits_rw_channel_0_valid ),
       .io_mem_req_cmd_bits_rw_channel_0_bits( TileWrapper_io_mem_req_cmd_bits_rw_channel_0_bits ),
       .io_mem_req_cmd_bits_tag_channel_0_ready( mem_conv_0_io_sim_mem_req_cmd_ready ),
       .io_mem_req_cmd_bits_tag_channel_0_valid( TileWrapper_io_mem_req_cmd_bits_tag_channel_0_valid ),
       .io_mem_req_cmd_bits_tag_channel_0_bits( TileWrapper_io_mem_req_cmd_bits_tag_channel_0_bits ),
       .io_mem_req_cmd_bits_addr_channel_0_ready( mem_conv_0_io_sim_mem_req_cmd_ready ),
       .io_mem_req_cmd_bits_addr_channel_0_valid( TileWrapper_io_mem_req_cmd_bits_addr_channel_0_valid ),
       .io_mem_req_cmd_bits_addr_channel_0_bits( TileWrapper_io_mem_req_cmd_bits_addr_channel_0_bits ),
       .io_mem_req_cmd_valid_channel_0_ready( mem_conv_0_io_sim_mem_req_cmd_ready ),
       .io_mem_req_cmd_valid_channel_0_valid( TileWrapper_io_mem_req_cmd_valid_channel_0_valid ),
       .io_mem_req_cmd_valid_channel_0_bits( TileWrapper_io_mem_req_cmd_valid_channel_0_bits ),
       .io_htif_host_tohost_channel_0_ready( tock ),
       .io_htif_host_tohost_channel_0_valid( TileWrapper_io_htif_host_tohost_channel_0_valid ),
       .io_htif_host_tohost_channel_0_bits( TileWrapper_io_htif_host_tohost_channel_0_bits ),
       .io_nasti_r_bits_user_trace_0_ready( master_io_inT_21_ready ),
       .io_nasti_r_bits_user_trace_0_valid( TileWrapper_io_nasti_r_bits_user_trace_0_valid ),
       .io_nasti_r_bits_user_trace_0_bits( TileWrapper_io_nasti_r_bits_user_trace_0_bits ),
       .io_nasti_r_bits_id_trace_0_ready( master_io_inT_20_ready ),
       .io_nasti_r_bits_id_trace_0_valid( TileWrapper_io_nasti_r_bits_id_trace_0_valid ),
       .io_nasti_r_bits_id_trace_0_bits( TileWrapper_io_nasti_r_bits_id_trace_0_bits ),
       .io_nasti_r_bits_last_trace_0_ready( master_io_inT_19_ready ),
       .io_nasti_r_bits_last_trace_0_valid( TileWrapper_io_nasti_r_bits_last_trace_0_valid ),
       .io_nasti_r_bits_last_trace_0_bits( TileWrapper_io_nasti_r_bits_last_trace_0_bits ),
       .io_nasti_r_bits_data_trace_1_ready( master_io_inT_18_ready ),
       .io_nasti_r_bits_data_trace_1_valid( TileWrapper_io_nasti_r_bits_data_trace_1_valid ),
       .io_nasti_r_bits_data_trace_1_bits( TileWrapper_io_nasti_r_bits_data_trace_1_bits ),
       .io_nasti_r_bits_data_trace_0_ready( master_io_inT_17_ready ),
       .io_nasti_r_bits_data_trace_0_valid( TileWrapper_io_nasti_r_bits_data_trace_0_valid ),
       .io_nasti_r_bits_data_trace_0_bits( TileWrapper_io_nasti_r_bits_data_trace_0_bits ),
       .io_nasti_r_bits_resp_trace_0_ready( master_io_inT_16_ready ),
       .io_nasti_r_bits_resp_trace_0_valid( TileWrapper_io_nasti_r_bits_resp_trace_0_valid ),
       .io_nasti_r_bits_resp_trace_0_bits( TileWrapper_io_nasti_r_bits_resp_trace_0_bits ),
       .io_nasti_r_valid_trace_0_ready( master_io_inT_15_ready ),
       .io_nasti_r_valid_trace_0_valid( TileWrapper_io_nasti_r_valid_trace_0_valid ),
       .io_nasti_r_valid_trace_0_bits( TileWrapper_io_nasti_r_valid_trace_0_bits ),
       .io_nasti_ar_ready_trace_0_ready( master_io_inT_14_ready ),
       .io_nasti_ar_ready_trace_0_valid( TileWrapper_io_nasti_ar_ready_trace_0_valid ),
       .io_nasti_ar_ready_trace_0_bits( TileWrapper_io_nasti_ar_ready_trace_0_bits ),
       .io_nasti_b_bits_user_trace_0_ready( master_io_inT_13_ready ),
       .io_nasti_b_bits_user_trace_0_valid( TileWrapper_io_nasti_b_bits_user_trace_0_valid ),
       .io_nasti_b_bits_user_trace_0_bits( TileWrapper_io_nasti_b_bits_user_trace_0_bits ),
       .io_nasti_b_bits_id_trace_0_ready( master_io_inT_12_ready ),
       .io_nasti_b_bits_id_trace_0_valid( TileWrapper_io_nasti_b_bits_id_trace_0_valid ),
       .io_nasti_b_bits_id_trace_0_bits( TileWrapper_io_nasti_b_bits_id_trace_0_bits ),
       .io_nasti_b_bits_resp_trace_0_ready( master_io_inT_11_ready ),
       .io_nasti_b_bits_resp_trace_0_valid( TileWrapper_io_nasti_b_bits_resp_trace_0_valid ),
       .io_nasti_b_bits_resp_trace_0_bits( TileWrapper_io_nasti_b_bits_resp_trace_0_bits ),
       .io_nasti_b_valid_trace_0_ready( master_io_inT_10_ready ),
       .io_nasti_b_valid_trace_0_valid( TileWrapper_io_nasti_b_valid_trace_0_valid ),
       .io_nasti_b_valid_trace_0_bits( TileWrapper_io_nasti_b_valid_trace_0_bits ),
       .io_nasti_w_ready_trace_0_ready( master_io_inT_9_ready ),
       .io_nasti_w_ready_trace_0_valid( TileWrapper_io_nasti_w_ready_trace_0_valid ),
       .io_nasti_w_ready_trace_0_bits( TileWrapper_io_nasti_w_ready_trace_0_bits ),
       .io_nasti_aw_ready_trace_0_ready( master_io_inT_8_ready ),
       .io_nasti_aw_ready_trace_0_valid( TileWrapper_io_nasti_aw_ready_trace_0_valid ),
       .io_nasti_aw_ready_trace_0_bits( TileWrapper_io_nasti_aw_ready_trace_0_bits ),
       .io_mem_resp_bits_tag_trace_0_ready( master_io_inT_7_ready ),
       .io_mem_resp_bits_tag_trace_0_valid( TileWrapper_io_mem_resp_bits_tag_trace_0_valid ),
       .io_mem_resp_bits_tag_trace_0_bits( TileWrapper_io_mem_resp_bits_tag_trace_0_bits ),
       .io_mem_resp_bits_data_trace_1_ready( master_io_inT_6_ready ),
       .io_mem_resp_bits_data_trace_1_valid( TileWrapper_io_mem_resp_bits_data_trace_1_valid ),
       .io_mem_resp_bits_data_trace_1_bits( TileWrapper_io_mem_resp_bits_data_trace_1_bits ),
       .io_mem_resp_bits_data_trace_0_ready( master_io_inT_5_ready ),
       .io_mem_resp_bits_data_trace_0_valid( TileWrapper_io_mem_resp_bits_data_trace_0_valid ),
       .io_mem_resp_bits_data_trace_0_bits( TileWrapper_io_mem_resp_bits_data_trace_0_bits ),
       .io_mem_resp_valid_trace_0_ready( master_io_inT_4_ready ),
       .io_mem_resp_valid_trace_0_valid( TileWrapper_io_mem_resp_valid_trace_0_valid ),
       .io_mem_resp_valid_trace_0_bits( TileWrapper_io_mem_resp_valid_trace_0_bits ),
       .io_mem_req_data_ready_trace_0_ready( master_io_inT_3_ready ),
       .io_mem_req_data_ready_trace_0_valid( TileWrapper_io_mem_req_data_ready_trace_0_valid ),
       .io_mem_req_data_ready_trace_0_bits( TileWrapper_io_mem_req_data_ready_trace_0_bits ),
       .io_mem_req_cmd_ready_trace_0_ready( master_io_inT_2_ready ),
       .io_mem_req_cmd_ready_trace_0_valid( TileWrapper_io_mem_req_cmd_ready_trace_0_valid ),
       .io_mem_req_cmd_ready_trace_0_bits( TileWrapper_io_mem_req_cmd_ready_trace_0_bits ),
       .io_htif_host_fromhost_bits_trace_0_ready( master_io_inT_1_ready ),
       .io_htif_host_fromhost_bits_trace_0_valid( TileWrapper_io_htif_host_fromhost_bits_trace_0_valid ),
       .io_htif_host_fromhost_bits_trace_0_bits( TileWrapper_io_htif_host_fromhost_bits_trace_0_bits ),
       .io_htif_host_fromhost_valid_trace_0_ready( master_io_inT_0_ready ),
       .io_htif_host_fromhost_valid_trace_0_valid( TileWrapper_io_htif_host_fromhost_valid_trace_0_valid ),
       .io_htif_host_fromhost_valid_trace_0_bits( TileWrapper_io_htif_host_fromhost_valid_trace_0_bits ),
       .io_mem_resp_ready_trace_0_ready( master_io_outT_8_ready ),
       .io_mem_resp_ready_trace_0_valid( TileWrapper_io_mem_resp_ready_trace_0_valid ),
       .io_mem_resp_ready_trace_0_bits( TileWrapper_io_mem_resp_ready_trace_0_bits ),
       .io_mem_req_data_bits_data_trace_1_ready( master_io_outT_7_ready ),
       .io_mem_req_data_bits_data_trace_1_valid( TileWrapper_io_mem_req_data_bits_data_trace_1_valid ),
       .io_mem_req_data_bits_data_trace_1_bits( TileWrapper_io_mem_req_data_bits_data_trace_1_bits ),
       .io_mem_req_data_bits_data_trace_0_ready( master_io_outT_6_ready ),
       .io_mem_req_data_bits_data_trace_0_valid( TileWrapper_io_mem_req_data_bits_data_trace_0_valid ),
       .io_mem_req_data_bits_data_trace_0_bits( TileWrapper_io_mem_req_data_bits_data_trace_0_bits ),
       .io_mem_req_data_valid_trace_0_ready( master_io_outT_5_ready ),
       .io_mem_req_data_valid_trace_0_valid( TileWrapper_io_mem_req_data_valid_trace_0_valid ),
       .io_mem_req_data_valid_trace_0_bits( TileWrapper_io_mem_req_data_valid_trace_0_bits ),
       .io_mem_req_cmd_bits_rw_trace_0_ready( master_io_outT_4_ready ),
       .io_mem_req_cmd_bits_rw_trace_0_valid( TileWrapper_io_mem_req_cmd_bits_rw_trace_0_valid ),
       .io_mem_req_cmd_bits_rw_trace_0_bits( TileWrapper_io_mem_req_cmd_bits_rw_trace_0_bits ),
       .io_mem_req_cmd_bits_tag_trace_0_ready( master_io_outT_3_ready ),
       .io_mem_req_cmd_bits_tag_trace_0_valid( TileWrapper_io_mem_req_cmd_bits_tag_trace_0_valid ),
       .io_mem_req_cmd_bits_tag_trace_0_bits( TileWrapper_io_mem_req_cmd_bits_tag_trace_0_bits ),
       .io_mem_req_cmd_bits_addr_trace_0_ready( master_io_outT_2_ready ),
       .io_mem_req_cmd_bits_addr_trace_0_valid( TileWrapper_io_mem_req_cmd_bits_addr_trace_0_valid ),
       .io_mem_req_cmd_bits_addr_trace_0_bits( TileWrapper_io_mem_req_cmd_bits_addr_trace_0_bits ),
       .io_mem_req_cmd_valid_trace_0_ready( master_io_outT_1_ready ),
       .io_mem_req_cmd_valid_trace_0_valid( TileWrapper_io_mem_req_cmd_valid_trace_0_valid ),
       .io_mem_req_cmd_valid_trace_0_bits( TileWrapper_io_mem_req_cmd_valid_trace_0_bits ),
       .io_htif_host_tohost_trace_0_ready( master_io_outT_0_ready ),
       .io_htif_host_tohost_trace_0_valid( TileWrapper_io_htif_host_tohost_trace_0_valid ),
       .io_htif_host_tohost_trace_0_bits( TileWrapper_io_htif_host_tohost_trace_0_bits ),
       //.io_daisy_regs_in_ready(  )
       .io_daisy_regs_in_valid( master_io_daisy_regs_in_valid ),
       .io_daisy_regs_in_bits( master_io_daisy_regs_in_bits ),
       .io_daisy_regs_out_ready( master_io_daisy_regs_out_ready ),
       .io_daisy_regs_out_valid( TileWrapper_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( TileWrapper_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       .io_daisy_trace_in_valid( master_io_daisy_trace_in_valid ),
       .io_daisy_trace_in_bits( master_io_daisy_trace_in_bits ),
       .io_daisy_trace_out_ready( master_io_daisy_trace_out_ready ),
       .io_daisy_trace_out_valid( TileWrapper_io_daisy_trace_out_valid ),
       .io_daisy_trace_out_bits( TileWrapper_io_daisy_trace_out_bits ),
       //.io_daisy_sram_1_in_ready(  )
       .io_daisy_sram_1_in_valid( master_io_daisy_sram_1_in_valid ),
       .io_daisy_sram_1_in_bits( master_io_daisy_sram_1_in_bits ),
       .io_daisy_sram_1_out_ready( master_io_daisy_sram_1_out_ready ),
       .io_daisy_sram_1_out_valid( TileWrapper_io_daisy_sram_1_out_valid ),
       .io_daisy_sram_1_out_bits( TileWrapper_io_daisy_sram_1_out_bits ),
       .io_daisy_sram_1_restart( master_io_daisy_sram_1_restart ),
       //.io_daisy_sram_0_in_ready(  )
       .io_daisy_sram_0_in_valid( master_io_daisy_sram_0_in_valid ),
       .io_daisy_sram_0_in_bits( master_io_daisy_sram_0_in_bits ),
       .io_daisy_sram_0_out_ready( master_io_daisy_sram_0_out_ready ),
       .io_daisy_sram_0_out_valid( TileWrapper_io_daisy_sram_0_out_valid ),
       .io_daisy_sram_0_out_bits( TileWrapper_io_daisy_sram_0_out_bits ),
       .io_daisy_sram_0_restart( master_io_daisy_sram_0_restart ),
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       .io_daisy_cntr_out_ready( master_io_daisy_cntr_out_ready ),
       .io_daisy_cntr_out_valid( TileWrapper_io_daisy_cntr_out_valid ),
       .io_daisy_cntr_out_bits( TileWrapper_io_daisy_cntr_out_bits ),
       .io_traceLen_ready( TileWrapper_io_traceLen_ready ),
       .io_traceLen_valid( master_io_len_valid ),
       .io_traceLen_bits( T140 )
  );
`ifndef SYNTHESIS
// synthesis translate_off
    assign TileWrapper.io_daisy_trace_out_valid = {1{$random}};
    assign TileWrapper.io_daisy_trace_out_bits = {1{$random}};
    assign TileWrapper.io_daisy_sram_1_out_valid = {1{$random}};
    assign TileWrapper.io_daisy_sram_1_out_bits = {1{$random}};
    assign TileWrapper.io_daisy_cntr_out_valid = {1{$random}};
    assign TileWrapper.io_daisy_cntr_out_bits = {1{$random}};
// synthesis translate_on
`endif
  Queue_0 in_buf_0(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_0_io_enq_ready ),
       .io_enq_valid( master_io_ins_0_valid ),
       .io_enq_bits( master_io_ins_0_bits ),
       .io_deq_ready( T127 ),
       .io_deq_valid( in_buf_0_io_deq_valid ),
       .io_deq_bits( in_buf_0_io_deq_bits )
       //.io_count(  )
  );
  Queue_1 in_buf_1(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_1_io_enq_ready ),
       .io_enq_valid( master_io_ins_1_valid ),
       .io_enq_bits( master_io_ins_1_bits ),
       .io_deq_ready( T125 ),
       .io_deq_valid( in_buf_1_io_deq_valid ),
       .io_deq_bits( in_buf_1_io_deq_bits )
       //.io_count(  )
  );
  Queue_0 in_buf_2(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_2_io_enq_ready ),
       .io_enq_valid( master_io_ins_2_valid ),
       .io_enq_bits( master_io_ins_2_bits ),
       .io_deq_ready( T123 ),
       .io_deq_valid( in_buf_2_io_deq_valid ),
       .io_deq_bits( in_buf_2_io_deq_bits )
       //.io_count(  )
  );
  Queue_0 in_buf_3(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_3_io_enq_ready ),
       .io_enq_valid( master_io_ins_3_valid ),
       .io_enq_bits( master_io_ins_3_bits ),
       .io_deq_ready( T121 ),
       .io_deq_valid( in_buf_3_io_deq_valid ),
       .io_deq_bits( in_buf_3_io_deq_bits )
       //.io_count(  )
  );
  Queue_0 in_buf_4(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_4_io_enq_ready ),
       .io_enq_valid( master_io_ins_4_valid ),
       .io_enq_bits( master_io_ins_4_bits ),
       .io_deq_ready( T119 ),
       .io_deq_valid( in_buf_4_io_deq_valid ),
       .io_deq_bits( in_buf_4_io_deq_bits )
       //.io_count(  )
  );
  Queue_2 in_buf_5(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_5_io_enq_ready ),
       .io_enq_valid( master_io_ins_5_valid ),
       .io_enq_bits( master_io_ins_5_bits ),
       .io_deq_ready( T117 ),
       .io_deq_valid( in_buf_5_io_deq_valid ),
       .io_deq_bits( in_buf_5_io_deq_bits )
       //.io_count(  )
  );
  Queue_3 in_buf_6(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_6_io_enq_ready ),
       .io_enq_valid( master_io_ins_6_valid ),
       .io_enq_bits( master_io_ins_6_bits ),
       .io_deq_ready( T115 ),
       .io_deq_valid( in_buf_6_io_deq_valid ),
       .io_deq_bits( in_buf_6_io_deq_bits )
       //.io_count(  )
  );
  Queue_0 in_buf_7(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_7_io_enq_ready ),
       .io_enq_valid( master_io_ins_7_valid ),
       .io_enq_bits( master_io_ins_7_bits ),
       .io_deq_ready( T113 ),
       .io_deq_valid( in_buf_7_io_deq_valid ),
       .io_deq_bits( in_buf_7_io_deq_bits )
       //.io_count(  )
  );
  Queue_0 in_buf_8(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_8_io_enq_ready ),
       .io_enq_valid( master_io_ins_8_valid ),
       .io_enq_bits( master_io_ins_8_bits ),
       .io_deq_ready( T111 ),
       .io_deq_valid( in_buf_8_io_deq_valid ),
       .io_deq_bits( in_buf_8_io_deq_bits )
       //.io_count(  )
  );
  Queue_0 in_buf_9(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_9_io_enq_ready ),
       .io_enq_valid( master_io_ins_9_valid ),
       .io_enq_bits( master_io_ins_9_bits ),
       .io_deq_ready( T109 ),
       .io_deq_valid( in_buf_9_io_deq_valid ),
       .io_deq_bits( in_buf_9_io_deq_bits )
       //.io_count(  )
  );
  Queue_2 in_buf_10(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_10_io_enq_ready ),
       .io_enq_valid( master_io_ins_10_valid ),
       .io_enq_bits( master_io_ins_10_bits ),
       .io_deq_ready( T107 ),
       .io_deq_valid( in_buf_10_io_deq_valid ),
       .io_deq_bits( in_buf_10_io_deq_bits )
       //.io_count(  )
  );
  Queue_1 in_buf_11(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_11_io_enq_ready ),
       .io_enq_valid( master_io_ins_11_valid ),
       .io_enq_bits( master_io_ins_11_bits ),
       .io_deq_ready( T105 ),
       .io_deq_valid( in_buf_11_io_deq_valid ),
       .io_deq_bits( in_buf_11_io_deq_bits )
       //.io_count(  )
  );
  Queue_1 in_buf_12(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_12_io_enq_ready ),
       .io_enq_valid( master_io_ins_12_valid ),
       .io_enq_bits( master_io_ins_12_bits ),
       .io_deq_ready( T103 ),
       .io_deq_valid( in_buf_12_io_deq_valid ),
       .io_deq_bits( in_buf_12_io_deq_bits )
       //.io_count(  )
  );
  Queue_0 in_buf_13(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_13_io_enq_ready ),
       .io_enq_valid( master_io_ins_13_valid ),
       .io_enq_bits( master_io_ins_13_bits ),
       .io_deq_ready( T101 ),
       .io_deq_valid( in_buf_13_io_deq_valid ),
       .io_deq_bits( in_buf_13_io_deq_bits )
       //.io_count(  )
  );
  Queue_3 in_buf_14(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_14_io_enq_ready ),
       .io_enq_valid( master_io_ins_14_valid ),
       .io_enq_bits( master_io_ins_14_bits ),
       .io_deq_ready( T99 ),
       .io_deq_valid( in_buf_14_io_deq_valid ),
       .io_deq_bits( in_buf_14_io_deq_bits )
       //.io_count(  )
  );
  Queue_0 in_buf_15(.clk(clk), .reset(reset),
       .io_enq_ready( in_buf_15_io_enq_ready ),
       .io_enq_valid( master_io_ins_15_valid ),
       .io_enq_bits( master_io_ins_15_bits ),
       .io_deq_ready( T97 ),
       .io_deq_valid( in_buf_15_io_deq_valid ),
       .io_deq_bits( in_buf_15_io_deq_bits )
       //.io_count(  )
  );
  Queue_1 out_buf_0(.clk(clk), .reset(reset),
       .io_enq_ready( out_buf_0_io_enq_ready ),
       .io_enq_valid( T95 ),
       .io_enq_bits( TileWrapper_io_htif_host_tohost_channel_0_bits ),
       .io_deq_ready( master_io_outs_0_ready ),
       .io_deq_valid( out_buf_0_io_deq_valid ),
       .io_deq_bits( out_buf_0_io_deq_bits )
       //.io_count(  )
  );
  MemArbiter arb(.clk(clk), .reset(reset),
       .io_ins_1_req_cmd_ready( arb_io_ins_1_req_cmd_ready ),
       .io_ins_1_req_cmd_valid( T93 ),
       .io_ins_1_req_cmd_bits_addr( T92 ),
       .io_ins_1_req_cmd_bits_tag( T91 ),
       .io_ins_1_req_cmd_bits_rw( T90 ),
       .io_ins_1_req_data_ready( arb_io_ins_1_req_data_ready ),
       .io_ins_1_req_data_valid( T89 ),
       .io_ins_1_req_data_bits_data( T87 ),
       .io_ins_1_resp_ready( T86 ),
       .io_ins_1_resp_valid( arb_io_ins_1_resp_valid ),
       .io_ins_1_resp_bits_data( arb_io_ins_1_resp_bits_data ),
       .io_ins_1_resp_bits_tag( arb_io_ins_1_resp_bits_tag ),
       .io_ins_0_req_cmd_ready( arb_io_ins_0_req_cmd_ready ),
       .io_ins_0_req_cmd_valid( mem_conv_0_io_host_mem_req_cmd_valid ),
       .io_ins_0_req_cmd_bits_addr( mem_conv_0_io_host_mem_req_cmd_bits_addr ),
       .io_ins_0_req_cmd_bits_tag( mem_conv_0_io_host_mem_req_cmd_bits_tag ),
       .io_ins_0_req_cmd_bits_rw( mem_conv_0_io_host_mem_req_cmd_bits_rw ),
       .io_ins_0_req_data_ready( arb_io_ins_0_req_data_ready ),
       .io_ins_0_req_data_valid( mem_conv_0_io_host_mem_req_data_valid ),
       .io_ins_0_req_data_bits_data( mem_conv_0_io_host_mem_req_data_bits_data ),
       .io_ins_0_resp_ready( mem_conv_0_io_host_mem_resp_ready ),
       .io_ins_0_resp_valid( arb_io_ins_0_resp_valid ),
       .io_ins_0_resp_bits_data( arb_io_ins_0_resp_bits_data ),
       .io_ins_0_resp_bits_tag( arb_io_ins_0_resp_bits_tag ),
       .io_out_req_cmd_ready( slave_io_mem_req_cmd_ready ),
       .io_out_req_cmd_valid( arb_io_out_req_cmd_valid ),
       .io_out_req_cmd_bits_addr( arb_io_out_req_cmd_bits_addr ),
       .io_out_req_cmd_bits_tag( arb_io_out_req_cmd_bits_tag ),
       .io_out_req_cmd_bits_rw( arb_io_out_req_cmd_bits_rw ),
       .io_out_req_data_ready( slave_io_mem_req_data_ready ),
       .io_out_req_data_valid( arb_io_out_req_data_valid ),
       .io_out_req_data_bits_data( arb_io_out_req_data_bits_data ),
       .io_out_resp_ready( arb_io_out_resp_ready ),
       .io_out_resp_valid( slave_io_mem_resp_valid ),
       .io_out_resp_bits_data( slave_io_mem_resp_bits_data ),
       .io_out_resp_bits_tag( slave_io_mem_resp_bits_tag )
  );
  NastiMasterHandler master(.clk(clk), .reset(reset),
       .io_nasti_aw_ready( master_io_nasti_aw_ready ),
       .io_nasti_aw_valid( io_master_aw_valid ),
       .io_nasti_aw_bits_addr( io_master_aw_bits_addr ),
       .io_nasti_aw_bits_len( io_master_aw_bits_len ),
       .io_nasti_aw_bits_size( io_master_aw_bits_size ),
       .io_nasti_aw_bits_burst( io_master_aw_bits_burst ),
       .io_nasti_aw_bits_lock( io_master_aw_bits_lock ),
       .io_nasti_aw_bits_cache( io_master_aw_bits_cache ),
       .io_nasti_aw_bits_prot( io_master_aw_bits_prot ),
       .io_nasti_aw_bits_qos( io_master_aw_bits_qos ),
       .io_nasti_aw_bits_region( io_master_aw_bits_region ),
       .io_nasti_aw_bits_id( io_master_aw_bits_id ),
       .io_nasti_aw_bits_user( io_master_aw_bits_user ),
       .io_nasti_w_ready( master_io_nasti_w_ready ),
       .io_nasti_w_valid( io_master_w_valid ),
       .io_nasti_w_bits_data( io_master_w_bits_data ),
       .io_nasti_w_bits_last( io_master_w_bits_last ),
       .io_nasti_w_bits_strb( io_master_w_bits_strb ),
       .io_nasti_w_bits_user( io_master_w_bits_user ),
       .io_nasti_b_ready( io_master_b_ready ),
       .io_nasti_b_valid( master_io_nasti_b_valid ),
       .io_nasti_b_bits_resp( master_io_nasti_b_bits_resp ),
       .io_nasti_b_bits_id( master_io_nasti_b_bits_id ),
       .io_nasti_b_bits_user( master_io_nasti_b_bits_user ),
       .io_nasti_ar_ready( master_io_nasti_ar_ready ),
       .io_nasti_ar_valid( io_master_ar_valid ),
       .io_nasti_ar_bits_addr( io_master_ar_bits_addr ),
       .io_nasti_ar_bits_len( io_master_ar_bits_len ),
       .io_nasti_ar_bits_size( io_master_ar_bits_size ),
       .io_nasti_ar_bits_burst( io_master_ar_bits_burst ),
       .io_nasti_ar_bits_lock( io_master_ar_bits_lock ),
       .io_nasti_ar_bits_cache( io_master_ar_bits_cache ),
       .io_nasti_ar_bits_prot( io_master_ar_bits_prot ),
       .io_nasti_ar_bits_qos( io_master_ar_bits_qos ),
       .io_nasti_ar_bits_region( io_master_ar_bits_region ),
       .io_nasti_ar_bits_id( io_master_ar_bits_id ),
       .io_nasti_ar_bits_user( io_master_ar_bits_user ),
       .io_nasti_r_ready( io_master_r_ready ),
       .io_nasti_r_valid( master_io_nasti_r_valid ),
       .io_nasti_r_bits_resp( master_io_nasti_r_bits_resp ),
       .io_nasti_r_bits_data( master_io_nasti_r_bits_data ),
       .io_nasti_r_bits_last( master_io_nasti_r_bits_last ),
       .io_nasti_r_bits_id( master_io_nasti_r_bits_id ),
       .io_nasti_r_bits_user( master_io_nasti_r_bits_user ),
       .io_step_ready( T40 ),
       .io_step_valid( master_io_step_valid ),
       .io_step_bits( master_io_step_bits ),
       .io_len_ready( TileWrapper_io_traceLen_ready ),
       .io_len_valid( master_io_len_valid ),
       .io_len_bits( master_io_len_bits ),
       .io_lat_ready( mem_conv_0_io_latency_ready ),
       .io_lat_valid( master_io_lat_valid ),
       .io_lat_bits( master_io_lat_bits ),
       //.io_fin_ready(  )
       .io_fin_valid( 1'h1 ),
       .io_fin_bits( T137 ),
       .io_ins_15_ready( in_buf_15_io_enq_ready ),
       .io_ins_15_valid( master_io_ins_15_valid ),
       .io_ins_15_bits( master_io_ins_15_bits ),
       .io_ins_14_ready( in_buf_14_io_enq_ready ),
       .io_ins_14_valid( master_io_ins_14_valid ),
       .io_ins_14_bits( master_io_ins_14_bits ),
       .io_ins_13_ready( in_buf_13_io_enq_ready ),
       .io_ins_13_valid( master_io_ins_13_valid ),
       .io_ins_13_bits( master_io_ins_13_bits ),
       .io_ins_12_ready( in_buf_12_io_enq_ready ),
       .io_ins_12_valid( master_io_ins_12_valid ),
       .io_ins_12_bits( master_io_ins_12_bits ),
       .io_ins_11_ready( in_buf_11_io_enq_ready ),
       .io_ins_11_valid( master_io_ins_11_valid ),
       .io_ins_11_bits( master_io_ins_11_bits ),
       .io_ins_10_ready( in_buf_10_io_enq_ready ),
       .io_ins_10_valid( master_io_ins_10_valid ),
       .io_ins_10_bits( master_io_ins_10_bits ),
       .io_ins_9_ready( in_buf_9_io_enq_ready ),
       .io_ins_9_valid( master_io_ins_9_valid ),
       .io_ins_9_bits( master_io_ins_9_bits ),
       .io_ins_8_ready( in_buf_8_io_enq_ready ),
       .io_ins_8_valid( master_io_ins_8_valid ),
       .io_ins_8_bits( master_io_ins_8_bits ),
       .io_ins_7_ready( in_buf_7_io_enq_ready ),
       .io_ins_7_valid( master_io_ins_7_valid ),
       .io_ins_7_bits( master_io_ins_7_bits ),
       .io_ins_6_ready( in_buf_6_io_enq_ready ),
       .io_ins_6_valid( master_io_ins_6_valid ),
       .io_ins_6_bits( master_io_ins_6_bits ),
       .io_ins_5_ready( in_buf_5_io_enq_ready ),
       .io_ins_5_valid( master_io_ins_5_valid ),
       .io_ins_5_bits( master_io_ins_5_bits ),
       .io_ins_4_ready( in_buf_4_io_enq_ready ),
       .io_ins_4_valid( master_io_ins_4_valid ),
       .io_ins_4_bits( master_io_ins_4_bits ),
       .io_ins_3_ready( in_buf_3_io_enq_ready ),
       .io_ins_3_valid( master_io_ins_3_valid ),
       .io_ins_3_bits( master_io_ins_3_bits ),
       .io_ins_2_ready( in_buf_2_io_enq_ready ),
       .io_ins_2_valid( master_io_ins_2_valid ),
       .io_ins_2_bits( master_io_ins_2_bits ),
       .io_ins_1_ready( in_buf_1_io_enq_ready ),
       .io_ins_1_valid( master_io_ins_1_valid ),
       .io_ins_1_bits( master_io_ins_1_bits ),
       .io_ins_0_ready( in_buf_0_io_enq_ready ),
       .io_ins_0_valid( master_io_ins_0_valid ),
       .io_ins_0_bits( master_io_ins_0_bits ),
       .io_outs_0_ready( master_io_outs_0_ready ),
       .io_outs_0_valid( out_buf_0_io_deq_valid ),
       .io_outs_0_bits( out_buf_0_io_deq_bits ),
       .io_inT_21_ready( master_io_inT_21_ready ),
       .io_inT_21_valid( TileWrapper_io_nasti_r_bits_user_trace_0_valid ),
       .io_inT_21_bits( TileWrapper_io_nasti_r_bits_user_trace_0_bits ),
       .io_inT_20_ready( master_io_inT_20_ready ),
       .io_inT_20_valid( TileWrapper_io_nasti_r_bits_id_trace_0_valid ),
       .io_inT_20_bits( TileWrapper_io_nasti_r_bits_id_trace_0_bits ),
       .io_inT_19_ready( master_io_inT_19_ready ),
       .io_inT_19_valid( TileWrapper_io_nasti_r_bits_last_trace_0_valid ),
       .io_inT_19_bits( TileWrapper_io_nasti_r_bits_last_trace_0_bits ),
       .io_inT_18_ready( master_io_inT_18_ready ),
       .io_inT_18_valid( TileWrapper_io_nasti_r_bits_data_trace_1_valid ),
       .io_inT_18_bits( TileWrapper_io_nasti_r_bits_data_trace_1_bits ),
       .io_inT_17_ready( master_io_inT_17_ready ),
       .io_inT_17_valid( TileWrapper_io_nasti_r_bits_data_trace_0_valid ),
       .io_inT_17_bits( TileWrapper_io_nasti_r_bits_data_trace_0_bits ),
       .io_inT_16_ready( master_io_inT_16_ready ),
       .io_inT_16_valid( TileWrapper_io_nasti_r_bits_resp_trace_0_valid ),
       .io_inT_16_bits( TileWrapper_io_nasti_r_bits_resp_trace_0_bits ),
       .io_inT_15_ready( master_io_inT_15_ready ),
       .io_inT_15_valid( TileWrapper_io_nasti_r_valid_trace_0_valid ),
       .io_inT_15_bits( TileWrapper_io_nasti_r_valid_trace_0_bits ),
       .io_inT_14_ready( master_io_inT_14_ready ),
       .io_inT_14_valid( TileWrapper_io_nasti_ar_ready_trace_0_valid ),
       .io_inT_14_bits( TileWrapper_io_nasti_ar_ready_trace_0_bits ),
       .io_inT_13_ready( master_io_inT_13_ready ),
       .io_inT_13_valid( TileWrapper_io_nasti_b_bits_user_trace_0_valid ),
       .io_inT_13_bits( TileWrapper_io_nasti_b_bits_user_trace_0_bits ),
       .io_inT_12_ready( master_io_inT_12_ready ),
       .io_inT_12_valid( TileWrapper_io_nasti_b_bits_id_trace_0_valid ),
       .io_inT_12_bits( TileWrapper_io_nasti_b_bits_id_trace_0_bits ),
       .io_inT_11_ready( master_io_inT_11_ready ),
       .io_inT_11_valid( TileWrapper_io_nasti_b_bits_resp_trace_0_valid ),
       .io_inT_11_bits( TileWrapper_io_nasti_b_bits_resp_trace_0_bits ),
       .io_inT_10_ready( master_io_inT_10_ready ),
       .io_inT_10_valid( TileWrapper_io_nasti_b_valid_trace_0_valid ),
       .io_inT_10_bits( TileWrapper_io_nasti_b_valid_trace_0_bits ),
       .io_inT_9_ready( master_io_inT_9_ready ),
       .io_inT_9_valid( TileWrapper_io_nasti_w_ready_trace_0_valid ),
       .io_inT_9_bits( TileWrapper_io_nasti_w_ready_trace_0_bits ),
       .io_inT_8_ready( master_io_inT_8_ready ),
       .io_inT_8_valid( TileWrapper_io_nasti_aw_ready_trace_0_valid ),
       .io_inT_8_bits( TileWrapper_io_nasti_aw_ready_trace_0_bits ),
       .io_inT_7_ready( master_io_inT_7_ready ),
       .io_inT_7_valid( TileWrapper_io_mem_resp_bits_tag_trace_0_valid ),
       .io_inT_7_bits( TileWrapper_io_mem_resp_bits_tag_trace_0_bits ),
       .io_inT_6_ready( master_io_inT_6_ready ),
       .io_inT_6_valid( TileWrapper_io_mem_resp_bits_data_trace_1_valid ),
       .io_inT_6_bits( TileWrapper_io_mem_resp_bits_data_trace_1_bits ),
       .io_inT_5_ready( master_io_inT_5_ready ),
       .io_inT_5_valid( TileWrapper_io_mem_resp_bits_data_trace_0_valid ),
       .io_inT_5_bits( TileWrapper_io_mem_resp_bits_data_trace_0_bits ),
       .io_inT_4_ready( master_io_inT_4_ready ),
       .io_inT_4_valid( TileWrapper_io_mem_resp_valid_trace_0_valid ),
       .io_inT_4_bits( TileWrapper_io_mem_resp_valid_trace_0_bits ),
       .io_inT_3_ready( master_io_inT_3_ready ),
       .io_inT_3_valid( TileWrapper_io_mem_req_data_ready_trace_0_valid ),
       .io_inT_3_bits( TileWrapper_io_mem_req_data_ready_trace_0_bits ),
       .io_inT_2_ready( master_io_inT_2_ready ),
       .io_inT_2_valid( TileWrapper_io_mem_req_cmd_ready_trace_0_valid ),
       .io_inT_2_bits( TileWrapper_io_mem_req_cmd_ready_trace_0_bits ),
       .io_inT_1_ready( master_io_inT_1_ready ),
       .io_inT_1_valid( TileWrapper_io_htif_host_fromhost_bits_trace_0_valid ),
       .io_inT_1_bits( TileWrapper_io_htif_host_fromhost_bits_trace_0_bits ),
       .io_inT_0_ready( master_io_inT_0_ready ),
       .io_inT_0_valid( TileWrapper_io_htif_host_fromhost_valid_trace_0_valid ),
       .io_inT_0_bits( TileWrapper_io_htif_host_fromhost_valid_trace_0_bits ),
       .io_outT_8_ready( master_io_outT_8_ready ),
       .io_outT_8_valid( TileWrapper_io_mem_resp_ready_trace_0_valid ),
       .io_outT_8_bits( TileWrapper_io_mem_resp_ready_trace_0_bits ),
       .io_outT_7_ready( master_io_outT_7_ready ),
       .io_outT_7_valid( TileWrapper_io_mem_req_data_bits_data_trace_1_valid ),
       .io_outT_7_bits( TileWrapper_io_mem_req_data_bits_data_trace_1_bits ),
       .io_outT_6_ready( master_io_outT_6_ready ),
       .io_outT_6_valid( TileWrapper_io_mem_req_data_bits_data_trace_0_valid ),
       .io_outT_6_bits( TileWrapper_io_mem_req_data_bits_data_trace_0_bits ),
       .io_outT_5_ready( master_io_outT_5_ready ),
       .io_outT_5_valid( TileWrapper_io_mem_req_data_valid_trace_0_valid ),
       .io_outT_5_bits( TileWrapper_io_mem_req_data_valid_trace_0_bits ),
       .io_outT_4_ready( master_io_outT_4_ready ),
       .io_outT_4_valid( TileWrapper_io_mem_req_cmd_bits_rw_trace_0_valid ),
       .io_outT_4_bits( TileWrapper_io_mem_req_cmd_bits_rw_trace_0_bits ),
       .io_outT_3_ready( master_io_outT_3_ready ),
       .io_outT_3_valid( TileWrapper_io_mem_req_cmd_bits_tag_trace_0_valid ),
       .io_outT_3_bits( TileWrapper_io_mem_req_cmd_bits_tag_trace_0_bits ),
       .io_outT_2_ready( master_io_outT_2_ready ),
       .io_outT_2_valid( TileWrapper_io_mem_req_cmd_bits_addr_trace_0_valid ),
       .io_outT_2_bits( TileWrapper_io_mem_req_cmd_bits_addr_trace_0_bits ),
       .io_outT_1_ready( master_io_outT_1_ready ),
       .io_outT_1_valid( TileWrapper_io_mem_req_cmd_valid_trace_0_valid ),
       .io_outT_1_bits( TileWrapper_io_mem_req_cmd_valid_trace_0_bits ),
       .io_outT_0_ready( master_io_outT_0_ready ),
       .io_outT_0_valid( TileWrapper_io_htif_host_tohost_trace_0_valid ),
       .io_outT_0_bits( TileWrapper_io_htif_host_tohost_trace_0_bits ),
       //.io_daisy_regs_in_ready(  )
       .io_daisy_regs_in_valid( master_io_daisy_regs_in_valid ),
       .io_daisy_regs_in_bits( master_io_daisy_regs_in_bits ),
       .io_daisy_regs_out_ready( master_io_daisy_regs_out_ready ),
       .io_daisy_regs_out_valid( TileWrapper_io_daisy_regs_out_valid ),
       .io_daisy_regs_out_bits( TileWrapper_io_daisy_regs_out_bits ),
       //.io_daisy_trace_in_ready(  )
       .io_daisy_trace_in_valid( master_io_daisy_trace_in_valid ),
       .io_daisy_trace_in_bits( master_io_daisy_trace_in_bits ),
       .io_daisy_trace_out_ready( master_io_daisy_trace_out_ready ),
       .io_daisy_trace_out_valid( TileWrapper_io_daisy_trace_out_valid ),
       .io_daisy_trace_out_bits( TileWrapper_io_daisy_trace_out_bits ),
       //.io_daisy_sram_1_in_ready(  )
       .io_daisy_sram_1_in_valid( master_io_daisy_sram_1_in_valid ),
       .io_daisy_sram_1_in_bits( master_io_daisy_sram_1_in_bits ),
       .io_daisy_sram_1_out_ready( master_io_daisy_sram_1_out_ready ),
       .io_daisy_sram_1_out_valid( TileWrapper_io_daisy_sram_1_out_valid ),
       .io_daisy_sram_1_out_bits( TileWrapper_io_daisy_sram_1_out_bits ),
       .io_daisy_sram_1_restart( master_io_daisy_sram_1_restart ),
       //.io_daisy_sram_0_in_ready(  )
       .io_daisy_sram_0_in_valid( master_io_daisy_sram_0_in_valid ),
       .io_daisy_sram_0_in_bits( master_io_daisy_sram_0_in_bits ),
       .io_daisy_sram_0_out_ready( master_io_daisy_sram_0_out_ready ),
       .io_daisy_sram_0_out_valid( TileWrapper_io_daisy_sram_0_out_valid ),
       .io_daisy_sram_0_out_bits( TileWrapper_io_daisy_sram_0_out_bits ),
       .io_daisy_sram_0_restart( master_io_daisy_sram_0_restart ),
       //.io_daisy_cntr_in_ready(  )
       //.io_daisy_cntr_in_valid(  )
       //.io_daisy_cntr_in_bits(  )
       .io_daisy_cntr_out_ready( master_io_daisy_cntr_out_ready ),
       .io_daisy_cntr_out_valid( TileWrapper_io_daisy_cntr_out_valid ),
       .io_daisy_cntr_out_bits( TileWrapper_io_daisy_cntr_out_bits ),
       .io_reset_t( master_io_reset_t ),
       .io_req_cmd_rw_channel_0_ready( Channel_req_cmd_rw_0_io_in_ready ),
       .io_req_cmd_rw_channel_0_valid( master_io_req_cmd_rw_channel_0_valid ),
       .io_req_cmd_rw_channel_0_bits( master_io_req_cmd_rw_channel_0_bits ),
       .io_req_cmd_tag_channel_0_ready( Channel_req_cmd_tag_0_io_in_ready ),
       .io_req_cmd_tag_channel_0_valid( master_io_req_cmd_tag_channel_0_valid ),
       .io_req_cmd_tag_channel_0_bits( master_io_req_cmd_tag_channel_0_bits ),
       .io_req_cmd_addr_channel_0_ready( Channel_req_cmd_addr_0_io_in_ready ),
       .io_req_cmd_addr_channel_0_valid( master_io_req_cmd_addr_channel_0_valid ),
       .io_req_cmd_addr_channel_0_bits( master_io_req_cmd_addr_channel_0_bits ),
       .io_req_data_data_channel_1_ready( Channel_req_data_data_1_io_in_ready ),
       .io_req_data_data_channel_1_valid( master_io_req_data_data_channel_1_valid ),
       .io_req_data_data_channel_1_bits( master_io_req_data_data_channel_1_bits ),
       .io_req_data_data_channel_0_ready( Channel_req_data_data_0_io_in_ready ),
       .io_req_data_data_channel_0_valid( master_io_req_data_data_channel_0_valid ),
       .io_req_data_data_channel_0_bits( master_io_req_data_data_channel_0_bits ),
       .io_resp_tag_channel_0_ready( master_io_resp_tag_channel_0_ready ),
       .io_resp_tag_channel_0_valid( Channel_resp_tag_0_io_out_valid ),
       .io_resp_tag_channel_0_bits( Channel_resp_tag_0_io_out_bits ),
       .io_resp_data_channel_1_ready( master_io_resp_data_channel_1_ready ),
       .io_resp_data_channel_1_valid( Channel_resp_data_1_io_out_valid ),
       .io_resp_data_channel_1_bits( Channel_resp_data_1_io_out_bits ),
       .io_resp_data_channel_0_ready( master_io_resp_data_channel_0_ready ),
       .io_resp_data_channel_0_valid( Channel_resp_data_0_io_out_valid ),
       .io_resp_data_channel_0_bits( Channel_resp_data_0_io_out_bits )
  );
  NastiSlaveHandler slave(.clk(clk), .reset(reset),
       .io_mem_req_cmd_ready( slave_io_mem_req_cmd_ready ),
       .io_mem_req_cmd_valid( arb_io_out_req_cmd_valid ),
       .io_mem_req_cmd_bits_addr( arb_io_out_req_cmd_bits_addr ),
       .io_mem_req_cmd_bits_tag( arb_io_out_req_cmd_bits_tag ),
       .io_mem_req_cmd_bits_rw( arb_io_out_req_cmd_bits_rw ),
       .io_mem_req_data_ready( slave_io_mem_req_data_ready ),
       .io_mem_req_data_valid( arb_io_out_req_data_valid ),
       .io_mem_req_data_bits_data( arb_io_out_req_data_bits_data ),
       .io_mem_resp_ready( arb_io_out_resp_ready ),
       .io_mem_resp_valid( slave_io_mem_resp_valid ),
       .io_mem_resp_bits_data( slave_io_mem_resp_bits_data ),
       .io_mem_resp_bits_tag( slave_io_mem_resp_bits_tag ),
       .io_nasti_aw_ready( io_slave_aw_ready ),
       .io_nasti_aw_valid( slave_io_nasti_aw_valid ),
       .io_nasti_aw_bits_addr( slave_io_nasti_aw_bits_addr ),
       .io_nasti_aw_bits_len( slave_io_nasti_aw_bits_len ),
       .io_nasti_aw_bits_size( slave_io_nasti_aw_bits_size ),
       .io_nasti_aw_bits_burst( slave_io_nasti_aw_bits_burst ),
       .io_nasti_aw_bits_lock( slave_io_nasti_aw_bits_lock ),
       .io_nasti_aw_bits_cache( slave_io_nasti_aw_bits_cache ),
       .io_nasti_aw_bits_prot( slave_io_nasti_aw_bits_prot ),
       .io_nasti_aw_bits_qos( slave_io_nasti_aw_bits_qos ),
       .io_nasti_aw_bits_region( slave_io_nasti_aw_bits_region ),
       .io_nasti_aw_bits_id( slave_io_nasti_aw_bits_id ),
       .io_nasti_aw_bits_user( slave_io_nasti_aw_bits_user ),
       .io_nasti_w_ready( io_slave_w_ready ),
       .io_nasti_w_valid( slave_io_nasti_w_valid ),
       .io_nasti_w_bits_data( slave_io_nasti_w_bits_data ),
       .io_nasti_w_bits_last( slave_io_nasti_w_bits_last ),
       .io_nasti_w_bits_strb( slave_io_nasti_w_bits_strb ),
       .io_nasti_w_bits_user( slave_io_nasti_w_bits_user ),
       .io_nasti_b_ready( slave_io_nasti_b_ready ),
       .io_nasti_b_valid( io_slave_b_valid ),
       .io_nasti_b_bits_resp( io_slave_b_bits_resp ),
       .io_nasti_b_bits_id( io_slave_b_bits_id ),
       .io_nasti_b_bits_user( io_slave_b_bits_user ),
       .io_nasti_ar_ready( io_slave_ar_ready ),
       .io_nasti_ar_valid( slave_io_nasti_ar_valid ),
       .io_nasti_ar_bits_addr( slave_io_nasti_ar_bits_addr ),
       .io_nasti_ar_bits_len( slave_io_nasti_ar_bits_len ),
       .io_nasti_ar_bits_size( slave_io_nasti_ar_bits_size ),
       .io_nasti_ar_bits_burst( slave_io_nasti_ar_bits_burst ),
       .io_nasti_ar_bits_lock( slave_io_nasti_ar_bits_lock ),
       .io_nasti_ar_bits_cache( slave_io_nasti_ar_bits_cache ),
       .io_nasti_ar_bits_prot( slave_io_nasti_ar_bits_prot ),
       .io_nasti_ar_bits_qos( slave_io_nasti_ar_bits_qos ),
       .io_nasti_ar_bits_region( slave_io_nasti_ar_bits_region ),
       .io_nasti_ar_bits_id( slave_io_nasti_ar_bits_id ),
       .io_nasti_ar_bits_user( slave_io_nasti_ar_bits_user ),
       .io_nasti_r_ready( slave_io_nasti_r_ready ),
       .io_nasti_r_valid( io_slave_r_valid ),
       .io_nasti_r_bits_resp( io_slave_r_bits_resp ),
       .io_nasti_r_bits_data( io_slave_r_bits_data ),
       .io_nasti_r_bits_last( io_slave_r_bits_last ),
       .io_nasti_r_bits_id( io_slave_r_bits_id ),
       .io_nasti_r_bits_user( io_slave_r_bits_user )
  );
  Channel_0 Channel_req_cmd_addr_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_req_cmd_addr_0_io_in_ready ),
       .io_in_valid( master_io_req_cmd_addr_channel_0_valid ),
       .io_in_bits( master_io_req_cmd_addr_channel_0_bits ),
       .io_out_ready( arb_io_ins_1_req_cmd_ready ),
       .io_out_valid( Channel_req_cmd_addr_0_io_out_valid ),
       .io_out_bits( Channel_req_cmd_addr_0_io_out_bits )
       //.io_trace_ready(  )
       //.io_trace_valid(  )
       //.io_trace_bits(  )
       //.io_traceLen(  )
  );
  Channel_1 Channel_req_cmd_tag_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_req_cmd_tag_0_io_in_ready ),
       .io_in_valid( master_io_req_cmd_tag_channel_0_valid ),
       .io_in_bits( master_io_req_cmd_tag_channel_0_bits ),
       .io_out_ready( arb_io_ins_1_req_cmd_ready ),
       .io_out_valid( Channel_req_cmd_tag_0_io_out_valid ),
       .io_out_bits( Channel_req_cmd_tag_0_io_out_bits )
       //.io_trace_ready(  )
       //.io_trace_valid(  )
       //.io_trace_bits(  )
       //.io_traceLen(  )
  );
  Channel_2 Channel_req_cmd_rw_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_req_cmd_rw_0_io_in_ready ),
       .io_in_valid( master_io_req_cmd_rw_channel_0_valid ),
       .io_in_bits( master_io_req_cmd_rw_channel_0_bits ),
       .io_out_ready( arb_io_ins_1_req_cmd_ready ),
       .io_out_valid( Channel_req_cmd_rw_0_io_out_valid ),
       .io_out_bits( Channel_req_cmd_rw_0_io_out_bits )
       //.io_trace_ready(  )
       //.io_trace_valid(  )
       //.io_trace_bits(  )
       //.io_traceLen(  )
  );
  Channel_0 Channel_req_data_data_0(.clk(clk), .reset(reset),
       .io_in_ready( Channel_req_data_data_0_io_in_ready ),
       .io_in_valid( master_io_req_data_data_channel_0_valid ),
       .io_in_bits( master_io_req_data_data_channel_0_bits ),
       .io_out_ready( arb_io_ins_1_req_data_ready ),
       .io_out_valid( Channel_req_data_data_0_io_out_valid ),
       .io_out_bits( Channel_req_data_data_0_io_out_bits )
       //.io_trace_ready(  )
       //.io_trace_valid(  )
       //.io_trace_bits(  )
       //.io_traceLen(  )
  );
  Channel_0 Channel_req_data_data_1(.clk(clk), .reset(reset),
       .io_in_ready( Channel_req_data_data_1_io_in_ready ),
       .io_in_valid( master_io_req_data_data_channel_1_valid ),
       .io_in_bits( master_io_req_data_data_channel_1_bits ),
       .io_out_ready( arb_io_ins_1_req_data_ready ),
       .io_out_valid( Channel_req_data_data_1_io_out_valid ),
       .io_out_bits( Channel_req_data_data_1_io_out_bits )
       //.io_trace_ready(  )
       //.io_trace_valid(  )
       //.io_trace_bits(  )
       //.io_traceLen(  )
  );
  Channel_0 Channel_resp_data_0(.clk(clk), .reset(reset),
       //.io_in_ready(  )
       .io_in_valid( arb_io_ins_1_resp_valid ),
       .io_in_bits( T136 ),
       .io_out_ready( master_io_resp_data_channel_0_ready ),
       .io_out_valid( Channel_resp_data_0_io_out_valid ),
       .io_out_bits( Channel_resp_data_0_io_out_bits )
       //.io_trace_ready(  )
       //.io_trace_valid(  )
       //.io_trace_bits(  )
       //.io_traceLen(  )
  );
  Channel_0 Channel_resp_data_1(.clk(clk), .reset(reset),
       //.io_in_ready(  )
       .io_in_valid( arb_io_ins_1_resp_valid ),
       .io_in_bits( T17 ),
       .io_out_ready( master_io_resp_data_channel_1_ready ),
       .io_out_valid( Channel_resp_data_1_io_out_valid ),
       .io_out_bits( Channel_resp_data_1_io_out_bits )
       //.io_trace_ready(  )
       //.io_trace_valid(  )
       //.io_trace_bits(  )
       //.io_traceLen(  )
  );
  Channel_1 Channel_resp_tag_0(.clk(clk), .reset(reset),
       //.io_in_ready(  )
       .io_in_valid( arb_io_ins_1_resp_valid ),
       .io_in_bits( T15 ),
       .io_out_ready( master_io_resp_tag_channel_0_ready ),
       .io_out_valid( Channel_resp_tag_0_io_out_valid ),
       .io_out_bits( Channel_resp_tag_0_io_out_bits )
       //.io_trace_ready(  )
       //.io_trace_valid(  )
       //.io_trace_bits(  )
       //.io_traceLen(  )
  );
  ChannelMemIOConverter mem_conv_0(.clk(clk), .reset(master_io_reset_t),
       .io_sim_mem_req_cmd_ready( mem_conv_0_io_sim_mem_req_cmd_ready ),
       .io_sim_mem_req_cmd_valid( T11 ),
       .io_sim_mem_req_cmd_target_ready( mem_conv_0_io_sim_mem_req_cmd_target_ready ),
       .io_sim_mem_req_cmd_target_valid( TileWrapper_io_mem_req_cmd_valid_channel_0_bits ),
       .io_sim_mem_req_cmd_target_bits_addr( T10 ),
       .io_sim_mem_req_cmd_target_bits_tag( T9 ),
       .io_sim_mem_req_cmd_target_bits_rw( TileWrapper_io_mem_req_cmd_bits_rw_channel_0_bits ),
       .io_sim_mem_req_data_ready( mem_conv_0_io_sim_mem_req_data_ready ),
       .io_sim_mem_req_data_valid( T6 ),
       .io_sim_mem_req_data_target_ready( mem_conv_0_io_sim_mem_req_data_target_ready ),
       .io_sim_mem_req_data_target_valid( TileWrapper_io_mem_req_data_valid_channel_0_bits ),
       .io_sim_mem_req_data_target_bits_data( T4 ),
       .io_sim_mem_resp_ready( T0 ),
       .io_sim_mem_resp_valid( mem_conv_0_io_sim_mem_resp_valid ),
       .io_sim_mem_resp_target_ready( TileWrapper_io_mem_resp_ready_channel_0_bits ),
       .io_sim_mem_resp_target_valid( mem_conv_0_io_sim_mem_resp_target_valid ),
       .io_sim_mem_resp_target_bits_data( mem_conv_0_io_sim_mem_resp_target_bits_data ),
       .io_sim_mem_resp_target_bits_tag( mem_conv_0_io_sim_mem_resp_target_bits_tag ),
       .io_host_mem_req_cmd_ready( arb_io_ins_0_req_cmd_ready ),
       .io_host_mem_req_cmd_valid( mem_conv_0_io_host_mem_req_cmd_valid ),
       .io_host_mem_req_cmd_bits_addr( mem_conv_0_io_host_mem_req_cmd_bits_addr ),
       .io_host_mem_req_cmd_bits_tag( mem_conv_0_io_host_mem_req_cmd_bits_tag ),
       .io_host_mem_req_cmd_bits_rw( mem_conv_0_io_host_mem_req_cmd_bits_rw ),
       .io_host_mem_req_data_ready( arb_io_ins_0_req_data_ready ),
       .io_host_mem_req_data_valid( mem_conv_0_io_host_mem_req_data_valid ),
       .io_host_mem_req_data_bits_data( mem_conv_0_io_host_mem_req_data_bits_data ),
       .io_host_mem_resp_ready( mem_conv_0_io_host_mem_resp_ready ),
       .io_host_mem_resp_valid( arb_io_ins_0_resp_valid ),
       .io_host_mem_resp_bits_data( arb_io_ins_0_resp_bits_data ),
       .io_host_mem_resp_bits_tag( arb_io_ins_0_resp_bits_tag ),
       .io_latency_ready( mem_conv_0_io_latency_ready ),
       .io_latency_valid( master_io_lat_valid ),
       .io_latency_bits( T135 )
  );

  always @(posedge clk) begin
    if(reset) begin
      tockCounter <= 32'h0;
    end else if(T38) begin
      tockCounter <= 32'h1;
    end else if(T37) begin
      tockCounter <= master_io_step_bits;
    end else if(tock) begin
      tockCounter <= T26;
    end
    if(reset) begin
      tickCounter <= 32'h0;
    end else if(T37) begin
      tickCounter <= master_io_step_bits;
    end else if(tick) begin
      tickCounter <= T47;
    end
  end
endmodule

module HellaFlowQueue_ram(
  input CLK,
  input RST,
  input init,
  input [7:0] W0A,
  input W0E,
  input [69:0] W0I,
  input [7:0] R1A,
  input R1E,
  output [69:0] R1O
);

reg [69:0] ram [255:0];
  `ifndef SYNTHESIS
    integer initvar;
    initial begin
      #0.002;
      for (initvar = 0; initvar < 256; initvar = initvar+1)
        ram[initvar] = {3 {$random}};
    end
  `endif
  reg [7:0] reg_R1A;
always @(posedge CLK) begin
  if (R1E) reg_R1A <= R1A;
  if (W0E) ram[W0A] <= W0I;
end
assign R1O = ram[reg_R1A];

endmodule


module TraceQueue_ram_3(
  input CLK,
  input RST,
  input init,
  input [9:0] W0A,
  input W0E,
  input [1:0] W0I,
  input [9:0] R1A,
  input R1E,
  output [1:0] R1O
);

reg [1:0] ram [1023:0];
  `ifndef SYNTHESIS
    integer initvar;
    initial begin
      #0.002;
      for (initvar = 0; initvar < 1024; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
    end
  `endif
  reg [9:0] reg_R1A;
always @(posedge CLK) begin
  if (R1E) reg_R1A <= R1A;
  if (W0E) ram[W0A] <= W0I;
end
assign R1O = ram[reg_R1A];

endmodule


module TraceQueue_ram_1(
  input CLK,
  input RST,
  input init,
  input [9:0] W0A,
  input W0E,
  input [31:0] W0I,
  input [9:0] R1A,
  input R1E,
  output [31:0] R1O
);

reg [31:0] ram [1023:0];
  `ifndef SYNTHESIS
    integer initvar;
    initial begin
      #0.002;
      for (initvar = 0; initvar < 1024; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
    end
  `endif
  reg [9:0] reg_R1A;
always @(posedge CLK) begin
  if (R1E) reg_R1A <= R1A;
  if (W0E) ram[W0A] <= W0I;
end
assign R1O = ram[reg_R1A];

endmodule


module TraceQueue_ram_2(
  input CLK,
  input RST,
  input init,
  input [9:0] W0A,
  input W0E,
  input [4:0] W0I,
  input [9:0] R1A,
  input R1E,
  output [4:0] R1O
);

reg [4:0] ram [1023:0];
  `ifndef SYNTHESIS
    integer initvar;
    initial begin
      #0.002;
      for (initvar = 0; initvar < 1024; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
    end
  `endif
  reg [9:0] reg_R1A;
always @(posedge CLK) begin
  if (R1E) reg_R1A <= R1A;
  if (W0E) ram[W0A] <= W0I;
end
assign R1O = ram[reg_R1A];

endmodule


module TraceQueue_ram(
  input CLK,
  input RST,
  input init,
  input [9:0] W0A,
  input W0E,
  input [0:0] W0I,
  input [9:0] R1A,
  input R1E,
  output [0:0] R1O
);

reg [0:0] ram [1023:0];
  `ifndef SYNTHESIS
    integer initvar;
    initial begin
      #0.002;
      for (initvar = 0; initvar < 1024; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
    end
  `endif
  reg [9:0] reg_R1A;
always @(posedge CLK) begin
  if (R1E) reg_R1A <= R1A;
  if (W0E) ram[W0A] <= W0I;
end
assign R1O = ram[reg_R1A];

endmodule


module Cache_dataMem_0(
  input CLK,
  input RST,
  input init,
  input [7:0] W0A,
  input W0E,
  input [31:0] W0I,
  input [31:0] W0M,
  input [7:0] R1A,
  input R1E,
  output [31:0] R1O
);

`ifndef SYNTHESIS
integer i;
integer j;
always @(posedge CLK) begin
  for (i=0; i<4; i=i+8) begin
    for (j=1; j<8; j=j+1) begin
      if (W0M[i] != W0M[i+j]) begin
        $fwrite(32'h80000002, "ASSERTION FAILED: write mask granularity\n");
        $finish;
      end
    end
  end
end
`endif

reg [31:0] ram [255:0];
  `ifndef SYNTHESIS
    integer initvar;
    initial begin
      #0.002;
      for (initvar = 0; initvar < 256; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
    end
  `endif
  reg [7:0] reg_R1A;
always @(posedge CLK) begin
  if (R1E) reg_R1A <= R1A;
  if (W0E && W0M[0]) ram[W0A][7:0] <= W0I[7:0];
  if (W0E && W0M[8]) ram[W0A][15:8] <= W0I[15:8];
  if (W0E && W0M[16]) ram[W0A][23:16] <= W0I[23:16];
  if (W0E && W0M[24]) ram[W0A][31:24] <= W0I[31:24];
end
assign R1O = ram[reg_R1A];

endmodule


module Cache_metaMem(
  input CLK,
  input RST,
  input init,
  input [7:0] W0A,
  input W0E,
  input [20:0] W0I,
  input [7:0] R1A,
  input R1E,
  output [20:0] R1O
);

reg [20:0] ram [255:0];
  `ifndef SYNTHESIS
    integer initvar;
    initial begin
      #0.002;
      for (initvar = 0; initvar < 256; initvar = initvar+1)
        ram[initvar] = {1 {$random}};
    end
  `endif
  reg [7:0] reg_R1A;
always @(posedge CLK) begin
  if (R1E) reg_R1A <= R1A;
  if (W0E) ram[W0A] <= W0I;
end
assign R1O = ram[reg_R1A];

endmodule


