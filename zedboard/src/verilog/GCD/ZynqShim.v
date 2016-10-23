`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif

module RegChainDatapath(
  input   clock,
  input   reset,
  output  io_dataIo_in_ready,
  input   io_dataIo_in_valid,
  input  [31:0] io_dataIo_in_bits,
  input   io_dataIo_out_ready,
  output  io_dataIo_out_valid,
  output [31:0] io_dataIo_out_bits,
  input  [31:0] io_dataIo_data_0,
  input   io_ctrlIo_copyCond,
  input   io_ctrlIo_readCond,
  input   io_ctrlIo_cntrNotZero,
  output  io_ctrlIo_outFire,
  output  io_ctrlIo_inValid
);
  reg [31:0] regs_0;
  reg [31:0] GEN_2;
  wire  T_58;
  wire  readCondAndOutFire;
  wire [31:0] GEN_0;
  wire [31:0] GEN_1;
  assign io_dataIo_in_ready = io_dataIo_out_ready;
  assign io_dataIo_out_valid = io_ctrlIo_cntrNotZero;
  assign io_dataIo_out_bits = regs_0;
  assign io_ctrlIo_outFire = T_58;
  assign io_ctrlIo_inValid = io_dataIo_in_valid;
  assign T_58 = io_dataIo_out_ready & io_dataIo_out_valid;
  assign readCondAndOutFire = io_ctrlIo_readCond & T_58;
  assign GEN_0 = io_ctrlIo_copyCond ? io_dataIo_data_0 : regs_0;
  assign GEN_1 = readCondAndOutFire ? io_dataIo_in_bits : GEN_0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_2 = {1{$random}};
  regs_0 = GEN_2[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (readCondAndOutFire) begin
      regs_0 <= io_dataIo_in_bits;
    end else begin
      if (io_ctrlIo_copyCond) begin
        regs_0 <= io_dataIo_data_0;
      end
    end
  end
endmodule
module RegChainControl(
  input   clock,
  input   reset,
  input   io_stall,
  output  io_ctrlIo_copyCond,
  output  io_ctrlIo_readCond,
  output  io_ctrlIo_cntrNotZero,
  input   io_ctrlIo_outFire,
  input   io_ctrlIo_inValid
);
  reg  copied;
  reg [31:0] GEN_3;
  reg  counter;
  reg [31:0] GEN_4;
  wire  T_17;
  wire  GEN_0;
  wire  T_20;
  wire  T_21;
  wire  GEN_1;
  wire  T_23;
  wire  T_25;
  wire  T_26;
  wire  T_30;
  wire  T_31;
  wire  T_32;
  wire [1:0] T_34;
  wire  T_35;
  wire  GEN_2;
  wire  T_39;
  wire  T_40;
  reg  T_41;
  reg [31:0] GEN_5;
  wire  T_42;
  wire  T_43;
  wire  T_46;
  assign io_ctrlIo_copyCond = T_42;
  assign io_ctrlIo_readCond = T_46;
  assign io_ctrlIo_cntrNotZero = counter;
  assign T_17 = io_stall == 1'h0;
  assign GEN_0 = T_17 ? 1'h0 : counter;
  assign T_20 = T_17 == 1'h0;
  assign T_21 = T_20 & io_ctrlIo_copyCond;
  assign GEN_1 = T_21 ? 1'h1 : GEN_0;
  assign T_23 = io_ctrlIo_readCond & io_ctrlIo_outFire;
  assign T_25 = io_ctrlIo_inValid == 1'h0;
  assign T_26 = T_23 & T_25;
  assign T_30 = io_ctrlIo_copyCond == 1'h0;
  assign T_31 = T_20 & T_30;
  assign T_32 = T_31 & T_26;
  assign T_34 = counter - 1'h1;
  assign T_35 = T_34[0:0];
  assign GEN_2 = T_32 ? T_35 : GEN_1;
  assign T_39 = copied == 1'h0;
  assign T_40 = io_stall & T_39;
  assign T_42 = T_40 | T_41;
  assign T_43 = io_stall & copied;
  assign T_46 = T_43 & counter;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_3 = {1{$random}};
  copied = GEN_3[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_4 = {1{$random}};
  counter = GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_5 = {1{$random}};
  T_41 = GEN_5[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    copied <= io_stall;
    if (reset) begin
      counter <= 1'h0;
    end else begin
      if (T_32) begin
        counter <= T_35;
      end else begin
        if (T_21) begin
          counter <= 1'h1;
        end else begin
          if (T_17) begin
            counter <= 1'h0;
          end
        end
      end
    end
    T_41 <= reset;
  end
endmodule
module RegChain(
  input   clock,
  input   reset,
  input   io_stall,
  output  io_dataIo_in_ready,
  input   io_dataIo_in_valid,
  input  [31:0] io_dataIo_in_bits,
  input   io_dataIo_out_ready,
  output  io_dataIo_out_valid,
  output [31:0] io_dataIo_out_bits,
  input  [31:0] io_dataIo_data_0
);
  wire  datapath_clock;
  wire  datapath_reset;
  wire  datapath_io_dataIo_in_ready;
  wire  datapath_io_dataIo_in_valid;
  wire [31:0] datapath_io_dataIo_in_bits;
  wire  datapath_io_dataIo_out_ready;
  wire  datapath_io_dataIo_out_valid;
  wire [31:0] datapath_io_dataIo_out_bits;
  wire [31:0] datapath_io_dataIo_data_0;
  wire  datapath_io_ctrlIo_copyCond;
  wire  datapath_io_ctrlIo_readCond;
  wire  datapath_io_ctrlIo_cntrNotZero;
  wire  datapath_io_ctrlIo_outFire;
  wire  datapath_io_ctrlIo_inValid;
  wire  control_clock;
  wire  control_reset;
  wire  control_io_stall;
  wire  control_io_ctrlIo_copyCond;
  wire  control_io_ctrlIo_readCond;
  wire  control_io_ctrlIo_cntrNotZero;
  wire  control_io_ctrlIo_outFire;
  wire  control_io_ctrlIo_inValid;
  RegChainDatapath datapath (
    .clock(datapath_clock),
    .reset(datapath_reset),
    .io_dataIo_in_ready(datapath_io_dataIo_in_ready),
    .io_dataIo_in_valid(datapath_io_dataIo_in_valid),
    .io_dataIo_in_bits(datapath_io_dataIo_in_bits),
    .io_dataIo_out_ready(datapath_io_dataIo_out_ready),
    .io_dataIo_out_valid(datapath_io_dataIo_out_valid),
    .io_dataIo_out_bits(datapath_io_dataIo_out_bits),
    .io_dataIo_data_0(datapath_io_dataIo_data_0),
    .io_ctrlIo_copyCond(datapath_io_ctrlIo_copyCond),
    .io_ctrlIo_readCond(datapath_io_ctrlIo_readCond),
    .io_ctrlIo_cntrNotZero(datapath_io_ctrlIo_cntrNotZero),
    .io_ctrlIo_outFire(datapath_io_ctrlIo_outFire),
    .io_ctrlIo_inValid(datapath_io_ctrlIo_inValid)
  );
  RegChainControl control (
    .clock(control_clock),
    .reset(control_reset),
    .io_stall(control_io_stall),
    .io_ctrlIo_copyCond(control_io_ctrlIo_copyCond),
    .io_ctrlIo_readCond(control_io_ctrlIo_readCond),
    .io_ctrlIo_cntrNotZero(control_io_ctrlIo_cntrNotZero),
    .io_ctrlIo_outFire(control_io_ctrlIo_outFire),
    .io_ctrlIo_inValid(control_io_ctrlIo_inValid)
  );
  assign io_dataIo_in_ready = datapath_io_dataIo_in_ready;
  assign io_dataIo_out_valid = datapath_io_dataIo_out_valid;
  assign io_dataIo_out_bits = datapath_io_dataIo_out_bits;
  assign datapath_clock = clock;
  assign datapath_reset = reset;
  assign datapath_io_dataIo_in_valid = io_dataIo_in_valid;
  assign datapath_io_dataIo_in_bits = io_dataIo_in_bits;
  assign datapath_io_dataIo_out_ready = io_dataIo_out_ready;
  assign datapath_io_dataIo_data_0 = io_dataIo_data_0;
  assign datapath_io_ctrlIo_copyCond = control_io_ctrlIo_copyCond;
  assign datapath_io_ctrlIo_readCond = control_io_ctrlIo_readCond;
  assign datapath_io_ctrlIo_cntrNotZero = control_io_ctrlIo_cntrNotZero;
  assign control_clock = clock;
  assign control_reset = reset;
  assign control_io_stall = io_stall;
  assign control_io_ctrlIo_outFire = datapath_io_ctrlIo_outFire;
  assign control_io_ctrlIo_inValid = datapath_io_ctrlIo_inValid;
endmodule
module GCD(
  input   clock,
  input   reset,
  input  [15:0] io_a,
  input  [15:0] io_b,
  input   io_e,
  output [15:0] io_z,
  output  io_v,
  input   targetFire,
  input   daisyReset,
  output  daisy_regs_0_in_ready,
  input   daisy_regs_0_in_valid,
  input  [31:0] daisy_regs_0_in_bits,
  input   daisy_regs_0_out_ready,
  output  daisy_regs_0_out_valid,
  output [31:0] daisy_regs_0_out_bits,
  output  daisy_trace_0_in_ready,
  input   daisy_trace_0_in_valid,
  input  [31:0] daisy_trace_0_in_bits,
  input   daisy_trace_0_out_ready,
  output  daisy_trace_0_out_valid,
  output [31:0] daisy_trace_0_out_bits,
  output  daisy_cntr_0_in_ready,
  input   daisy_cntr_0_in_valid,
  input  [31:0] daisy_cntr_0_in_bits,
  input   daisy_cntr_0_out_ready,
  output  daisy_cntr_0_out_valid,
  output [31:0] daisy_cntr_0_out_bits,
  output  daisy_sram_0_in_ready,
  input   daisy_sram_0_in_valid,
  input  [31:0] daisy_sram_0_in_bits,
  input   daisy_sram_0_out_ready,
  output  daisy_sram_0_out_valid,
  output [31:0] daisy_sram_0_out_bits,
  input   daisy_sram_0_restart
);
  reg [15:0] x;
  reg [31:0] GEN_15;
  reg [15:0] y;
  reg [31:0] GEN_16;
  wire  T_14;
  wire [16:0] T_15;
  wire [15:0] T_16;
  wire [15:0] GEN_0;
  wire  T_19;
  wire [16:0] T_20;
  wire [15:0] T_21;
  wire [15:0] GEN_1;
  wire [15:0] GEN_2;
  wire [15:0] GEN_3;
  wire  T_23;
  wire [15:0] GEN_4;
  wire [15:0] GEN_5;
  wire  regs_0_clock;
  wire  regs_0_reset;
  wire  regs_0_io_stall;
  wire  regs_0_io_dataIo_in_ready;
  wire  regs_0_io_dataIo_in_valid;
  wire [31:0] regs_0_io_dataIo_in_bits;
  wire  regs_0_io_dataIo_out_ready;
  wire  regs_0_io_dataIo_out_valid;
  wire [31:0] regs_0_io_dataIo_out_bits;
  wire [31:0] regs_0_io_dataIo_data_0;
  reg  GEN_6;
  reg [31:0] GEN_17;
  reg  GEN_7;
  reg [31:0] GEN_18;
  reg [31:0] GEN_8;
  reg [31:0] GEN_19;
  reg  GEN_9;
  reg [31:0] GEN_20;
  reg  GEN_10;
  reg [31:0] GEN_21;
  reg [31:0] GEN_11;
  reg [31:0] GEN_22;
  reg  GEN_12;
  reg [31:0] GEN_23;
  reg  GEN_13;
  reg [31:0] GEN_24;
  reg [31:0] GEN_14;
  reg [31:0] GEN_25;
  RegChain regs_0 (
    .clock(regs_0_clock),
    .reset(regs_0_reset),
    .io_stall(regs_0_io_stall),
    .io_dataIo_in_ready(regs_0_io_dataIo_in_ready),
    .io_dataIo_in_valid(regs_0_io_dataIo_in_valid),
    .io_dataIo_in_bits(regs_0_io_dataIo_in_bits),
    .io_dataIo_out_ready(regs_0_io_dataIo_out_ready),
    .io_dataIo_out_valid(regs_0_io_dataIo_out_valid),
    .io_dataIo_out_bits(regs_0_io_dataIo_out_bits),
    .io_dataIo_data_0(regs_0_io_dataIo_data_0)
  );
  assign io_z = x;
  assign io_v = T_23;
  assign daisy_regs_0_in_ready = regs_0_io_dataIo_in_ready;
  assign daisy_regs_0_out_valid = regs_0_io_dataIo_out_valid;
  assign daisy_regs_0_out_bits = regs_0_io_dataIo_out_bits;
  assign daisy_trace_0_in_ready = GEN_6;
  assign daisy_trace_0_out_valid = GEN_7;
  assign daisy_trace_0_out_bits = GEN_8;
  assign daisy_cntr_0_in_ready = GEN_9;
  assign daisy_cntr_0_out_valid = GEN_10;
  assign daisy_cntr_0_out_bits = GEN_11;
  assign daisy_sram_0_in_ready = GEN_12;
  assign daisy_sram_0_out_valid = GEN_13;
  assign daisy_sram_0_out_bits = GEN_14;
  assign T_14 = x > y;
  assign T_15 = x - y;
  assign T_16 = T_15[15:0];
  assign GEN_0 = T_14 ? T_16 : x;
  assign T_19 = T_14 == 1'h0;
  assign T_20 = y - x;
  assign T_21 = T_20[15:0];
  assign GEN_1 = T_19 ? T_21 : y;
  assign GEN_2 = io_e ? io_a : GEN_0;
  assign GEN_3 = io_e ? io_b : GEN_1;
  assign T_23 = y == 16'h0;
  assign GEN_4 = targetFire ? GEN_2 : x;
  assign GEN_5 = targetFire ? GEN_3 : y;
  assign regs_0_clock = clock;
  assign regs_0_reset = daisyReset;
  assign regs_0_io_stall = ~ targetFire;
  assign regs_0_io_dataIo_in_valid = daisy_regs_0_in_valid;
  assign regs_0_io_dataIo_in_bits = daisy_regs_0_in_bits;
  assign regs_0_io_dataIo_out_ready = daisy_regs_0_out_ready;
  assign regs_0_io_dataIo_data_0 = {x,y};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_15 = {1{$random}};
  x = GEN_15[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_16 = {1{$random}};
  y = GEN_16[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_17 = {1{$random}};
  GEN_6 = GEN_17[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_18 = {1{$random}};
  GEN_7 = GEN_18[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_19 = {1{$random}};
  GEN_8 = GEN_19[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_20 = {1{$random}};
  GEN_9 = GEN_20[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_21 = {1{$random}};
  GEN_10 = GEN_21[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_22 = {1{$random}};
  GEN_11 = GEN_22[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_23 = {1{$random}};
  GEN_12 = GEN_23[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_24 = {1{$random}};
  GEN_13 = GEN_24[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_25 = {1{$random}};
  GEN_14 = GEN_25[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (targetFire) begin
      if (io_e) begin
        x <= io_a;
      end else begin
        if (T_14) begin
          x <= T_16;
        end
      end
    end
    if (targetFire) begin
      if (io_e) begin
        y <= io_b;
      end else begin
        if (T_19) begin
          y <= T_21;
        end
      end
    end
  end
endmodule
module Queue(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits,
  output [4:0] io_count
);
  reg  ram [0:15];
  reg [31:0] GEN_0;
  wire  ram_T_51_data;
  wire [3:0] ram_T_51_addr;
  wire  ram_T_35_data;
  wire [3:0] ram_T_35_addr;
  wire  ram_T_35_mask;
  wire  ram_T_35_en;
  reg [3:0] T_27;
  reg [31:0] GEN_1;
  reg [3:0] T_29;
  reg [31:0] GEN_2;
  reg  maybe_full;
  reg [31:0] GEN_3;
  wire  ptr_match;
  wire  T_32;
  wire  empty;
  wire  full;
  wire  T_33;
  wire  do_enq;
  wire  T_34;
  wire  do_deq;
  wire [4:0] T_39;
  wire [3:0] T_40;
  wire [3:0] GEN_4;
  wire [4:0] T_44;
  wire [3:0] T_45;
  wire [3:0] GEN_5;
  wire  T_46;
  wire  GEN_6;
  wire  T_48;
  wire  T_50;
  wire [4:0] T_52;
  wire [3:0] ptr_diff;
  wire  T_53;
  wire [4:0] T_54;
  assign io_enq_ready = T_50;
  assign io_deq_valid = T_48;
  assign io_deq_bits = ram_T_51_data;
  assign io_count = T_54;
  assign ram_T_51_addr = T_29;
  assign ram_T_51_data = ram[ram_T_51_addr];
  assign ram_T_35_data = io_enq_bits;
  assign ram_T_35_addr = T_27;
  assign ram_T_35_mask = do_enq;
  assign ram_T_35_en = do_enq;
  assign ptr_match = T_27 == T_29;
  assign T_32 = maybe_full == 1'h0;
  assign empty = ptr_match & T_32;
  assign full = ptr_match & maybe_full;
  assign T_33 = io_enq_ready & io_enq_valid;
  assign do_enq = T_33;
  assign T_34 = io_deq_ready & io_deq_valid;
  assign do_deq = T_34;
  assign T_39 = T_27 + 4'h1;
  assign T_40 = T_39[3:0];
  assign GEN_4 = do_enq ? T_40 : T_27;
  assign T_44 = T_29 + 4'h1;
  assign T_45 = T_44[3:0];
  assign GEN_5 = do_deq ? T_45 : T_29;
  assign T_46 = do_enq != do_deq;
  assign GEN_6 = T_46 ? do_enq : maybe_full;
  assign T_48 = empty == 1'h0;
  assign T_50 = full == 1'h0;
  assign T_52 = T_27 - T_29;
  assign ptr_diff = T_52[3:0];
  assign T_53 = maybe_full & ptr_match;
  assign T_54 = {T_53,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  T_27 = GEN_1[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_2 = {1{$random}};
  T_29 = GEN_2[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_3 = {1{$random}};
  maybe_full = GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_T_35_en & ram_T_35_mask) begin
      ram[ram_T_35_addr] <= ram_T_35_data;
    end
    if (reset) begin
      T_27 <= 4'h0;
    end else begin
      if (do_enq) begin
        T_27 <= T_40;
      end
    end
    if (reset) begin
      T_29 <= 4'h0;
    end else begin
      if (do_deq) begin
        T_29 <= T_45;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_46) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module TraceQueue(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits,
  output [10:0] io_count,
  input  [9:0] io_limit
);
  wire  do_flow;
  wire  T_29;
  wire  T_31;
  wire  do_enq;
  wire  T_32;
  wire  do_deq;
  reg  maybe_full;
  reg [31:0] GEN_4;
  reg [9:0] enq_ptr;
  reg [31:0] GEN_5;
  reg [9:0] deq_ptr;
  reg [31:0] GEN_6;
  wire  enq_wrap;
  wire  deq_wrap;
  wire [10:0] T_40;
  wire [9:0] T_41;
  wire [9:0] T_42;
  wire [9:0] GEN_0;
  wire [10:0] T_45;
  wire [9:0] T_46;
  wire [9:0] T_47;
  wire [9:0] GEN_1;
  wire  T_48;
  wire  GEN_2;
  wire  ptr_match;
  wire  T_50;
  wire  empty;
  wire  full;
  wire [10:0] T_51;
  wire [9:0] T_52;
  wire  T_54;
  wire  atLeastTwo;
  wire  T_55;
  reg  ram [0:1023];
  reg [31:0] GEN_7;
  wire  ram_T_77_data;
  wire [9:0] ram_T_77_addr;
  wire  ram_T_58_data;
  wire [9:0] ram_T_58_addr;
  wire  ram_T_58_mask;
  wire  ram_T_58_en;
  reg [9:0] ram_T_77_addr_pipe_0;
  reg [31:0] GEN_9;
  wire  T_60;
  wire  T_62;
  wire  T_63;
  wire  T_64;
  wire  ren;
  wire [9:0] raddr;
  reg  ram_out_valid;
  reg [31:0] GEN_10;
  wire  T_70;
  wire  T_72;
  wire [9:0] T_74;
  wire [9:0] T_76;
  wire  T_78;
  reg [31:0] counts;
  reg [31:0] GEN_11;
  wire [32:0] T_82;
  wire [31:0] T_83;
  wire [32:0] T_85;
  wire [31:0] T_86;
  wire [31:0] T_87;
  wire [31:0] GEN_8;
  reg [10:0] GEN_3;
  reg [31:0] GEN_12;
  assign io_enq_ready = T_72;
  assign io_deq_valid = T_70;
  assign io_deq_bits = T_78;
  assign io_count = GEN_3;
  assign do_flow = T_55;
  assign T_29 = io_enq_ready & io_enq_valid;
  assign T_31 = do_flow == 1'h0;
  assign do_enq = T_29 & T_31;
  assign T_32 = io_deq_ready & io_deq_valid;
  assign do_deq = T_32 & T_31;
  assign enq_wrap = enq_ptr == io_limit;
  assign deq_wrap = deq_ptr == io_limit;
  assign T_40 = enq_ptr + 10'h1;
  assign T_41 = T_40[9:0];
  assign T_42 = enq_wrap ? 10'h0 : T_41;
  assign GEN_0 = do_enq ? T_42 : enq_ptr;
  assign T_45 = deq_ptr + 10'h1;
  assign T_46 = T_45[9:0];
  assign T_47 = deq_wrap ? 10'h0 : T_46;
  assign GEN_1 = do_deq ? T_47 : deq_ptr;
  assign T_48 = do_enq != do_deq;
  assign GEN_2 = T_48 ? do_enq : maybe_full;
  assign ptr_match = enq_ptr == deq_ptr;
  assign T_50 = maybe_full == 1'h0;
  assign empty = ptr_match & T_50;
  assign full = ptr_match & maybe_full;
  assign T_51 = enq_ptr - deq_ptr;
  assign T_52 = T_51[9:0];
  assign T_54 = T_52 >= 10'h2;
  assign atLeastTwo = full | T_54;
  assign T_55 = empty & io_deq_ready;
  assign ram_T_77_addr = ram_T_77_addr_pipe_0;
  assign ram_T_77_data = ram[ram_T_77_addr];
  assign ram_T_58_data = io_enq_bits;
  assign ram_T_58_addr = enq_ptr;
  assign ram_T_58_mask = do_enq;
  assign ram_T_58_en = do_enq;
  assign T_60 = io_deq_valid == 1'h0;
  assign T_62 = empty == 1'h0;
  assign T_63 = T_60 & T_62;
  assign T_64 = atLeastTwo | T_63;
  assign ren = io_deq_ready & T_64;
  assign raddr = io_deq_valid ? T_47 : deq_ptr;
  assign T_70 = empty ? io_enq_valid : ram_out_valid;
  assign T_72 = full == 1'h0;
  assign T_74 = raddr;
  assign T_76 = T_74;
  assign T_78 = empty ? io_enq_bits : ram_T_77_data;
  assign T_82 = counts + 32'h1;
  assign T_83 = T_82[31:0];
  assign T_85 = counts - 32'h1;
  assign T_86 = T_85[31:0];
  assign T_87 = do_enq ? T_83 : T_86;
  assign GEN_8 = T_48 ? T_87 : counts;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_4 = {1{$random}};
  maybe_full = GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_5 = {1{$random}};
  enq_ptr = GEN_5[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_6 = {1{$random}};
  deq_ptr = GEN_6[9:0];
  `endif
  GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram[initvar] = GEN_7[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_9 = {1{$random}};
  ram_T_77_addr_pipe_0 = GEN_9[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_10 = {1{$random}};
  ram_out_valid = GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_11 = {1{$random}};
  counts = GEN_11[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_12 = {1{$random}};
  GEN_3 = GEN_12[10:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_48) begin
        maybe_full <= do_enq;
      end
    end
    if (reset) begin
      enq_ptr <= 10'h0;
    end else begin
      if (do_enq) begin
        enq_ptr <= T_42;
      end
    end
    if (reset) begin
      deq_ptr <= 10'h0;
    end else begin
      if (do_deq) begin
        if (deq_wrap) begin
          deq_ptr <= 10'h0;
        end else begin
          deq_ptr <= T_46;
        end
      end
    end
    if(ram_T_58_en & ram_T_58_mask) begin
      ram[ram_T_58_addr] <= ram_T_58_data;
    end
    ram_T_77_addr_pipe_0 <= T_76;
    ram_out_valid <= ren;
    if (reset) begin
      counts <= 32'h0;
    end else begin
      if (T_48) begin
        if (do_enq) begin
          counts <= T_83;
        end else begin
          counts <= T_86;
        end
      end
    end
  end
endmodule
module Queue_1(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input   io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output  io_deq_bits,
  output  io_count
);
  reg  ram [0:0];
  reg [31:0] GEN_0;
  wire  ram_T_43_data;
  wire  ram_T_43_addr;
  wire  ram_T_34_data;
  wire  ram_T_34_addr;
  wire  ram_T_34_mask;
  wire  ram_T_34_en;
  reg  maybe_full;
  reg [31:0] GEN_1;
  wire  T_30;
  wire  T_31;
  wire  do_enq;
  wire  T_32;
  wire  do_deq;
  wire  T_37;
  wire  GEN_4;
  wire  T_39;
  wire  GEN_5;
  wire [1:0] T_45;
  wire  ptr_diff;
  wire [1:0] T_47;
  assign io_enq_ready = GEN_5;
  assign io_deq_valid = T_39;
  assign io_deq_bits = ram_T_43_data;
  assign io_count = T_47[0];
  assign ram_T_43_addr = 1'h0;
  assign ram_T_43_data = ram[ram_T_43_addr];
  assign ram_T_34_data = io_enq_bits;
  assign ram_T_34_addr = 1'h0;
  assign ram_T_34_mask = do_enq;
  assign ram_T_34_en = do_enq;
  assign T_30 = maybe_full == 1'h0;
  assign T_31 = io_enq_ready & io_enq_valid;
  assign do_enq = T_31;
  assign T_32 = io_deq_ready & io_deq_valid;
  assign do_deq = T_32;
  assign T_37 = do_enq != do_deq;
  assign GEN_4 = T_37 ? do_enq : maybe_full;
  assign T_39 = T_30 == 1'h0;
  assign GEN_5 = io_deq_ready ? 1'h1 : T_30;
  assign T_45 = 1'h0 - 1'h0;
  assign ptr_diff = T_45[0:0];
  assign T_47 = {maybe_full,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = GEN_0[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  maybe_full = GEN_1[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_T_34_en & ram_T_34_mask) begin
      ram[ram_T_34_addr] <= ram_T_34_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_37) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module Channel(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input   io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output  io_out_bits,
  input   io_trace_ready,
  output  io_trace_valid,
  output  io_trace_bits,
  input  [10:0] io_traceLen
);
  wire  tokens_clock;
  wire  tokens_reset;
  wire  tokens_io_enq_ready;
  wire  tokens_io_enq_valid;
  wire  tokens_io_enq_bits;
  wire  tokens_io_deq_ready;
  wire  tokens_io_deq_valid;
  wire  tokens_io_deq_bits;
  wire [4:0] tokens_io_count;
  wire  trace_clock;
  wire  trace_reset;
  wire  trace_io_enq_ready;
  wire  trace_io_enq_valid;
  wire  trace_io_enq_bits;
  wire  trace_io_deq_ready;
  wire  trace_io_deq_valid;
  wire  trace_io_deq_bits;
  wire [10:0] trace_io_count;
  wire [9:0] trace_io_limit;
  wire  T_36;
  wire  T_37;
  wire [11:0] T_39;
  wire [10:0] T_40;
  wire  Queue_1_1_clock;
  wire  Queue_1_1_reset;
  wire  Queue_1_1_io_enq_ready;
  wire  Queue_1_1_io_enq_valid;
  wire  Queue_1_1_io_enq_bits;
  wire  Queue_1_1_io_deq_ready;
  wire  Queue_1_1_io_deq_valid;
  wire  Queue_1_1_io_deq_bits;
  wire  Queue_1_1_io_count;
  Queue tokens (
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits),
    .io_count(tokens_io_count)
  );
  TraceQueue trace (
    .clock(trace_clock),
    .reset(trace_reset),
    .io_enq_ready(trace_io_enq_ready),
    .io_enq_valid(trace_io_enq_valid),
    .io_enq_bits(trace_io_enq_bits),
    .io_deq_ready(trace_io_deq_ready),
    .io_deq_valid(trace_io_deq_valid),
    .io_deq_bits(trace_io_deq_bits),
    .io_count(trace_io_count),
    .io_limit(trace_io_limit)
  );
  Queue_1 Queue_1_1 (
    .clock(Queue_1_1_clock),
    .reset(Queue_1_1_reset),
    .io_enq_ready(Queue_1_1_io_enq_ready),
    .io_enq_valid(Queue_1_1_io_enq_valid),
    .io_enq_bits(Queue_1_1_io_enq_bits),
    .io_deq_ready(Queue_1_1_io_deq_ready),
    .io_deq_valid(Queue_1_1_io_deq_valid),
    .io_deq_bits(Queue_1_1_io_deq_bits),
    .io_count(Queue_1_1_io_count)
  );
  assign io_in_ready = tokens_io_enq_ready;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_trace_valid = Queue_1_1_io_deq_valid;
  assign io_trace_bits = Queue_1_1_io_deq_bits;
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid;
  assign tokens_io_enq_bits = io_in_bits;
  assign tokens_io_deq_ready = io_out_ready;
  assign trace_clock = clock;
  assign trace_reset = reset;
  assign trace_io_enq_valid = T_37;
  assign trace_io_enq_bits = io_out_bits;
  assign trace_io_deq_ready = Queue_1_1_io_enq_ready;
  assign trace_io_limit = T_40[9:0];
  assign T_36 = io_out_ready & io_out_valid;
  assign T_37 = T_36 & trace_io_enq_ready;
  assign T_39 = io_traceLen - 11'h2;
  assign T_40 = T_39[10:0];
  assign Queue_1_1_clock = clock;
  assign Queue_1_1_reset = reset;
  assign Queue_1_1_io_enq_valid = trace_io_deq_valid;
  assign Queue_1_1_io_enq_bits = trace_io_deq_bits;
  assign Queue_1_1_io_deq_ready = io_trace_ready;
endmodule
module Channel_1(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input   io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output  io_out_bits,
  input   io_trace_ready,
  output  io_trace_valid,
  output  io_trace_bits,
  input  [10:0] io_traceLen
);
  wire  tokens_clock;
  wire  tokens_reset;
  wire  tokens_io_enq_ready;
  wire  tokens_io_enq_valid;
  wire  tokens_io_enq_bits;
  wire  tokens_io_deq_ready;
  wire  tokens_io_deq_valid;
  wire  tokens_io_deq_bits;
  wire [4:0] tokens_io_count;
  wire  trace_clock;
  wire  trace_reset;
  wire  trace_io_enq_ready;
  wire  trace_io_enq_valid;
  wire  trace_io_enq_bits;
  wire  trace_io_deq_ready;
  wire  trace_io_deq_valid;
  wire  trace_io_deq_bits;
  wire [10:0] trace_io_count;
  wire [9:0] trace_io_limit;
  wire  T_36;
  wire  T_37;
  wire [11:0] T_39;
  wire [10:0] T_40;
  wire  Queue_3_1_clock;
  wire  Queue_3_1_reset;
  wire  Queue_3_1_io_enq_ready;
  wire  Queue_3_1_io_enq_valid;
  wire  Queue_3_1_io_enq_bits;
  wire  Queue_3_1_io_deq_ready;
  wire  Queue_3_1_io_deq_valid;
  wire  Queue_3_1_io_deq_bits;
  wire  Queue_3_1_io_count;
  Queue tokens (
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits),
    .io_count(tokens_io_count)
  );
  TraceQueue trace (
    .clock(trace_clock),
    .reset(trace_reset),
    .io_enq_ready(trace_io_enq_ready),
    .io_enq_valid(trace_io_enq_valid),
    .io_enq_bits(trace_io_enq_bits),
    .io_deq_ready(trace_io_deq_ready),
    .io_deq_valid(trace_io_deq_valid),
    .io_deq_bits(trace_io_deq_bits),
    .io_count(trace_io_count),
    .io_limit(trace_io_limit)
  );
  Queue_1 Queue_3_1 (
    .clock(Queue_3_1_clock),
    .reset(Queue_3_1_reset),
    .io_enq_ready(Queue_3_1_io_enq_ready),
    .io_enq_valid(Queue_3_1_io_enq_valid),
    .io_enq_bits(Queue_3_1_io_enq_bits),
    .io_deq_ready(Queue_3_1_io_deq_ready),
    .io_deq_valid(Queue_3_1_io_deq_valid),
    .io_deq_bits(Queue_3_1_io_deq_bits),
    .io_count(Queue_3_1_io_count)
  );
  assign io_in_ready = tokens_io_enq_ready;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_trace_valid = Queue_3_1_io_deq_valid;
  assign io_trace_bits = Queue_3_1_io_deq_bits;
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid;
  assign tokens_io_enq_bits = io_in_bits;
  assign tokens_io_deq_ready = io_out_ready;
  assign trace_clock = clock;
  assign trace_reset = reset;
  assign trace_io_enq_valid = T_37;
  assign trace_io_enq_bits = io_out_bits;
  assign trace_io_deq_ready = Queue_3_1_io_enq_ready;
  assign trace_io_limit = T_40[9:0];
  assign T_36 = io_out_ready & io_out_valid;
  assign T_37 = T_36 & trace_io_enq_ready;
  assign T_39 = io_traceLen - 11'h2;
  assign T_40 = T_39[10:0];
  assign Queue_3_1_clock = clock;
  assign Queue_3_1_reset = reset;
  assign Queue_3_1_io_enq_valid = trace_io_deq_valid;
  assign Queue_3_1_io_enq_bits = trace_io_deq_bits;
  assign Queue_3_1_io_deq_ready = io_trace_ready;
endmodule
module Queue_4(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [15:0] io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output [15:0] io_deq_bits,
  output [4:0] io_count
);
  reg [15:0] ram [0:15];
  reg [31:0] GEN_0;
  wire [15:0] ram_T_51_data;
  wire [3:0] ram_T_51_addr;
  wire [15:0] ram_T_35_data;
  wire [3:0] ram_T_35_addr;
  wire  ram_T_35_mask;
  wire  ram_T_35_en;
  reg [3:0] T_27;
  reg [31:0] GEN_1;
  reg [3:0] T_29;
  reg [31:0] GEN_2;
  reg  maybe_full;
  reg [31:0] GEN_3;
  wire  ptr_match;
  wire  T_32;
  wire  empty;
  wire  full;
  wire  T_33;
  wire  do_enq;
  wire  T_34;
  wire  do_deq;
  wire [4:0] T_39;
  wire [3:0] T_40;
  wire [3:0] GEN_4;
  wire [4:0] T_44;
  wire [3:0] T_45;
  wire [3:0] GEN_5;
  wire  T_46;
  wire  GEN_6;
  wire  T_48;
  wire  T_50;
  wire [4:0] T_52;
  wire [3:0] ptr_diff;
  wire  T_53;
  wire [4:0] T_54;
  assign io_enq_ready = T_50;
  assign io_deq_valid = T_48;
  assign io_deq_bits = ram_T_51_data;
  assign io_count = T_54;
  assign ram_T_51_addr = T_29;
  assign ram_T_51_data = ram[ram_T_51_addr];
  assign ram_T_35_data = io_enq_bits;
  assign ram_T_35_addr = T_27;
  assign ram_T_35_mask = do_enq;
  assign ram_T_35_en = do_enq;
  assign ptr_match = T_27 == T_29;
  assign T_32 = maybe_full == 1'h0;
  assign empty = ptr_match & T_32;
  assign full = ptr_match & maybe_full;
  assign T_33 = io_enq_ready & io_enq_valid;
  assign do_enq = T_33;
  assign T_34 = io_deq_ready & io_deq_valid;
  assign do_deq = T_34;
  assign T_39 = T_27 + 4'h1;
  assign T_40 = T_39[3:0];
  assign GEN_4 = do_enq ? T_40 : T_27;
  assign T_44 = T_29 + 4'h1;
  assign T_45 = T_44[3:0];
  assign GEN_5 = do_deq ? T_45 : T_29;
  assign T_46 = do_enq != do_deq;
  assign GEN_6 = T_46 ? do_enq : maybe_full;
  assign T_48 = empty == 1'h0;
  assign T_50 = full == 1'h0;
  assign T_52 = T_27 - T_29;
  assign ptr_diff = T_52[3:0];
  assign T_53 = maybe_full & ptr_match;
  assign T_54 = {T_53,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = GEN_0[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  T_27 = GEN_1[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_2 = {1{$random}};
  T_29 = GEN_2[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_3 = {1{$random}};
  maybe_full = GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_T_35_en & ram_T_35_mask) begin
      ram[ram_T_35_addr] <= ram_T_35_data;
    end
    if (reset) begin
      T_27 <= 4'h0;
    end else begin
      if (do_enq) begin
        T_27 <= T_40;
      end
    end
    if (reset) begin
      T_29 <= 4'h0;
    end else begin
      if (do_deq) begin
        T_29 <= T_45;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_46) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module TraceQueue_2(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [15:0] io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output [15:0] io_deq_bits,
  output [10:0] io_count,
  input  [9:0] io_limit
);
  wire  do_flow;
  wire  T_29;
  wire  T_31;
  wire  do_enq;
  wire  T_32;
  wire  do_deq;
  reg  maybe_full;
  reg [31:0] GEN_4;
  reg [9:0] enq_ptr;
  reg [31:0] GEN_5;
  reg [9:0] deq_ptr;
  reg [31:0] GEN_6;
  wire  enq_wrap;
  wire  deq_wrap;
  wire [10:0] T_40;
  wire [9:0] T_41;
  wire [9:0] T_42;
  wire [9:0] GEN_0;
  wire [10:0] T_45;
  wire [9:0] T_46;
  wire [9:0] T_47;
  wire [9:0] GEN_1;
  wire  T_48;
  wire  GEN_2;
  wire  ptr_match;
  wire  T_50;
  wire  empty;
  wire  full;
  wire [10:0] T_51;
  wire [9:0] T_52;
  wire  T_54;
  wire  atLeastTwo;
  wire  T_55;
  reg [15:0] ram [0:1023];
  reg [31:0] GEN_7;
  wire [15:0] ram_T_77_data;
  wire [9:0] ram_T_77_addr;
  wire [15:0] ram_T_58_data;
  wire [9:0] ram_T_58_addr;
  wire  ram_T_58_mask;
  wire  ram_T_58_en;
  reg [9:0] ram_T_77_addr_pipe_0;
  reg [31:0] GEN_9;
  wire  T_60;
  wire  T_62;
  wire  T_63;
  wire  T_64;
  wire  ren;
  wire [9:0] raddr;
  reg  ram_out_valid;
  reg [31:0] GEN_10;
  wire  T_70;
  wire  T_72;
  wire [9:0] T_74;
  wire [9:0] T_76;
  wire [15:0] T_78;
  reg [31:0] counts;
  reg [31:0] GEN_11;
  wire [32:0] T_82;
  wire [31:0] T_83;
  wire [32:0] T_85;
  wire [31:0] T_86;
  wire [31:0] T_87;
  wire [31:0] GEN_8;
  reg [10:0] GEN_3;
  reg [31:0] GEN_12;
  assign io_enq_ready = T_72;
  assign io_deq_valid = T_70;
  assign io_deq_bits = T_78;
  assign io_count = GEN_3;
  assign do_flow = T_55;
  assign T_29 = io_enq_ready & io_enq_valid;
  assign T_31 = do_flow == 1'h0;
  assign do_enq = T_29 & T_31;
  assign T_32 = io_deq_ready & io_deq_valid;
  assign do_deq = T_32 & T_31;
  assign enq_wrap = enq_ptr == io_limit;
  assign deq_wrap = deq_ptr == io_limit;
  assign T_40 = enq_ptr + 10'h1;
  assign T_41 = T_40[9:0];
  assign T_42 = enq_wrap ? 10'h0 : T_41;
  assign GEN_0 = do_enq ? T_42 : enq_ptr;
  assign T_45 = deq_ptr + 10'h1;
  assign T_46 = T_45[9:0];
  assign T_47 = deq_wrap ? 10'h0 : T_46;
  assign GEN_1 = do_deq ? T_47 : deq_ptr;
  assign T_48 = do_enq != do_deq;
  assign GEN_2 = T_48 ? do_enq : maybe_full;
  assign ptr_match = enq_ptr == deq_ptr;
  assign T_50 = maybe_full == 1'h0;
  assign empty = ptr_match & T_50;
  assign full = ptr_match & maybe_full;
  assign T_51 = enq_ptr - deq_ptr;
  assign T_52 = T_51[9:0];
  assign T_54 = T_52 >= 10'h2;
  assign atLeastTwo = full | T_54;
  assign T_55 = empty & io_deq_ready;
  assign ram_T_77_addr = ram_T_77_addr_pipe_0;
  assign ram_T_77_data = ram[ram_T_77_addr];
  assign ram_T_58_data = io_enq_bits;
  assign ram_T_58_addr = enq_ptr;
  assign ram_T_58_mask = do_enq;
  assign ram_T_58_en = do_enq;
  assign T_60 = io_deq_valid == 1'h0;
  assign T_62 = empty == 1'h0;
  assign T_63 = T_60 & T_62;
  assign T_64 = atLeastTwo | T_63;
  assign ren = io_deq_ready & T_64;
  assign raddr = io_deq_valid ? T_47 : deq_ptr;
  assign T_70 = empty ? io_enq_valid : ram_out_valid;
  assign T_72 = full == 1'h0;
  assign T_74 = raddr;
  assign T_76 = T_74;
  assign T_78 = empty ? io_enq_bits : ram_T_77_data;
  assign T_82 = counts + 32'h1;
  assign T_83 = T_82[31:0];
  assign T_85 = counts - 32'h1;
  assign T_86 = T_85[31:0];
  assign T_87 = do_enq ? T_83 : T_86;
  assign GEN_8 = T_48 ? T_87 : counts;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_4 = {1{$random}};
  maybe_full = GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_5 = {1{$random}};
  enq_ptr = GEN_5[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_6 = {1{$random}};
  deq_ptr = GEN_6[9:0];
  `endif
  GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    ram[initvar] = GEN_7[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_9 = {1{$random}};
  ram_T_77_addr_pipe_0 = GEN_9[9:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_10 = {1{$random}};
  ram_out_valid = GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_11 = {1{$random}};
  counts = GEN_11[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_12 = {1{$random}};
  GEN_3 = GEN_12[10:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_48) begin
        maybe_full <= do_enq;
      end
    end
    if (reset) begin
      enq_ptr <= 10'h0;
    end else begin
      if (do_enq) begin
        enq_ptr <= T_42;
      end
    end
    if (reset) begin
      deq_ptr <= 10'h0;
    end else begin
      if (do_deq) begin
        if (deq_wrap) begin
          deq_ptr <= 10'h0;
        end else begin
          deq_ptr <= T_46;
        end
      end
    end
    if(ram_T_58_en & ram_T_58_mask) begin
      ram[ram_T_58_addr] <= ram_T_58_data;
    end
    ram_T_77_addr_pipe_0 <= T_76;
    ram_out_valid <= ren;
    if (reset) begin
      counts <= 32'h0;
    end else begin
      if (T_48) begin
        if (do_enq) begin
          counts <= T_83;
        end else begin
          counts <= T_86;
        end
      end
    end
  end
endmodule
module Queue_5(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [15:0] io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output [15:0] io_deq_bits,
  output  io_count
);
  reg [15:0] ram [0:0];
  reg [31:0] GEN_0;
  wire [15:0] ram_T_43_data;
  wire  ram_T_43_addr;
  wire [15:0] ram_T_34_data;
  wire  ram_T_34_addr;
  wire  ram_T_34_mask;
  wire  ram_T_34_en;
  reg  maybe_full;
  reg [31:0] GEN_1;
  wire  T_30;
  wire  T_31;
  wire  do_enq;
  wire  T_32;
  wire  do_deq;
  wire  T_37;
  wire  GEN_4;
  wire  T_39;
  wire  GEN_5;
  wire [1:0] T_45;
  wire  ptr_diff;
  wire [1:0] T_47;
  assign io_enq_ready = GEN_5;
  assign io_deq_valid = T_39;
  assign io_deq_bits = ram_T_43_data;
  assign io_count = T_47[0];
  assign ram_T_43_addr = 1'h0;
  assign ram_T_43_data = ram[ram_T_43_addr];
  assign ram_T_34_data = io_enq_bits;
  assign ram_T_34_addr = 1'h0;
  assign ram_T_34_mask = do_enq;
  assign ram_T_34_en = do_enq;
  assign T_30 = maybe_full == 1'h0;
  assign T_31 = io_enq_ready & io_enq_valid;
  assign do_enq = T_31;
  assign T_32 = io_deq_ready & io_deq_valid;
  assign do_deq = T_32;
  assign T_37 = do_enq != do_deq;
  assign GEN_4 = T_37 ? do_enq : maybe_full;
  assign T_39 = T_30 == 1'h0;
  assign GEN_5 = io_deq_ready ? 1'h1 : T_30;
  assign T_45 = 1'h0 - 1'h0;
  assign ptr_diff = T_45[0:0];
  assign T_47 = {maybe_full,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = GEN_0[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  maybe_full = GEN_1[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_T_34_en & ram_T_34_mask) begin
      ram[ram_T_34_addr] <= ram_T_34_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_37) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module Channel_2(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input  [15:0] io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output [15:0] io_out_bits,
  input   io_trace_ready,
  output  io_trace_valid,
  output [15:0] io_trace_bits,
  input  [10:0] io_traceLen
);
  wire  tokens_clock;
  wire  tokens_reset;
  wire  tokens_io_enq_ready;
  wire  tokens_io_enq_valid;
  wire [15:0] tokens_io_enq_bits;
  wire  tokens_io_deq_ready;
  wire  tokens_io_deq_valid;
  wire [15:0] tokens_io_deq_bits;
  wire [4:0] tokens_io_count;
  wire  trace_clock;
  wire  trace_reset;
  wire  trace_io_enq_ready;
  wire  trace_io_enq_valid;
  wire [15:0] trace_io_enq_bits;
  wire  trace_io_deq_ready;
  wire  trace_io_deq_valid;
  wire [15:0] trace_io_deq_bits;
  wire [10:0] trace_io_count;
  wire [9:0] trace_io_limit;
  wire  T_36;
  wire  T_37;
  wire [11:0] T_39;
  wire [10:0] T_40;
  wire  Queue_5_1_clock;
  wire  Queue_5_1_reset;
  wire  Queue_5_1_io_enq_ready;
  wire  Queue_5_1_io_enq_valid;
  wire [15:0] Queue_5_1_io_enq_bits;
  wire  Queue_5_1_io_deq_ready;
  wire  Queue_5_1_io_deq_valid;
  wire [15:0] Queue_5_1_io_deq_bits;
  wire  Queue_5_1_io_count;
  Queue_4 tokens (
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits),
    .io_count(tokens_io_count)
  );
  TraceQueue_2 trace (
    .clock(trace_clock),
    .reset(trace_reset),
    .io_enq_ready(trace_io_enq_ready),
    .io_enq_valid(trace_io_enq_valid),
    .io_enq_bits(trace_io_enq_bits),
    .io_deq_ready(trace_io_deq_ready),
    .io_deq_valid(trace_io_deq_valid),
    .io_deq_bits(trace_io_deq_bits),
    .io_count(trace_io_count),
    .io_limit(trace_io_limit)
  );
  Queue_5 Queue_5_1 (
    .clock(Queue_5_1_clock),
    .reset(Queue_5_1_reset),
    .io_enq_ready(Queue_5_1_io_enq_ready),
    .io_enq_valid(Queue_5_1_io_enq_valid),
    .io_enq_bits(Queue_5_1_io_enq_bits),
    .io_deq_ready(Queue_5_1_io_deq_ready),
    .io_deq_valid(Queue_5_1_io_deq_valid),
    .io_deq_bits(Queue_5_1_io_deq_bits),
    .io_count(Queue_5_1_io_count)
  );
  assign io_in_ready = tokens_io_enq_ready;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_trace_valid = Queue_5_1_io_deq_valid;
  assign io_trace_bits = Queue_5_1_io_deq_bits;
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid;
  assign tokens_io_enq_bits = io_in_bits;
  assign tokens_io_deq_ready = io_out_ready;
  assign trace_clock = clock;
  assign trace_reset = reset;
  assign trace_io_enq_valid = T_37;
  assign trace_io_enq_bits = io_out_bits;
  assign trace_io_deq_ready = Queue_5_1_io_enq_ready;
  assign trace_io_limit = T_40[9:0];
  assign T_36 = io_out_ready & io_out_valid;
  assign T_37 = T_36 & trace_io_enq_ready;
  assign T_39 = io_traceLen - 11'h2;
  assign T_40 = T_39[10:0];
  assign Queue_5_1_clock = clock;
  assign Queue_5_1_reset = reset;
  assign Queue_5_1_io_enq_valid = trace_io_deq_valid;
  assign Queue_5_1_io_enq_bits = trace_io_deq_bits;
  assign Queue_5_1_io_deq_ready = io_trace_ready;
endmodule
module Channel_3(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input  [15:0] io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output [15:0] io_out_bits,
  input   io_trace_ready,
  output  io_trace_valid,
  output [15:0] io_trace_bits,
  input  [10:0] io_traceLen
);
  wire  tokens_clock;
  wire  tokens_reset;
  wire  tokens_io_enq_ready;
  wire  tokens_io_enq_valid;
  wire [15:0] tokens_io_enq_bits;
  wire  tokens_io_deq_ready;
  wire  tokens_io_deq_valid;
  wire [15:0] tokens_io_deq_bits;
  wire [4:0] tokens_io_count;
  wire  trace_clock;
  wire  trace_reset;
  wire  trace_io_enq_ready;
  wire  trace_io_enq_valid;
  wire [15:0] trace_io_enq_bits;
  wire  trace_io_deq_ready;
  wire  trace_io_deq_valid;
  wire [15:0] trace_io_deq_bits;
  wire [10:0] trace_io_count;
  wire [9:0] trace_io_limit;
  wire  T_36;
  wire  T_37;
  wire [11:0] T_39;
  wire [10:0] T_40;
  wire  Queue_7_1_clock;
  wire  Queue_7_1_reset;
  wire  Queue_7_1_io_enq_ready;
  wire  Queue_7_1_io_enq_valid;
  wire [15:0] Queue_7_1_io_enq_bits;
  wire  Queue_7_1_io_deq_ready;
  wire  Queue_7_1_io_deq_valid;
  wire [15:0] Queue_7_1_io_deq_bits;
  wire  Queue_7_1_io_count;
  Queue_4 tokens (
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits),
    .io_count(tokens_io_count)
  );
  TraceQueue_2 trace (
    .clock(trace_clock),
    .reset(trace_reset),
    .io_enq_ready(trace_io_enq_ready),
    .io_enq_valid(trace_io_enq_valid),
    .io_enq_bits(trace_io_enq_bits),
    .io_deq_ready(trace_io_deq_ready),
    .io_deq_valid(trace_io_deq_valid),
    .io_deq_bits(trace_io_deq_bits),
    .io_count(trace_io_count),
    .io_limit(trace_io_limit)
  );
  Queue_5 Queue_7_1 (
    .clock(Queue_7_1_clock),
    .reset(Queue_7_1_reset),
    .io_enq_ready(Queue_7_1_io_enq_ready),
    .io_enq_valid(Queue_7_1_io_enq_valid),
    .io_enq_bits(Queue_7_1_io_enq_bits),
    .io_deq_ready(Queue_7_1_io_deq_ready),
    .io_deq_valid(Queue_7_1_io_deq_valid),
    .io_deq_bits(Queue_7_1_io_deq_bits),
    .io_count(Queue_7_1_io_count)
  );
  assign io_in_ready = tokens_io_enq_ready;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_trace_valid = Queue_7_1_io_deq_valid;
  assign io_trace_bits = Queue_7_1_io_deq_bits;
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid;
  assign tokens_io_enq_bits = io_in_bits;
  assign tokens_io_deq_ready = io_out_ready;
  assign trace_clock = clock;
  assign trace_reset = reset;
  assign trace_io_enq_valid = T_37;
  assign trace_io_enq_bits = io_out_bits;
  assign trace_io_deq_ready = Queue_7_1_io_enq_ready;
  assign trace_io_limit = T_40[9:0];
  assign T_36 = io_out_ready & io_out_valid;
  assign T_37 = T_36 & trace_io_enq_ready;
  assign T_39 = io_traceLen - 11'h2;
  assign T_40 = T_39[10:0];
  assign Queue_7_1_clock = clock;
  assign Queue_7_1_reset = reset;
  assign Queue_7_1_io_enq_valid = trace_io_deq_valid;
  assign Queue_7_1_io_enq_bits = trace_io_deq_bits;
  assign Queue_7_1_io_deq_ready = io_trace_ready;
endmodule
module Channel_4(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input   io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output  io_out_bits,
  input   io_trace_ready,
  output  io_trace_valid,
  output  io_trace_bits,
  input  [10:0] io_traceLen
);
  wire  tokens_clock;
  wire  tokens_reset;
  wire  tokens_io_enq_ready;
  wire  tokens_io_enq_valid;
  wire  tokens_io_enq_bits;
  wire  tokens_io_deq_ready;
  wire  tokens_io_deq_valid;
  wire  tokens_io_deq_bits;
  wire [4:0] tokens_io_count;
  wire  trace_clock;
  wire  trace_reset;
  wire  trace_io_enq_ready;
  wire  trace_io_enq_valid;
  wire  trace_io_enq_bits;
  wire  trace_io_deq_ready;
  wire  trace_io_deq_valid;
  wire  trace_io_deq_bits;
  wire [10:0] trace_io_count;
  wire [9:0] trace_io_limit;
  wire  T_36;
  wire  T_37;
  wire [11:0] T_39;
  wire [10:0] T_40;
  wire  Queue_9_1_clock;
  wire  Queue_9_1_reset;
  wire  Queue_9_1_io_enq_ready;
  wire  Queue_9_1_io_enq_valid;
  wire  Queue_9_1_io_enq_bits;
  wire  Queue_9_1_io_deq_ready;
  wire  Queue_9_1_io_deq_valid;
  wire  Queue_9_1_io_deq_bits;
  wire  Queue_9_1_io_count;
  Queue tokens (
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits),
    .io_count(tokens_io_count)
  );
  TraceQueue trace (
    .clock(trace_clock),
    .reset(trace_reset),
    .io_enq_ready(trace_io_enq_ready),
    .io_enq_valid(trace_io_enq_valid),
    .io_enq_bits(trace_io_enq_bits),
    .io_deq_ready(trace_io_deq_ready),
    .io_deq_valid(trace_io_deq_valid),
    .io_deq_bits(trace_io_deq_bits),
    .io_count(trace_io_count),
    .io_limit(trace_io_limit)
  );
  Queue_1 Queue_9_1 (
    .clock(Queue_9_1_clock),
    .reset(Queue_9_1_reset),
    .io_enq_ready(Queue_9_1_io_enq_ready),
    .io_enq_valid(Queue_9_1_io_enq_valid),
    .io_enq_bits(Queue_9_1_io_enq_bits),
    .io_deq_ready(Queue_9_1_io_deq_ready),
    .io_deq_valid(Queue_9_1_io_deq_valid),
    .io_deq_bits(Queue_9_1_io_deq_bits),
    .io_count(Queue_9_1_io_count)
  );
  assign io_in_ready = tokens_io_enq_ready;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_trace_valid = Queue_9_1_io_deq_valid;
  assign io_trace_bits = Queue_9_1_io_deq_bits;
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid;
  assign tokens_io_enq_bits = io_in_bits;
  assign tokens_io_deq_ready = io_out_ready;
  assign trace_clock = clock;
  assign trace_reset = reset;
  assign trace_io_enq_valid = T_37;
  assign trace_io_enq_bits = io_out_bits;
  assign trace_io_deq_ready = Queue_9_1_io_enq_ready;
  assign trace_io_limit = T_40[9:0];
  assign T_36 = io_out_ready & io_out_valid;
  assign T_37 = T_36 & trace_io_enq_ready;
  assign T_39 = io_traceLen - 11'h2;
  assign T_40 = T_39[10:0];
  assign Queue_9_1_clock = clock;
  assign Queue_9_1_reset = reset;
  assign Queue_9_1_io_enq_valid = trace_io_deq_valid;
  assign Queue_9_1_io_enq_bits = trace_io_deq_bits;
  assign Queue_9_1_io_deq_ready = io_trace_ready;
endmodule
module Channel_5(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input  [15:0] io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output [15:0] io_out_bits,
  input   io_trace_ready,
  output  io_trace_valid,
  output [15:0] io_trace_bits,
  input  [10:0] io_traceLen
);
  wire  tokens_clock;
  wire  tokens_reset;
  wire  tokens_io_enq_ready;
  wire  tokens_io_enq_valid;
  wire [15:0] tokens_io_enq_bits;
  wire  tokens_io_deq_ready;
  wire  tokens_io_deq_valid;
  wire [15:0] tokens_io_deq_bits;
  wire [4:0] tokens_io_count;
  wire  trace_clock;
  wire  trace_reset;
  wire  trace_io_enq_ready;
  wire  trace_io_enq_valid;
  wire [15:0] trace_io_enq_bits;
  wire  trace_io_deq_ready;
  wire  trace_io_deq_valid;
  wire [15:0] trace_io_deq_bits;
  wire [10:0] trace_io_count;
  wire [9:0] trace_io_limit;
  wire  T_36;
  wire  T_37;
  wire [11:0] T_39;
  wire [10:0] T_40;
  wire  Queue_11_1_clock;
  wire  Queue_11_1_reset;
  wire  Queue_11_1_io_enq_ready;
  wire  Queue_11_1_io_enq_valid;
  wire [15:0] Queue_11_1_io_enq_bits;
  wire  Queue_11_1_io_deq_ready;
  wire  Queue_11_1_io_deq_valid;
  wire [15:0] Queue_11_1_io_deq_bits;
  wire  Queue_11_1_io_count;
  Queue_4 tokens (
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits),
    .io_count(tokens_io_count)
  );
  TraceQueue_2 trace (
    .clock(trace_clock),
    .reset(trace_reset),
    .io_enq_ready(trace_io_enq_ready),
    .io_enq_valid(trace_io_enq_valid),
    .io_enq_bits(trace_io_enq_bits),
    .io_deq_ready(trace_io_deq_ready),
    .io_deq_valid(trace_io_deq_valid),
    .io_deq_bits(trace_io_deq_bits),
    .io_count(trace_io_count),
    .io_limit(trace_io_limit)
  );
  Queue_5 Queue_11_1 (
    .clock(Queue_11_1_clock),
    .reset(Queue_11_1_reset),
    .io_enq_ready(Queue_11_1_io_enq_ready),
    .io_enq_valid(Queue_11_1_io_enq_valid),
    .io_enq_bits(Queue_11_1_io_enq_bits),
    .io_deq_ready(Queue_11_1_io_deq_ready),
    .io_deq_valid(Queue_11_1_io_deq_valid),
    .io_deq_bits(Queue_11_1_io_deq_bits),
    .io_count(Queue_11_1_io_count)
  );
  assign io_in_ready = tokens_io_enq_ready;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_trace_valid = Queue_11_1_io_deq_valid;
  assign io_trace_bits = Queue_11_1_io_deq_bits;
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid;
  assign tokens_io_enq_bits = io_in_bits;
  assign tokens_io_deq_ready = io_out_ready;
  assign trace_clock = clock;
  assign trace_reset = reset;
  assign trace_io_enq_valid = T_37;
  assign trace_io_enq_bits = io_out_bits;
  assign trace_io_deq_ready = Queue_11_1_io_enq_ready;
  assign trace_io_limit = T_40[9:0];
  assign T_36 = io_out_ready & io_out_valid;
  assign T_37 = T_36 & trace_io_enq_ready;
  assign T_39 = io_traceLen - 11'h2;
  assign T_40 = T_39[10:0];
  assign Queue_11_1_clock = clock;
  assign Queue_11_1_reset = reset;
  assign Queue_11_1_io_enq_valid = trace_io_deq_valid;
  assign Queue_11_1_io_enq_bits = trace_io_deq_bits;
  assign Queue_11_1_io_deq_ready = io_trace_ready;
endmodule
module SimWrapper(
  input   clock,
  input   reset,
  output  io_ins_0_ready,
  input   io_ins_0_valid,
  input  [31:0] io_ins_0_bits,
  output  io_ins_1_ready,
  input   io_ins_1_valid,
  input  [31:0] io_ins_1_bits,
  output  io_ins_2_ready,
  input   io_ins_2_valid,
  input  [31:0] io_ins_2_bits,
  output  io_ins_3_ready,
  input   io_ins_3_valid,
  input  [31:0] io_ins_3_bits,
  input   io_outs_0_ready,
  output  io_outs_0_valid,
  output [31:0] io_outs_0_bits,
  input   io_outs_1_ready,
  output  io_outs_1_valid,
  output [31:0] io_outs_1_bits,
  input   io_inT_0_ready,
  output  io_inT_0_valid,
  output [31:0] io_inT_0_bits,
  input   io_inT_1_ready,
  output  io_inT_1_valid,
  output [31:0] io_inT_1_bits,
  input   io_inT_2_ready,
  output  io_inT_2_valid,
  output [31:0] io_inT_2_bits,
  input   io_inT_3_ready,
  output  io_inT_3_valid,
  output [31:0] io_inT_3_bits,
  input   io_outT_0_ready,
  output  io_outT_0_valid,
  output [31:0] io_outT_0_bits,
  input   io_outT_1_ready,
  output  io_outT_1_valid,
  output [31:0] io_outT_1_bits,
  output  io_daisy_regs_0_in_ready,
  input   io_daisy_regs_0_in_valid,
  input  [31:0] io_daisy_regs_0_in_bits,
  input   io_daisy_regs_0_out_ready,
  output  io_daisy_regs_0_out_valid,
  output [31:0] io_daisy_regs_0_out_bits,
  output  io_daisy_trace_0_in_ready,
  input   io_daisy_trace_0_in_valid,
  input  [31:0] io_daisy_trace_0_in_bits,
  input   io_daisy_trace_0_out_ready,
  output  io_daisy_trace_0_out_valid,
  output [31:0] io_daisy_trace_0_out_bits,
  output  io_daisy_cntr_0_in_ready,
  input   io_daisy_cntr_0_in_valid,
  input  [31:0] io_daisy_cntr_0_in_bits,
  input   io_daisy_cntr_0_out_ready,
  output  io_daisy_cntr_0_out_valid,
  output [31:0] io_daisy_cntr_0_out_bits,
  output  io_daisy_sram_0_in_ready,
  input   io_daisy_sram_0_in_valid,
  input  [31:0] io_daisy_sram_0_in_bits,
  input   io_daisy_sram_0_out_ready,
  output  io_daisy_sram_0_out_valid,
  output [31:0] io_daisy_sram_0_out_bits,
  input   io_daisy_sram_0_restart,
  input  [10:0] io_traceLen
);
  wire  target_clock;
  wire  target_reset;
  wire [15:0] target_io_a;
  wire [15:0] target_io_b;
  wire  target_io_e;
  wire [15:0] target_io_z;
  wire  target_io_v;
  wire  target_targetFire;
  wire  target_daisyReset;
  wire  target_daisy_regs_0_in_ready;
  wire  target_daisy_regs_0_in_valid;
  wire [31:0] target_daisy_regs_0_in_bits;
  wire  target_daisy_regs_0_out_ready;
  wire  target_daisy_regs_0_out_valid;
  wire [31:0] target_daisy_regs_0_out_bits;
  wire  target_daisy_trace_0_in_ready;
  wire  target_daisy_trace_0_in_valid;
  wire [31:0] target_daisy_trace_0_in_bits;
  wire  target_daisy_trace_0_out_ready;
  wire  target_daisy_trace_0_out_valid;
  wire [31:0] target_daisy_trace_0_out_bits;
  wire  target_daisy_cntr_0_in_ready;
  wire  target_daisy_cntr_0_in_valid;
  wire [31:0] target_daisy_cntr_0_in_bits;
  wire  target_daisy_cntr_0_out_ready;
  wire  target_daisy_cntr_0_out_valid;
  wire [31:0] target_daisy_cntr_0_out_bits;
  wire  target_daisy_sram_0_in_ready;
  wire  target_daisy_sram_0_in_valid;
  wire [31:0] target_daisy_sram_0_in_bits;
  wire  target_daisy_sram_0_out_ready;
  wire  target_daisy_sram_0_out_valid;
  wire [31:0] target_daisy_sram_0_out_bits;
  wire  target_daisy_sram_0_restart;
  wire  fire;
  wire  Channel_reset_0_clock;
  wire  Channel_reset_0_reset;
  wire  Channel_reset_0_io_in_ready;
  wire  Channel_reset_0_io_in_valid;
  wire  Channel_reset_0_io_in_bits;
  wire  Channel_reset_0_io_out_ready;
  wire  Channel_reset_0_io_out_valid;
  wire  Channel_reset_0_io_out_bits;
  wire  Channel_reset_0_io_trace_ready;
  wire  Channel_reset_0_io_trace_valid;
  wire  Channel_reset_0_io_trace_bits;
  wire [10:0] Channel_reset_0_io_traceLen;
  wire  Channel_io_e_0_clock;
  wire  Channel_io_e_0_reset;
  wire  Channel_io_e_0_io_in_ready;
  wire  Channel_io_e_0_io_in_valid;
  wire  Channel_io_e_0_io_in_bits;
  wire  Channel_io_e_0_io_out_ready;
  wire  Channel_io_e_0_io_out_valid;
  wire  Channel_io_e_0_io_out_bits;
  wire  Channel_io_e_0_io_trace_ready;
  wire  Channel_io_e_0_io_trace_valid;
  wire  Channel_io_e_0_io_trace_bits;
  wire [10:0] Channel_io_e_0_io_traceLen;
  wire  Channel_io_b_0_clock;
  wire  Channel_io_b_0_reset;
  wire  Channel_io_b_0_io_in_ready;
  wire  Channel_io_b_0_io_in_valid;
  wire [15:0] Channel_io_b_0_io_in_bits;
  wire  Channel_io_b_0_io_out_ready;
  wire  Channel_io_b_0_io_out_valid;
  wire [15:0] Channel_io_b_0_io_out_bits;
  wire  Channel_io_b_0_io_trace_ready;
  wire  Channel_io_b_0_io_trace_valid;
  wire [15:0] Channel_io_b_0_io_trace_bits;
  wire [10:0] Channel_io_b_0_io_traceLen;
  wire  Channel_io_a_0_clock;
  wire  Channel_io_a_0_reset;
  wire  Channel_io_a_0_io_in_ready;
  wire  Channel_io_a_0_io_in_valid;
  wire [15:0] Channel_io_a_0_io_in_bits;
  wire  Channel_io_a_0_io_out_ready;
  wire  Channel_io_a_0_io_out_valid;
  wire [15:0] Channel_io_a_0_io_out_bits;
  wire  Channel_io_a_0_io_trace_ready;
  wire  Channel_io_a_0_io_trace_valid;
  wire [15:0] Channel_io_a_0_io_trace_bits;
  wire [10:0] Channel_io_a_0_io_traceLen;
  wire  Channel_io_v_0_clock;
  wire  Channel_io_v_0_reset;
  wire  Channel_io_v_0_io_in_ready;
  wire  Channel_io_v_0_io_in_valid;
  wire  Channel_io_v_0_io_in_bits;
  wire  Channel_io_v_0_io_out_ready;
  wire  Channel_io_v_0_io_out_valid;
  wire  Channel_io_v_0_io_out_bits;
  wire  Channel_io_v_0_io_trace_ready;
  wire  Channel_io_v_0_io_trace_valid;
  wire  Channel_io_v_0_io_trace_bits;
  wire [10:0] Channel_io_v_0_io_traceLen;
  wire  Channel_io_z_0_clock;
  wire  Channel_io_z_0_reset;
  wire  Channel_io_z_0_io_in_ready;
  wire  Channel_io_z_0_io_in_valid;
  wire [15:0] Channel_io_z_0_io_in_bits;
  wire  Channel_io_z_0_io_out_ready;
  wire  Channel_io_z_0_io_out_valid;
  wire [15:0] Channel_io_z_0_io_out_bits;
  wire  Channel_io_z_0_io_trace_ready;
  wire  Channel_io_z_0_io_trace_valid;
  wire [15:0] Channel_io_z_0_io_trace_bits;
  wire [10:0] Channel_io_z_0_io_traceLen;
  wire  T_468;
  reg  reset_buffer;
  reg [31:0] GEN_5;
  wire  GEN_0;
  wire  T_471;
  reg  io_e_buffer;
  reg [31:0] GEN_6;
  wire  GEN_1;
  reg [15:0] io_b_buffer;
  reg [31:0] GEN_7;
  wire [15:0] GEN_2;
  reg [15:0] io_a_buffer;
  reg [31:0] GEN_8;
  wire [15:0] GEN_3;
  wire  T_479;
  wire [15:0] T_481;
  wire  T_483;
  wire  T_484;
  wire  T_485;
  wire  T_486;
  wire  T_488;
  wire  T_489;
  wire  T_490;
  reg [63:0] cycles;
  reg [63:0] GEN_9;
  wire [64:0] T_494;
  wire [63:0] T_495;
  wire [63:0] T_496;
  wire [63:0] GEN_4;
  GCD target (
    .clock(target_clock),
    .reset(target_reset),
    .io_a(target_io_a),
    .io_b(target_io_b),
    .io_e(target_io_e),
    .io_z(target_io_z),
    .io_v(target_io_v),
    .targetFire(target_targetFire),
    .daisyReset(target_daisyReset),
    .daisy_regs_0_in_ready(target_daisy_regs_0_in_ready),
    .daisy_regs_0_in_valid(target_daisy_regs_0_in_valid),
    .daisy_regs_0_in_bits(target_daisy_regs_0_in_bits),
    .daisy_regs_0_out_ready(target_daisy_regs_0_out_ready),
    .daisy_regs_0_out_valid(target_daisy_regs_0_out_valid),
    .daisy_regs_0_out_bits(target_daisy_regs_0_out_bits),
    .daisy_trace_0_in_ready(target_daisy_trace_0_in_ready),
    .daisy_trace_0_in_valid(target_daisy_trace_0_in_valid),
    .daisy_trace_0_in_bits(target_daisy_trace_0_in_bits),
    .daisy_trace_0_out_ready(target_daisy_trace_0_out_ready),
    .daisy_trace_0_out_valid(target_daisy_trace_0_out_valid),
    .daisy_trace_0_out_bits(target_daisy_trace_0_out_bits),
    .daisy_cntr_0_in_ready(target_daisy_cntr_0_in_ready),
    .daisy_cntr_0_in_valid(target_daisy_cntr_0_in_valid),
    .daisy_cntr_0_in_bits(target_daisy_cntr_0_in_bits),
    .daisy_cntr_0_out_ready(target_daisy_cntr_0_out_ready),
    .daisy_cntr_0_out_valid(target_daisy_cntr_0_out_valid),
    .daisy_cntr_0_out_bits(target_daisy_cntr_0_out_bits),
    .daisy_sram_0_in_ready(target_daisy_sram_0_in_ready),
    .daisy_sram_0_in_valid(target_daisy_sram_0_in_valid),
    .daisy_sram_0_in_bits(target_daisy_sram_0_in_bits),
    .daisy_sram_0_out_ready(target_daisy_sram_0_out_ready),
    .daisy_sram_0_out_valid(target_daisy_sram_0_out_valid),
    .daisy_sram_0_out_bits(target_daisy_sram_0_out_bits),
    .daisy_sram_0_restart(target_daisy_sram_0_restart)
  );
  Channel Channel_reset_0 (
    .clock(Channel_reset_0_clock),
    .reset(Channel_reset_0_reset),
    .io_in_ready(Channel_reset_0_io_in_ready),
    .io_in_valid(Channel_reset_0_io_in_valid),
    .io_in_bits(Channel_reset_0_io_in_bits),
    .io_out_ready(Channel_reset_0_io_out_ready),
    .io_out_valid(Channel_reset_0_io_out_valid),
    .io_out_bits(Channel_reset_0_io_out_bits),
    .io_trace_ready(Channel_reset_0_io_trace_ready),
    .io_trace_valid(Channel_reset_0_io_trace_valid),
    .io_trace_bits(Channel_reset_0_io_trace_bits),
    .io_traceLen(Channel_reset_0_io_traceLen)
  );
  Channel_1 Channel_io_e_0 (
    .clock(Channel_io_e_0_clock),
    .reset(Channel_io_e_0_reset),
    .io_in_ready(Channel_io_e_0_io_in_ready),
    .io_in_valid(Channel_io_e_0_io_in_valid),
    .io_in_bits(Channel_io_e_0_io_in_bits),
    .io_out_ready(Channel_io_e_0_io_out_ready),
    .io_out_valid(Channel_io_e_0_io_out_valid),
    .io_out_bits(Channel_io_e_0_io_out_bits),
    .io_trace_ready(Channel_io_e_0_io_trace_ready),
    .io_trace_valid(Channel_io_e_0_io_trace_valid),
    .io_trace_bits(Channel_io_e_0_io_trace_bits),
    .io_traceLen(Channel_io_e_0_io_traceLen)
  );
  Channel_2 Channel_io_b_0 (
    .clock(Channel_io_b_0_clock),
    .reset(Channel_io_b_0_reset),
    .io_in_ready(Channel_io_b_0_io_in_ready),
    .io_in_valid(Channel_io_b_0_io_in_valid),
    .io_in_bits(Channel_io_b_0_io_in_bits),
    .io_out_ready(Channel_io_b_0_io_out_ready),
    .io_out_valid(Channel_io_b_0_io_out_valid),
    .io_out_bits(Channel_io_b_0_io_out_bits),
    .io_trace_ready(Channel_io_b_0_io_trace_ready),
    .io_trace_valid(Channel_io_b_0_io_trace_valid),
    .io_trace_bits(Channel_io_b_0_io_trace_bits),
    .io_traceLen(Channel_io_b_0_io_traceLen)
  );
  Channel_3 Channel_io_a_0 (
    .clock(Channel_io_a_0_clock),
    .reset(Channel_io_a_0_reset),
    .io_in_ready(Channel_io_a_0_io_in_ready),
    .io_in_valid(Channel_io_a_0_io_in_valid),
    .io_in_bits(Channel_io_a_0_io_in_bits),
    .io_out_ready(Channel_io_a_0_io_out_ready),
    .io_out_valid(Channel_io_a_0_io_out_valid),
    .io_out_bits(Channel_io_a_0_io_out_bits),
    .io_trace_ready(Channel_io_a_0_io_trace_ready),
    .io_trace_valid(Channel_io_a_0_io_trace_valid),
    .io_trace_bits(Channel_io_a_0_io_trace_bits),
    .io_traceLen(Channel_io_a_0_io_traceLen)
  );
  Channel_4 Channel_io_v_0 (
    .clock(Channel_io_v_0_clock),
    .reset(Channel_io_v_0_reset),
    .io_in_ready(Channel_io_v_0_io_in_ready),
    .io_in_valid(Channel_io_v_0_io_in_valid),
    .io_in_bits(Channel_io_v_0_io_in_bits),
    .io_out_ready(Channel_io_v_0_io_out_ready),
    .io_out_valid(Channel_io_v_0_io_out_valid),
    .io_out_bits(Channel_io_v_0_io_out_bits),
    .io_trace_ready(Channel_io_v_0_io_trace_ready),
    .io_trace_valid(Channel_io_v_0_io_trace_valid),
    .io_trace_bits(Channel_io_v_0_io_trace_bits),
    .io_traceLen(Channel_io_v_0_io_traceLen)
  );
  Channel_5 Channel_io_z_0 (
    .clock(Channel_io_z_0_clock),
    .reset(Channel_io_z_0_reset),
    .io_in_ready(Channel_io_z_0_io_in_ready),
    .io_in_valid(Channel_io_z_0_io_in_valid),
    .io_in_bits(Channel_io_z_0_io_in_bits),
    .io_out_ready(Channel_io_z_0_io_out_ready),
    .io_out_valid(Channel_io_z_0_io_out_valid),
    .io_out_bits(Channel_io_z_0_io_out_bits),
    .io_trace_ready(Channel_io_z_0_io_trace_ready),
    .io_trace_valid(Channel_io_z_0_io_trace_valid),
    .io_trace_bits(Channel_io_z_0_io_trace_bits),
    .io_traceLen(Channel_io_z_0_io_traceLen)
  );
  assign io_ins_0_ready = Channel_reset_0_io_in_ready;
  assign io_ins_1_ready = Channel_io_e_0_io_in_ready;
  assign io_ins_2_ready = Channel_io_b_0_io_in_ready;
  assign io_ins_3_ready = Channel_io_a_0_io_in_ready;
  assign io_outs_0_valid = Channel_io_v_0_io_out_valid;
  assign io_outs_0_bits = {{31'd0}, Channel_io_v_0_io_out_bits};
  assign io_outs_1_valid = Channel_io_z_0_io_out_valid;
  assign io_outs_1_bits = {{16'd0}, Channel_io_z_0_io_out_bits};
  assign io_inT_0_valid = Channel_reset_0_io_trace_valid;
  assign io_inT_0_bits = {{31'd0}, Channel_reset_0_io_trace_bits};
  assign io_inT_1_valid = Channel_io_e_0_io_trace_valid;
  assign io_inT_1_bits = {{31'd0}, Channel_io_e_0_io_trace_bits};
  assign io_inT_2_valid = Channel_io_b_0_io_trace_valid;
  assign io_inT_2_bits = {{16'd0}, Channel_io_b_0_io_trace_bits};
  assign io_inT_3_valid = Channel_io_a_0_io_trace_valid;
  assign io_inT_3_bits = {{16'd0}, Channel_io_a_0_io_trace_bits};
  assign io_outT_0_valid = Channel_io_v_0_io_trace_valid;
  assign io_outT_0_bits = {{31'd0}, Channel_io_v_0_io_trace_bits};
  assign io_outT_1_valid = Channel_io_z_0_io_trace_valid;
  assign io_outT_1_bits = {{16'd0}, Channel_io_z_0_io_trace_bits};
  assign io_daisy_regs_0_in_ready = target_daisy_regs_0_in_ready;
  assign io_daisy_regs_0_out_valid = target_daisy_regs_0_out_valid;
  assign io_daisy_regs_0_out_bits = target_daisy_regs_0_out_bits;
  assign io_daisy_trace_0_in_ready = target_daisy_trace_0_in_ready;
  assign io_daisy_trace_0_out_valid = target_daisy_trace_0_out_valid;
  assign io_daisy_trace_0_out_bits = target_daisy_trace_0_out_bits;
  assign io_daisy_cntr_0_in_ready = target_daisy_cntr_0_in_ready;
  assign io_daisy_cntr_0_out_valid = target_daisy_cntr_0_out_valid;
  assign io_daisy_cntr_0_out_bits = target_daisy_cntr_0_out_bits;
  assign io_daisy_sram_0_in_ready = target_daisy_sram_0_in_ready;
  assign io_daisy_sram_0_out_valid = target_daisy_sram_0_out_valid;
  assign io_daisy_sram_0_out_bits = target_daisy_sram_0_out_bits;
  assign target_clock = clock;
  assign target_reset = GEN_0;
  assign target_io_a = GEN_3;
  assign target_io_b = GEN_2;
  assign target_io_e = GEN_1;
  assign target_targetFire = fire;
  assign target_daisyReset = reset;
  assign target_daisy_regs_0_in_valid = io_daisy_regs_0_in_valid;
  assign target_daisy_regs_0_in_bits = io_daisy_regs_0_in_bits;
  assign target_daisy_regs_0_out_ready = io_daisy_regs_0_out_ready;
  assign target_daisy_trace_0_in_valid = io_daisy_trace_0_in_valid;
  assign target_daisy_trace_0_in_bits = io_daisy_trace_0_in_bits;
  assign target_daisy_trace_0_out_ready = io_daisy_trace_0_out_ready;
  assign target_daisy_cntr_0_in_valid = io_daisy_cntr_0_in_valid;
  assign target_daisy_cntr_0_in_bits = io_daisy_cntr_0_in_bits;
  assign target_daisy_cntr_0_out_ready = io_daisy_cntr_0_out_ready;
  assign target_daisy_sram_0_in_valid = io_daisy_sram_0_in_valid;
  assign target_daisy_sram_0_in_bits = io_daisy_sram_0_in_bits;
  assign target_daisy_sram_0_out_ready = io_daisy_sram_0_out_ready;
  assign target_daisy_sram_0_restart = io_daisy_sram_0_restart;
  assign fire = T_490;
  assign Channel_reset_0_clock = clock;
  assign Channel_reset_0_reset = reset;
  assign Channel_reset_0_io_in_valid = io_ins_0_valid;
  assign Channel_reset_0_io_in_bits = io_ins_0_bits[0];
  assign Channel_reset_0_io_out_ready = fire;
  assign Channel_reset_0_io_trace_ready = io_inT_0_ready;
  assign Channel_reset_0_io_traceLen = io_traceLen;
  assign Channel_io_e_0_clock = clock;
  assign Channel_io_e_0_reset = reset;
  assign Channel_io_e_0_io_in_valid = io_ins_1_valid;
  assign Channel_io_e_0_io_in_bits = io_ins_1_bits[0];
  assign Channel_io_e_0_io_out_ready = fire;
  assign Channel_io_e_0_io_trace_ready = io_inT_1_ready;
  assign Channel_io_e_0_io_traceLen = io_traceLen;
  assign Channel_io_b_0_clock = clock;
  assign Channel_io_b_0_reset = reset;
  assign Channel_io_b_0_io_in_valid = io_ins_2_valid;
  assign Channel_io_b_0_io_in_bits = io_ins_2_bits[15:0];
  assign Channel_io_b_0_io_out_ready = fire;
  assign Channel_io_b_0_io_trace_ready = io_inT_2_ready;
  assign Channel_io_b_0_io_traceLen = io_traceLen;
  assign Channel_io_a_0_clock = clock;
  assign Channel_io_a_0_reset = reset;
  assign Channel_io_a_0_io_in_valid = io_ins_3_valid;
  assign Channel_io_a_0_io_in_bits = io_ins_3_bits[15:0];
  assign Channel_io_a_0_io_out_ready = fire;
  assign Channel_io_a_0_io_trace_ready = io_inT_3_ready;
  assign Channel_io_a_0_io_traceLen = io_traceLen;
  assign Channel_io_v_0_clock = clock;
  assign Channel_io_v_0_reset = reset;
  assign Channel_io_v_0_io_in_valid = fire;
  assign Channel_io_v_0_io_in_bits = T_479;
  assign Channel_io_v_0_io_out_ready = io_outs_0_ready;
  assign Channel_io_v_0_io_trace_ready = io_outT_0_ready;
  assign Channel_io_v_0_io_traceLen = io_traceLen;
  assign Channel_io_z_0_clock = clock;
  assign Channel_io_z_0_reset = reset;
  assign Channel_io_z_0_io_in_valid = fire;
  assign Channel_io_z_0_io_in_bits = T_481;
  assign Channel_io_z_0_io_out_ready = io_outs_1_ready;
  assign Channel_io_z_0_io_trace_ready = io_outT_1_ready;
  assign Channel_io_z_0_io_traceLen = io_traceLen;
  assign T_468 = Channel_reset_0_io_out_bits;
  assign GEN_0 = fire ? T_468 : reset_buffer;
  assign T_471 = Channel_io_e_0_io_out_bits;
  assign GEN_1 = fire ? T_471 : io_e_buffer;
  assign GEN_2 = fire ? Channel_io_b_0_io_out_bits : io_b_buffer;
  assign GEN_3 = fire ? Channel_io_a_0_io_out_bits : io_a_buffer;
  assign T_479 = target_io_v >> 1'h0;
  assign T_481 = target_io_z >> 1'h0;
  assign T_483 = Channel_reset_0_io_out_valid;
  assign T_484 = T_483 & Channel_io_e_0_io_out_valid;
  assign T_485 = T_484 & Channel_io_b_0_io_out_valid;
  assign T_486 = T_485 & Channel_io_a_0_io_out_valid;
  assign T_488 = Channel_io_v_0_io_in_ready;
  assign T_489 = T_488 & Channel_io_z_0_io_in_ready;
  assign T_490 = T_486 & T_489;
  assign T_494 = cycles + 64'h1;
  assign T_495 = T_494[63:0];
  assign T_496 = target_reset ? 64'h0 : T_495;
  assign GEN_4 = fire ? T_496 : cycles;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_5 = {1{$random}};
  reset_buffer = GEN_5[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_6 = {1{$random}};
  io_e_buffer = GEN_6[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_7 = {1{$random}};
  io_b_buffer = GEN_7[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_8 = {1{$random}};
  io_a_buffer = GEN_8[15:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_9 = {2{$random}};
  cycles = GEN_9[63:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (fire) begin
      reset_buffer <= T_468;
    end
    if (fire) begin
      io_e_buffer <= T_471;
    end
    if (fire) begin
      io_b_buffer <= Channel_io_b_0_io_out_bits;
    end
    if (fire) begin
      io_a_buffer <= Channel_io_a_0_io_out_bits;
    end
    if (fire) begin
      if (target_reset) begin
        cycles <= 64'h0;
      end else begin
        cycles <= T_495;
      end
    end
  end
endmodule
module Queue_0(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [31:0] io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output [31:0] io_deq_bits,
  output [1:0] io_count
);
  reg [31:0] ram [0:1];
  reg [31:0] GEN_0;
  wire [31:0] ram_T_51_data;
  wire  ram_T_51_addr;
  wire [31:0] ram_T_35_data;
  wire  ram_T_35_addr;
  wire  ram_T_35_mask;
  wire  ram_T_35_en;
  reg  T_27;
  reg [31:0] GEN_1;
  reg  T_29;
  reg [31:0] GEN_2;
  reg  maybe_full;
  reg [31:0] GEN_3;
  wire  ptr_match;
  wire  T_32;
  wire  empty;
  wire  full;
  wire  T_33;
  wire  do_enq;
  wire  T_34;
  wire  do_deq;
  wire [1:0] T_39;
  wire  T_40;
  wire  GEN_4;
  wire [1:0] T_44;
  wire  T_45;
  wire  GEN_5;
  wire  T_46;
  wire  GEN_6;
  wire  T_48;
  wire  T_50;
  wire  GEN_7;
  wire  GEN_8;
  wire [31:0] GEN_9;
  wire  GEN_10;
  wire  GEN_11;
  wire [1:0] T_55;
  wire  ptr_diff;
  wire  T_56;
  wire [1:0] T_57;
  assign io_enq_ready = T_50;
  assign io_deq_valid = GEN_7;
  assign io_deq_bits = GEN_9;
  assign io_count = T_57;
  assign ram_T_51_addr = T_29;
  assign ram_T_51_data = ram[ram_T_51_addr];
  assign ram_T_35_data = io_enq_bits;
  assign ram_T_35_addr = T_27;
  assign ram_T_35_mask = do_enq;
  assign ram_T_35_en = do_enq;
  assign ptr_match = T_27 == T_29;
  assign T_32 = maybe_full == 1'h0;
  assign empty = ptr_match & T_32;
  assign full = ptr_match & maybe_full;
  assign T_33 = io_enq_ready & io_enq_valid;
  assign do_enq = GEN_11;
  assign T_34 = io_deq_ready & io_deq_valid;
  assign do_deq = GEN_10;
  assign T_39 = T_27 + 1'h1;
  assign T_40 = T_39[0:0];
  assign GEN_4 = do_enq ? T_40 : T_27;
  assign T_44 = T_29 + 1'h1;
  assign T_45 = T_44[0:0];
  assign GEN_5 = do_deq ? T_45 : T_29;
  assign T_46 = do_enq != do_deq;
  assign GEN_6 = T_46 ? do_enq : maybe_full;
  assign T_48 = empty == 1'h0;
  assign T_50 = full == 1'h0;
  assign GEN_7 = io_enq_valid ? 1'h1 : T_48;
  assign GEN_8 = io_deq_ready ? 1'h0 : T_33;
  assign GEN_9 = empty ? io_enq_bits : ram_T_51_data;
  assign GEN_10 = empty ? 1'h0 : T_34;
  assign GEN_11 = empty ? GEN_8 : T_33;
  assign T_55 = T_27 - T_29;
  assign ptr_diff = T_55[0:0];
  assign T_56 = maybe_full & ptr_match;
  assign T_57 = {T_56,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram[initvar] = GEN_0[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  T_27 = GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_2 = {1{$random}};
  T_29 = GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_3 = {1{$random}};
  maybe_full = GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_T_35_en & ram_T_35_mask) begin
      ram[ram_T_35_addr] <= ram_T_35_data;
    end
    if (reset) begin
      T_27 <= 1'h0;
    end else begin
      if (do_enq) begin
        T_27 <= T_40;
      end
    end
    if (reset) begin
      T_29 <= 1'h0;
    end else begin
      if (do_deq) begin
        T_29 <= T_45;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_46) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module NastiArbiter(
  input   clock,
  input   reset,
  output  io_master_0_aw_ready,
  input   io_master_0_aw_valid,
  input  [31:0] io_master_0_aw_bits_addr,
  input  [7:0] io_master_0_aw_bits_len,
  input  [2:0] io_master_0_aw_bits_size,
  input  [1:0] io_master_0_aw_bits_burst,
  input   io_master_0_aw_bits_lock,
  input  [3:0] io_master_0_aw_bits_cache,
  input  [2:0] io_master_0_aw_bits_prot,
  input  [3:0] io_master_0_aw_bits_qos,
  input  [3:0] io_master_0_aw_bits_region,
  input  [5:0] io_master_0_aw_bits_id,
  input   io_master_0_aw_bits_user,
  output  io_master_0_w_ready,
  input   io_master_0_w_valid,
  input  [63:0] io_master_0_w_bits_data,
  input   io_master_0_w_bits_last,
  input  [5:0] io_master_0_w_bits_id,
  input  [7:0] io_master_0_w_bits_strb,
  input   io_master_0_w_bits_user,
  input   io_master_0_b_ready,
  output  io_master_0_b_valid,
  output [1:0] io_master_0_b_bits_resp,
  output [5:0] io_master_0_b_bits_id,
  output  io_master_0_b_bits_user,
  output  io_master_0_ar_ready,
  input   io_master_0_ar_valid,
  input  [31:0] io_master_0_ar_bits_addr,
  input  [7:0] io_master_0_ar_bits_len,
  input  [2:0] io_master_0_ar_bits_size,
  input  [1:0] io_master_0_ar_bits_burst,
  input   io_master_0_ar_bits_lock,
  input  [3:0] io_master_0_ar_bits_cache,
  input  [2:0] io_master_0_ar_bits_prot,
  input  [3:0] io_master_0_ar_bits_qos,
  input  [3:0] io_master_0_ar_bits_region,
  input  [5:0] io_master_0_ar_bits_id,
  input   io_master_0_ar_bits_user,
  input   io_master_0_r_ready,
  output  io_master_0_r_valid,
  output [1:0] io_master_0_r_bits_resp,
  output [63:0] io_master_0_r_bits_data,
  output  io_master_0_r_bits_last,
  output [5:0] io_master_0_r_bits_id,
  output  io_master_0_r_bits_user,
  input   io_slave_aw_ready,
  output  io_slave_aw_valid,
  output [31:0] io_slave_aw_bits_addr,
  output [7:0] io_slave_aw_bits_len,
  output [2:0] io_slave_aw_bits_size,
  output [1:0] io_slave_aw_bits_burst,
  output  io_slave_aw_bits_lock,
  output [3:0] io_slave_aw_bits_cache,
  output [2:0] io_slave_aw_bits_prot,
  output [3:0] io_slave_aw_bits_qos,
  output [3:0] io_slave_aw_bits_region,
  output [5:0] io_slave_aw_bits_id,
  output  io_slave_aw_bits_user,
  input   io_slave_w_ready,
  output  io_slave_w_valid,
  output [63:0] io_slave_w_bits_data,
  output  io_slave_w_bits_last,
  output [5:0] io_slave_w_bits_id,
  output [7:0] io_slave_w_bits_strb,
  output  io_slave_w_bits_user,
  output  io_slave_b_ready,
  input   io_slave_b_valid,
  input  [1:0] io_slave_b_bits_resp,
  input  [5:0] io_slave_b_bits_id,
  input   io_slave_b_bits_user,
  input   io_slave_ar_ready,
  output  io_slave_ar_valid,
  output [31:0] io_slave_ar_bits_addr,
  output [7:0] io_slave_ar_bits_len,
  output [2:0] io_slave_ar_bits_size,
  output [1:0] io_slave_ar_bits_burst,
  output  io_slave_ar_bits_lock,
  output [3:0] io_slave_ar_bits_cache,
  output [2:0] io_slave_ar_bits_prot,
  output [3:0] io_slave_ar_bits_qos,
  output [3:0] io_slave_ar_bits_region,
  output [5:0] io_slave_ar_bits_id,
  output  io_slave_ar_bits_user,
  output  io_slave_r_ready,
  input   io_slave_r_valid,
  input  [1:0] io_slave_r_bits_resp,
  input  [63:0] io_slave_r_bits_data,
  input   io_slave_r_bits_last,
  input  [5:0] io_slave_r_bits_id,
  input   io_slave_r_bits_user
);
  assign io_master_0_aw_ready = io_slave_aw_ready;
  assign io_master_0_w_ready = io_slave_w_ready;
  assign io_master_0_b_valid = io_slave_b_valid;
  assign io_master_0_b_bits_resp = io_slave_b_bits_resp;
  assign io_master_0_b_bits_id = io_slave_b_bits_id;
  assign io_master_0_b_bits_user = io_slave_b_bits_user;
  assign io_master_0_ar_ready = io_slave_ar_ready;
  assign io_master_0_r_valid = io_slave_r_valid;
  assign io_master_0_r_bits_resp = io_slave_r_bits_resp;
  assign io_master_0_r_bits_data = io_slave_r_bits_data;
  assign io_master_0_r_bits_last = io_slave_r_bits_last;
  assign io_master_0_r_bits_id = io_slave_r_bits_id;
  assign io_master_0_r_bits_user = io_slave_r_bits_user;
  assign io_slave_aw_valid = io_master_0_aw_valid;
  assign io_slave_aw_bits_addr = io_master_0_aw_bits_addr;
  assign io_slave_aw_bits_len = io_master_0_aw_bits_len;
  assign io_slave_aw_bits_size = io_master_0_aw_bits_size;
  assign io_slave_aw_bits_burst = io_master_0_aw_bits_burst;
  assign io_slave_aw_bits_lock = io_master_0_aw_bits_lock;
  assign io_slave_aw_bits_cache = io_master_0_aw_bits_cache;
  assign io_slave_aw_bits_prot = io_master_0_aw_bits_prot;
  assign io_slave_aw_bits_qos = io_master_0_aw_bits_qos;
  assign io_slave_aw_bits_region = io_master_0_aw_bits_region;
  assign io_slave_aw_bits_id = io_master_0_aw_bits_id;
  assign io_slave_aw_bits_user = io_master_0_aw_bits_user;
  assign io_slave_w_valid = io_master_0_w_valid;
  assign io_slave_w_bits_data = io_master_0_w_bits_data;
  assign io_slave_w_bits_last = io_master_0_w_bits_last;
  assign io_slave_w_bits_id = io_master_0_w_bits_id;
  assign io_slave_w_bits_strb = io_master_0_w_bits_strb;
  assign io_slave_w_bits_user = io_master_0_w_bits_user;
  assign io_slave_b_ready = io_master_0_b_ready;
  assign io_slave_ar_valid = io_master_0_ar_valid;
  assign io_slave_ar_bits_addr = io_master_0_ar_bits_addr;
  assign io_slave_ar_bits_len = io_master_0_ar_bits_len;
  assign io_slave_ar_bits_size = io_master_0_ar_bits_size;
  assign io_slave_ar_bits_burst = io_master_0_ar_bits_burst;
  assign io_slave_ar_bits_lock = io_master_0_ar_bits_lock;
  assign io_slave_ar_bits_cache = io_master_0_ar_bits_cache;
  assign io_slave_ar_bits_prot = io_master_0_ar_bits_prot;
  assign io_slave_ar_bits_qos = io_master_0_ar_bits_qos;
  assign io_slave_ar_bits_region = io_master_0_ar_bits_region;
  assign io_slave_ar_bits_id = io_master_0_ar_bits_id;
  assign io_slave_ar_bits_user = io_master_0_ar_bits_user;
  assign io_slave_r_ready = io_master_0_r_ready;
endmodule
module Queue_5_1(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [31:0] io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output [31:0] io_deq_bits,
  output [4:0] io_count
);
  reg [31:0] ram [0:15];
  reg [31:0] GEN_0;
  wire [31:0] ram_T_51_data;
  wire [3:0] ram_T_51_addr;
  wire [31:0] ram_T_35_data;
  wire [3:0] ram_T_35_addr;
  wire  ram_T_35_mask;
  wire  ram_T_35_en;
  reg [3:0] T_27;
  reg [31:0] GEN_1;
  reg [3:0] T_29;
  reg [31:0] GEN_2;
  reg  maybe_full;
  reg [31:0] GEN_3;
  wire  ptr_match;
  wire  T_32;
  wire  empty;
  wire  full;
  wire  T_33;
  wire  do_enq;
  wire  T_34;
  wire  do_deq;
  wire [4:0] T_39;
  wire [3:0] T_40;
  wire [3:0] GEN_4;
  wire [4:0] T_44;
  wire [3:0] T_45;
  wire [3:0] GEN_5;
  wire  T_46;
  wire  GEN_6;
  wire  T_48;
  wire  T_50;
  wire [4:0] T_52;
  wire [3:0] ptr_diff;
  wire  T_53;
  wire [4:0] T_54;
  assign io_enq_ready = T_50;
  assign io_deq_valid = T_48;
  assign io_deq_bits = ram_T_51_data;
  assign io_count = T_54;
  assign ram_T_51_addr = T_29;
  assign ram_T_51_data = ram[ram_T_51_addr];
  assign ram_T_35_data = io_enq_bits;
  assign ram_T_35_addr = T_27;
  assign ram_T_35_mask = do_enq;
  assign ram_T_35_en = do_enq;
  assign ptr_match = T_27 == T_29;
  assign T_32 = maybe_full == 1'h0;
  assign empty = ptr_match & T_32;
  assign full = ptr_match & maybe_full;
  assign T_33 = io_enq_ready & io_enq_valid;
  assign do_enq = T_33;
  assign T_34 = io_deq_ready & io_deq_valid;
  assign do_deq = T_34;
  assign T_39 = T_27 + 4'h1;
  assign T_40 = T_39[3:0];
  assign GEN_4 = do_enq ? T_40 : T_27;
  assign T_44 = T_29 + 4'h1;
  assign T_45 = T_44[3:0];
  assign GEN_5 = do_deq ? T_45 : T_29;
  assign T_46 = do_enq != do_deq;
  assign GEN_6 = T_46 ? do_enq : maybe_full;
  assign T_48 = empty == 1'h0;
  assign T_50 = full == 1'h0;
  assign T_52 = T_27 - T_29;
  assign ptr_diff = T_52[3:0];
  assign T_53 = maybe_full & ptr_match;
  assign T_54 = {T_53,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = GEN_0[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  T_27 = GEN_1[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_2 = {1{$random}};
  T_29 = GEN_2[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_3 = {1{$random}};
  maybe_full = GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_T_35_en & ram_T_35_mask) begin
      ram[ram_T_35_addr] <= ram_T_35_data;
    end
    if (reset) begin
      T_27 <= 4'h0;
    end else begin
      if (do_enq) begin
        T_27 <= T_40;
      end
    end
    if (reset) begin
      T_29 <= 4'h0;
    end else begin
      if (do_deq) begin
        T_29 <= T_45;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_46) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module Channel_6(
  input   clock,
  input   reset,
  output  io_in_ready,
  input   io_in_valid,
  input  [31:0] io_in_bits,
  input   io_out_ready,
  output  io_out_valid,
  output [31:0] io_out_bits,
  input   io_trace_ready,
  output  io_trace_valid,
  output [31:0] io_trace_bits,
  input  [10:0] io_traceLen
);
  wire  tokens_clock;
  wire  tokens_reset;
  wire  tokens_io_enq_ready;
  wire  tokens_io_enq_valid;
  wire [31:0] tokens_io_enq_bits;
  wire  tokens_io_deq_ready;
  wire  tokens_io_deq_valid;
  wire [31:0] tokens_io_deq_bits;
  wire [4:0] tokens_io_count;
  reg [31:0] GEN_0;
  reg [31:0] GEN_1;
  Queue_5_1 tokens (
    .clock(tokens_clock),
    .reset(tokens_reset),
    .io_enq_ready(tokens_io_enq_ready),
    .io_enq_valid(tokens_io_enq_valid),
    .io_enq_bits(tokens_io_enq_bits),
    .io_deq_ready(tokens_io_deq_ready),
    .io_deq_valid(tokens_io_deq_valid),
    .io_deq_bits(tokens_io_deq_bits),
    .io_count(tokens_io_count)
  );
  assign io_in_ready = tokens_io_enq_ready;
  assign io_out_valid = tokens_io_deq_valid;
  assign io_out_bits = tokens_io_deq_bits;
  assign io_trace_valid = 1'h0;
  assign io_trace_bits = GEN_0;
  assign tokens_clock = clock;
  assign tokens_reset = reset;
  assign tokens_io_enq_valid = io_in_valid;
  assign tokens_io_enq_bits = io_in_bits;
  assign tokens_io_deq_ready = io_out_ready;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  GEN_0 = GEN_1[31:0];
  `endif
  end
`endif
endmodule
module ZynqMasterHandler(
  input   clock,
  input   reset,
  output  io_ctrl_aw_ready,
  input   io_ctrl_aw_valid,
  input  [31:0] io_ctrl_aw_bits_addr,
  input  [7:0] io_ctrl_aw_bits_len,
  input  [2:0] io_ctrl_aw_bits_size,
  input  [1:0] io_ctrl_aw_bits_burst,
  input   io_ctrl_aw_bits_lock,
  input  [3:0] io_ctrl_aw_bits_cache,
  input  [2:0] io_ctrl_aw_bits_prot,
  input  [3:0] io_ctrl_aw_bits_qos,
  input  [3:0] io_ctrl_aw_bits_region,
  input  [11:0] io_ctrl_aw_bits_id,
  input   io_ctrl_aw_bits_user,
  output  io_ctrl_w_ready,
  input   io_ctrl_w_valid,
  input  [31:0] io_ctrl_w_bits_data,
  input   io_ctrl_w_bits_last,
  input  [11:0] io_ctrl_w_bits_id,
  input  [3:0] io_ctrl_w_bits_strb,
  input   io_ctrl_w_bits_user,
  input   io_ctrl_b_ready,
  output  io_ctrl_b_valid,
  output [1:0] io_ctrl_b_bits_resp,
  output [11:0] io_ctrl_b_bits_id,
  output  io_ctrl_b_bits_user,
  output  io_ctrl_ar_ready,
  input   io_ctrl_ar_valid,
  input  [31:0] io_ctrl_ar_bits_addr,
  input  [7:0] io_ctrl_ar_bits_len,
  input  [2:0] io_ctrl_ar_bits_size,
  input  [1:0] io_ctrl_ar_bits_burst,
  input   io_ctrl_ar_bits_lock,
  input  [3:0] io_ctrl_ar_bits_cache,
  input  [2:0] io_ctrl_ar_bits_prot,
  input  [3:0] io_ctrl_ar_bits_qos,
  input  [3:0] io_ctrl_ar_bits_region,
  input  [11:0] io_ctrl_ar_bits_id,
  input   io_ctrl_ar_bits_user,
  input   io_ctrl_r_ready,
  output  io_ctrl_r_valid,
  output [1:0] io_ctrl_r_bits_resp,
  output [31:0] io_ctrl_r_bits_data,
  output  io_ctrl_r_bits_last,
  output [11:0] io_ctrl_r_bits_id,
  output  io_ctrl_r_bits_user,
  input   io_ins_0_ready,
  output  io_ins_0_valid,
  output [31:0] io_ins_0_bits,
  input   io_ins_1_ready,
  output  io_ins_1_valid,
  output [31:0] io_ins_1_bits,
  input   io_ins_2_ready,
  output  io_ins_2_valid,
  output [31:0] io_ins_2_bits,
  output  io_outs_0_ready,
  input   io_outs_0_valid,
  input  [31:0] io_outs_0_bits,
  output  io_outs_1_ready,
  input   io_outs_1_valid,
  input  [31:0] io_outs_1_bits,
  output  io_inT_0_ready,
  input   io_inT_0_valid,
  input  [31:0] io_inT_0_bits,
  output  io_inT_1_ready,
  input   io_inT_1_valid,
  input  [31:0] io_inT_1_bits,
  output  io_inT_2_ready,
  input   io_inT_2_valid,
  input  [31:0] io_inT_2_bits,
  output  io_inT_3_ready,
  input   io_inT_3_valid,
  input  [31:0] io_inT_3_bits,
  output  io_outT_0_ready,
  input   io_outT_0_valid,
  input  [31:0] io_outT_0_bits,
  output  io_outT_1_ready,
  input   io_outT_1_valid,
  input  [31:0] io_outT_1_bits,
  input   io_mem_ar_0_ready,
  output  io_mem_ar_0_valid,
  output [31:0] io_mem_ar_0_bits,
  input   io_mem_aw_0_ready,
  output  io_mem_aw_0_valid,
  output [31:0] io_mem_aw_0_bits,
  output  io_mem_r_0_ready,
  input   io_mem_r_0_valid,
  input  [31:0] io_mem_r_0_bits,
  output  io_mem_r_1_ready,
  input   io_mem_r_1_valid,
  input  [31:0] io_mem_r_1_bits,
  input   io_mem_w_0_ready,
  output  io_mem_w_0_valid,
  output [31:0] io_mem_w_0_bits,
  input   io_mem_w_1_ready,
  output  io_mem_w_1_valid,
  output [31:0] io_mem_w_1_bits
);
  reg [11:0] awId;
  reg [31:0] GEN_0;
  reg [7:0] wAddr;
  reg [31:0] GEN_1;
  reg [1:0] wState;
  reg [31:0] GEN_2;
  wire  inputs_0_ready;
  wire  inputs_0_valid;
  wire [31:0] inputs_0_bits;
  wire  inputs_1_ready;
  wire  inputs_1_valid;
  wire [31:0] inputs_1_bits;
  wire  inputs_2_ready;
  wire  inputs_2_valid;
  wire [31:0] inputs_2_bits;
  wire  inputs_3_ready;
  wire  inputs_3_valid;
  wire [31:0] inputs_3_bits;
  wire  inputs_4_ready;
  wire  inputs_4_valid;
  wire [31:0] inputs_4_bits;
  wire  inputs_5_ready;
  wire  inputs_5_valid;
  wire [31:0] inputs_5_bits;
  wire  inputs_6_ready;
  wire  inputs_6_valid;
  wire [31:0] inputs_6_bits;
  wire  T_788;
  wire  T_789;
  wire  T_790;
  wire  T_792;
  wire  T_794;
  wire  T_796;
  wire  T_798;
  wire  T_800;
  wire  T_802;
  wire  T_804;
  wire  T_806;
  wire  T_808;
  wire  T_810;
  wire  T_812;
  wire  T_814;
  wire  T_815;
  wire [31:0] T_817;
  wire [1:0] GEN_3;
  wire [11:0] GEN_4;
  wire [31:0] GEN_5;
  wire [1:0] GEN_6;
  wire [11:0] GEN_7;
  wire [31:0] GEN_8;
  wire  T_818;
  wire [1:0] GEN_9;
  wire [1:0] GEN_10;
  wire  T_819;
  wire [2:0] T_826;
  wire  GEN_0_ready;
  wire  GEN_0_valid;
  wire [31:0] GEN_0_bits;
  wire  GEN_11;
  wire  GEN_12;
  wire [31:0] GEN_13;
  wire  GEN_14;
  wire  GEN_15;
  wire [31:0] GEN_16;
  wire  GEN_17;
  wire  GEN_18;
  wire [31:0] GEN_19;
  wire  GEN_20;
  wire  GEN_21;
  wire [31:0] GEN_22;
  wire  GEN_23;
  wire  GEN_24;
  wire [31:0] GEN_25;
  wire  GEN_26;
  wire  GEN_27;
  wire [31:0] GEN_28;
  wire [1:0] GEN_29;
  wire [1:0] GEN_30;
  wire  T_827;
  wire [1:0] GEN_31;
  wire [1:0] GEN_32;
  wire  T_828;
  wire  T_830;
  wire [1:0] T_836_resp;
  wire [11:0] T_836_id;
  wire  T_836_user;
  reg [11:0] arId;
  reg [31:0] GEN_68;
  reg [7:0] rAddr;
  reg [31:0] GEN_69;
  reg  rState;
  reg [31:0] GEN_70;
  wire  outputs_0_ready;
  wire  outputs_0_valid;
  wire [31:0] outputs_0_bits;
  wire  outputs_1_ready;
  wire  outputs_1_valid;
  wire [31:0] outputs_1_bits;
  wire  outputs_2_ready;
  wire  outputs_2_valid;
  wire [31:0] outputs_2_bits;
  wire  outputs_3_ready;
  wire  outputs_3_valid;
  wire [31:0] outputs_3_bits;
  wire  outputs_4_ready;
  wire  outputs_4_valid;
  wire [31:0] outputs_4_bits;
  wire  outputs_5_ready;
  wire  outputs_5_valid;
  wire [31:0] outputs_5_bits;
  wire  outputs_6_ready;
  wire  outputs_6_valid;
  wire [31:0] outputs_6_bits;
  wire  outputs_7_ready;
  wire  outputs_7_valid;
  wire [31:0] outputs_7_bits;
  wire  outputs_8_ready;
  wire  outputs_8_valid;
  wire [31:0] outputs_8_bits;
  wire  outputs_9_ready;
  wire  outputs_9_valid;
  wire [31:0] outputs_9_bits;
  wire  T_988;
  wire  T_989;
  wire  T_991;
  wire  T_992;
  wire  T_994;
  wire  T_995;
  wire  T_997;
  wire  T_998;
  wire  T_1000;
  wire  T_1001;
  wire  T_1003;
  wire  T_1004;
  wire  T_1006;
  wire  T_1007;
  wire  T_1009;
  wire  T_1010;
  wire  T_1012;
  wire  T_1013;
  wire  T_1015;
  wire  T_1016;
  wire  T_1017;
  wire [31:0] T_1019;
  wire  GEN_33;
  wire [11:0] GEN_34;
  wire [31:0] GEN_35;
  wire  GEN_36;
  wire [11:0] GEN_37;
  wire [31:0] GEN_38;
  wire  GEN_39;
  wire  GEN_40;
  wire  T_1021;
  wire [3:0] T_1028;
  wire  GEN_1_ready;
  wire  GEN_1_valid;
  wire [31:0] GEN_1_bits;
  wire  GEN_41;
  wire  GEN_42;
  wire [31:0] GEN_43;
  wire  GEN_44;
  wire  GEN_45;
  wire [31:0] GEN_46;
  wire  GEN_47;
  wire  GEN_48;
  wire [31:0] GEN_49;
  wire  GEN_50;
  wire  GEN_51;
  wire [31:0] GEN_52;
  wire  GEN_53;
  wire  GEN_54;
  wire [31:0] GEN_55;
  wire  GEN_56;
  wire  GEN_57;
  wire [31:0] GEN_58;
  wire  GEN_59;
  wire  GEN_60;
  wire [31:0] GEN_61;
  wire  GEN_62;
  wire  GEN_63;
  wire [31:0] GEN_64;
  wire  GEN_65;
  wire  GEN_66;
  wire [31:0] GEN_67;
  wire  T_1036;
  wire [1:0] T_1044_resp;
  wire [31:0] T_1044_data;
  wire  T_1044_last;
  wire [11:0] T_1044_id;
  wire  T_1044_user;
  wire  GEN_2_ready;
  wire  GEN_2_valid;
  wire [31:0] GEN_2_bits;
  assign io_ctrl_aw_ready = T_828;
  assign io_ctrl_w_ready = T_789;
  assign io_ctrl_b_valid = T_830;
  assign io_ctrl_b_bits_resp = T_836_resp;
  assign io_ctrl_b_bits_id = T_836_id;
  assign io_ctrl_b_bits_user = T_836_user;
  assign io_ctrl_ar_ready = T_1021;
  assign io_ctrl_r_valid = io_ctrl_r_bits_last;
  assign io_ctrl_r_bits_resp = T_1044_resp;
  assign io_ctrl_r_bits_data = T_1044_data;
  assign io_ctrl_r_bits_last = T_1044_last;
  assign io_ctrl_r_bits_id = T_1044_id;
  assign io_ctrl_r_bits_user = T_1044_user;
  assign io_ins_0_valid = inputs_0_valid;
  assign io_ins_0_bits = inputs_0_bits;
  assign io_ins_1_valid = inputs_1_valid;
  assign io_ins_1_bits = inputs_1_bits;
  assign io_ins_2_valid = inputs_2_valid;
  assign io_ins_2_bits = inputs_2_bits;
  assign io_outs_0_ready = outputs_0_ready;
  assign io_outs_1_ready = outputs_1_ready;
  assign io_inT_0_ready = outputs_2_ready;
  assign io_inT_1_ready = outputs_3_ready;
  assign io_inT_2_ready = outputs_4_ready;
  assign io_inT_3_ready = outputs_5_ready;
  assign io_outT_0_ready = outputs_6_ready;
  assign io_outT_1_ready = outputs_7_ready;
  assign io_mem_ar_0_valid = inputs_3_valid;
  assign io_mem_ar_0_bits = inputs_3_bits;
  assign io_mem_aw_0_valid = inputs_4_valid;
  assign io_mem_aw_0_bits = inputs_4_bits;
  assign io_mem_r_0_ready = outputs_8_ready;
  assign io_mem_r_1_ready = outputs_9_ready;
  assign io_mem_w_0_valid = inputs_5_valid;
  assign io_mem_w_0_bits = inputs_5_bits;
  assign io_mem_w_1_valid = inputs_6_valid;
  assign io_mem_w_1_bits = inputs_6_bits;
  assign inputs_0_ready = io_ins_0_ready;
  assign inputs_0_valid = T_790;
  assign inputs_0_bits = io_ctrl_w_bits_data;
  assign inputs_1_ready = io_ins_1_ready;
  assign inputs_1_valid = T_794;
  assign inputs_1_bits = io_ctrl_w_bits_data;
  assign inputs_2_ready = io_ins_2_ready;
  assign inputs_2_valid = T_798;
  assign inputs_2_bits = io_ctrl_w_bits_data;
  assign inputs_3_ready = io_mem_ar_0_ready;
  assign inputs_3_valid = T_802;
  assign inputs_3_bits = io_ctrl_w_bits_data;
  assign inputs_4_ready = io_mem_aw_0_ready;
  assign inputs_4_valid = T_806;
  assign inputs_4_bits = io_ctrl_w_bits_data;
  assign inputs_5_ready = io_mem_w_0_ready;
  assign inputs_5_valid = T_810;
  assign inputs_5_bits = io_ctrl_w_bits_data;
  assign inputs_6_ready = io_mem_w_1_ready;
  assign inputs_6_valid = T_814;
  assign inputs_6_bits = io_ctrl_w_bits_data;
  assign T_788 = wAddr == 8'h0;
  assign T_789 = wState == 2'h2;
  assign T_790 = T_788 & T_789;
  assign T_792 = wAddr == 8'h1;
  assign T_794 = T_792 & T_789;
  assign T_796 = wAddr == 8'h2;
  assign T_798 = T_796 & T_789;
  assign T_800 = wAddr == 8'h3;
  assign T_802 = T_800 & T_789;
  assign T_804 = wAddr == 8'h4;
  assign T_806 = T_804 & T_789;
  assign T_808 = wAddr == 8'h5;
  assign T_810 = T_808 & T_789;
  assign T_812 = wAddr == 8'h6;
  assign T_814 = T_812 & T_789;
  assign T_815 = 2'h0 == wState;
  assign T_817 = io_ctrl_aw_bits_addr >> 2'h2;
  assign GEN_3 = io_ctrl_aw_valid ? 2'h1 : wState;
  assign GEN_4 = io_ctrl_aw_valid ? io_ctrl_aw_bits_id : awId;
  assign GEN_5 = io_ctrl_aw_valid ? T_817 : {{24'd0}, wAddr};
  assign GEN_6 = T_815 ? GEN_3 : wState;
  assign GEN_7 = T_815 ? GEN_4 : awId;
  assign GEN_8 = T_815 ? GEN_5 : {{24'd0}, wAddr};
  assign T_818 = 2'h1 == wState;
  assign GEN_9 = io_ctrl_w_valid ? 2'h2 : GEN_6;
  assign GEN_10 = T_818 ? GEN_9 : GEN_6;
  assign T_819 = 2'h2 == wState;
  assign T_826 = wAddr[2:0];
  assign GEN_0_ready = GEN_26;
  assign GEN_0_valid = GEN_27;
  assign GEN_0_bits = GEN_28;
  assign GEN_11 = 3'h1 == T_826 ? inputs_1_ready : inputs_0_ready;
  assign GEN_12 = 3'h1 == T_826 ? inputs_1_valid : inputs_0_valid;
  assign GEN_13 = 3'h1 == T_826 ? inputs_1_bits : inputs_0_bits;
  assign GEN_14 = 3'h2 == T_826 ? inputs_2_ready : GEN_11;
  assign GEN_15 = 3'h2 == T_826 ? inputs_2_valid : GEN_12;
  assign GEN_16 = 3'h2 == T_826 ? inputs_2_bits : GEN_13;
  assign GEN_17 = 3'h3 == T_826 ? inputs_3_ready : GEN_14;
  assign GEN_18 = 3'h3 == T_826 ? inputs_3_valid : GEN_15;
  assign GEN_19 = 3'h3 == T_826 ? inputs_3_bits : GEN_16;
  assign GEN_20 = 3'h4 == T_826 ? inputs_4_ready : GEN_17;
  assign GEN_21 = 3'h4 == T_826 ? inputs_4_valid : GEN_18;
  assign GEN_22 = 3'h4 == T_826 ? inputs_4_bits : GEN_19;
  assign GEN_23 = 3'h5 == T_826 ? inputs_5_ready : GEN_20;
  assign GEN_24 = 3'h5 == T_826 ? inputs_5_valid : GEN_21;
  assign GEN_25 = 3'h5 == T_826 ? inputs_5_bits : GEN_22;
  assign GEN_26 = 3'h6 == T_826 ? inputs_6_ready : GEN_23;
  assign GEN_27 = 3'h6 == T_826 ? inputs_6_valid : GEN_24;
  assign GEN_28 = 3'h6 == T_826 ? inputs_6_bits : GEN_25;
  assign GEN_29 = GEN_0_ready ? 2'h3 : GEN_10;
  assign GEN_30 = T_819 ? GEN_29 : GEN_10;
  assign T_827 = 2'h3 == wState;
  assign GEN_31 = io_ctrl_b_ready ? 2'h0 : GEN_30;
  assign GEN_32 = T_827 ? GEN_31 : GEN_30;
  assign T_828 = wState == 2'h0;
  assign T_830 = wState == 2'h3;
  assign T_836_resp = 2'h0;
  assign T_836_id = awId;
  assign T_836_user = 1'h0;
  assign outputs_0_ready = T_989;
  assign outputs_0_valid = io_outs_0_valid;
  assign outputs_0_bits = io_outs_0_bits;
  assign outputs_1_ready = T_992;
  assign outputs_1_valid = io_outs_1_valid;
  assign outputs_1_bits = io_outs_1_bits;
  assign outputs_2_ready = T_995;
  assign outputs_2_valid = io_inT_0_valid;
  assign outputs_2_bits = io_inT_0_bits;
  assign outputs_3_ready = T_998;
  assign outputs_3_valid = io_inT_1_valid;
  assign outputs_3_bits = io_inT_1_bits;
  assign outputs_4_ready = T_1001;
  assign outputs_4_valid = io_inT_2_valid;
  assign outputs_4_bits = io_inT_2_bits;
  assign outputs_5_ready = T_1004;
  assign outputs_5_valid = io_inT_3_valid;
  assign outputs_5_bits = io_inT_3_bits;
  assign outputs_6_ready = T_1007;
  assign outputs_6_valid = io_outT_0_valid;
  assign outputs_6_bits = io_outT_0_bits;
  assign outputs_7_ready = T_1010;
  assign outputs_7_valid = io_outT_1_valid;
  assign outputs_7_bits = io_outT_1_bits;
  assign outputs_8_ready = T_1013;
  assign outputs_8_valid = io_mem_r_0_valid;
  assign outputs_8_bits = io_mem_r_0_bits;
  assign outputs_9_ready = T_1016;
  assign outputs_9_valid = io_mem_r_1_valid;
  assign outputs_9_bits = io_mem_r_1_bits;
  assign T_988 = rAddr == 8'h0;
  assign T_989 = T_988 & rState;
  assign T_991 = rAddr == 8'h1;
  assign T_992 = T_991 & rState;
  assign T_994 = rAddr == 8'h2;
  assign T_995 = T_994 & rState;
  assign T_997 = rAddr == 8'h3;
  assign T_998 = T_997 & rState;
  assign T_1000 = rAddr == 8'h4;
  assign T_1001 = T_1000 & rState;
  assign T_1003 = rAddr == 8'h5;
  assign T_1004 = T_1003 & rState;
  assign T_1006 = rAddr == 8'h6;
  assign T_1007 = T_1006 & rState;
  assign T_1009 = rAddr == 8'h7;
  assign T_1010 = T_1009 & rState;
  assign T_1012 = rAddr == 8'h8;
  assign T_1013 = T_1012 & rState;
  assign T_1015 = rAddr == 8'h9;
  assign T_1016 = T_1015 & rState;
  assign T_1017 = 1'h0 == rState;
  assign T_1019 = io_ctrl_ar_bits_addr >> 2'h2;
  assign GEN_33 = io_ctrl_ar_valid ? 1'h1 : rState;
  assign GEN_34 = io_ctrl_ar_valid ? io_ctrl_ar_bits_id : arId;
  assign GEN_35 = io_ctrl_ar_valid ? T_1019 : {{24'd0}, rAddr};
  assign GEN_36 = T_1017 ? GEN_33 : rState;
  assign GEN_37 = T_1017 ? GEN_34 : arId;
  assign GEN_38 = T_1017 ? GEN_35 : {{24'd0}, rAddr};
  assign GEN_39 = io_ctrl_r_ready ? 1'h0 : GEN_36;
  assign GEN_40 = rState ? GEN_39 : GEN_36;
  assign T_1021 = rState == 1'h0;
  assign T_1028 = rAddr[3:0];
  assign GEN_1_ready = GEN_65;
  assign GEN_1_valid = GEN_66;
  assign GEN_1_bits = GEN_67;
  assign GEN_41 = 4'h1 == T_1028 ? outputs_1_ready : outputs_0_ready;
  assign GEN_42 = 4'h1 == T_1028 ? outputs_1_valid : outputs_0_valid;
  assign GEN_43 = 4'h1 == T_1028 ? outputs_1_bits : outputs_0_bits;
  assign GEN_44 = 4'h2 == T_1028 ? outputs_2_ready : GEN_41;
  assign GEN_45 = 4'h2 == T_1028 ? outputs_2_valid : GEN_42;
  assign GEN_46 = 4'h2 == T_1028 ? outputs_2_bits : GEN_43;
  assign GEN_47 = 4'h3 == T_1028 ? outputs_3_ready : GEN_44;
  assign GEN_48 = 4'h3 == T_1028 ? outputs_3_valid : GEN_45;
  assign GEN_49 = 4'h3 == T_1028 ? outputs_3_bits : GEN_46;
  assign GEN_50 = 4'h4 == T_1028 ? outputs_4_ready : GEN_47;
  assign GEN_51 = 4'h4 == T_1028 ? outputs_4_valid : GEN_48;
  assign GEN_52 = 4'h4 == T_1028 ? outputs_4_bits : GEN_49;
  assign GEN_53 = 4'h5 == T_1028 ? outputs_5_ready : GEN_50;
  assign GEN_54 = 4'h5 == T_1028 ? outputs_5_valid : GEN_51;
  assign GEN_55 = 4'h5 == T_1028 ? outputs_5_bits : GEN_52;
  assign GEN_56 = 4'h6 == T_1028 ? outputs_6_ready : GEN_53;
  assign GEN_57 = 4'h6 == T_1028 ? outputs_6_valid : GEN_54;
  assign GEN_58 = 4'h6 == T_1028 ? outputs_6_bits : GEN_55;
  assign GEN_59 = 4'h7 == T_1028 ? outputs_7_ready : GEN_56;
  assign GEN_60 = 4'h7 == T_1028 ? outputs_7_valid : GEN_57;
  assign GEN_61 = 4'h7 == T_1028 ? outputs_7_bits : GEN_58;
  assign GEN_62 = 4'h8 == T_1028 ? outputs_8_ready : GEN_59;
  assign GEN_63 = 4'h8 == T_1028 ? outputs_8_valid : GEN_60;
  assign GEN_64 = 4'h8 == T_1028 ? outputs_8_bits : GEN_61;
  assign GEN_65 = 4'h9 == T_1028 ? outputs_9_ready : GEN_62;
  assign GEN_66 = 4'h9 == T_1028 ? outputs_9_valid : GEN_63;
  assign GEN_67 = 4'h9 == T_1028 ? outputs_9_bits : GEN_64;
  assign T_1036 = GEN_1_valid & rState;
  assign T_1044_resp = 2'h0;
  assign T_1044_data = GEN_2_bits;
  assign T_1044_last = T_1036;
  assign T_1044_id = arId;
  assign T_1044_user = 1'h0;
  assign GEN_2_ready = GEN_65;
  assign GEN_2_valid = GEN_66;
  assign GEN_2_bits = GEN_67;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_0 = {1{$random}};
  awId = GEN_0[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  wAddr = GEN_1[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_2 = {1{$random}};
  wState = GEN_2[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_68 = {1{$random}};
  arId = GEN_68[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_69 = {1{$random}};
  rAddr = GEN_69[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_70 = {1{$random}};
  rState = GEN_70[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (T_815) begin
      if (io_ctrl_aw_valid) begin
        awId <= io_ctrl_aw_bits_id;
      end
    end
    wAddr <= GEN_8[7:0];
    if (reset) begin
      wState <= 2'h0;
    end else begin
      if (T_827) begin
        if (io_ctrl_b_ready) begin
          wState <= 2'h0;
        end else begin
          if (T_819) begin
            if (GEN_0_ready) begin
              wState <= 2'h3;
            end else begin
              if (T_818) begin
                if (io_ctrl_w_valid) begin
                  wState <= 2'h2;
                end else begin
                  if (T_815) begin
                    if (io_ctrl_aw_valid) begin
                      wState <= 2'h1;
                    end
                  end
                end
              end else begin
                if (T_815) begin
                  if (io_ctrl_aw_valid) begin
                    wState <= 2'h1;
                  end
                end
              end
            end
          end else begin
            if (T_818) begin
              if (io_ctrl_w_valid) begin
                wState <= 2'h2;
              end else begin
                if (T_815) begin
                  if (io_ctrl_aw_valid) begin
                    wState <= 2'h1;
                  end
                end
              end
            end else begin
              if (T_815) begin
                if (io_ctrl_aw_valid) begin
                  wState <= 2'h1;
                end
              end
            end
          end
        end
      end else begin
        if (T_819) begin
          if (GEN_0_ready) begin
            wState <= 2'h3;
          end else begin
            if (T_818) begin
              if (io_ctrl_w_valid) begin
                wState <= 2'h2;
              end else begin
                wState <= GEN_6;
              end
            end else begin
              wState <= GEN_6;
            end
          end
        end else begin
          if (T_818) begin
            if (io_ctrl_w_valid) begin
              wState <= 2'h2;
            end else begin
              wState <= GEN_6;
            end
          end else begin
            wState <= GEN_6;
          end
        end
      end
    end
    if (T_1017) begin
      if (io_ctrl_ar_valid) begin
        arId <= io_ctrl_ar_bits_id;
      end
    end
    rAddr <= GEN_38[7:0];
    if (reset) begin
      rState <= 1'h0;
    end else begin
      if (rState) begin
        if (io_ctrl_r_ready) begin
          rState <= 1'h0;
        end else begin
          if (T_1017) begin
            if (io_ctrl_ar_valid) begin
              rState <= 1'h1;
            end
          end
        end
      end else begin
        if (T_1017) begin
          if (io_ctrl_ar_valid) begin
            rState <= 1'h1;
          end
        end
      end
    end
  end
endmodule
module Queue_11(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [31:0] io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output [31:0] io_deq_bits,
  output [1:0] io_count
);
  reg [31:0] ram [0:1];
  reg [31:0] GEN_0;
  wire [31:0] ram_T_51_data;
  wire  ram_T_51_addr;
  wire [31:0] ram_T_35_data;
  wire  ram_T_35_addr;
  wire  ram_T_35_mask;
  wire  ram_T_35_en;
  reg  T_27;
  reg [31:0] GEN_1;
  reg  T_29;
  reg [31:0] GEN_2;
  reg  maybe_full;
  reg [31:0] GEN_3;
  wire  ptr_match;
  wire  T_32;
  wire  empty;
  wire  full;
  wire  T_33;
  wire  do_enq;
  wire  T_34;
  wire  do_deq;
  wire [1:0] T_39;
  wire  T_40;
  wire  GEN_4;
  wire [1:0] T_44;
  wire  T_45;
  wire  GEN_5;
  wire  T_46;
  wire  GEN_6;
  wire  T_48;
  wire  T_50;
  wire [1:0] T_52;
  wire  ptr_diff;
  wire  T_53;
  wire [1:0] T_54;
  assign io_enq_ready = T_50;
  assign io_deq_valid = T_48;
  assign io_deq_bits = ram_T_51_data;
  assign io_count = T_54;
  assign ram_T_51_addr = T_29;
  assign ram_T_51_data = ram[ram_T_51_addr];
  assign ram_T_35_data = io_enq_bits;
  assign ram_T_35_addr = T_27;
  assign ram_T_35_mask = do_enq;
  assign ram_T_35_en = do_enq;
  assign ptr_match = T_27 == T_29;
  assign T_32 = maybe_full == 1'h0;
  assign empty = ptr_match & T_32;
  assign full = ptr_match & maybe_full;
  assign T_33 = io_enq_ready & io_enq_valid;
  assign do_enq = T_33;
  assign T_34 = io_deq_ready & io_deq_valid;
  assign do_deq = T_34;
  assign T_39 = T_27 + 1'h1;
  assign T_40 = T_39[0:0];
  assign GEN_4 = do_enq ? T_40 : T_27;
  assign T_44 = T_29 + 1'h1;
  assign T_45 = T_44[0:0];
  assign GEN_5 = do_deq ? T_45 : T_29;
  assign T_46 = do_enq != do_deq;
  assign GEN_6 = T_46 ? do_enq : maybe_full;
  assign T_48 = empty == 1'h0;
  assign T_50 = full == 1'h0;
  assign T_52 = T_27 - T_29;
  assign ptr_diff = T_52[0:0];
  assign T_53 = maybe_full & ptr_match;
  assign T_54 = {T_53,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    ram[initvar] = GEN_0[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  T_27 = GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_2 = {1{$random}};
  T_29 = GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_3 = {1{$random}};
  maybe_full = GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_T_35_en & ram_T_35_mask) begin
      ram[ram_T_35_addr] <= ram_T_35_data;
    end
    if (reset) begin
      T_27 <= 1'h0;
    end else begin
      if (do_enq) begin
        T_27 <= T_40;
      end
    end
    if (reset) begin
      T_29 <= 1'h0;
    end else begin
      if (do_deq) begin
        T_29 <= T_45;
      end
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_46) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module MCRFile(
  input   clock,
  input   reset,
  output  io_nasti_aw_ready,
  input   io_nasti_aw_valid,
  input  [31:0] io_nasti_aw_bits_addr,
  input  [7:0] io_nasti_aw_bits_len,
  input  [2:0] io_nasti_aw_bits_size,
  input  [1:0] io_nasti_aw_bits_burst,
  input   io_nasti_aw_bits_lock,
  input  [3:0] io_nasti_aw_bits_cache,
  input  [2:0] io_nasti_aw_bits_prot,
  input  [3:0] io_nasti_aw_bits_qos,
  input  [3:0] io_nasti_aw_bits_region,
  input  [11:0] io_nasti_aw_bits_id,
  input   io_nasti_aw_bits_user,
  output  io_nasti_w_ready,
  input   io_nasti_w_valid,
  input  [31:0] io_nasti_w_bits_data,
  input   io_nasti_w_bits_last,
  input  [11:0] io_nasti_w_bits_id,
  input  [3:0] io_nasti_w_bits_strb,
  input   io_nasti_w_bits_user,
  input   io_nasti_b_ready,
  output  io_nasti_b_valid,
  output [1:0] io_nasti_b_bits_resp,
  output [11:0] io_nasti_b_bits_id,
  output  io_nasti_b_bits_user,
  output  io_nasti_ar_ready,
  input   io_nasti_ar_valid,
  input  [31:0] io_nasti_ar_bits_addr,
  input  [7:0] io_nasti_ar_bits_len,
  input  [2:0] io_nasti_ar_bits_size,
  input  [1:0] io_nasti_ar_bits_burst,
  input   io_nasti_ar_bits_lock,
  input  [3:0] io_nasti_ar_bits_cache,
  input  [2:0] io_nasti_ar_bits_prot,
  input  [3:0] io_nasti_ar_bits_qos,
  input  [3:0] io_nasti_ar_bits_region,
  input  [11:0] io_nasti_ar_bits_id,
  input   io_nasti_ar_bits_user,
  input   io_nasti_r_ready,
  output  io_nasti_r_valid,
  output [1:0] io_nasti_r_bits_resp,
  output [31:0] io_nasti_r_bits_data,
  output  io_nasti_r_bits_last,
  output [11:0] io_nasti_r_bits_id,
  output  io_nasti_r_bits_user,
  output  io_mcr_read_0_ready,
  input   io_mcr_read_0_valid,
  input  [31:0] io_mcr_read_0_bits,
  output  io_mcr_read_1_ready,
  input   io_mcr_read_1_valid,
  input  [31:0] io_mcr_read_1_bits,
  output  io_mcr_read_2_ready,
  input   io_mcr_read_2_valid,
  input  [31:0] io_mcr_read_2_bits,
  output  io_mcr_read_3_ready,
  input   io_mcr_read_3_valid,
  input  [31:0] io_mcr_read_3_bits,
  output  io_mcr_read_4_ready,
  input   io_mcr_read_4_valid,
  input  [31:0] io_mcr_read_4_bits,
  input   io_mcr_write_0_ready,
  output  io_mcr_write_0_valid,
  output [31:0] io_mcr_write_0_bits,
  input   io_mcr_write_1_ready,
  output  io_mcr_write_1_valid,
  output [31:0] io_mcr_write_1_bits,
  input   io_mcr_write_2_ready,
  output  io_mcr_write_2_valid,
  output [31:0] io_mcr_write_2_bits,
  input   io_mcr_write_3_ready,
  output  io_mcr_write_3_valid,
  output [31:0] io_mcr_write_3_bits,
  input   io_mcr_write_4_ready,
  output  io_mcr_write_4_valid,
  output [31:0] io_mcr_write_4_bits,
  output [3:0] io_mcr_wstrb
);
  reg  rValid;
  reg [31:0] GEN_1;
  reg  arFired;
  reg [31:0] GEN_4;
  reg  awFired;
  reg [31:0] GEN_5;
  reg  wFired;
  reg [31:0] GEN_31;
  reg  wCommited;
  reg [31:0] GEN_32;
  reg [11:0] bId;
  reg [31:0] GEN_33;
  reg [11:0] rId;
  reg [31:0] GEN_34;
  reg [31:0] rData;
  reg [31:0] GEN_35;
  reg [31:0] wData;
  reg [31:0] GEN_36;
  reg [2:0] wAddr;
  reg [31:0] GEN_37;
  reg [2:0] rAddr;
  reg [31:0] GEN_38;
  reg [3:0] wStrb;
  reg [31:0] GEN_39;
  wire  T_468;
  wire [29:0] T_470;
  wire  T_472;
  wire  T_473;
  wire  T_475;
  wire  GEN_6;
  wire [29:0] GEN_7;
  wire [11:0] GEN_8;
  wire  T_476;
  wire  GEN_9;
  wire [31:0] GEN_10;
  wire [3:0] GEN_11;
  wire  T_478;
  wire [29:0] T_480;
  wire [2:0] T_481;
  wire  T_483;
  wire  T_484;
  wire  T_486;
  wire  GEN_12;
  wire [2:0] GEN_13;
  wire [11:0] GEN_14;
  wire  T_487;
  wire  GEN_15;
  wire  T_489;
  wire  GEN_16;
  wire  GEN_17;
  wire  GEN_18;
  wire  GEN_0_ready;
  wire  GEN_0_valid;
  wire [31:0] GEN_0_bits;
  wire  GEN_19;
  wire  GEN_20;
  wire [31:0] GEN_21;
  wire  GEN_22;
  wire  GEN_23;
  wire [31:0] GEN_24;
  wire  GEN_25;
  wire  GEN_26;
  wire [31:0] GEN_27;
  wire  GEN_28;
  wire  GEN_29;
  wire [31:0] GEN_30;
  wire  GEN_1_ready;
  wire  GEN_1_valid;
  wire [31:0] GEN_1_bits;
  wire  T_499;
  wire  GEN_43;
  wire  T_517;
  wire  T_518;
  wire  T_519;
  wire  GEN_2;
  wire  GEN_44;
  wire  GEN_45;
  wire  GEN_46;
  wire  GEN_47;
  wire  GEN_48;
  wire  T_526;
  wire  GEN_3;
  wire  GEN_49;
  wire  GEN_50;
  wire  GEN_51;
  wire  GEN_52;
  wire  GEN_53;
  wire [1:0] T_541_resp;
  wire [31:0] T_541_data;
  wire  T_541_last;
  wire [11:0] T_541_id;
  wire  T_541_user;
  wire  GEN_4_ready;
  wire  GEN_4_valid;
  wire [31:0] GEN_4_bits;
  wire  GEN_54;
  wire  GEN_55;
  wire [31:0] GEN_56;
  wire  GEN_57;
  wire  GEN_58;
  wire [31:0] GEN_59;
  wire  GEN_60;
  wire  GEN_61;
  wire [31:0] GEN_62;
  wire  GEN_63;
  wire  GEN_64;
  wire [31:0] GEN_65;
  wire  GEN_5_ready;
  wire  GEN_5_valid;
  wire [31:0] GEN_5_bits;
  wire  T_554;
  wire [1:0] T_560_resp;
  wire [11:0] T_560_id;
  wire  T_560_user;
  wire  T_566;
  wire  T_567;
  wire  T_568;
  wire  T_569;
  reg [3:0] GEN_0;
  reg [31:0] GEN_40;
  assign io_nasti_aw_ready = T_568;
  assign io_nasti_w_ready = T_569;
  assign io_nasti_b_valid = T_566;
  assign io_nasti_b_bits_resp = T_560_resp;
  assign io_nasti_b_bits_id = T_560_id;
  assign io_nasti_b_bits_user = T_560_user;
  assign io_nasti_ar_ready = T_567;
  assign io_nasti_r_valid = T_554;
  assign io_nasti_r_bits_resp = T_541_resp;
  assign io_nasti_r_bits_data = T_541_data;
  assign io_nasti_r_bits_last = T_541_last;
  assign io_nasti_r_bits_id = T_541_id;
  assign io_nasti_r_bits_user = T_541_user;
  assign io_mcr_read_0_ready = GEN_49;
  assign io_mcr_read_1_ready = GEN_50;
  assign io_mcr_read_2_ready = GEN_51;
  assign io_mcr_read_3_ready = GEN_52;
  assign io_mcr_read_4_ready = GEN_53;
  assign io_mcr_write_0_valid = GEN_44;
  assign io_mcr_write_0_bits = wData;
  assign io_mcr_write_1_valid = GEN_45;
  assign io_mcr_write_1_bits = wData;
  assign io_mcr_write_2_valid = GEN_46;
  assign io_mcr_write_2_bits = wData;
  assign io_mcr_write_3_valid = GEN_47;
  assign io_mcr_write_3_bits = wData;
  assign io_mcr_write_4_valid = GEN_48;
  assign io_mcr_write_4_bits = wData;
  assign io_mcr_wstrb = GEN_0;
  assign T_468 = io_nasti_aw_ready & io_nasti_aw_valid;
  assign T_470 = io_nasti_aw_bits_addr[31:2];
  assign T_472 = io_nasti_aw_bits_len == 8'h0;
  assign T_473 = T_472 | reset;
  assign T_475 = T_473 == 1'h0;
  assign GEN_6 = T_468 ? 1'h1 : awFired;
  assign GEN_7 = T_468 ? T_470 : {{27'd0}, wAddr};
  assign GEN_8 = T_468 ? io_nasti_aw_bits_id : bId;
  assign T_476 = io_nasti_w_ready & io_nasti_w_valid;
  assign GEN_9 = T_476 ? 1'h1 : wFired;
  assign GEN_10 = T_476 ? io_nasti_w_bits_data : wData;
  assign GEN_11 = T_476 ? io_nasti_w_bits_strb : wStrb;
  assign T_478 = io_nasti_ar_ready & io_nasti_ar_valid;
  assign T_480 = io_nasti_ar_bits_addr[31:2];
  assign T_481 = T_480[2:0];
  assign T_483 = io_nasti_ar_bits_len == 8'h0;
  assign T_484 = T_483 | reset;
  assign T_486 = T_484 == 1'h0;
  assign GEN_12 = T_478 ? 1'h1 : arFired;
  assign GEN_13 = T_478 ? T_481 : rAddr;
  assign GEN_14 = T_478 ? io_nasti_ar_bits_id : rId;
  assign T_487 = io_nasti_r_ready & io_nasti_r_valid;
  assign GEN_15 = T_487 ? 1'h0 : GEN_12;
  assign T_489 = io_nasti_b_ready & io_nasti_b_valid;
  assign GEN_16 = T_489 ? 1'h0 : GEN_6;
  assign GEN_17 = T_489 ? 1'h0 : GEN_9;
  assign GEN_18 = T_489 ? 1'h0 : wCommited;
  assign GEN_0_ready = GEN_28;
  assign GEN_0_valid = GEN_29;
  assign GEN_0_bits = GEN_30;
  assign GEN_19 = 3'h1 == wAddr ? io_mcr_write_1_ready : io_mcr_write_0_ready;
  assign GEN_20 = 3'h1 == wAddr ? io_mcr_write_1_valid : io_mcr_write_0_valid;
  assign GEN_21 = 3'h1 == wAddr ? io_mcr_write_1_bits : io_mcr_write_0_bits;
  assign GEN_22 = 3'h2 == wAddr ? io_mcr_write_2_ready : GEN_19;
  assign GEN_23 = 3'h2 == wAddr ? io_mcr_write_2_valid : GEN_20;
  assign GEN_24 = 3'h2 == wAddr ? io_mcr_write_2_bits : GEN_21;
  assign GEN_25 = 3'h3 == wAddr ? io_mcr_write_3_ready : GEN_22;
  assign GEN_26 = 3'h3 == wAddr ? io_mcr_write_3_valid : GEN_23;
  assign GEN_27 = 3'h3 == wAddr ? io_mcr_write_3_bits : GEN_24;
  assign GEN_28 = 3'h4 == wAddr ? io_mcr_write_4_ready : GEN_25;
  assign GEN_29 = 3'h4 == wAddr ? io_mcr_write_4_valid : GEN_26;
  assign GEN_30 = 3'h4 == wAddr ? io_mcr_write_4_bits : GEN_27;
  assign GEN_1_ready = GEN_28;
  assign GEN_1_valid = GEN_29;
  assign GEN_1_bits = GEN_30;
  assign T_499 = GEN_0_ready & GEN_1_valid;
  assign GEN_43 = T_499 ? 1'h1 : GEN_18;
  assign T_517 = awFired & wFired;
  assign T_518 = ~ wCommited;
  assign T_519 = T_517 & T_518;
  assign GEN_2 = T_519;
  assign GEN_44 = 3'h0 == wAddr ? GEN_2 : 1'h0;
  assign GEN_45 = 3'h1 == wAddr ? GEN_2 : 1'h0;
  assign GEN_46 = 3'h2 == wAddr ? GEN_2 : 1'h0;
  assign GEN_47 = 3'h3 == wAddr ? GEN_2 : 1'h0;
  assign GEN_48 = 3'h4 == wAddr ? GEN_2 : 1'h0;
  assign T_526 = arFired & io_nasti_r_ready;
  assign GEN_3 = T_526;
  assign GEN_49 = 3'h0 == rAddr ? GEN_3 : 1'h0;
  assign GEN_50 = 3'h1 == rAddr ? GEN_3 : 1'h0;
  assign GEN_51 = 3'h2 == rAddr ? GEN_3 : 1'h0;
  assign GEN_52 = 3'h3 == rAddr ? GEN_3 : 1'h0;
  assign GEN_53 = 3'h4 == rAddr ? GEN_3 : 1'h0;
  assign T_541_resp = 2'h0;
  assign T_541_data = GEN_4_bits;
  assign T_541_last = 1'h1;
  assign T_541_id = rId;
  assign T_541_user = 1'h0;
  assign GEN_4_ready = GEN_63;
  assign GEN_4_valid = GEN_64;
  assign GEN_4_bits = GEN_65;
  assign GEN_54 = 3'h1 == rAddr ? io_mcr_read_1_ready : io_mcr_read_0_ready;
  assign GEN_55 = 3'h1 == rAddr ? io_mcr_read_1_valid : io_mcr_read_0_valid;
  assign GEN_56 = 3'h1 == rAddr ? io_mcr_read_1_bits : io_mcr_read_0_bits;
  assign GEN_57 = 3'h2 == rAddr ? io_mcr_read_2_ready : GEN_54;
  assign GEN_58 = 3'h2 == rAddr ? io_mcr_read_2_valid : GEN_55;
  assign GEN_59 = 3'h2 == rAddr ? io_mcr_read_2_bits : GEN_56;
  assign GEN_60 = 3'h3 == rAddr ? io_mcr_read_3_ready : GEN_57;
  assign GEN_61 = 3'h3 == rAddr ? io_mcr_read_3_valid : GEN_58;
  assign GEN_62 = 3'h3 == rAddr ? io_mcr_read_3_bits : GEN_59;
  assign GEN_63 = 3'h4 == rAddr ? io_mcr_read_4_ready : GEN_60;
  assign GEN_64 = 3'h4 == rAddr ? io_mcr_read_4_valid : GEN_61;
  assign GEN_65 = 3'h4 == rAddr ? io_mcr_read_4_bits : GEN_62;
  assign GEN_5_ready = GEN_63;
  assign GEN_5_valid = GEN_64;
  assign GEN_5_bits = GEN_65;
  assign T_554 = arFired & GEN_5_valid;
  assign T_560_resp = 2'h0;
  assign T_560_id = bId;
  assign T_560_user = 1'h0;
  assign T_566 = T_517 & wCommited;
  assign T_567 = ~ arFired;
  assign T_568 = ~ awFired;
  assign T_569 = ~ wFired;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  rValid = GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_4 = {1{$random}};
  arFired = GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_5 = {1{$random}};
  awFired = GEN_5[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_31 = {1{$random}};
  wFired = GEN_31[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_32 = {1{$random}};
  wCommited = GEN_32[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_33 = {1{$random}};
  bId = GEN_33[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_34 = {1{$random}};
  rId = GEN_34[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_35 = {1{$random}};
  rData = GEN_35[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_36 = {1{$random}};
  wData = GEN_36[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_37 = {1{$random}};
  wAddr = GEN_37[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_38 = {1{$random}};
  rAddr = GEN_38[2:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_39 = {1{$random}};
  wStrb = GEN_39[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_40 = {1{$random}};
  GEN_0 = GEN_40[3:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      rValid <= 1'h0;
    end
    if (reset) begin
      arFired <= 1'h0;
    end else begin
      if (T_487) begin
        arFired <= 1'h0;
      end else begin
        if (T_478) begin
          arFired <= 1'h1;
        end
      end
    end
    if (reset) begin
      awFired <= 1'h0;
    end else begin
      if (T_489) begin
        awFired <= 1'h0;
      end else begin
        if (T_468) begin
          awFired <= 1'h1;
        end
      end
    end
    if (reset) begin
      wFired <= 1'h0;
    end else begin
      if (T_489) begin
        wFired <= 1'h0;
      end else begin
        if (T_476) begin
          wFired <= 1'h1;
        end
      end
    end
    if (reset) begin
      wCommited <= 1'h0;
    end else begin
      if (T_499) begin
        wCommited <= 1'h1;
      end else begin
        if (T_489) begin
          wCommited <= 1'h0;
        end
      end
    end
    if (T_468) begin
      bId <= io_nasti_aw_bits_id;
    end
    if (T_478) begin
      rId <= io_nasti_ar_bits_id;
    end
    if (T_476) begin
      wData <= io_nasti_w_bits_data;
    end
    wAddr <= GEN_7[2:0];
    if (T_478) begin
      rAddr <= T_481;
    end
    if (T_476) begin
      wStrb <= io_nasti_w_bits_strb;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_468 & T_475) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Lib.scala:275 assert(io.nasti.aw.bits.len === UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_468 & T_475) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_478 & T_486) begin
          $fwrite(32'h80000002,"Assertion failed: MCRFile only support single beat reads\n    at Lib.scala:288 assert(io.nasti.ar.bits.len === UInt(0), \"MCRFile only support single beat reads\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_478 & T_486) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule
module EmulationMaster(
  input   clock,
  input   reset,
  output  io_ctrl_aw_ready,
  input   io_ctrl_aw_valid,
  input  [31:0] io_ctrl_aw_bits_addr,
  input  [7:0] io_ctrl_aw_bits_len,
  input  [2:0] io_ctrl_aw_bits_size,
  input  [1:0] io_ctrl_aw_bits_burst,
  input   io_ctrl_aw_bits_lock,
  input  [3:0] io_ctrl_aw_bits_cache,
  input  [2:0] io_ctrl_aw_bits_prot,
  input  [3:0] io_ctrl_aw_bits_qos,
  input  [3:0] io_ctrl_aw_bits_region,
  input  [11:0] io_ctrl_aw_bits_id,
  input   io_ctrl_aw_bits_user,
  output  io_ctrl_w_ready,
  input   io_ctrl_w_valid,
  input  [31:0] io_ctrl_w_bits_data,
  input   io_ctrl_w_bits_last,
  input  [11:0] io_ctrl_w_bits_id,
  input  [3:0] io_ctrl_w_bits_strb,
  input   io_ctrl_w_bits_user,
  input   io_ctrl_b_ready,
  output  io_ctrl_b_valid,
  output [1:0] io_ctrl_b_bits_resp,
  output [11:0] io_ctrl_b_bits_id,
  output  io_ctrl_b_bits_user,
  output  io_ctrl_ar_ready,
  input   io_ctrl_ar_valid,
  input  [31:0] io_ctrl_ar_bits_addr,
  input  [7:0] io_ctrl_ar_bits_len,
  input  [2:0] io_ctrl_ar_bits_size,
  input  [1:0] io_ctrl_ar_bits_burst,
  input   io_ctrl_ar_bits_lock,
  input  [3:0] io_ctrl_ar_bits_cache,
  input  [2:0] io_ctrl_ar_bits_prot,
  input  [3:0] io_ctrl_ar_bits_qos,
  input  [3:0] io_ctrl_ar_bits_region,
  input  [11:0] io_ctrl_ar_bits_id,
  input   io_ctrl_ar_bits_user,
  input   io_ctrl_r_ready,
  output  io_ctrl_r_valid,
  output [1:0] io_ctrl_r_bits_resp,
  output [31:0] io_ctrl_r_bits_data,
  output  io_ctrl_r_bits_last,
  output [11:0] io_ctrl_r_bits_id,
  output  io_ctrl_r_bits_user,
  output  io_hostReset,
  output  io_simReset,
  input   io_done,
  input   io_step_ready,
  output  io_step_valid,
  output [31:0] io_step_bits,
  output [31:0] io_traceLen
);
  wire  T_372;
  reg  T_373;
  reg [31:0] GEN_10;
  reg [1:0] T_375;
  reg [31:0] GEN_11;
  wire  T_377;
  wire [2:0] T_379;
  wire [1:0] T_380;
  wire [1:0] GEN_0;
  wire  GEN_1;
  wire [1:0] GEN_2;
  wire  T_387;
  reg  T_388;
  reg [31:0] GEN_12;
  wire  GEN_3;
  wire  T_397_ready;
  wire  T_397_valid;
  wire [31:0] T_397_bits;
  wire  Queue_11_1_clock;
  wire  Queue_11_1_reset;
  wire  Queue_11_1_io_enq_ready;
  wire  Queue_11_1_io_enq_valid;
  wire [31:0] Queue_11_1_io_enq_bits;
  wire  Queue_11_1_io_deq_ready;
  wire  Queue_11_1_io_deq_valid;
  wire [31:0] Queue_11_1_io_deq_bits;
  wire [1:0] Queue_11_1_io_count;
  wire  T_407;
  reg  T_408;
  reg [31:0] GEN_13;
  wire [31:0] T_411;
  reg [31:0] T_412;
  reg [31:0] GEN_14;
  wire  MCRFile_1_clock;
  wire  MCRFile_1_reset;
  wire  MCRFile_1_io_nasti_aw_ready;
  wire  MCRFile_1_io_nasti_aw_valid;
  wire [31:0] MCRFile_1_io_nasti_aw_bits_addr;
  wire [7:0] MCRFile_1_io_nasti_aw_bits_len;
  wire [2:0] MCRFile_1_io_nasti_aw_bits_size;
  wire [1:0] MCRFile_1_io_nasti_aw_bits_burst;
  wire  MCRFile_1_io_nasti_aw_bits_lock;
  wire [3:0] MCRFile_1_io_nasti_aw_bits_cache;
  wire [2:0] MCRFile_1_io_nasti_aw_bits_prot;
  wire [3:0] MCRFile_1_io_nasti_aw_bits_qos;
  wire [3:0] MCRFile_1_io_nasti_aw_bits_region;
  wire [11:0] MCRFile_1_io_nasti_aw_bits_id;
  wire  MCRFile_1_io_nasti_aw_bits_user;
  wire  MCRFile_1_io_nasti_w_ready;
  wire  MCRFile_1_io_nasti_w_valid;
  wire [31:0] MCRFile_1_io_nasti_w_bits_data;
  wire  MCRFile_1_io_nasti_w_bits_last;
  wire [11:0] MCRFile_1_io_nasti_w_bits_id;
  wire [3:0] MCRFile_1_io_nasti_w_bits_strb;
  wire  MCRFile_1_io_nasti_w_bits_user;
  wire  MCRFile_1_io_nasti_b_ready;
  wire  MCRFile_1_io_nasti_b_valid;
  wire [1:0] MCRFile_1_io_nasti_b_bits_resp;
  wire [11:0] MCRFile_1_io_nasti_b_bits_id;
  wire  MCRFile_1_io_nasti_b_bits_user;
  wire  MCRFile_1_io_nasti_ar_ready;
  wire  MCRFile_1_io_nasti_ar_valid;
  wire [31:0] MCRFile_1_io_nasti_ar_bits_addr;
  wire [7:0] MCRFile_1_io_nasti_ar_bits_len;
  wire [2:0] MCRFile_1_io_nasti_ar_bits_size;
  wire [1:0] MCRFile_1_io_nasti_ar_bits_burst;
  wire  MCRFile_1_io_nasti_ar_bits_lock;
  wire [3:0] MCRFile_1_io_nasti_ar_bits_cache;
  wire [2:0] MCRFile_1_io_nasti_ar_bits_prot;
  wire [3:0] MCRFile_1_io_nasti_ar_bits_qos;
  wire [3:0] MCRFile_1_io_nasti_ar_bits_region;
  wire [11:0] MCRFile_1_io_nasti_ar_bits_id;
  wire  MCRFile_1_io_nasti_ar_bits_user;
  wire  MCRFile_1_io_nasti_r_ready;
  wire  MCRFile_1_io_nasti_r_valid;
  wire [1:0] MCRFile_1_io_nasti_r_bits_resp;
  wire [31:0] MCRFile_1_io_nasti_r_bits_data;
  wire  MCRFile_1_io_nasti_r_bits_last;
  wire [11:0] MCRFile_1_io_nasti_r_bits_id;
  wire  MCRFile_1_io_nasti_r_bits_user;
  wire  MCRFile_1_io_mcr_read_0_ready;
  wire  MCRFile_1_io_mcr_read_0_valid;
  wire [31:0] MCRFile_1_io_mcr_read_0_bits;
  wire  MCRFile_1_io_mcr_read_1_ready;
  wire  MCRFile_1_io_mcr_read_1_valid;
  wire [31:0] MCRFile_1_io_mcr_read_1_bits;
  wire  MCRFile_1_io_mcr_read_2_ready;
  wire  MCRFile_1_io_mcr_read_2_valid;
  wire [31:0] MCRFile_1_io_mcr_read_2_bits;
  wire  MCRFile_1_io_mcr_read_3_ready;
  wire  MCRFile_1_io_mcr_read_3_valid;
  wire [31:0] MCRFile_1_io_mcr_read_3_bits;
  wire  MCRFile_1_io_mcr_read_4_ready;
  wire  MCRFile_1_io_mcr_read_4_valid;
  wire [31:0] MCRFile_1_io_mcr_read_4_bits;
  wire  MCRFile_1_io_mcr_write_0_ready;
  wire  MCRFile_1_io_mcr_write_0_valid;
  wire [31:0] MCRFile_1_io_mcr_write_0_bits;
  wire  MCRFile_1_io_mcr_write_1_ready;
  wire  MCRFile_1_io_mcr_write_1_valid;
  wire [31:0] MCRFile_1_io_mcr_write_1_bits;
  wire  MCRFile_1_io_mcr_write_2_ready;
  wire  MCRFile_1_io_mcr_write_2_valid;
  wire [31:0] MCRFile_1_io_mcr_write_2_bits;
  wire  MCRFile_1_io_mcr_write_3_ready;
  wire  MCRFile_1_io_mcr_write_3_valid;
  wire [31:0] MCRFile_1_io_mcr_write_3_bits;
  wire  MCRFile_1_io_mcr_write_4_ready;
  wire  MCRFile_1_io_mcr_write_4_valid;
  wire [31:0] MCRFile_1_io_mcr_write_4_bits;
  wire [3:0] MCRFile_1_io_mcr_wstrb;
  wire [31:0] GEN_4;
  wire [31:0] GEN_5;
  wire  T_418;
  wire  T_419;
  wire  T_421;
  wire [31:0] GEN_6;
  wire [31:0] GEN_7;
  reg  GEN_8;
  reg [31:0] GEN_15;
  reg [31:0] GEN_9;
  reg [31:0] GEN_16;
  Queue_11 Queue_11_1 (
    .clock(Queue_11_1_clock),
    .reset(Queue_11_1_reset),
    .io_enq_ready(Queue_11_1_io_enq_ready),
    .io_enq_valid(Queue_11_1_io_enq_valid),
    .io_enq_bits(Queue_11_1_io_enq_bits),
    .io_deq_ready(Queue_11_1_io_deq_ready),
    .io_deq_valid(Queue_11_1_io_deq_valid),
    .io_deq_bits(Queue_11_1_io_deq_bits),
    .io_count(Queue_11_1_io_count)
  );
  MCRFile MCRFile_1 (
    .clock(MCRFile_1_clock),
    .reset(MCRFile_1_reset),
    .io_nasti_aw_ready(MCRFile_1_io_nasti_aw_ready),
    .io_nasti_aw_valid(MCRFile_1_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(MCRFile_1_io_nasti_aw_bits_addr),
    .io_nasti_aw_bits_len(MCRFile_1_io_nasti_aw_bits_len),
    .io_nasti_aw_bits_size(MCRFile_1_io_nasti_aw_bits_size),
    .io_nasti_aw_bits_burst(MCRFile_1_io_nasti_aw_bits_burst),
    .io_nasti_aw_bits_lock(MCRFile_1_io_nasti_aw_bits_lock),
    .io_nasti_aw_bits_cache(MCRFile_1_io_nasti_aw_bits_cache),
    .io_nasti_aw_bits_prot(MCRFile_1_io_nasti_aw_bits_prot),
    .io_nasti_aw_bits_qos(MCRFile_1_io_nasti_aw_bits_qos),
    .io_nasti_aw_bits_region(MCRFile_1_io_nasti_aw_bits_region),
    .io_nasti_aw_bits_id(MCRFile_1_io_nasti_aw_bits_id),
    .io_nasti_aw_bits_user(MCRFile_1_io_nasti_aw_bits_user),
    .io_nasti_w_ready(MCRFile_1_io_nasti_w_ready),
    .io_nasti_w_valid(MCRFile_1_io_nasti_w_valid),
    .io_nasti_w_bits_data(MCRFile_1_io_nasti_w_bits_data),
    .io_nasti_w_bits_last(MCRFile_1_io_nasti_w_bits_last),
    .io_nasti_w_bits_id(MCRFile_1_io_nasti_w_bits_id),
    .io_nasti_w_bits_strb(MCRFile_1_io_nasti_w_bits_strb),
    .io_nasti_w_bits_user(MCRFile_1_io_nasti_w_bits_user),
    .io_nasti_b_ready(MCRFile_1_io_nasti_b_ready),
    .io_nasti_b_valid(MCRFile_1_io_nasti_b_valid),
    .io_nasti_b_bits_resp(MCRFile_1_io_nasti_b_bits_resp),
    .io_nasti_b_bits_id(MCRFile_1_io_nasti_b_bits_id),
    .io_nasti_b_bits_user(MCRFile_1_io_nasti_b_bits_user),
    .io_nasti_ar_ready(MCRFile_1_io_nasti_ar_ready),
    .io_nasti_ar_valid(MCRFile_1_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(MCRFile_1_io_nasti_ar_bits_addr),
    .io_nasti_ar_bits_len(MCRFile_1_io_nasti_ar_bits_len),
    .io_nasti_ar_bits_size(MCRFile_1_io_nasti_ar_bits_size),
    .io_nasti_ar_bits_burst(MCRFile_1_io_nasti_ar_bits_burst),
    .io_nasti_ar_bits_lock(MCRFile_1_io_nasti_ar_bits_lock),
    .io_nasti_ar_bits_cache(MCRFile_1_io_nasti_ar_bits_cache),
    .io_nasti_ar_bits_prot(MCRFile_1_io_nasti_ar_bits_prot),
    .io_nasti_ar_bits_qos(MCRFile_1_io_nasti_ar_bits_qos),
    .io_nasti_ar_bits_region(MCRFile_1_io_nasti_ar_bits_region),
    .io_nasti_ar_bits_id(MCRFile_1_io_nasti_ar_bits_id),
    .io_nasti_ar_bits_user(MCRFile_1_io_nasti_ar_bits_user),
    .io_nasti_r_ready(MCRFile_1_io_nasti_r_ready),
    .io_nasti_r_valid(MCRFile_1_io_nasti_r_valid),
    .io_nasti_r_bits_resp(MCRFile_1_io_nasti_r_bits_resp),
    .io_nasti_r_bits_data(MCRFile_1_io_nasti_r_bits_data),
    .io_nasti_r_bits_last(MCRFile_1_io_nasti_r_bits_last),
    .io_nasti_r_bits_id(MCRFile_1_io_nasti_r_bits_id),
    .io_nasti_r_bits_user(MCRFile_1_io_nasti_r_bits_user),
    .io_mcr_read_0_ready(MCRFile_1_io_mcr_read_0_ready),
    .io_mcr_read_0_valid(MCRFile_1_io_mcr_read_0_valid),
    .io_mcr_read_0_bits(MCRFile_1_io_mcr_read_0_bits),
    .io_mcr_read_1_ready(MCRFile_1_io_mcr_read_1_ready),
    .io_mcr_read_1_valid(MCRFile_1_io_mcr_read_1_valid),
    .io_mcr_read_1_bits(MCRFile_1_io_mcr_read_1_bits),
    .io_mcr_read_2_ready(MCRFile_1_io_mcr_read_2_ready),
    .io_mcr_read_2_valid(MCRFile_1_io_mcr_read_2_valid),
    .io_mcr_read_2_bits(MCRFile_1_io_mcr_read_2_bits),
    .io_mcr_read_3_ready(MCRFile_1_io_mcr_read_3_ready),
    .io_mcr_read_3_valid(MCRFile_1_io_mcr_read_3_valid),
    .io_mcr_read_3_bits(MCRFile_1_io_mcr_read_3_bits),
    .io_mcr_read_4_ready(MCRFile_1_io_mcr_read_4_ready),
    .io_mcr_read_4_valid(MCRFile_1_io_mcr_read_4_valid),
    .io_mcr_read_4_bits(MCRFile_1_io_mcr_read_4_bits),
    .io_mcr_write_0_ready(MCRFile_1_io_mcr_write_0_ready),
    .io_mcr_write_0_valid(MCRFile_1_io_mcr_write_0_valid),
    .io_mcr_write_0_bits(MCRFile_1_io_mcr_write_0_bits),
    .io_mcr_write_1_ready(MCRFile_1_io_mcr_write_1_ready),
    .io_mcr_write_1_valid(MCRFile_1_io_mcr_write_1_valid),
    .io_mcr_write_1_bits(MCRFile_1_io_mcr_write_1_bits),
    .io_mcr_write_2_ready(MCRFile_1_io_mcr_write_2_ready),
    .io_mcr_write_2_valid(MCRFile_1_io_mcr_write_2_valid),
    .io_mcr_write_2_bits(MCRFile_1_io_mcr_write_2_bits),
    .io_mcr_write_3_ready(MCRFile_1_io_mcr_write_3_ready),
    .io_mcr_write_3_valid(MCRFile_1_io_mcr_write_3_valid),
    .io_mcr_write_3_bits(MCRFile_1_io_mcr_write_3_bits),
    .io_mcr_write_4_ready(MCRFile_1_io_mcr_write_4_ready),
    .io_mcr_write_4_valid(MCRFile_1_io_mcr_write_4_valid),
    .io_mcr_write_4_bits(MCRFile_1_io_mcr_write_4_bits),
    .io_mcr_wstrb(MCRFile_1_io_mcr_wstrb)
  );
  assign io_ctrl_aw_ready = MCRFile_1_io_nasti_aw_ready;
  assign io_ctrl_w_ready = MCRFile_1_io_nasti_w_ready;
  assign io_ctrl_b_valid = MCRFile_1_io_nasti_b_valid;
  assign io_ctrl_b_bits_resp = MCRFile_1_io_nasti_b_bits_resp;
  assign io_ctrl_b_bits_id = MCRFile_1_io_nasti_b_bits_id;
  assign io_ctrl_b_bits_user = MCRFile_1_io_nasti_b_bits_user;
  assign io_ctrl_ar_ready = MCRFile_1_io_nasti_ar_ready;
  assign io_ctrl_r_valid = MCRFile_1_io_nasti_r_valid;
  assign io_ctrl_r_bits_resp = MCRFile_1_io_nasti_r_bits_resp;
  assign io_ctrl_r_bits_data = MCRFile_1_io_nasti_r_bits_data;
  assign io_ctrl_r_bits_last = MCRFile_1_io_nasti_r_bits_last;
  assign io_ctrl_r_bits_id = MCRFile_1_io_nasti_r_bits_id;
  assign io_ctrl_r_bits_user = MCRFile_1_io_nasti_r_bits_user;
  assign io_hostReset = T_373;
  assign io_simReset = T_388;
  assign io_step_valid = Queue_11_1_io_deq_valid;
  assign io_step_bits = Queue_11_1_io_deq_bits;
  assign io_traceLen = T_412;
  assign T_372 = 1'h0;
  assign T_377 = T_375 == 2'h3;
  assign T_379 = T_375 + 2'h1;
  assign T_380 = T_379[1:0];
  assign GEN_0 = T_373 ? T_380 : T_375;
  assign GEN_1 = T_377 ? 1'h0 : T_373;
  assign GEN_2 = T_377 ? 2'h0 : GEN_0;
  assign T_387 = 1'h0;
  assign GEN_3 = T_388 ? 1'h0 : T_388;
  assign T_397_ready = Queue_11_1_io_enq_ready;
  assign T_397_valid = MCRFile_1_io_mcr_write_2_valid;
  assign T_397_bits = MCRFile_1_io_mcr_write_2_bits;
  assign Queue_11_1_clock = clock;
  assign Queue_11_1_reset = reset;
  assign Queue_11_1_io_enq_valid = T_397_valid;
  assign Queue_11_1_io_enq_bits = T_397_bits;
  assign Queue_11_1_io_deq_ready = io_step_ready;
  assign T_407 = 1'h0;
  assign T_411 = 32'h80;
  assign MCRFile_1_clock = clock;
  assign MCRFile_1_reset = reset;
  assign MCRFile_1_io_nasti_aw_valid = io_ctrl_aw_valid;
  assign MCRFile_1_io_nasti_aw_bits_addr = io_ctrl_aw_bits_addr;
  assign MCRFile_1_io_nasti_aw_bits_len = io_ctrl_aw_bits_len;
  assign MCRFile_1_io_nasti_aw_bits_size = io_ctrl_aw_bits_size;
  assign MCRFile_1_io_nasti_aw_bits_burst = io_ctrl_aw_bits_burst;
  assign MCRFile_1_io_nasti_aw_bits_lock = io_ctrl_aw_bits_lock;
  assign MCRFile_1_io_nasti_aw_bits_cache = io_ctrl_aw_bits_cache;
  assign MCRFile_1_io_nasti_aw_bits_prot = io_ctrl_aw_bits_prot;
  assign MCRFile_1_io_nasti_aw_bits_qos = io_ctrl_aw_bits_qos;
  assign MCRFile_1_io_nasti_aw_bits_region = io_ctrl_aw_bits_region;
  assign MCRFile_1_io_nasti_aw_bits_id = io_ctrl_aw_bits_id;
  assign MCRFile_1_io_nasti_aw_bits_user = io_ctrl_aw_bits_user;
  assign MCRFile_1_io_nasti_w_valid = io_ctrl_w_valid;
  assign MCRFile_1_io_nasti_w_bits_data = io_ctrl_w_bits_data;
  assign MCRFile_1_io_nasti_w_bits_last = io_ctrl_w_bits_last;
  assign MCRFile_1_io_nasti_w_bits_id = io_ctrl_w_bits_id;
  assign MCRFile_1_io_nasti_w_bits_strb = io_ctrl_w_bits_strb;
  assign MCRFile_1_io_nasti_w_bits_user = io_ctrl_w_bits_user;
  assign MCRFile_1_io_nasti_b_ready = io_ctrl_b_ready;
  assign MCRFile_1_io_nasti_ar_valid = io_ctrl_ar_valid;
  assign MCRFile_1_io_nasti_ar_bits_addr = io_ctrl_ar_bits_addr;
  assign MCRFile_1_io_nasti_ar_bits_len = io_ctrl_ar_bits_len;
  assign MCRFile_1_io_nasti_ar_bits_size = io_ctrl_ar_bits_size;
  assign MCRFile_1_io_nasti_ar_bits_burst = io_ctrl_ar_bits_burst;
  assign MCRFile_1_io_nasti_ar_bits_lock = io_ctrl_ar_bits_lock;
  assign MCRFile_1_io_nasti_ar_bits_cache = io_ctrl_ar_bits_cache;
  assign MCRFile_1_io_nasti_ar_bits_prot = io_ctrl_ar_bits_prot;
  assign MCRFile_1_io_nasti_ar_bits_qos = io_ctrl_ar_bits_qos;
  assign MCRFile_1_io_nasti_ar_bits_region = io_ctrl_ar_bits_region;
  assign MCRFile_1_io_nasti_ar_bits_id = io_ctrl_ar_bits_id;
  assign MCRFile_1_io_nasti_ar_bits_user = io_ctrl_ar_bits_user;
  assign MCRFile_1_io_nasti_r_ready = io_ctrl_r_ready;
  assign MCRFile_1_io_mcr_read_0_valid = 1'h1;
  assign MCRFile_1_io_mcr_read_0_bits = {{31'd0}, T_373};
  assign MCRFile_1_io_mcr_read_1_valid = 1'h1;
  assign MCRFile_1_io_mcr_read_1_bits = {{31'd0}, T_388};
  assign MCRFile_1_io_mcr_read_2_valid = GEN_8;
  assign MCRFile_1_io_mcr_read_2_bits = GEN_9;
  assign MCRFile_1_io_mcr_read_3_valid = 1'h1;
  assign MCRFile_1_io_mcr_read_3_bits = {{31'd0}, T_408};
  assign MCRFile_1_io_mcr_read_4_valid = 1'h1;
  assign MCRFile_1_io_mcr_read_4_bits = T_412;
  assign MCRFile_1_io_mcr_write_0_ready = 1'h1;
  assign MCRFile_1_io_mcr_write_1_ready = 1'h1;
  assign MCRFile_1_io_mcr_write_2_ready = T_397_ready;
  assign MCRFile_1_io_mcr_write_3_ready = 1'h1;
  assign MCRFile_1_io_mcr_write_4_ready = 1'h1;
  assign GEN_4 = MCRFile_1_io_mcr_write_0_valid ? MCRFile_1_io_mcr_write_0_bits : {{31'd0}, GEN_1};
  assign GEN_5 = MCRFile_1_io_mcr_write_1_valid ? MCRFile_1_io_mcr_write_1_bits : {{31'd0}, GEN_3};
  assign T_418 = MCRFile_1_io_mcr_read_2_ready == 1'h0;
  assign T_419 = T_418 | reset;
  assign T_421 = T_419 == 1'h0;
  assign GEN_6 = MCRFile_1_io_mcr_write_3_valid ? MCRFile_1_io_mcr_write_3_bits : {{31'd0}, io_done};
  assign GEN_7 = MCRFile_1_io_mcr_write_4_valid ? MCRFile_1_io_mcr_write_4_bits : T_412;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_10 = {1{$random}};
  T_373 = GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_11 = {1{$random}};
  T_375 = GEN_11[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_12 = {1{$random}};
  T_388 = GEN_12[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_13 = {1{$random}};
  T_408 = GEN_13[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_14 = {1{$random}};
  T_412 = GEN_14[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_15 = {1{$random}};
  GEN_8 = GEN_15[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_16 = {1{$random}};
  GEN_9 = GEN_16[31:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      T_373 <= T_372;
    end else begin
      T_373 <= GEN_4[0];
    end
    if (reset) begin
      T_375 <= 2'h0;
    end else begin
      if (T_377) begin
        T_375 <= 2'h0;
      end else begin
        if (T_373) begin
          T_375 <= T_380;
        end
      end
    end
    if (reset) begin
      T_388 <= T_387;
    end else begin
      T_388 <= GEN_5[0];
    end
    if (reset) begin
      T_408 <= T_407;
    end else begin
      T_408 <= GEN_6[0];
    end
    if (reset) begin
      T_412 <= T_411;
    end else begin
      if (MCRFile_1_io_mcr_write_4_valid) begin
        T_412 <= MCRFile_1_io_mcr_write_4_bits;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_421) begin
          $fwrite(32'h80000002,"Assertion failed: Can only write to this decoupled sink\n    at Lib.scala:241 assert(read(addr).ready === Bool(false), \"Can only write to this decoupled sink\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_421) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule
module MCRFile_1(
  input   clock,
  input   reset,
  output  io_nasti_aw_ready,
  input   io_nasti_aw_valid,
  input  [31:0] io_nasti_aw_bits_addr,
  input  [7:0] io_nasti_aw_bits_len,
  input  [2:0] io_nasti_aw_bits_size,
  input  [1:0] io_nasti_aw_bits_burst,
  input   io_nasti_aw_bits_lock,
  input  [3:0] io_nasti_aw_bits_cache,
  input  [2:0] io_nasti_aw_bits_prot,
  input  [3:0] io_nasti_aw_bits_qos,
  input  [3:0] io_nasti_aw_bits_region,
  input  [11:0] io_nasti_aw_bits_id,
  input   io_nasti_aw_bits_user,
  output  io_nasti_w_ready,
  input   io_nasti_w_valid,
  input  [31:0] io_nasti_w_bits_data,
  input   io_nasti_w_bits_last,
  input  [11:0] io_nasti_w_bits_id,
  input  [3:0] io_nasti_w_bits_strb,
  input   io_nasti_w_bits_user,
  input   io_nasti_b_ready,
  output  io_nasti_b_valid,
  output [1:0] io_nasti_b_bits_resp,
  output [11:0] io_nasti_b_bits_id,
  output  io_nasti_b_bits_user,
  output  io_nasti_ar_ready,
  input   io_nasti_ar_valid,
  input  [31:0] io_nasti_ar_bits_addr,
  input  [7:0] io_nasti_ar_bits_len,
  input  [2:0] io_nasti_ar_bits_size,
  input  [1:0] io_nasti_ar_bits_burst,
  input   io_nasti_ar_bits_lock,
  input  [3:0] io_nasti_ar_bits_cache,
  input  [2:0] io_nasti_ar_bits_prot,
  input  [3:0] io_nasti_ar_bits_qos,
  input  [3:0] io_nasti_ar_bits_region,
  input  [11:0] io_nasti_ar_bits_id,
  input   io_nasti_ar_bits_user,
  input   io_nasti_r_ready,
  output  io_nasti_r_valid,
  output [1:0] io_nasti_r_bits_resp,
  output [31:0] io_nasti_r_bits_data,
  output  io_nasti_r_bits_last,
  output [11:0] io_nasti_r_bits_id,
  output  io_nasti_r_bits_user,
  output  io_mcr_read_0_ready,
  input   io_mcr_read_0_valid,
  input  [31:0] io_mcr_read_0_bits,
  output  io_mcr_read_1_ready,
  input   io_mcr_read_1_valid,
  input  [31:0] io_mcr_read_1_bits,
  output  io_mcr_read_2_ready,
  input   io_mcr_read_2_valid,
  input  [31:0] io_mcr_read_2_bits,
  output  io_mcr_read_3_ready,
  input   io_mcr_read_3_valid,
  input  [31:0] io_mcr_read_3_bits,
  output  io_mcr_read_4_ready,
  input   io_mcr_read_4_valid,
  input  [31:0] io_mcr_read_4_bits,
  output  io_mcr_read_5_ready,
  input   io_mcr_read_5_valid,
  input  [31:0] io_mcr_read_5_bits,
  output  io_mcr_read_6_ready,
  input   io_mcr_read_6_valid,
  input  [31:0] io_mcr_read_6_bits,
  output  io_mcr_read_7_ready,
  input   io_mcr_read_7_valid,
  input  [31:0] io_mcr_read_7_bits,
  output  io_mcr_read_8_ready,
  input   io_mcr_read_8_valid,
  input  [31:0] io_mcr_read_8_bits,
  input   io_mcr_write_0_ready,
  output  io_mcr_write_0_valid,
  output [31:0] io_mcr_write_0_bits,
  input   io_mcr_write_1_ready,
  output  io_mcr_write_1_valid,
  output [31:0] io_mcr_write_1_bits,
  input   io_mcr_write_2_ready,
  output  io_mcr_write_2_valid,
  output [31:0] io_mcr_write_2_bits,
  input   io_mcr_write_3_ready,
  output  io_mcr_write_3_valid,
  output [31:0] io_mcr_write_3_bits,
  input   io_mcr_write_4_ready,
  output  io_mcr_write_4_valid,
  output [31:0] io_mcr_write_4_bits,
  input   io_mcr_write_5_ready,
  output  io_mcr_write_5_valid,
  output [31:0] io_mcr_write_5_bits,
  input   io_mcr_write_6_ready,
  output  io_mcr_write_6_valid,
  output [31:0] io_mcr_write_6_bits,
  input   io_mcr_write_7_ready,
  output  io_mcr_write_7_valid,
  output [31:0] io_mcr_write_7_bits,
  input   io_mcr_write_8_ready,
  output  io_mcr_write_8_valid,
  output [31:0] io_mcr_write_8_bits,
  output [3:0] io_mcr_wstrb
);
  reg  rValid;
  reg [31:0] GEN_1;
  reg  arFired;
  reg [31:0] GEN_4;
  reg  awFired;
  reg [31:0] GEN_5;
  reg  wFired;
  reg [31:0] GEN_43;
  reg  wCommited;
  reg [31:0] GEN_44;
  reg [11:0] bId;
  reg [31:0] GEN_45;
  reg [11:0] rId;
  reg [31:0] GEN_46;
  reg [31:0] rData;
  reg [31:0] GEN_47;
  reg [31:0] wData;
  reg [31:0] GEN_48;
  reg [3:0] wAddr;
  reg [31:0] GEN_49;
  reg [3:0] rAddr;
  reg [31:0] GEN_50;
  reg [3:0] wStrb;
  reg [31:0] GEN_51;
  wire  T_516;
  wire [29:0] T_518;
  wire  T_520;
  wire  T_521;
  wire  T_523;
  wire  GEN_6;
  wire [29:0] GEN_7;
  wire [11:0] GEN_8;
  wire  T_524;
  wire  GEN_9;
  wire [31:0] GEN_10;
  wire [3:0] GEN_11;
  wire  T_526;
  wire [29:0] T_528;
  wire [3:0] T_529;
  wire  T_531;
  wire  T_532;
  wire  T_534;
  wire  GEN_12;
  wire [3:0] GEN_13;
  wire [11:0] GEN_14;
  wire  T_535;
  wire  GEN_15;
  wire  T_537;
  wire  GEN_16;
  wire  GEN_17;
  wire  GEN_18;
  wire  GEN_0_ready;
  wire  GEN_0_valid;
  wire [31:0] GEN_0_bits;
  wire  GEN_19;
  wire  GEN_20;
  wire [31:0] GEN_21;
  wire  GEN_22;
  wire  GEN_23;
  wire [31:0] GEN_24;
  wire  GEN_25;
  wire  GEN_26;
  wire [31:0] GEN_27;
  wire  GEN_28;
  wire  GEN_29;
  wire [31:0] GEN_30;
  wire  GEN_31;
  wire  GEN_32;
  wire [31:0] GEN_33;
  wire  GEN_34;
  wire  GEN_35;
  wire [31:0] GEN_36;
  wire  GEN_37;
  wire  GEN_38;
  wire [31:0] GEN_39;
  wire  GEN_40;
  wire  GEN_41;
  wire [31:0] GEN_42;
  wire  GEN_1_ready;
  wire  GEN_1_valid;
  wire [31:0] GEN_1_bits;
  wire  T_547;
  wire  GEN_67;
  wire  T_573;
  wire  T_574;
  wire  T_575;
  wire  GEN_2;
  wire  GEN_68;
  wire  GEN_69;
  wire  GEN_70;
  wire  GEN_71;
  wire  GEN_72;
  wire  GEN_73;
  wire  GEN_74;
  wire  GEN_75;
  wire  GEN_76;
  wire  T_582;
  wire  GEN_3;
  wire  GEN_77;
  wire  GEN_78;
  wire  GEN_79;
  wire  GEN_80;
  wire  GEN_81;
  wire  GEN_82;
  wire  GEN_83;
  wire  GEN_84;
  wire  GEN_85;
  wire [1:0] T_597_resp;
  wire [31:0] T_597_data;
  wire  T_597_last;
  wire [11:0] T_597_id;
  wire  T_597_user;
  wire  GEN_4_ready;
  wire  GEN_4_valid;
  wire [31:0] GEN_4_bits;
  wire  GEN_86;
  wire  GEN_87;
  wire [31:0] GEN_88;
  wire  GEN_89;
  wire  GEN_90;
  wire [31:0] GEN_91;
  wire  GEN_92;
  wire  GEN_93;
  wire [31:0] GEN_94;
  wire  GEN_95;
  wire  GEN_96;
  wire [31:0] GEN_97;
  wire  GEN_98;
  wire  GEN_99;
  wire [31:0] GEN_100;
  wire  GEN_101;
  wire  GEN_102;
  wire [31:0] GEN_103;
  wire  GEN_104;
  wire  GEN_105;
  wire [31:0] GEN_106;
  wire  GEN_107;
  wire  GEN_108;
  wire [31:0] GEN_109;
  wire  GEN_5_ready;
  wire  GEN_5_valid;
  wire [31:0] GEN_5_bits;
  wire  T_610;
  wire [1:0] T_616_resp;
  wire [11:0] T_616_id;
  wire  T_616_user;
  wire  T_622;
  wire  T_623;
  wire  T_624;
  wire  T_625;
  reg [3:0] GEN_0;
  reg [31:0] GEN_52;
  assign io_nasti_aw_ready = T_624;
  assign io_nasti_w_ready = T_625;
  assign io_nasti_b_valid = T_622;
  assign io_nasti_b_bits_resp = T_616_resp;
  assign io_nasti_b_bits_id = T_616_id;
  assign io_nasti_b_bits_user = T_616_user;
  assign io_nasti_ar_ready = T_623;
  assign io_nasti_r_valid = T_610;
  assign io_nasti_r_bits_resp = T_597_resp;
  assign io_nasti_r_bits_data = T_597_data;
  assign io_nasti_r_bits_last = T_597_last;
  assign io_nasti_r_bits_id = T_597_id;
  assign io_nasti_r_bits_user = T_597_user;
  assign io_mcr_read_0_ready = GEN_77;
  assign io_mcr_read_1_ready = GEN_78;
  assign io_mcr_read_2_ready = GEN_79;
  assign io_mcr_read_3_ready = GEN_80;
  assign io_mcr_read_4_ready = GEN_81;
  assign io_mcr_read_5_ready = GEN_82;
  assign io_mcr_read_6_ready = GEN_83;
  assign io_mcr_read_7_ready = GEN_84;
  assign io_mcr_read_8_ready = GEN_85;
  assign io_mcr_write_0_valid = GEN_68;
  assign io_mcr_write_0_bits = wData;
  assign io_mcr_write_1_valid = GEN_69;
  assign io_mcr_write_1_bits = wData;
  assign io_mcr_write_2_valid = GEN_70;
  assign io_mcr_write_2_bits = wData;
  assign io_mcr_write_3_valid = GEN_71;
  assign io_mcr_write_3_bits = wData;
  assign io_mcr_write_4_valid = GEN_72;
  assign io_mcr_write_4_bits = wData;
  assign io_mcr_write_5_valid = GEN_73;
  assign io_mcr_write_5_bits = wData;
  assign io_mcr_write_6_valid = GEN_74;
  assign io_mcr_write_6_bits = wData;
  assign io_mcr_write_7_valid = GEN_75;
  assign io_mcr_write_7_bits = wData;
  assign io_mcr_write_8_valid = GEN_76;
  assign io_mcr_write_8_bits = wData;
  assign io_mcr_wstrb = GEN_0;
  assign T_516 = io_nasti_aw_ready & io_nasti_aw_valid;
  assign T_518 = io_nasti_aw_bits_addr[31:2];
  assign T_520 = io_nasti_aw_bits_len == 8'h0;
  assign T_521 = T_520 | reset;
  assign T_523 = T_521 == 1'h0;
  assign GEN_6 = T_516 ? 1'h1 : awFired;
  assign GEN_7 = T_516 ? T_518 : {{26'd0}, wAddr};
  assign GEN_8 = T_516 ? io_nasti_aw_bits_id : bId;
  assign T_524 = io_nasti_w_ready & io_nasti_w_valid;
  assign GEN_9 = T_524 ? 1'h1 : wFired;
  assign GEN_10 = T_524 ? io_nasti_w_bits_data : wData;
  assign GEN_11 = T_524 ? io_nasti_w_bits_strb : wStrb;
  assign T_526 = io_nasti_ar_ready & io_nasti_ar_valid;
  assign T_528 = io_nasti_ar_bits_addr[31:2];
  assign T_529 = T_528[3:0];
  assign T_531 = io_nasti_ar_bits_len == 8'h0;
  assign T_532 = T_531 | reset;
  assign T_534 = T_532 == 1'h0;
  assign GEN_12 = T_526 ? 1'h1 : arFired;
  assign GEN_13 = T_526 ? T_529 : rAddr;
  assign GEN_14 = T_526 ? io_nasti_ar_bits_id : rId;
  assign T_535 = io_nasti_r_ready & io_nasti_r_valid;
  assign GEN_15 = T_535 ? 1'h0 : GEN_12;
  assign T_537 = io_nasti_b_ready & io_nasti_b_valid;
  assign GEN_16 = T_537 ? 1'h0 : GEN_6;
  assign GEN_17 = T_537 ? 1'h0 : GEN_9;
  assign GEN_18 = T_537 ? 1'h0 : wCommited;
  assign GEN_0_ready = GEN_40;
  assign GEN_0_valid = GEN_41;
  assign GEN_0_bits = GEN_42;
  assign GEN_19 = 4'h1 == wAddr ? io_mcr_write_1_ready : io_mcr_write_0_ready;
  assign GEN_20 = 4'h1 == wAddr ? io_mcr_write_1_valid : io_mcr_write_0_valid;
  assign GEN_21 = 4'h1 == wAddr ? io_mcr_write_1_bits : io_mcr_write_0_bits;
  assign GEN_22 = 4'h2 == wAddr ? io_mcr_write_2_ready : GEN_19;
  assign GEN_23 = 4'h2 == wAddr ? io_mcr_write_2_valid : GEN_20;
  assign GEN_24 = 4'h2 == wAddr ? io_mcr_write_2_bits : GEN_21;
  assign GEN_25 = 4'h3 == wAddr ? io_mcr_write_3_ready : GEN_22;
  assign GEN_26 = 4'h3 == wAddr ? io_mcr_write_3_valid : GEN_23;
  assign GEN_27 = 4'h3 == wAddr ? io_mcr_write_3_bits : GEN_24;
  assign GEN_28 = 4'h4 == wAddr ? io_mcr_write_4_ready : GEN_25;
  assign GEN_29 = 4'h4 == wAddr ? io_mcr_write_4_valid : GEN_26;
  assign GEN_30 = 4'h4 == wAddr ? io_mcr_write_4_bits : GEN_27;
  assign GEN_31 = 4'h5 == wAddr ? io_mcr_write_5_ready : GEN_28;
  assign GEN_32 = 4'h5 == wAddr ? io_mcr_write_5_valid : GEN_29;
  assign GEN_33 = 4'h5 == wAddr ? io_mcr_write_5_bits : GEN_30;
  assign GEN_34 = 4'h6 == wAddr ? io_mcr_write_6_ready : GEN_31;
  assign GEN_35 = 4'h6 == wAddr ? io_mcr_write_6_valid : GEN_32;
  assign GEN_36 = 4'h6 == wAddr ? io_mcr_write_6_bits : GEN_33;
  assign GEN_37 = 4'h7 == wAddr ? io_mcr_write_7_ready : GEN_34;
  assign GEN_38 = 4'h7 == wAddr ? io_mcr_write_7_valid : GEN_35;
  assign GEN_39 = 4'h7 == wAddr ? io_mcr_write_7_bits : GEN_36;
  assign GEN_40 = 4'h8 == wAddr ? io_mcr_write_8_ready : GEN_37;
  assign GEN_41 = 4'h8 == wAddr ? io_mcr_write_8_valid : GEN_38;
  assign GEN_42 = 4'h8 == wAddr ? io_mcr_write_8_bits : GEN_39;
  assign GEN_1_ready = GEN_40;
  assign GEN_1_valid = GEN_41;
  assign GEN_1_bits = GEN_42;
  assign T_547 = GEN_0_ready & GEN_1_valid;
  assign GEN_67 = T_547 ? 1'h1 : GEN_18;
  assign T_573 = awFired & wFired;
  assign T_574 = ~ wCommited;
  assign T_575 = T_573 & T_574;
  assign GEN_2 = T_575;
  assign GEN_68 = 4'h0 == wAddr ? GEN_2 : 1'h0;
  assign GEN_69 = 4'h1 == wAddr ? GEN_2 : 1'h0;
  assign GEN_70 = 4'h2 == wAddr ? GEN_2 : 1'h0;
  assign GEN_71 = 4'h3 == wAddr ? GEN_2 : 1'h0;
  assign GEN_72 = 4'h4 == wAddr ? GEN_2 : 1'h0;
  assign GEN_73 = 4'h5 == wAddr ? GEN_2 : 1'h0;
  assign GEN_74 = 4'h6 == wAddr ? GEN_2 : 1'h0;
  assign GEN_75 = 4'h7 == wAddr ? GEN_2 : 1'h0;
  assign GEN_76 = 4'h8 == wAddr ? GEN_2 : 1'h0;
  assign T_582 = arFired & io_nasti_r_ready;
  assign GEN_3 = T_582;
  assign GEN_77 = 4'h0 == rAddr ? GEN_3 : 1'h0;
  assign GEN_78 = 4'h1 == rAddr ? GEN_3 : 1'h0;
  assign GEN_79 = 4'h2 == rAddr ? GEN_3 : 1'h0;
  assign GEN_80 = 4'h3 == rAddr ? GEN_3 : 1'h0;
  assign GEN_81 = 4'h4 == rAddr ? GEN_3 : 1'h0;
  assign GEN_82 = 4'h5 == rAddr ? GEN_3 : 1'h0;
  assign GEN_83 = 4'h6 == rAddr ? GEN_3 : 1'h0;
  assign GEN_84 = 4'h7 == rAddr ? GEN_3 : 1'h0;
  assign GEN_85 = 4'h8 == rAddr ? GEN_3 : 1'h0;
  assign T_597_resp = 2'h0;
  assign T_597_data = GEN_4_bits;
  assign T_597_last = 1'h1;
  assign T_597_id = rId;
  assign T_597_user = 1'h0;
  assign GEN_4_ready = GEN_107;
  assign GEN_4_valid = GEN_108;
  assign GEN_4_bits = GEN_109;
  assign GEN_86 = 4'h1 == rAddr ? io_mcr_read_1_ready : io_mcr_read_0_ready;
  assign GEN_87 = 4'h1 == rAddr ? io_mcr_read_1_valid : io_mcr_read_0_valid;
  assign GEN_88 = 4'h1 == rAddr ? io_mcr_read_1_bits : io_mcr_read_0_bits;
  assign GEN_89 = 4'h2 == rAddr ? io_mcr_read_2_ready : GEN_86;
  assign GEN_90 = 4'h2 == rAddr ? io_mcr_read_2_valid : GEN_87;
  assign GEN_91 = 4'h2 == rAddr ? io_mcr_read_2_bits : GEN_88;
  assign GEN_92 = 4'h3 == rAddr ? io_mcr_read_3_ready : GEN_89;
  assign GEN_93 = 4'h3 == rAddr ? io_mcr_read_3_valid : GEN_90;
  assign GEN_94 = 4'h3 == rAddr ? io_mcr_read_3_bits : GEN_91;
  assign GEN_95 = 4'h4 == rAddr ? io_mcr_read_4_ready : GEN_92;
  assign GEN_96 = 4'h4 == rAddr ? io_mcr_read_4_valid : GEN_93;
  assign GEN_97 = 4'h4 == rAddr ? io_mcr_read_4_bits : GEN_94;
  assign GEN_98 = 4'h5 == rAddr ? io_mcr_read_5_ready : GEN_95;
  assign GEN_99 = 4'h5 == rAddr ? io_mcr_read_5_valid : GEN_96;
  assign GEN_100 = 4'h5 == rAddr ? io_mcr_read_5_bits : GEN_97;
  assign GEN_101 = 4'h6 == rAddr ? io_mcr_read_6_ready : GEN_98;
  assign GEN_102 = 4'h6 == rAddr ? io_mcr_read_6_valid : GEN_99;
  assign GEN_103 = 4'h6 == rAddr ? io_mcr_read_6_bits : GEN_100;
  assign GEN_104 = 4'h7 == rAddr ? io_mcr_read_7_ready : GEN_101;
  assign GEN_105 = 4'h7 == rAddr ? io_mcr_read_7_valid : GEN_102;
  assign GEN_106 = 4'h7 == rAddr ? io_mcr_read_7_bits : GEN_103;
  assign GEN_107 = 4'h8 == rAddr ? io_mcr_read_8_ready : GEN_104;
  assign GEN_108 = 4'h8 == rAddr ? io_mcr_read_8_valid : GEN_105;
  assign GEN_109 = 4'h8 == rAddr ? io_mcr_read_8_bits : GEN_106;
  assign GEN_5_ready = GEN_107;
  assign GEN_5_valid = GEN_108;
  assign GEN_5_bits = GEN_109;
  assign T_610 = arFired & GEN_5_valid;
  assign T_616_resp = 2'h0;
  assign T_616_id = bId;
  assign T_616_user = 1'h0;
  assign T_622 = T_573 & wCommited;
  assign T_623 = ~ arFired;
  assign T_624 = ~ awFired;
  assign T_625 = ~ wFired;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  rValid = GEN_1[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_4 = {1{$random}};
  arFired = GEN_4[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_5 = {1{$random}};
  awFired = GEN_5[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_43 = {1{$random}};
  wFired = GEN_43[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_44 = {1{$random}};
  wCommited = GEN_44[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_45 = {1{$random}};
  bId = GEN_45[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_46 = {1{$random}};
  rId = GEN_46[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_47 = {1{$random}};
  rData = GEN_47[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_48 = {1{$random}};
  wData = GEN_48[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_49 = {1{$random}};
  wAddr = GEN_49[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_50 = {1{$random}};
  rAddr = GEN_50[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_51 = {1{$random}};
  wStrb = GEN_51[3:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_52 = {1{$random}};
  GEN_0 = GEN_52[3:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      rValid <= 1'h0;
    end
    if (reset) begin
      arFired <= 1'h0;
    end else begin
      if (T_535) begin
        arFired <= 1'h0;
      end else begin
        if (T_526) begin
          arFired <= 1'h1;
        end
      end
    end
    if (reset) begin
      awFired <= 1'h0;
    end else begin
      if (T_537) begin
        awFired <= 1'h0;
      end else begin
        if (T_516) begin
          awFired <= 1'h1;
        end
      end
    end
    if (reset) begin
      wFired <= 1'h0;
    end else begin
      if (T_537) begin
        wFired <= 1'h0;
      end else begin
        if (T_524) begin
          wFired <= 1'h1;
        end
      end
    end
    if (reset) begin
      wCommited <= 1'h0;
    end else begin
      if (T_547) begin
        wCommited <= 1'h1;
      end else begin
        if (T_537) begin
          wCommited <= 1'h0;
        end
      end
    end
    if (T_516) begin
      bId <= io_nasti_aw_bits_id;
    end
    if (T_526) begin
      rId <= io_nasti_ar_bits_id;
    end
    if (T_524) begin
      wData <= io_nasti_w_bits_data;
    end
    wAddr <= GEN_7[3:0];
    if (T_526) begin
      rAddr <= T_529;
    end
    if (T_524) begin
      wStrb <= io_nasti_w_bits_strb;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_516 & T_523) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Lib.scala:275 assert(io.nasti.aw.bits.len === UInt(0))\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_516 & T_523) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_526 & T_534) begin
          $fwrite(32'h80000002,"Assertion failed: MCRFile only support single beat reads\n    at Lib.scala:288 assert(io.nasti.ar.bits.len === UInt(0), \"MCRFile only support single beat reads\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_526 & T_534) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule
module DaisyController(
  input   clock,
  input   reset,
  output  io_ctrl_aw_ready,
  input   io_ctrl_aw_valid,
  input  [31:0] io_ctrl_aw_bits_addr,
  input  [7:0] io_ctrl_aw_bits_len,
  input  [2:0] io_ctrl_aw_bits_size,
  input  [1:0] io_ctrl_aw_bits_burst,
  input   io_ctrl_aw_bits_lock,
  input  [3:0] io_ctrl_aw_bits_cache,
  input  [2:0] io_ctrl_aw_bits_prot,
  input  [3:0] io_ctrl_aw_bits_qos,
  input  [3:0] io_ctrl_aw_bits_region,
  input  [11:0] io_ctrl_aw_bits_id,
  input   io_ctrl_aw_bits_user,
  output  io_ctrl_w_ready,
  input   io_ctrl_w_valid,
  input  [31:0] io_ctrl_w_bits_data,
  input   io_ctrl_w_bits_last,
  input  [11:0] io_ctrl_w_bits_id,
  input  [3:0] io_ctrl_w_bits_strb,
  input   io_ctrl_w_bits_user,
  input   io_ctrl_b_ready,
  output  io_ctrl_b_valid,
  output [1:0] io_ctrl_b_bits_resp,
  output [11:0] io_ctrl_b_bits_id,
  output  io_ctrl_b_bits_user,
  output  io_ctrl_ar_ready,
  input   io_ctrl_ar_valid,
  input  [31:0] io_ctrl_ar_bits_addr,
  input  [7:0] io_ctrl_ar_bits_len,
  input  [2:0] io_ctrl_ar_bits_size,
  input  [1:0] io_ctrl_ar_bits_burst,
  input   io_ctrl_ar_bits_lock,
  input  [3:0] io_ctrl_ar_bits_cache,
  input  [2:0] io_ctrl_ar_bits_prot,
  input  [3:0] io_ctrl_ar_bits_qos,
  input  [3:0] io_ctrl_ar_bits_region,
  input  [11:0] io_ctrl_ar_bits_id,
  input   io_ctrl_ar_bits_user,
  input   io_ctrl_r_ready,
  output  io_ctrl_r_valid,
  output [1:0] io_ctrl_r_bits_resp,
  output [31:0] io_ctrl_r_bits_data,
  output  io_ctrl_r_bits_last,
  output [11:0] io_ctrl_r_bits_id,
  output  io_ctrl_r_bits_user,
  input   io_daisy_regs_0_in_ready,
  output  io_daisy_regs_0_in_valid,
  output [31:0] io_daisy_regs_0_in_bits,
  output  io_daisy_regs_0_out_ready,
  input   io_daisy_regs_0_out_valid,
  input  [31:0] io_daisy_regs_0_out_bits,
  input   io_daisy_trace_0_in_ready,
  output  io_daisy_trace_0_in_valid,
  output [31:0] io_daisy_trace_0_in_bits,
  output  io_daisy_trace_0_out_ready,
  input   io_daisy_trace_0_out_valid,
  input  [31:0] io_daisy_trace_0_out_bits,
  input   io_daisy_cntr_0_in_ready,
  output  io_daisy_cntr_0_in_valid,
  output [31:0] io_daisy_cntr_0_in_bits,
  output  io_daisy_cntr_0_out_ready,
  input   io_daisy_cntr_0_out_valid,
  input  [31:0] io_daisy_cntr_0_out_bits,
  input   io_daisy_sram_0_in_ready,
  output  io_daisy_sram_0_in_valid,
  output [31:0] io_daisy_sram_0_in_bits,
  output  io_daisy_sram_0_out_ready,
  input   io_daisy_sram_0_out_valid,
  input  [31:0] io_daisy_sram_0_out_bits,
  output  io_daisy_sram_0_restart
);
  wire  T_946;
  reg  T_947;
  reg [31:0] GEN_14;
  wire  GEN_0;
  wire  MCRFile_1_1_clock;
  wire  MCRFile_1_1_reset;
  wire  MCRFile_1_1_io_nasti_aw_ready;
  wire  MCRFile_1_1_io_nasti_aw_valid;
  wire [31:0] MCRFile_1_1_io_nasti_aw_bits_addr;
  wire [7:0] MCRFile_1_1_io_nasti_aw_bits_len;
  wire [2:0] MCRFile_1_1_io_nasti_aw_bits_size;
  wire [1:0] MCRFile_1_1_io_nasti_aw_bits_burst;
  wire  MCRFile_1_1_io_nasti_aw_bits_lock;
  wire [3:0] MCRFile_1_1_io_nasti_aw_bits_cache;
  wire [2:0] MCRFile_1_1_io_nasti_aw_bits_prot;
  wire [3:0] MCRFile_1_1_io_nasti_aw_bits_qos;
  wire [3:0] MCRFile_1_1_io_nasti_aw_bits_region;
  wire [11:0] MCRFile_1_1_io_nasti_aw_bits_id;
  wire  MCRFile_1_1_io_nasti_aw_bits_user;
  wire  MCRFile_1_1_io_nasti_w_ready;
  wire  MCRFile_1_1_io_nasti_w_valid;
  wire [31:0] MCRFile_1_1_io_nasti_w_bits_data;
  wire  MCRFile_1_1_io_nasti_w_bits_last;
  wire [11:0] MCRFile_1_1_io_nasti_w_bits_id;
  wire [3:0] MCRFile_1_1_io_nasti_w_bits_strb;
  wire  MCRFile_1_1_io_nasti_w_bits_user;
  wire  MCRFile_1_1_io_nasti_b_ready;
  wire  MCRFile_1_1_io_nasti_b_valid;
  wire [1:0] MCRFile_1_1_io_nasti_b_bits_resp;
  wire [11:0] MCRFile_1_1_io_nasti_b_bits_id;
  wire  MCRFile_1_1_io_nasti_b_bits_user;
  wire  MCRFile_1_1_io_nasti_ar_ready;
  wire  MCRFile_1_1_io_nasti_ar_valid;
  wire [31:0] MCRFile_1_1_io_nasti_ar_bits_addr;
  wire [7:0] MCRFile_1_1_io_nasti_ar_bits_len;
  wire [2:0] MCRFile_1_1_io_nasti_ar_bits_size;
  wire [1:0] MCRFile_1_1_io_nasti_ar_bits_burst;
  wire  MCRFile_1_1_io_nasti_ar_bits_lock;
  wire [3:0] MCRFile_1_1_io_nasti_ar_bits_cache;
  wire [2:0] MCRFile_1_1_io_nasti_ar_bits_prot;
  wire [3:0] MCRFile_1_1_io_nasti_ar_bits_qos;
  wire [3:0] MCRFile_1_1_io_nasti_ar_bits_region;
  wire [11:0] MCRFile_1_1_io_nasti_ar_bits_id;
  wire  MCRFile_1_1_io_nasti_ar_bits_user;
  wire  MCRFile_1_1_io_nasti_r_ready;
  wire  MCRFile_1_1_io_nasti_r_valid;
  wire [1:0] MCRFile_1_1_io_nasti_r_bits_resp;
  wire [31:0] MCRFile_1_1_io_nasti_r_bits_data;
  wire  MCRFile_1_1_io_nasti_r_bits_last;
  wire [11:0] MCRFile_1_1_io_nasti_r_bits_id;
  wire  MCRFile_1_1_io_nasti_r_bits_user;
  wire  MCRFile_1_1_io_mcr_read_0_ready;
  wire  MCRFile_1_1_io_mcr_read_0_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_0_bits;
  wire  MCRFile_1_1_io_mcr_read_1_ready;
  wire  MCRFile_1_1_io_mcr_read_1_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_1_bits;
  wire  MCRFile_1_1_io_mcr_read_2_ready;
  wire  MCRFile_1_1_io_mcr_read_2_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_2_bits;
  wire  MCRFile_1_1_io_mcr_read_3_ready;
  wire  MCRFile_1_1_io_mcr_read_3_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_3_bits;
  wire  MCRFile_1_1_io_mcr_read_4_ready;
  wire  MCRFile_1_1_io_mcr_read_4_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_4_bits;
  wire  MCRFile_1_1_io_mcr_read_5_ready;
  wire  MCRFile_1_1_io_mcr_read_5_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_5_bits;
  wire  MCRFile_1_1_io_mcr_read_6_ready;
  wire  MCRFile_1_1_io_mcr_read_6_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_6_bits;
  wire  MCRFile_1_1_io_mcr_read_7_ready;
  wire  MCRFile_1_1_io_mcr_read_7_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_7_bits;
  wire  MCRFile_1_1_io_mcr_read_8_ready;
  wire  MCRFile_1_1_io_mcr_read_8_valid;
  wire [31:0] MCRFile_1_1_io_mcr_read_8_bits;
  wire  MCRFile_1_1_io_mcr_write_0_ready;
  wire  MCRFile_1_1_io_mcr_write_0_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_0_bits;
  wire  MCRFile_1_1_io_mcr_write_1_ready;
  wire  MCRFile_1_1_io_mcr_write_1_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_1_bits;
  wire  MCRFile_1_1_io_mcr_write_2_ready;
  wire  MCRFile_1_1_io_mcr_write_2_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_2_bits;
  wire  MCRFile_1_1_io_mcr_write_3_ready;
  wire  MCRFile_1_1_io_mcr_write_3_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_3_bits;
  wire  MCRFile_1_1_io_mcr_write_4_ready;
  wire  MCRFile_1_1_io_mcr_write_4_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_4_bits;
  wire  MCRFile_1_1_io_mcr_write_5_ready;
  wire  MCRFile_1_1_io_mcr_write_5_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_5_bits;
  wire  MCRFile_1_1_io_mcr_write_6_ready;
  wire  MCRFile_1_1_io_mcr_write_6_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_6_bits;
  wire  MCRFile_1_1_io_mcr_write_7_ready;
  wire  MCRFile_1_1_io_mcr_write_7_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_7_bits;
  wire  MCRFile_1_1_io_mcr_write_8_ready;
  wire  MCRFile_1_1_io_mcr_write_8_valid;
  wire [31:0] MCRFile_1_1_io_mcr_write_8_bits;
  wire [3:0] MCRFile_1_1_io_mcr_wstrb;
  wire [31:0] GEN_1;
  wire  T_952;
  wire  T_953;
  wire  T_955;
  wire  T_957;
  wire  T_958;
  wire  T_960;
  wire  T_962;
  wire  T_963;
  wire  T_965;
  wire  T_967;
  wire  T_968;
  wire  T_970;
  wire  T_972;
  wire  T_973;
  wire  T_975;
  wire  T_977;
  wire  T_978;
  wire  T_980;
  wire  T_982;
  wire  T_983;
  wire  T_985;
  wire  T_987;
  wire  T_988;
  wire  T_990;
  reg  GEN_2;
  reg [31:0] GEN_15;
  reg [31:0] GEN_3;
  reg [31:0] GEN_16;
  reg  GEN_4;
  reg [31:0] GEN_17;
  reg [31:0] GEN_5;
  reg [31:0] GEN_18;
  reg  GEN_6;
  reg [31:0] GEN_19;
  reg [31:0] GEN_7;
  reg [31:0] GEN_20;
  reg  GEN_8;
  reg [31:0] GEN_21;
  reg [31:0] GEN_9;
  reg [31:0] GEN_22;
  reg  GEN_10;
  reg [31:0] GEN_23;
  reg  GEN_11;
  reg [31:0] GEN_24;
  reg  GEN_12;
  reg [31:0] GEN_25;
  reg  GEN_13;
  reg [31:0] GEN_26;
  MCRFile_1 MCRFile_1_1 (
    .clock(MCRFile_1_1_clock),
    .reset(MCRFile_1_1_reset),
    .io_nasti_aw_ready(MCRFile_1_1_io_nasti_aw_ready),
    .io_nasti_aw_valid(MCRFile_1_1_io_nasti_aw_valid),
    .io_nasti_aw_bits_addr(MCRFile_1_1_io_nasti_aw_bits_addr),
    .io_nasti_aw_bits_len(MCRFile_1_1_io_nasti_aw_bits_len),
    .io_nasti_aw_bits_size(MCRFile_1_1_io_nasti_aw_bits_size),
    .io_nasti_aw_bits_burst(MCRFile_1_1_io_nasti_aw_bits_burst),
    .io_nasti_aw_bits_lock(MCRFile_1_1_io_nasti_aw_bits_lock),
    .io_nasti_aw_bits_cache(MCRFile_1_1_io_nasti_aw_bits_cache),
    .io_nasti_aw_bits_prot(MCRFile_1_1_io_nasti_aw_bits_prot),
    .io_nasti_aw_bits_qos(MCRFile_1_1_io_nasti_aw_bits_qos),
    .io_nasti_aw_bits_region(MCRFile_1_1_io_nasti_aw_bits_region),
    .io_nasti_aw_bits_id(MCRFile_1_1_io_nasti_aw_bits_id),
    .io_nasti_aw_bits_user(MCRFile_1_1_io_nasti_aw_bits_user),
    .io_nasti_w_ready(MCRFile_1_1_io_nasti_w_ready),
    .io_nasti_w_valid(MCRFile_1_1_io_nasti_w_valid),
    .io_nasti_w_bits_data(MCRFile_1_1_io_nasti_w_bits_data),
    .io_nasti_w_bits_last(MCRFile_1_1_io_nasti_w_bits_last),
    .io_nasti_w_bits_id(MCRFile_1_1_io_nasti_w_bits_id),
    .io_nasti_w_bits_strb(MCRFile_1_1_io_nasti_w_bits_strb),
    .io_nasti_w_bits_user(MCRFile_1_1_io_nasti_w_bits_user),
    .io_nasti_b_ready(MCRFile_1_1_io_nasti_b_ready),
    .io_nasti_b_valid(MCRFile_1_1_io_nasti_b_valid),
    .io_nasti_b_bits_resp(MCRFile_1_1_io_nasti_b_bits_resp),
    .io_nasti_b_bits_id(MCRFile_1_1_io_nasti_b_bits_id),
    .io_nasti_b_bits_user(MCRFile_1_1_io_nasti_b_bits_user),
    .io_nasti_ar_ready(MCRFile_1_1_io_nasti_ar_ready),
    .io_nasti_ar_valid(MCRFile_1_1_io_nasti_ar_valid),
    .io_nasti_ar_bits_addr(MCRFile_1_1_io_nasti_ar_bits_addr),
    .io_nasti_ar_bits_len(MCRFile_1_1_io_nasti_ar_bits_len),
    .io_nasti_ar_bits_size(MCRFile_1_1_io_nasti_ar_bits_size),
    .io_nasti_ar_bits_burst(MCRFile_1_1_io_nasti_ar_bits_burst),
    .io_nasti_ar_bits_lock(MCRFile_1_1_io_nasti_ar_bits_lock),
    .io_nasti_ar_bits_cache(MCRFile_1_1_io_nasti_ar_bits_cache),
    .io_nasti_ar_bits_prot(MCRFile_1_1_io_nasti_ar_bits_prot),
    .io_nasti_ar_bits_qos(MCRFile_1_1_io_nasti_ar_bits_qos),
    .io_nasti_ar_bits_region(MCRFile_1_1_io_nasti_ar_bits_region),
    .io_nasti_ar_bits_id(MCRFile_1_1_io_nasti_ar_bits_id),
    .io_nasti_ar_bits_user(MCRFile_1_1_io_nasti_ar_bits_user),
    .io_nasti_r_ready(MCRFile_1_1_io_nasti_r_ready),
    .io_nasti_r_valid(MCRFile_1_1_io_nasti_r_valid),
    .io_nasti_r_bits_resp(MCRFile_1_1_io_nasti_r_bits_resp),
    .io_nasti_r_bits_data(MCRFile_1_1_io_nasti_r_bits_data),
    .io_nasti_r_bits_last(MCRFile_1_1_io_nasti_r_bits_last),
    .io_nasti_r_bits_id(MCRFile_1_1_io_nasti_r_bits_id),
    .io_nasti_r_bits_user(MCRFile_1_1_io_nasti_r_bits_user),
    .io_mcr_read_0_ready(MCRFile_1_1_io_mcr_read_0_ready),
    .io_mcr_read_0_valid(MCRFile_1_1_io_mcr_read_0_valid),
    .io_mcr_read_0_bits(MCRFile_1_1_io_mcr_read_0_bits),
    .io_mcr_read_1_ready(MCRFile_1_1_io_mcr_read_1_ready),
    .io_mcr_read_1_valid(MCRFile_1_1_io_mcr_read_1_valid),
    .io_mcr_read_1_bits(MCRFile_1_1_io_mcr_read_1_bits),
    .io_mcr_read_2_ready(MCRFile_1_1_io_mcr_read_2_ready),
    .io_mcr_read_2_valid(MCRFile_1_1_io_mcr_read_2_valid),
    .io_mcr_read_2_bits(MCRFile_1_1_io_mcr_read_2_bits),
    .io_mcr_read_3_ready(MCRFile_1_1_io_mcr_read_3_ready),
    .io_mcr_read_3_valid(MCRFile_1_1_io_mcr_read_3_valid),
    .io_mcr_read_3_bits(MCRFile_1_1_io_mcr_read_3_bits),
    .io_mcr_read_4_ready(MCRFile_1_1_io_mcr_read_4_ready),
    .io_mcr_read_4_valid(MCRFile_1_1_io_mcr_read_4_valid),
    .io_mcr_read_4_bits(MCRFile_1_1_io_mcr_read_4_bits),
    .io_mcr_read_5_ready(MCRFile_1_1_io_mcr_read_5_ready),
    .io_mcr_read_5_valid(MCRFile_1_1_io_mcr_read_5_valid),
    .io_mcr_read_5_bits(MCRFile_1_1_io_mcr_read_5_bits),
    .io_mcr_read_6_ready(MCRFile_1_1_io_mcr_read_6_ready),
    .io_mcr_read_6_valid(MCRFile_1_1_io_mcr_read_6_valid),
    .io_mcr_read_6_bits(MCRFile_1_1_io_mcr_read_6_bits),
    .io_mcr_read_7_ready(MCRFile_1_1_io_mcr_read_7_ready),
    .io_mcr_read_7_valid(MCRFile_1_1_io_mcr_read_7_valid),
    .io_mcr_read_7_bits(MCRFile_1_1_io_mcr_read_7_bits),
    .io_mcr_read_8_ready(MCRFile_1_1_io_mcr_read_8_ready),
    .io_mcr_read_8_valid(MCRFile_1_1_io_mcr_read_8_valid),
    .io_mcr_read_8_bits(MCRFile_1_1_io_mcr_read_8_bits),
    .io_mcr_write_0_ready(MCRFile_1_1_io_mcr_write_0_ready),
    .io_mcr_write_0_valid(MCRFile_1_1_io_mcr_write_0_valid),
    .io_mcr_write_0_bits(MCRFile_1_1_io_mcr_write_0_bits),
    .io_mcr_write_1_ready(MCRFile_1_1_io_mcr_write_1_ready),
    .io_mcr_write_1_valid(MCRFile_1_1_io_mcr_write_1_valid),
    .io_mcr_write_1_bits(MCRFile_1_1_io_mcr_write_1_bits),
    .io_mcr_write_2_ready(MCRFile_1_1_io_mcr_write_2_ready),
    .io_mcr_write_2_valid(MCRFile_1_1_io_mcr_write_2_valid),
    .io_mcr_write_2_bits(MCRFile_1_1_io_mcr_write_2_bits),
    .io_mcr_write_3_ready(MCRFile_1_1_io_mcr_write_3_ready),
    .io_mcr_write_3_valid(MCRFile_1_1_io_mcr_write_3_valid),
    .io_mcr_write_3_bits(MCRFile_1_1_io_mcr_write_3_bits),
    .io_mcr_write_4_ready(MCRFile_1_1_io_mcr_write_4_ready),
    .io_mcr_write_4_valid(MCRFile_1_1_io_mcr_write_4_valid),
    .io_mcr_write_4_bits(MCRFile_1_1_io_mcr_write_4_bits),
    .io_mcr_write_5_ready(MCRFile_1_1_io_mcr_write_5_ready),
    .io_mcr_write_5_valid(MCRFile_1_1_io_mcr_write_5_valid),
    .io_mcr_write_5_bits(MCRFile_1_1_io_mcr_write_5_bits),
    .io_mcr_write_6_ready(MCRFile_1_1_io_mcr_write_6_ready),
    .io_mcr_write_6_valid(MCRFile_1_1_io_mcr_write_6_valid),
    .io_mcr_write_6_bits(MCRFile_1_1_io_mcr_write_6_bits),
    .io_mcr_write_7_ready(MCRFile_1_1_io_mcr_write_7_ready),
    .io_mcr_write_7_valid(MCRFile_1_1_io_mcr_write_7_valid),
    .io_mcr_write_7_bits(MCRFile_1_1_io_mcr_write_7_bits),
    .io_mcr_write_8_ready(MCRFile_1_1_io_mcr_write_8_ready),
    .io_mcr_write_8_valid(MCRFile_1_1_io_mcr_write_8_valid),
    .io_mcr_write_8_bits(MCRFile_1_1_io_mcr_write_8_bits),
    .io_mcr_wstrb(MCRFile_1_1_io_mcr_wstrb)
  );
  assign io_ctrl_aw_ready = MCRFile_1_1_io_nasti_aw_ready;
  assign io_ctrl_w_ready = MCRFile_1_1_io_nasti_w_ready;
  assign io_ctrl_b_valid = MCRFile_1_1_io_nasti_b_valid;
  assign io_ctrl_b_bits_resp = MCRFile_1_1_io_nasti_b_bits_resp;
  assign io_ctrl_b_bits_id = MCRFile_1_1_io_nasti_b_bits_id;
  assign io_ctrl_b_bits_user = MCRFile_1_1_io_nasti_b_bits_user;
  assign io_ctrl_ar_ready = MCRFile_1_1_io_nasti_ar_ready;
  assign io_ctrl_r_valid = MCRFile_1_1_io_nasti_r_valid;
  assign io_ctrl_r_bits_resp = MCRFile_1_1_io_nasti_r_bits_resp;
  assign io_ctrl_r_bits_data = MCRFile_1_1_io_nasti_r_bits_data;
  assign io_ctrl_r_bits_last = MCRFile_1_1_io_nasti_r_bits_last;
  assign io_ctrl_r_bits_id = MCRFile_1_1_io_nasti_r_bits_id;
  assign io_ctrl_r_bits_user = MCRFile_1_1_io_nasti_r_bits_user;
  assign io_daisy_regs_0_in_valid = MCRFile_1_1_io_mcr_write_3_valid;
  assign io_daisy_regs_0_in_bits = MCRFile_1_1_io_mcr_write_3_bits;
  assign io_daisy_regs_0_out_ready = MCRFile_1_1_io_mcr_read_4_ready;
  assign io_daisy_trace_0_in_valid = MCRFile_1_1_io_mcr_write_1_valid;
  assign io_daisy_trace_0_in_bits = MCRFile_1_1_io_mcr_write_1_bits;
  assign io_daisy_trace_0_out_ready = MCRFile_1_1_io_mcr_read_2_ready;
  assign io_daisy_cntr_0_in_valid = MCRFile_1_1_io_mcr_write_7_valid;
  assign io_daisy_cntr_0_in_bits = MCRFile_1_1_io_mcr_write_7_bits;
  assign io_daisy_cntr_0_out_ready = MCRFile_1_1_io_mcr_read_8_ready;
  assign io_daisy_sram_0_in_valid = MCRFile_1_1_io_mcr_write_5_valid;
  assign io_daisy_sram_0_in_bits = MCRFile_1_1_io_mcr_write_5_bits;
  assign io_daisy_sram_0_out_ready = MCRFile_1_1_io_mcr_read_6_ready;
  assign io_daisy_sram_0_restart = T_947;
  assign T_946 = 1'h0;
  assign GEN_0 = T_947 ? 1'h0 : T_947;
  assign MCRFile_1_1_clock = clock;
  assign MCRFile_1_1_reset = reset;
  assign MCRFile_1_1_io_nasti_aw_valid = io_ctrl_aw_valid;
  assign MCRFile_1_1_io_nasti_aw_bits_addr = io_ctrl_aw_bits_addr;
  assign MCRFile_1_1_io_nasti_aw_bits_len = io_ctrl_aw_bits_len;
  assign MCRFile_1_1_io_nasti_aw_bits_size = io_ctrl_aw_bits_size;
  assign MCRFile_1_1_io_nasti_aw_bits_burst = io_ctrl_aw_bits_burst;
  assign MCRFile_1_1_io_nasti_aw_bits_lock = io_ctrl_aw_bits_lock;
  assign MCRFile_1_1_io_nasti_aw_bits_cache = io_ctrl_aw_bits_cache;
  assign MCRFile_1_1_io_nasti_aw_bits_prot = io_ctrl_aw_bits_prot;
  assign MCRFile_1_1_io_nasti_aw_bits_qos = io_ctrl_aw_bits_qos;
  assign MCRFile_1_1_io_nasti_aw_bits_region = io_ctrl_aw_bits_region;
  assign MCRFile_1_1_io_nasti_aw_bits_id = io_ctrl_aw_bits_id;
  assign MCRFile_1_1_io_nasti_aw_bits_user = io_ctrl_aw_bits_user;
  assign MCRFile_1_1_io_nasti_w_valid = io_ctrl_w_valid;
  assign MCRFile_1_1_io_nasti_w_bits_data = io_ctrl_w_bits_data;
  assign MCRFile_1_1_io_nasti_w_bits_last = io_ctrl_w_bits_last;
  assign MCRFile_1_1_io_nasti_w_bits_id = io_ctrl_w_bits_id;
  assign MCRFile_1_1_io_nasti_w_bits_strb = io_ctrl_w_bits_strb;
  assign MCRFile_1_1_io_nasti_w_bits_user = io_ctrl_w_bits_user;
  assign MCRFile_1_1_io_nasti_b_ready = io_ctrl_b_ready;
  assign MCRFile_1_1_io_nasti_ar_valid = io_ctrl_ar_valid;
  assign MCRFile_1_1_io_nasti_ar_bits_addr = io_ctrl_ar_bits_addr;
  assign MCRFile_1_1_io_nasti_ar_bits_len = io_ctrl_ar_bits_len;
  assign MCRFile_1_1_io_nasti_ar_bits_size = io_ctrl_ar_bits_size;
  assign MCRFile_1_1_io_nasti_ar_bits_burst = io_ctrl_ar_bits_burst;
  assign MCRFile_1_1_io_nasti_ar_bits_lock = io_ctrl_ar_bits_lock;
  assign MCRFile_1_1_io_nasti_ar_bits_cache = io_ctrl_ar_bits_cache;
  assign MCRFile_1_1_io_nasti_ar_bits_prot = io_ctrl_ar_bits_prot;
  assign MCRFile_1_1_io_nasti_ar_bits_qos = io_ctrl_ar_bits_qos;
  assign MCRFile_1_1_io_nasti_ar_bits_region = io_ctrl_ar_bits_region;
  assign MCRFile_1_1_io_nasti_ar_bits_id = io_ctrl_ar_bits_id;
  assign MCRFile_1_1_io_nasti_ar_bits_user = io_ctrl_ar_bits_user;
  assign MCRFile_1_1_io_nasti_r_ready = io_ctrl_r_ready;
  assign MCRFile_1_1_io_mcr_read_0_valid = 1'h1;
  assign MCRFile_1_1_io_mcr_read_0_bits = {{31'd0}, T_947};
  assign MCRFile_1_1_io_mcr_read_1_valid = GEN_2;
  assign MCRFile_1_1_io_mcr_read_1_bits = GEN_3;
  assign MCRFile_1_1_io_mcr_read_2_valid = io_daisy_trace_0_out_valid;
  assign MCRFile_1_1_io_mcr_read_2_bits = io_daisy_trace_0_out_bits;
  assign MCRFile_1_1_io_mcr_read_3_valid = GEN_4;
  assign MCRFile_1_1_io_mcr_read_3_bits = GEN_5;
  assign MCRFile_1_1_io_mcr_read_4_valid = io_daisy_regs_0_out_valid;
  assign MCRFile_1_1_io_mcr_read_4_bits = io_daisy_regs_0_out_bits;
  assign MCRFile_1_1_io_mcr_read_5_valid = GEN_6;
  assign MCRFile_1_1_io_mcr_read_5_bits = GEN_7;
  assign MCRFile_1_1_io_mcr_read_6_valid = io_daisy_sram_0_out_valid;
  assign MCRFile_1_1_io_mcr_read_6_bits = io_daisy_sram_0_out_bits;
  assign MCRFile_1_1_io_mcr_read_7_valid = GEN_8;
  assign MCRFile_1_1_io_mcr_read_7_bits = GEN_9;
  assign MCRFile_1_1_io_mcr_read_8_valid = io_daisy_cntr_0_out_valid;
  assign MCRFile_1_1_io_mcr_read_8_bits = io_daisy_cntr_0_out_bits;
  assign MCRFile_1_1_io_mcr_write_0_ready = 1'h1;
  assign MCRFile_1_1_io_mcr_write_1_ready = io_daisy_trace_0_in_ready;
  assign MCRFile_1_1_io_mcr_write_2_ready = GEN_10;
  assign MCRFile_1_1_io_mcr_write_3_ready = io_daisy_regs_0_in_ready;
  assign MCRFile_1_1_io_mcr_write_4_ready = GEN_11;
  assign MCRFile_1_1_io_mcr_write_5_ready = io_daisy_sram_0_in_ready;
  assign MCRFile_1_1_io_mcr_write_6_ready = GEN_12;
  assign MCRFile_1_1_io_mcr_write_7_ready = io_daisy_cntr_0_in_ready;
  assign MCRFile_1_1_io_mcr_write_8_ready = GEN_13;
  assign GEN_1 = MCRFile_1_1_io_mcr_write_0_valid ? MCRFile_1_1_io_mcr_write_0_bits : {{31'd0}, GEN_0};
  assign T_952 = MCRFile_1_1_io_mcr_read_1_ready == 1'h0;
  assign T_953 = T_952 | reset;
  assign T_955 = T_953 == 1'h0;
  assign T_957 = MCRFile_1_1_io_mcr_write_2_valid != 1'h1;
  assign T_958 = T_957 | reset;
  assign T_960 = T_958 == 1'h0;
  assign T_962 = MCRFile_1_1_io_mcr_read_3_ready == 1'h0;
  assign T_963 = T_962 | reset;
  assign T_965 = T_963 == 1'h0;
  assign T_967 = MCRFile_1_1_io_mcr_write_4_valid != 1'h1;
  assign T_968 = T_967 | reset;
  assign T_970 = T_968 == 1'h0;
  assign T_972 = MCRFile_1_1_io_mcr_read_5_ready == 1'h0;
  assign T_973 = T_972 | reset;
  assign T_975 = T_973 == 1'h0;
  assign T_977 = MCRFile_1_1_io_mcr_write_6_valid != 1'h1;
  assign T_978 = T_977 | reset;
  assign T_980 = T_978 == 1'h0;
  assign T_982 = MCRFile_1_1_io_mcr_read_7_ready == 1'h0;
  assign T_983 = T_982 | reset;
  assign T_985 = T_983 == 1'h0;
  assign T_987 = MCRFile_1_1_io_mcr_write_8_valid != 1'h1;
  assign T_988 = T_987 | reset;
  assign T_990 = T_988 == 1'h0;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_14 = {1{$random}};
  T_947 = GEN_14[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_15 = {1{$random}};
  GEN_2 = GEN_15[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_16 = {1{$random}};
  GEN_3 = GEN_16[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_17 = {1{$random}};
  GEN_4 = GEN_17[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_18 = {1{$random}};
  GEN_5 = GEN_18[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_19 = {1{$random}};
  GEN_6 = GEN_19[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_20 = {1{$random}};
  GEN_7 = GEN_20[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_21 = {1{$random}};
  GEN_8 = GEN_21[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_22 = {1{$random}};
  GEN_9 = GEN_22[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_23 = {1{$random}};
  GEN_10 = GEN_23[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_24 = {1{$random}};
  GEN_11 = GEN_24[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_25 = {1{$random}};
  GEN_12 = GEN_25[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_26 = {1{$random}};
  GEN_13 = GEN_26[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      T_947 <= T_946;
    end else begin
      T_947 <= GEN_1[0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_955) begin
          $fwrite(32'h80000002,"Assertion failed: Can only write to this decoupled sink\n    at Lib.scala:241 assert(read(addr).ready === Bool(false), \"Can only write to this decoupled sink\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_955) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_960) begin
          $fwrite(32'h80000002,"Assertion failed: Can only read from this decoupled source\n    at Lib.scala:246 assert(write(addr).valid =/= Bool(true), \"Can only read from this decoupled source\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_960) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_965) begin
          $fwrite(32'h80000002,"Assertion failed: Can only write to this decoupled sink\n    at Lib.scala:241 assert(read(addr).ready === Bool(false), \"Can only write to this decoupled sink\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_965) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_970) begin
          $fwrite(32'h80000002,"Assertion failed: Can only read from this decoupled source\n    at Lib.scala:246 assert(write(addr).valid =/= Bool(true), \"Can only read from this decoupled source\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_970) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_975) begin
          $fwrite(32'h80000002,"Assertion failed: Can only write to this decoupled sink\n    at Lib.scala:241 assert(read(addr).ready === Bool(false), \"Can only write to this decoupled sink\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_975) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_980) begin
          $fwrite(32'h80000002,"Assertion failed: Can only read from this decoupled source\n    at Lib.scala:246 assert(write(addr).valid =/= Bool(true), \"Can only read from this decoupled source\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_980) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_985) begin
          $fwrite(32'h80000002,"Assertion failed: Can only write to this decoupled sink\n    at Lib.scala:241 assert(read(addr).ready === Bool(false), \"Can only write to this decoupled sink\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_985) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_990) begin
          $fwrite(32'h80000002,"Assertion failed: Can only read from this decoupled source\n    at Lib.scala:246 assert(write(addr).valid =/= Bool(true), \"Can only read from this decoupled source\")\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (T_990) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif
  end
endmodule
module Queue_12(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [31:0] io_enq_bits_addr,
  input  [7:0] io_enq_bits_len,
  input  [2:0] io_enq_bits_size,
  input  [1:0] io_enq_bits_burst,
  input   io_enq_bits_lock,
  input  [3:0] io_enq_bits_cache,
  input  [2:0] io_enq_bits_prot,
  input  [3:0] io_enq_bits_qos,
  input  [3:0] io_enq_bits_region,
  input  [11:0] io_enq_bits_id,
  input   io_enq_bits_user,
  input   io_deq_ready,
  output  io_deq_valid,
  output [31:0] io_deq_bits_addr,
  output [7:0] io_deq_bits_len,
  output [2:0] io_deq_bits_size,
  output [1:0] io_deq_bits_burst,
  output  io_deq_bits_lock,
  output [3:0] io_deq_bits_cache,
  output [2:0] io_deq_bits_prot,
  output [3:0] io_deq_bits_qos,
  output [3:0] io_deq_bits_region,
  output [11:0] io_deq_bits_id,
  output  io_deq_bits_user,
  output  io_count
);
  reg [31:0] ram_addr [0:0];
  reg [31:0] GEN_0;
  wire [31:0] ram_addr_T_131_data;
  wire  ram_addr_T_131_addr;
  wire [31:0] ram_addr_T_111_data;
  wire  ram_addr_T_111_addr;
  wire  ram_addr_T_111_mask;
  wire  ram_addr_T_111_en;
  reg [7:0] ram_len [0:0];
  reg [31:0] GEN_1;
  wire [7:0] ram_len_T_131_data;
  wire  ram_len_T_131_addr;
  wire [7:0] ram_len_T_111_data;
  wire  ram_len_T_111_addr;
  wire  ram_len_T_111_mask;
  wire  ram_len_T_111_en;
  reg [2:0] ram_size [0:0];
  reg [31:0] GEN_2;
  wire [2:0] ram_size_T_131_data;
  wire  ram_size_T_131_addr;
  wire [2:0] ram_size_T_111_data;
  wire  ram_size_T_111_addr;
  wire  ram_size_T_111_mask;
  wire  ram_size_T_111_en;
  reg [1:0] ram_burst [0:0];
  reg [31:0] GEN_3;
  wire [1:0] ram_burst_T_131_data;
  wire  ram_burst_T_131_addr;
  wire [1:0] ram_burst_T_111_data;
  wire  ram_burst_T_111_addr;
  wire  ram_burst_T_111_mask;
  wire  ram_burst_T_111_en;
  reg  ram_lock [0:0];
  reg [31:0] GEN_4;
  wire  ram_lock_T_131_data;
  wire  ram_lock_T_131_addr;
  wire  ram_lock_T_111_data;
  wire  ram_lock_T_111_addr;
  wire  ram_lock_T_111_mask;
  wire  ram_lock_T_111_en;
  reg [3:0] ram_cache [0:0];
  reg [31:0] GEN_5;
  wire [3:0] ram_cache_T_131_data;
  wire  ram_cache_T_131_addr;
  wire [3:0] ram_cache_T_111_data;
  wire  ram_cache_T_111_addr;
  wire  ram_cache_T_111_mask;
  wire  ram_cache_T_111_en;
  reg [2:0] ram_prot [0:0];
  reg [31:0] GEN_6;
  wire [2:0] ram_prot_T_131_data;
  wire  ram_prot_T_131_addr;
  wire [2:0] ram_prot_T_111_data;
  wire  ram_prot_T_111_addr;
  wire  ram_prot_T_111_mask;
  wire  ram_prot_T_111_en;
  reg [3:0] ram_qos [0:0];
  reg [31:0] GEN_7;
  wire [3:0] ram_qos_T_131_data;
  wire  ram_qos_T_131_addr;
  wire [3:0] ram_qos_T_111_data;
  wire  ram_qos_T_111_addr;
  wire  ram_qos_T_111_mask;
  wire  ram_qos_T_111_en;
  reg [3:0] ram_region [0:0];
  reg [31:0] GEN_8;
  wire [3:0] ram_region_T_131_data;
  wire  ram_region_T_131_addr;
  wire [3:0] ram_region_T_111_data;
  wire  ram_region_T_111_addr;
  wire  ram_region_T_111_mask;
  wire  ram_region_T_111_en;
  reg [11:0] ram_id [0:0];
  reg [31:0] GEN_9;
  wire [11:0] ram_id_T_131_data;
  wire  ram_id_T_131_addr;
  wire [11:0] ram_id_T_111_data;
  wire  ram_id_T_111_addr;
  wire  ram_id_T_111_mask;
  wire  ram_id_T_111_en;
  reg  ram_user [0:0];
  reg [31:0] GEN_10;
  wire  ram_user_T_131_data;
  wire  ram_user_T_131_addr;
  wire  ram_user_T_111_data;
  wire  ram_user_T_111_addr;
  wire  ram_user_T_111_mask;
  wire  ram_user_T_111_en;
  reg  maybe_full;
  reg [31:0] GEN_11;
  wire  T_107;
  wire  T_108;
  wire  do_enq;
  wire  T_109;
  wire  do_deq;
  wire  T_125;
  wire  GEN_14;
  wire  T_127;
  wire [1:0] T_143;
  wire  ptr_diff;
  wire [1:0] T_145;
  assign io_enq_ready = T_107;
  assign io_deq_valid = T_127;
  assign io_deq_bits_addr = ram_addr_T_131_data;
  assign io_deq_bits_len = ram_len_T_131_data;
  assign io_deq_bits_size = ram_size_T_131_data;
  assign io_deq_bits_burst = ram_burst_T_131_data;
  assign io_deq_bits_lock = ram_lock_T_131_data;
  assign io_deq_bits_cache = ram_cache_T_131_data;
  assign io_deq_bits_prot = ram_prot_T_131_data;
  assign io_deq_bits_qos = ram_qos_T_131_data;
  assign io_deq_bits_region = ram_region_T_131_data;
  assign io_deq_bits_id = ram_id_T_131_data;
  assign io_deq_bits_user = ram_user_T_131_data;
  assign io_count = T_145[0];
  assign ram_addr_T_131_addr = 1'h0;
  assign ram_addr_T_131_data = ram_addr[ram_addr_T_131_addr];
  assign ram_addr_T_111_data = io_enq_bits_addr;
  assign ram_addr_T_111_addr = 1'h0;
  assign ram_addr_T_111_mask = do_enq;
  assign ram_addr_T_111_en = do_enq;
  assign ram_len_T_131_addr = 1'h0;
  assign ram_len_T_131_data = ram_len[ram_len_T_131_addr];
  assign ram_len_T_111_data = io_enq_bits_len;
  assign ram_len_T_111_addr = 1'h0;
  assign ram_len_T_111_mask = do_enq;
  assign ram_len_T_111_en = do_enq;
  assign ram_size_T_131_addr = 1'h0;
  assign ram_size_T_131_data = ram_size[ram_size_T_131_addr];
  assign ram_size_T_111_data = io_enq_bits_size;
  assign ram_size_T_111_addr = 1'h0;
  assign ram_size_T_111_mask = do_enq;
  assign ram_size_T_111_en = do_enq;
  assign ram_burst_T_131_addr = 1'h0;
  assign ram_burst_T_131_data = ram_burst[ram_burst_T_131_addr];
  assign ram_burst_T_111_data = io_enq_bits_burst;
  assign ram_burst_T_111_addr = 1'h0;
  assign ram_burst_T_111_mask = do_enq;
  assign ram_burst_T_111_en = do_enq;
  assign ram_lock_T_131_addr = 1'h0;
  assign ram_lock_T_131_data = ram_lock[ram_lock_T_131_addr];
  assign ram_lock_T_111_data = io_enq_bits_lock;
  assign ram_lock_T_111_addr = 1'h0;
  assign ram_lock_T_111_mask = do_enq;
  assign ram_lock_T_111_en = do_enq;
  assign ram_cache_T_131_addr = 1'h0;
  assign ram_cache_T_131_data = ram_cache[ram_cache_T_131_addr];
  assign ram_cache_T_111_data = io_enq_bits_cache;
  assign ram_cache_T_111_addr = 1'h0;
  assign ram_cache_T_111_mask = do_enq;
  assign ram_cache_T_111_en = do_enq;
  assign ram_prot_T_131_addr = 1'h0;
  assign ram_prot_T_131_data = ram_prot[ram_prot_T_131_addr];
  assign ram_prot_T_111_data = io_enq_bits_prot;
  assign ram_prot_T_111_addr = 1'h0;
  assign ram_prot_T_111_mask = do_enq;
  assign ram_prot_T_111_en = do_enq;
  assign ram_qos_T_131_addr = 1'h0;
  assign ram_qos_T_131_data = ram_qos[ram_qos_T_131_addr];
  assign ram_qos_T_111_data = io_enq_bits_qos;
  assign ram_qos_T_111_addr = 1'h0;
  assign ram_qos_T_111_mask = do_enq;
  assign ram_qos_T_111_en = do_enq;
  assign ram_region_T_131_addr = 1'h0;
  assign ram_region_T_131_data = ram_region[ram_region_T_131_addr];
  assign ram_region_T_111_data = io_enq_bits_region;
  assign ram_region_T_111_addr = 1'h0;
  assign ram_region_T_111_mask = do_enq;
  assign ram_region_T_111_en = do_enq;
  assign ram_id_T_131_addr = 1'h0;
  assign ram_id_T_131_data = ram_id[ram_id_T_131_addr];
  assign ram_id_T_111_data = io_enq_bits_id;
  assign ram_id_T_111_addr = 1'h0;
  assign ram_id_T_111_mask = do_enq;
  assign ram_id_T_111_en = do_enq;
  assign ram_user_T_131_addr = 1'h0;
  assign ram_user_T_131_data = ram_user[ram_user_T_131_addr];
  assign ram_user_T_111_data = io_enq_bits_user;
  assign ram_user_T_111_addr = 1'h0;
  assign ram_user_T_111_mask = do_enq;
  assign ram_user_T_111_en = do_enq;
  assign T_107 = maybe_full == 1'h0;
  assign T_108 = io_enq_ready & io_enq_valid;
  assign do_enq = T_108;
  assign T_109 = io_deq_ready & io_deq_valid;
  assign do_deq = T_109;
  assign T_125 = do_enq != do_deq;
  assign GEN_14 = T_125 ? do_enq : maybe_full;
  assign T_127 = T_107 == 1'h0;
  assign T_143 = 1'h0 - 1'h0;
  assign ptr_diff = T_143[0:0];
  assign T_145 = {maybe_full,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_addr[initvar] = GEN_0[31:0];
  `endif
  GEN_1 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_len[initvar] = GEN_1[7:0];
  `endif
  GEN_2 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_size[initvar] = GEN_2[2:0];
  `endif
  GEN_3 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_burst[initvar] = GEN_3[1:0];
  `endif
  GEN_4 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_lock[initvar] = GEN_4[0:0];
  `endif
  GEN_5 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_cache[initvar] = GEN_5[3:0];
  `endif
  GEN_6 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_prot[initvar] = GEN_6[2:0];
  `endif
  GEN_7 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_qos[initvar] = GEN_7[3:0];
  `endif
  GEN_8 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_region[initvar] = GEN_8[3:0];
  `endif
  GEN_9 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_id[initvar] = GEN_9[11:0];
  `endif
  GEN_10 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_user[initvar] = GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_11 = {1{$random}};
  maybe_full = GEN_11[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_addr_T_111_en & ram_addr_T_111_mask) begin
      ram_addr[ram_addr_T_111_addr] <= ram_addr_T_111_data;
    end
    if(ram_len_T_111_en & ram_len_T_111_mask) begin
      ram_len[ram_len_T_111_addr] <= ram_len_T_111_data;
    end
    if(ram_size_T_111_en & ram_size_T_111_mask) begin
      ram_size[ram_size_T_111_addr] <= ram_size_T_111_data;
    end
    if(ram_burst_T_111_en & ram_burst_T_111_mask) begin
      ram_burst[ram_burst_T_111_addr] <= ram_burst_T_111_data;
    end
    if(ram_lock_T_111_en & ram_lock_T_111_mask) begin
      ram_lock[ram_lock_T_111_addr] <= ram_lock_T_111_data;
    end
    if(ram_cache_T_111_en & ram_cache_T_111_mask) begin
      ram_cache[ram_cache_T_111_addr] <= ram_cache_T_111_data;
    end
    if(ram_prot_T_111_en & ram_prot_T_111_mask) begin
      ram_prot[ram_prot_T_111_addr] <= ram_prot_T_111_data;
    end
    if(ram_qos_T_111_en & ram_qos_T_111_mask) begin
      ram_qos[ram_qos_T_111_addr] <= ram_qos_T_111_data;
    end
    if(ram_region_T_111_en & ram_region_T_111_mask) begin
      ram_region[ram_region_T_111_addr] <= ram_region_T_111_data;
    end
    if(ram_id_T_111_en & ram_id_T_111_mask) begin
      ram_id[ram_id_T_111_addr] <= ram_id_T_111_data;
    end
    if(ram_user_T_111_en & ram_user_T_111_mask) begin
      ram_user[ram_user_T_111_addr] <= ram_user_T_111_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_125) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module Queue_13(
  input   clock,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [11:0] io_enq_bits,
  input   io_deq_ready,
  output  io_deq_valid,
  output [11:0] io_deq_bits,
  output  io_count
);
  reg [11:0] ram [0:0];
  reg [31:0] GEN_0;
  wire [11:0] ram_T_43_data;
  wire  ram_T_43_addr;
  wire [11:0] ram_T_34_data;
  wire  ram_T_34_addr;
  wire  ram_T_34_mask;
  wire  ram_T_34_en;
  reg  maybe_full;
  reg [31:0] GEN_1;
  wire  T_30;
  wire  T_31;
  wire  do_enq;
  wire  T_32;
  wire  do_deq;
  wire  T_37;
  wire  GEN_4;
  wire  T_39;
  wire [1:0] T_44;
  wire  ptr_diff;
  wire [1:0] T_46;
  assign io_enq_ready = T_30;
  assign io_deq_valid = T_39;
  assign io_deq_bits = ram_T_43_data;
  assign io_count = T_46[0];
  assign ram_T_43_addr = 1'h0;
  assign ram_T_43_data = ram[ram_T_43_addr];
  assign ram_T_34_data = io_enq_bits;
  assign ram_T_34_addr = 1'h0;
  assign ram_T_34_mask = do_enq;
  assign ram_T_34_en = do_enq;
  assign T_30 = maybe_full == 1'h0;
  assign T_31 = io_enq_ready & io_enq_valid;
  assign do_enq = T_31;
  assign T_32 = io_deq_ready & io_deq_valid;
  assign do_deq = T_32;
  assign T_37 = do_enq != do_deq;
  assign GEN_4 = T_37 ? do_enq : maybe_full;
  assign T_39 = T_30 == 1'h0;
  assign T_44 = 1'h0 - 1'h0;
  assign ptr_diff = T_44[0:0];
  assign T_46 = {maybe_full,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram[initvar] = GEN_0[11:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_1 = {1{$random}};
  maybe_full = GEN_1[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if(ram_T_34_en & ram_T_34_mask) begin
      ram[ram_T_34_addr] <= ram_T_34_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else begin
      if (T_37) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
module NastiErrorSlave(
  input   clock,
  input   reset,
  output  io_aw_ready,
  input   io_aw_valid,
  input  [31:0] io_aw_bits_addr,
  input  [7:0] io_aw_bits_len,
  input  [2:0] io_aw_bits_size,
  input  [1:0] io_aw_bits_burst,
  input   io_aw_bits_lock,
  input  [3:0] io_aw_bits_cache,
  input  [2:0] io_aw_bits_prot,
  input  [3:0] io_aw_bits_qos,
  input  [3:0] io_aw_bits_region,
  input  [11:0] io_aw_bits_id,
  input   io_aw_bits_user,
  output  io_w_ready,
  input   io_w_valid,
  input  [31:0] io_w_bits_data,
  input   io_w_bits_last,
  input  [11:0] io_w_bits_id,
  input  [3:0] io_w_bits_strb,
  input   io_w_bits_user,
  input   io_b_ready,
  output  io_b_valid,
  output [1:0] io_b_bits_resp,
  output [11:0] io_b_bits_id,
  output  io_b_bits_user,
  output  io_ar_ready,
  input   io_ar_valid,
  input  [31:0] io_ar_bits_addr,
  input  [7:0] io_ar_bits_len,
  input  [2:0] io_ar_bits_size,
  input  [1:0] io_ar_bits_burst,
  input   io_ar_bits_lock,
  input  [3:0] io_ar_bits_cache,
  input  [2:0] io_ar_bits_prot,
  input  [3:0] io_ar_bits_qos,
  input  [3:0] io_ar_bits_region,
  input  [11:0] io_ar_bits_id,
  input   io_ar_bits_user,
  input   io_r_ready,
  output  io_r_valid,
  output [1:0] io_r_bits_resp,
  output [31:0] io_r_bits_data,
  output  io_r_bits_last,
  output [11:0] io_r_bits_id,
  output  io_r_bits_user
);
  wire  T_353;
  wire  T_355;
  wire  T_356;
  wire  r_queue_clock;
  wire  r_queue_reset;
  wire  r_queue_io_enq_ready;
  wire  r_queue_io_enq_valid;
  wire [31:0] r_queue_io_enq_bits_addr;
  wire [7:0] r_queue_io_enq_bits_len;
  wire [2:0] r_queue_io_enq_bits_size;
  wire [1:0] r_queue_io_enq_bits_burst;
  wire  r_queue_io_enq_bits_lock;
  wire [3:0] r_queue_io_enq_bits_cache;
  wire [2:0] r_queue_io_enq_bits_prot;
  wire [3:0] r_queue_io_enq_bits_qos;
  wire [3:0] r_queue_io_enq_bits_region;
  wire [11:0] r_queue_io_enq_bits_id;
  wire  r_queue_io_enq_bits_user;
  wire  r_queue_io_deq_ready;
  wire  r_queue_io_deq_valid;
  wire [31:0] r_queue_io_deq_bits_addr;
  wire [7:0] r_queue_io_deq_bits_len;
  wire [2:0] r_queue_io_deq_bits_size;
  wire [1:0] r_queue_io_deq_bits_burst;
  wire  r_queue_io_deq_bits_lock;
  wire [3:0] r_queue_io_deq_bits_cache;
  wire [2:0] r_queue_io_deq_bits_prot;
  wire [3:0] r_queue_io_deq_bits_qos;
  wire [3:0] r_queue_io_deq_bits_region;
  wire [11:0] r_queue_io_deq_bits_id;
  wire  r_queue_io_deq_bits_user;
  wire  r_queue_io_count;
  reg  responding;
  reg [31:0] GEN_10;
  reg [7:0] beats_left;
  reg [31:0] GEN_11;
  wire  T_374;
  wire  T_375;
  wire  GEN_0;
  wire [7:0] GEN_1;
  wire  T_377;
  wire  T_380;
  wire  T_381;
  wire  T_382;
  wire  GEN_2;
  wire  T_388;
  wire [8:0] T_390;
  wire [7:0] T_391;
  wire [7:0] GEN_3;
  wire  GEN_4;
  wire [7:0] GEN_5;
  reg  draining;
  reg [31:0] GEN_12;
  wire  GEN_6;
  wire  T_395;
  wire  T_396;
  wire  GEN_7;
  wire  b_queue_clock;
  wire  b_queue_reset;
  wire  b_queue_io_enq_ready;
  wire  b_queue_io_enq_valid;
  wire [11:0] b_queue_io_enq_bits;
  wire  b_queue_io_deq_ready;
  wire  b_queue_io_deq_valid;
  wire [11:0] b_queue_io_deq_bits;
  wire  b_queue_io_count;
  wire  T_400;
  wire  T_401;
  wire  T_404;
  wire  T_407;
  wire  T_411;
  reg  GEN_8;
  reg [31:0] GEN_13;
  reg  GEN_9;
  reg [31:0] GEN_14;
  Queue_12 r_queue (
    .clock(r_queue_clock),
    .reset(r_queue_reset),
    .io_enq_ready(r_queue_io_enq_ready),
    .io_enq_valid(r_queue_io_enq_valid),
    .io_enq_bits_addr(r_queue_io_enq_bits_addr),
    .io_enq_bits_len(r_queue_io_enq_bits_len),
    .io_enq_bits_size(r_queue_io_enq_bits_size),
    .io_enq_bits_burst(r_queue_io_enq_bits_burst),
    .io_enq_bits_lock(r_queue_io_enq_bits_lock),
    .io_enq_bits_cache(r_queue_io_enq_bits_cache),
    .io_enq_bits_prot(r_queue_io_enq_bits_prot),
    .io_enq_bits_qos(r_queue_io_enq_bits_qos),
    .io_enq_bits_region(r_queue_io_enq_bits_region),
    .io_enq_bits_id(r_queue_io_enq_bits_id),
    .io_enq_bits_user(r_queue_io_enq_bits_user),
    .io_deq_ready(r_queue_io_deq_ready),
    .io_deq_valid(r_queue_io_deq_valid),
    .io_deq_bits_addr(r_queue_io_deq_bits_addr),
    .io_deq_bits_len(r_queue_io_deq_bits_len),
    .io_deq_bits_size(r_queue_io_deq_bits_size),
    .io_deq_bits_burst(r_queue_io_deq_bits_burst),
    .io_deq_bits_lock(r_queue_io_deq_bits_lock),
    .io_deq_bits_cache(r_queue_io_deq_bits_cache),
    .io_deq_bits_prot(r_queue_io_deq_bits_prot),
    .io_deq_bits_qos(r_queue_io_deq_bits_qos),
    .io_deq_bits_region(r_queue_io_deq_bits_region),
    .io_deq_bits_id(r_queue_io_deq_bits_id),
    .io_deq_bits_user(r_queue_io_deq_bits_user),
    .io_count(r_queue_io_count)
  );
  Queue_13 b_queue (
    .clock(b_queue_clock),
    .reset(b_queue_reset),
    .io_enq_ready(b_queue_io_enq_ready),
    .io_enq_valid(b_queue_io_enq_valid),
    .io_enq_bits(b_queue_io_enq_bits),
    .io_deq_ready(b_queue_io_deq_ready),
    .io_deq_valid(b_queue_io_deq_valid),
    .io_deq_bits(b_queue_io_deq_bits),
    .io_count(b_queue_io_count)
  );
  assign io_aw_ready = T_404;
  assign io_w_ready = draining;
  assign io_b_valid = T_407;
  assign io_b_bits_resp = 2'h3;
  assign io_b_bits_id = b_queue_io_deq_bits;
  assign io_b_bits_user = GEN_8;
  assign io_ar_ready = r_queue_io_enq_ready;
  assign io_r_valid = T_377;
  assign io_r_bits_resp = 2'h3;
  assign io_r_bits_data = 32'h0;
  assign io_r_bits_last = T_380;
  assign io_r_bits_id = r_queue_io_deq_bits_id;
  assign io_r_bits_user = GEN_9;
  assign T_353 = io_ar_ready & io_ar_valid;
  assign T_355 = reset == 1'h0;
  assign T_356 = io_aw_ready & io_aw_valid;
  assign r_queue_clock = clock;
  assign r_queue_reset = reset;
  assign r_queue_io_enq_valid = io_ar_valid;
  assign r_queue_io_enq_bits_addr = io_ar_bits_addr;
  assign r_queue_io_enq_bits_len = io_ar_bits_len;
  assign r_queue_io_enq_bits_size = io_ar_bits_size;
  assign r_queue_io_enq_bits_burst = io_ar_bits_burst;
  assign r_queue_io_enq_bits_lock = io_ar_bits_lock;
  assign r_queue_io_enq_bits_cache = io_ar_bits_cache;
  assign r_queue_io_enq_bits_prot = io_ar_bits_prot;
  assign r_queue_io_enq_bits_qos = io_ar_bits_qos;
  assign r_queue_io_enq_bits_region = io_ar_bits_region;
  assign r_queue_io_enq_bits_id = io_ar_bits_id;
  assign r_queue_io_enq_bits_user = io_ar_bits_user;
  assign r_queue_io_deq_ready = T_382;
  assign T_374 = responding == 1'h0;
  assign T_375 = T_374 & r_queue_io_deq_valid;
  assign GEN_0 = T_375 ? 1'h1 : responding;
  assign GEN_1 = T_375 ? r_queue_io_deq_bits_len : beats_left;
  assign T_377 = r_queue_io_deq_valid & responding;
  assign T_380 = beats_left == 8'h0;
  assign T_381 = io_r_ready & io_r_valid;
  assign T_382 = T_381 & io_r_bits_last;
  assign GEN_2 = T_380 ? 1'h0 : GEN_0;
  assign T_388 = T_380 == 1'h0;
  assign T_390 = beats_left - 8'h1;
  assign T_391 = T_390[7:0];
  assign GEN_3 = T_388 ? T_391 : GEN_1;
  assign GEN_4 = T_381 ? GEN_2 : GEN_0;
  assign GEN_5 = T_381 ? GEN_3 : GEN_1;
  assign GEN_6 = T_356 ? 1'h1 : draining;
  assign T_395 = io_w_ready & io_w_valid;
  assign T_396 = T_395 & io_w_bits_last;
  assign GEN_7 = T_396 ? 1'h0 : GEN_6;
  assign b_queue_clock = clock;
  assign b_queue_reset = reset;
  assign b_queue_io_enq_valid = T_401;
  assign b_queue_io_enq_bits = io_aw_bits_id;
  assign b_queue_io_deq_ready = T_411;
  assign T_400 = draining == 1'h0;
  assign T_401 = io_aw_valid & T_400;
  assign T_404 = b_queue_io_enq_ready & T_400;
  assign T_407 = b_queue_io_deq_valid & T_400;
  assign T_411 = io_b_ready & T_400;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_10 = {1{$random}};
  responding = GEN_10[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_11 = {1{$random}};
  beats_left = GEN_11[7:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_12 = {1{$random}};
  draining = GEN_12[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_13 = {1{$random}};
  GEN_8 = GEN_13[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_14 = {1{$random}};
  GEN_9 = GEN_14[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      responding <= 1'h0;
    end else begin
      if (T_381) begin
        if (T_380) begin
          responding <= 1'h0;
        end else begin
          if (T_375) begin
            responding <= 1'h1;
          end
        end
      end else begin
        if (T_375) begin
          responding <= 1'h1;
        end
      end
    end
    if (reset) begin
      beats_left <= 8'h0;
    end else begin
      if (T_381) begin
        if (T_388) begin
          beats_left <= T_391;
        end else begin
          if (T_375) begin
            beats_left <= r_queue_io_deq_bits_len;
          end
        end
      end else begin
        if (T_375) begin
          beats_left <= r_queue_io_deq_bits_len;
        end
      end
    end
    if (reset) begin
      draining <= 1'h0;
    end else begin
      if (T_396) begin
        draining <= 1'h0;
      end else begin
        if (T_356) begin
          draining <= 1'h1;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_353 & T_355) begin
          $fwrite(32'h80000002,"Invalid read address %h\n",io_ar_bits_addr);
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (T_356 & T_355) begin
          $fwrite(32'h80000002,"Invalid write address %h\n",io_aw_bits_addr);
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif
  end
endmodule
module RRArbiter(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [1:0] io_in_0_bits_resp,
  input  [11:0] io_in_0_bits_id,
  input   io_in_0_bits_user,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [1:0] io_in_1_bits_resp,
  input  [11:0] io_in_1_bits_id,
  input   io_in_1_bits_user,
  output  io_in_2_ready,
  input   io_in_2_valid,
  input  [1:0] io_in_2_bits_resp,
  input  [11:0] io_in_2_bits_id,
  input   io_in_2_bits_user,
  output  io_in_3_ready,
  input   io_in_3_valid,
  input  [1:0] io_in_3_bits_resp,
  input  [11:0] io_in_3_bits_id,
  input   io_in_3_bits_user,
  input   io_out_ready,
  output  io_out_valid,
  output [1:0] io_out_bits_resp,
  output [11:0] io_out_bits_id,
  output  io_out_bits_user,
  output [1:0] io_chosen
);
  wire [1:0] choice;
  wire  GEN_0_ready;
  wire  GEN_0_valid;
  wire [1:0] GEN_0_bits_resp;
  wire [11:0] GEN_0_bits_id;
  wire  GEN_0_bits_user;
  wire  GEN_4;
  wire  GEN_5;
  wire [1:0] GEN_6;
  wire [11:0] GEN_7;
  wire  GEN_8;
  wire  GEN_9;
  wire  GEN_10;
  wire [1:0] GEN_11;
  wire [11:0] GEN_12;
  wire  GEN_13;
  wire  GEN_14;
  wire  GEN_15;
  wire [1:0] GEN_16;
  wire [11:0] GEN_17;
  wire  GEN_18;
  wire  GEN_1_ready;
  wire  GEN_1_valid;
  wire [1:0] GEN_1_bits_resp;
  wire [11:0] GEN_1_bits_id;
  wire  GEN_1_bits_user;
  wire  GEN_2_ready;
  wire  GEN_2_valid;
  wire [1:0] GEN_2_bits_resp;
  wire [11:0] GEN_2_bits_id;
  wire  GEN_2_bits_user;
  wire  GEN_3_ready;
  wire  GEN_3_valid;
  wire [1:0] GEN_3_bits_resp;
  wire [11:0] GEN_3_bits_id;
  wire  GEN_3_bits_user;
  wire  T_180;
  reg [1:0] lastGrant;
  reg [31:0] GEN_0;
  wire [1:0] GEN_19;
  wire  grantMask_1;
  wire  grantMask_2;
  wire  grantMask_3;
  wire  validMask_1;
  wire  validMask_2;
  wire  validMask_3;
  wire  T_187;
  wire  T_188;
  wire  T_189;
  wire  T_190;
  wire  T_191;
  wire  T_195;
  wire  T_197;
  wire  T_199;
  wire  T_201;
  wire  T_203;
  wire  T_205;
  wire  T_209;
  wire  T_210;
  wire  T_211;
  wire  T_212;
  wire  T_213;
  wire  T_214;
  wire  T_215;
  wire  T_216;
  wire  T_217;
  wire [1:0] GEN_20;
  wire [1:0] GEN_21;
  wire [1:0] GEN_22;
  wire [1:0] GEN_23;
  wire [1:0] GEN_24;
  wire [1:0] GEN_25;
  assign io_in_0_ready = T_214;
  assign io_in_1_ready = T_215;
  assign io_in_2_ready = T_216;
  assign io_in_3_ready = T_217;
  assign io_out_valid = GEN_0_valid;
  assign io_out_bits_resp = GEN_1_bits_resp;
  assign io_out_bits_id = GEN_2_bits_id;
  assign io_out_bits_user = GEN_3_bits_user;
  assign io_chosen = choice;
  assign choice = GEN_25;
  assign GEN_0_ready = GEN_14;
  assign GEN_0_valid = GEN_15;
  assign GEN_0_bits_resp = GEN_16;
  assign GEN_0_bits_id = GEN_17;
  assign GEN_0_bits_user = GEN_18;
  assign GEN_4 = 2'h1 == io_chosen ? io_in_1_ready : io_in_0_ready;
  assign GEN_5 = 2'h1 == io_chosen ? io_in_1_valid : io_in_0_valid;
  assign GEN_6 = 2'h1 == io_chosen ? io_in_1_bits_resp : io_in_0_bits_resp;
  assign GEN_7 = 2'h1 == io_chosen ? io_in_1_bits_id : io_in_0_bits_id;
  assign GEN_8 = 2'h1 == io_chosen ? io_in_1_bits_user : io_in_0_bits_user;
  assign GEN_9 = 2'h2 == io_chosen ? io_in_2_ready : GEN_4;
  assign GEN_10 = 2'h2 == io_chosen ? io_in_2_valid : GEN_5;
  assign GEN_11 = 2'h2 == io_chosen ? io_in_2_bits_resp : GEN_6;
  assign GEN_12 = 2'h2 == io_chosen ? io_in_2_bits_id : GEN_7;
  assign GEN_13 = 2'h2 == io_chosen ? io_in_2_bits_user : GEN_8;
  assign GEN_14 = 2'h3 == io_chosen ? io_in_3_ready : GEN_9;
  assign GEN_15 = 2'h3 == io_chosen ? io_in_3_valid : GEN_10;
  assign GEN_16 = 2'h3 == io_chosen ? io_in_3_bits_resp : GEN_11;
  assign GEN_17 = 2'h3 == io_chosen ? io_in_3_bits_id : GEN_12;
  assign GEN_18 = 2'h3 == io_chosen ? io_in_3_bits_user : GEN_13;
  assign GEN_1_ready = GEN_14;
  assign GEN_1_valid = GEN_15;
  assign GEN_1_bits_resp = GEN_16;
  assign GEN_1_bits_id = GEN_17;
  assign GEN_1_bits_user = GEN_18;
  assign GEN_2_ready = GEN_14;
  assign GEN_2_valid = GEN_15;
  assign GEN_2_bits_resp = GEN_16;
  assign GEN_2_bits_id = GEN_17;
  assign GEN_2_bits_user = GEN_18;
  assign GEN_3_ready = GEN_14;
  assign GEN_3_valid = GEN_15;
  assign GEN_3_bits_resp = GEN_16;
  assign GEN_3_bits_id = GEN_17;
  assign GEN_3_bits_user = GEN_18;
  assign T_180 = io_out_ready & io_out_valid;
  assign GEN_19 = T_180 ? io_chosen : lastGrant;
  assign grantMask_1 = 2'h1 > lastGrant;
  assign grantMask_2 = 2'h2 > lastGrant;
  assign grantMask_3 = 2'h3 > lastGrant;
  assign validMask_1 = io_in_1_valid & grantMask_1;
  assign validMask_2 = io_in_2_valid & grantMask_2;
  assign validMask_3 = io_in_3_valid & grantMask_3;
  assign T_187 = validMask_1 | validMask_2;
  assign T_188 = T_187 | validMask_3;
  assign T_189 = T_188 | io_in_0_valid;
  assign T_190 = T_189 | io_in_1_valid;
  assign T_191 = T_190 | io_in_2_valid;
  assign T_195 = validMask_1 == 1'h0;
  assign T_197 = T_187 == 1'h0;
  assign T_199 = T_188 == 1'h0;
  assign T_201 = T_189 == 1'h0;
  assign T_203 = T_190 == 1'h0;
  assign T_205 = T_191 == 1'h0;
  assign T_209 = grantMask_1 | T_201;
  assign T_210 = T_195 & grantMask_2;
  assign T_211 = T_210 | T_203;
  assign T_212 = T_197 & grantMask_3;
  assign T_213 = T_212 | T_205;
  assign T_214 = T_199 & io_out_ready;
  assign T_215 = T_209 & io_out_ready;
  assign T_216 = T_211 & io_out_ready;
  assign T_217 = T_213 & io_out_ready;
  assign GEN_20 = io_in_2_valid ? 2'h2 : 2'h3;
  assign GEN_21 = io_in_1_valid ? 2'h1 : GEN_20;
  assign GEN_22 = io_in_0_valid ? 2'h0 : GEN_21;
  assign GEN_23 = validMask_3 ? 2'h3 : GEN_22;
  assign GEN_24 = validMask_2 ? 2'h2 : GEN_23;
  assign GEN_25 = validMask_1 ? 2'h1 : GEN_24;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_0 = {1{$random}};
  lastGrant = GEN_0[1:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (T_180) begin
      lastGrant <= io_chosen;
    end
  end
endmodule
module JunctionsPeekingArbiter(
  input   clock,
  input   reset,
  output  io_in_0_ready,
  input   io_in_0_valid,
  input  [1:0] io_in_0_bits_resp,
  input  [31:0] io_in_0_bits_data,
  input   io_in_0_bits_last,
  input  [11:0] io_in_0_bits_id,
  input   io_in_0_bits_user,
  output  io_in_1_ready,
  input   io_in_1_valid,
  input  [1:0] io_in_1_bits_resp,
  input  [31:0] io_in_1_bits_data,
  input   io_in_1_bits_last,
  input  [11:0] io_in_1_bits_id,
  input   io_in_1_bits_user,
  output  io_in_2_ready,
  input   io_in_2_valid,
  input  [1:0] io_in_2_bits_resp,
  input  [31:0] io_in_2_bits_data,
  input   io_in_2_bits_last,
  input  [11:0] io_in_2_bits_id,
  input   io_in_2_bits_user,
  output  io_in_3_ready,
  input   io_in_3_valid,
  input  [1:0] io_in_3_bits_resp,
  input  [31:0] io_in_3_bits_data,
  input   io_in_3_bits_last,
  input  [11:0] io_in_3_bits_id,
  input   io_in_3_bits_user,
  input   io_out_ready,
  output  io_out_valid,
  output [1:0] io_out_bits_resp,
  output [31:0] io_out_bits_data,
  output  io_out_bits_last,
  output [11:0] io_out_bits_id,
  output  io_out_bits_user
);
  reg [1:0] lockIdx;
  reg [31:0] GEN_17;
  reg  locked;
  reg [31:0] GEN_18;
  wire  T_217_0;
  wire  T_217_1;
  wire  T_217_2;
  wire  T_217_3;
  wire [2:0] T_220;
  wire [1:0] T_221;
  wire [2:0] T_225;
  wire [1:0] T_226;
  wire [2:0] GEN_16;
  wire [3:0] T_228;
  wire [2:0] T_229;
  wire [1:0] T_230;
  wire  GEN_0;
  wire  GEN_22;
  wire  GEN_23;
  wire  GEN_24;
  wire  GEN_1;
  wire  GEN_25;
  wire  GEN_26;
  wire  GEN_27;
  wire  T_233;
  wire [2:0] T_235;
  wire [1:0] T_236;
  wire [2:0] T_238;
  wire [1:0] T_239;
  wire  GEN_2;
  wire  GEN_28;
  wire  GEN_29;
  wire  GEN_30;
  wire  GEN_3;
  wire  GEN_31;
  wire  GEN_32;
  wire  GEN_33;
  wire  T_240;
  wire  T_242;
  wire [2:0] T_244;
  wire [1:0] T_245;
  wire [2:0] T_247;
  wire [1:0] T_248;
  wire  GEN_4;
  wire  GEN_34;
  wire  GEN_35;
  wire  GEN_36;
  wire  GEN_5;
  wire  GEN_37;
  wire  GEN_38;
  wire  GEN_39;
  wire  T_249;
  wire  T_251;
  wire [2:0] T_253;
  wire [1:0] T_254;
  wire [2:0] T_256;
  wire [1:0] T_257;
  wire  GEN_6;
  wire  GEN_40;
  wire  GEN_41;
  wire  GEN_42;
  wire  GEN_7;
  wire  GEN_43;
  wire  GEN_44;
  wire  GEN_45;
  wire  T_258;
  wire  T_262_0;
  wire  T_262_1;
  wire  T_262_2;
  wire  T_262_3;
  wire [1:0] T_271_0;
  wire [1:0] T_271_1;
  wire [1:0] T_271_2;
  wire [1:0] T_271_3;
  wire [1:0] GEN_8;
  wire [1:0] GEN_46;
  wire [1:0] GEN_47;
  wire [1:0] GEN_48;
  wire [1:0] GEN_9;
  wire [1:0] GEN_49;
  wire [1:0] GEN_50;
  wire [1:0] GEN_51;
  wire [1:0] GEN_10;
  wire [1:0] GEN_52;
  wire [1:0] GEN_53;
  wire [1:0] GEN_54;
  wire [1:0] GEN_11;
  wire [1:0] GEN_55;
  wire [1:0] GEN_56;
  wire [1:0] GEN_57;
  wire [1:0] T_294;
  wire [1:0] GEN_12;
  wire [1:0] GEN_58;
  wire [1:0] GEN_59;
  wire [1:0] GEN_60;
  wire [1:0] GEN_13;
  wire [1:0] GEN_61;
  wire [1:0] GEN_62;
  wire [1:0] GEN_63;
  wire [1:0] T_303;
  wire [1:0] GEN_14;
  wire [1:0] GEN_64;
  wire [1:0] GEN_65;
  wire [1:0] GEN_66;
  wire [1:0] GEN_15;
  wire [1:0] GEN_67;
  wire [1:0] GEN_68;
  wire [1:0] GEN_69;
  wire [1:0] T_312;
  wire [1:0] T_316_0;
  wire [1:0] T_316_1;
  wire [1:0] T_316_2;
  wire [1:0] T_316_3;
  wire [1:0] T_318;
  wire [1:0] T_319;
  wire [1:0] choice;
  wire [1:0] chosen;
  wire  T_321;
  wire  T_322;
  wire  T_324;
  wire  T_325;
  wire  T_327;
  wire  T_328;
  wire  T_330;
  wire  T_331;
  wire  GEN_16_ready;
  wire  GEN_16_valid;
  wire [1:0] GEN_16_bits_resp;
  wire [31:0] GEN_16_bits_data;
  wire  GEN_16_bits_last;
  wire [11:0] GEN_16_bits_id;
  wire  GEN_16_bits_user;
  wire  GEN_70;
  wire  GEN_71;
  wire [1:0] GEN_72;
  wire [31:0] GEN_73;
  wire  GEN_74;
  wire [11:0] GEN_75;
  wire  GEN_76;
  wire  GEN_77;
  wire  GEN_78;
  wire [1:0] GEN_79;
  wire [31:0] GEN_80;
  wire  GEN_81;
  wire [11:0] GEN_82;
  wire  GEN_83;
  wire  GEN_84;
  wire  GEN_85;
  wire [1:0] GEN_86;
  wire [31:0] GEN_87;
  wire  GEN_88;
  wire [11:0] GEN_89;
  wire  GEN_90;
  wire  GEN_17_ready;
  wire  GEN_17_valid;
  wire [1:0] GEN_17_bits_resp;
  wire [31:0] GEN_17_bits_data;
  wire  GEN_17_bits_last;
  wire [11:0] GEN_17_bits_id;
  wire  GEN_17_bits_user;
  wire  GEN_18_ready;
  wire  GEN_18_valid;
  wire [1:0] GEN_18_bits_resp;
  wire [31:0] GEN_18_bits_data;
  wire  GEN_18_bits_last;
  wire [11:0] GEN_18_bits_id;
  wire  GEN_18_bits_user;
  wire  GEN_19_ready;
  wire  GEN_19_valid;
  wire [1:0] GEN_19_bits_resp;
  wire [31:0] GEN_19_bits_data;
  wire  GEN_19_bits_last;
  wire [11:0] GEN_19_bits_id;
  wire  GEN_19_bits_user;
  wire  GEN_20_ready;
  wire  GEN_20_valid;
  wire [1:0] GEN_20_bits_resp;
  wire [31:0] GEN_20_bits_data;
  wire  GEN_20_bits_last;
  wire [11:0] GEN_20_bits_id;
  wire  GEN_20_bits_user;
  wire  GEN_21_ready;
  wire  GEN_21_valid;
  wire [1:0] GEN_21_bits_resp;
  wire [31:0] GEN_21_bits_data;
  wire  GEN_21_bits_last;
  wire [11:0] GEN_21_bits_id;
  wire  GEN_21_bits_user;
  wire  T_364;
  wire  T_366;
  wire [1:0] GEN_91;
  wire  GEN_92;
  wire  GEN_93;
  wire [1:0] GEN_94;
  wire  GEN_95;
  assign io_in_0_ready = T_322;
  assign io_in_1_ready = T_325;
  assign io_in_2_ready = T_328;
  assign io_in_3_ready = T_331;
  assign io_out_valid = GEN_16_valid;
  assign io_out_bits_resp = GEN_17_bits_resp;
  assign io_out_bits_data = GEN_18_bits_data;
  assign io_out_bits_last = GEN_19_bits_last;
  assign io_out_bits_id = GEN_20_bits_id;
  assign io_out_bits_user = GEN_21_bits_user;
  assign T_217_0 = io_in_0_valid;
  assign T_217_1 = io_in_1_valid;
  assign T_217_2 = io_in_2_valid;
  assign T_217_3 = io_in_3_valid;
  assign T_220 = lockIdx + 2'h1;
  assign T_221 = T_220[1:0];
  assign T_225 = 2'h0 + T_221;
  assign T_226 = T_225[1:0];
  assign GEN_16 = {{1'd0}, T_221};
  assign T_228 = GEN_16 - 3'h4;
  assign T_229 = T_228[2:0];
  assign T_230 = T_229[1:0];
  assign GEN_0 = GEN_24;
  assign GEN_22 = 2'h1 == T_226 ? T_217_1 : T_217_0;
  assign GEN_23 = 2'h2 == T_226 ? T_217_2 : GEN_22;
  assign GEN_24 = 2'h3 == T_226 ? T_217_3 : GEN_23;
  assign GEN_1 = GEN_27;
  assign GEN_25 = 2'h1 == T_230 ? T_217_1 : T_217_0;
  assign GEN_26 = 2'h2 == T_230 ? T_217_2 : GEN_25;
  assign GEN_27 = 2'h3 == T_230 ? T_217_3 : GEN_26;
  assign T_233 = T_221 < 2'h3;
  assign T_235 = 2'h1 + T_221;
  assign T_236 = T_235[1:0];
  assign T_238 = T_221 - 2'h3;
  assign T_239 = T_238[1:0];
  assign GEN_2 = GEN_30;
  assign GEN_28 = 2'h1 == T_236 ? T_217_1 : T_217_0;
  assign GEN_29 = 2'h2 == T_236 ? T_217_2 : GEN_28;
  assign GEN_30 = 2'h3 == T_236 ? T_217_3 : GEN_29;
  assign GEN_3 = GEN_33;
  assign GEN_31 = 2'h1 == T_239 ? T_217_1 : T_217_0;
  assign GEN_32 = 2'h2 == T_239 ? T_217_2 : GEN_31;
  assign GEN_33 = 2'h3 == T_239 ? T_217_3 : GEN_32;
  assign T_240 = T_233 ? GEN_2 : GEN_3;
  assign T_242 = T_221 < 2'h2;
  assign T_244 = 2'h2 + T_221;
  assign T_245 = T_244[1:0];
  assign T_247 = T_221 - 2'h2;
  assign T_248 = T_247[1:0];
  assign GEN_4 = GEN_36;
  assign GEN_34 = 2'h1 == T_245 ? T_217_1 : T_217_0;
  assign GEN_35 = 2'h2 == T_245 ? T_217_2 : GEN_34;
  assign GEN_36 = 2'h3 == T_245 ? T_217_3 : GEN_35;
  assign GEN_5 = GEN_39;
  assign GEN_37 = 2'h1 == T_248 ? T_217_1 : T_217_0;
  assign GEN_38 = 2'h2 == T_248 ? T_217_2 : GEN_37;
  assign GEN_39 = 2'h3 == T_248 ? T_217_3 : GEN_38;
  assign T_249 = T_242 ? GEN_4 : GEN_5;
  assign T_251 = T_221 < 2'h1;
  assign T_253 = 2'h3 + T_221;
  assign T_254 = T_253[1:0];
  assign T_256 = T_221 - 2'h1;
  assign T_257 = T_256[1:0];
  assign GEN_6 = GEN_42;
  assign GEN_40 = 2'h1 == T_254 ? T_217_1 : T_217_0;
  assign GEN_41 = 2'h2 == T_254 ? T_217_2 : GEN_40;
  assign GEN_42 = 2'h3 == T_254 ? T_217_3 : GEN_41;
  assign GEN_7 = GEN_45;
  assign GEN_43 = 2'h1 == T_257 ? T_217_1 : T_217_0;
  assign GEN_44 = 2'h2 == T_257 ? T_217_2 : GEN_43;
  assign GEN_45 = 2'h3 == T_257 ? T_217_3 : GEN_44;
  assign T_258 = T_251 ? GEN_6 : GEN_7;
  assign T_262_0 = GEN_0;
  assign T_262_1 = T_240;
  assign T_262_2 = T_249;
  assign T_262_3 = T_258;
  assign T_271_0 = 2'h0;
  assign T_271_1 = 2'h1;
  assign T_271_2 = 2'h2;
  assign T_271_3 = 2'h3;
  assign GEN_8 = GEN_48;
  assign GEN_46 = 2'h1 == T_226 ? T_271_1 : T_271_0;
  assign GEN_47 = 2'h2 == T_226 ? T_271_2 : GEN_46;
  assign GEN_48 = 2'h3 == T_226 ? T_271_3 : GEN_47;
  assign GEN_9 = GEN_51;
  assign GEN_49 = 2'h1 == T_230 ? T_271_1 : T_271_0;
  assign GEN_50 = 2'h2 == T_230 ? T_271_2 : GEN_49;
  assign GEN_51 = 2'h3 == T_230 ? T_271_3 : GEN_50;
  assign GEN_10 = GEN_54;
  assign GEN_52 = 2'h1 == T_236 ? T_271_1 : T_271_0;
  assign GEN_53 = 2'h2 == T_236 ? T_271_2 : GEN_52;
  assign GEN_54 = 2'h3 == T_236 ? T_271_3 : GEN_53;
  assign GEN_11 = GEN_57;
  assign GEN_55 = 2'h1 == T_239 ? T_271_1 : T_271_0;
  assign GEN_56 = 2'h2 == T_239 ? T_271_2 : GEN_55;
  assign GEN_57 = 2'h3 == T_239 ? T_271_3 : GEN_56;
  assign T_294 = T_233 ? GEN_10 : GEN_11;
  assign GEN_12 = GEN_60;
  assign GEN_58 = 2'h1 == T_245 ? T_271_1 : T_271_0;
  assign GEN_59 = 2'h2 == T_245 ? T_271_2 : GEN_58;
  assign GEN_60 = 2'h3 == T_245 ? T_271_3 : GEN_59;
  assign GEN_13 = GEN_63;
  assign GEN_61 = 2'h1 == T_248 ? T_271_1 : T_271_0;
  assign GEN_62 = 2'h2 == T_248 ? T_271_2 : GEN_61;
  assign GEN_63 = 2'h3 == T_248 ? T_271_3 : GEN_62;
  assign T_303 = T_242 ? GEN_12 : GEN_13;
  assign GEN_14 = GEN_66;
  assign GEN_64 = 2'h1 == T_254 ? T_271_1 : T_271_0;
  assign GEN_65 = 2'h2 == T_254 ? T_271_2 : GEN_64;
  assign GEN_66 = 2'h3 == T_254 ? T_271_3 : GEN_65;
  assign GEN_15 = GEN_69;
  assign GEN_67 = 2'h1 == T_257 ? T_271_1 : T_271_0;
  assign GEN_68 = 2'h2 == T_257 ? T_271_2 : GEN_67;
  assign GEN_69 = 2'h3 == T_257 ? T_271_3 : GEN_68;
  assign T_312 = T_251 ? GEN_14 : GEN_15;
  assign T_316_0 = GEN_8;
  assign T_316_1 = T_294;
  assign T_316_2 = T_303;
  assign T_316_3 = T_312;
  assign T_318 = T_262_2 ? T_316_2 : T_316_3;
  assign T_319 = T_262_1 ? T_316_1 : T_318;
  assign choice = T_262_0 ? T_316_0 : T_319;
  assign chosen = locked ? lockIdx : choice;
  assign T_321 = chosen == 2'h0;
  assign T_322 = io_out_ready & T_321;
  assign T_324 = chosen == 2'h1;
  assign T_325 = io_out_ready & T_324;
  assign T_327 = chosen == 2'h2;
  assign T_328 = io_out_ready & T_327;
  assign T_330 = chosen == 2'h3;
  assign T_331 = io_out_ready & T_330;
  assign GEN_16_ready = GEN_84;
  assign GEN_16_valid = GEN_85;
  assign GEN_16_bits_resp = GEN_86;
  assign GEN_16_bits_data = GEN_87;
  assign GEN_16_bits_last = GEN_88;
  assign GEN_16_bits_id = GEN_89;
  assign GEN_16_bits_user = GEN_90;
  assign GEN_70 = 2'h1 == chosen ? io_in_1_ready : io_in_0_ready;
  assign GEN_71 = 2'h1 == chosen ? io_in_1_valid : io_in_0_valid;
  assign GEN_72 = 2'h1 == chosen ? io_in_1_bits_resp : io_in_0_bits_resp;
  assign GEN_73 = 2'h1 == chosen ? io_in_1_bits_data : io_in_0_bits_data;
  assign GEN_74 = 2'h1 == chosen ? io_in_1_bits_last : io_in_0_bits_last;
  assign GEN_75 = 2'h1 == chosen ? io_in_1_bits_id : io_in_0_bits_id;
  assign GEN_76 = 2'h1 == chosen ? io_in_1_bits_user : io_in_0_bits_user;
  assign GEN_77 = 2'h2 == chosen ? io_in_2_ready : GEN_70;
  assign GEN_78 = 2'h2 == chosen ? io_in_2_valid : GEN_71;
  assign GEN_79 = 2'h2 == chosen ? io_in_2_bits_resp : GEN_72;
  assign GEN_80 = 2'h2 == chosen ? io_in_2_bits_data : GEN_73;
  assign GEN_81 = 2'h2 == chosen ? io_in_2_bits_last : GEN_74;
  assign GEN_82 = 2'h2 == chosen ? io_in_2_bits_id : GEN_75;
  assign GEN_83 = 2'h2 == chosen ? io_in_2_bits_user : GEN_76;
  assign GEN_84 = 2'h3 == chosen ? io_in_3_ready : GEN_77;
  assign GEN_85 = 2'h3 == chosen ? io_in_3_valid : GEN_78;
  assign GEN_86 = 2'h3 == chosen ? io_in_3_bits_resp : GEN_79;
  assign GEN_87 = 2'h3 == chosen ? io_in_3_bits_data : GEN_80;
  assign GEN_88 = 2'h3 == chosen ? io_in_3_bits_last : GEN_81;
  assign GEN_89 = 2'h3 == chosen ? io_in_3_bits_id : GEN_82;
  assign GEN_90 = 2'h3 == chosen ? io_in_3_bits_user : GEN_83;
  assign GEN_17_ready = GEN_84;
  assign GEN_17_valid = GEN_85;
  assign GEN_17_bits_resp = GEN_86;
  assign GEN_17_bits_data = GEN_87;
  assign GEN_17_bits_last = GEN_88;
  assign GEN_17_bits_id = GEN_89;
  assign GEN_17_bits_user = GEN_90;
  assign GEN_18_ready = GEN_84;
  assign GEN_18_valid = GEN_85;
  assign GEN_18_bits_resp = GEN_86;
  assign GEN_18_bits_data = GEN_87;
  assign GEN_18_bits_last = GEN_88;
  assign GEN_18_bits_id = GEN_89;
  assign GEN_18_bits_user = GEN_90;
  assign GEN_19_ready = GEN_84;
  assign GEN_19_valid = GEN_85;
  assign GEN_19_bits_resp = GEN_86;
  assign GEN_19_bits_data = GEN_87;
  assign GEN_19_bits_last = GEN_88;
  assign GEN_19_bits_id = GEN_89;
  assign GEN_19_bits_user = GEN_90;
  assign GEN_20_ready = GEN_84;
  assign GEN_20_valid = GEN_85;
  assign GEN_20_bits_resp = GEN_86;
  assign GEN_20_bits_data = GEN_87;
  assign GEN_20_bits_last = GEN_88;
  assign GEN_20_bits_id = GEN_89;
  assign GEN_20_bits_user = GEN_90;
  assign GEN_21_ready = GEN_84;
  assign GEN_21_valid = GEN_85;
  assign GEN_21_bits_resp = GEN_86;
  assign GEN_21_bits_data = GEN_87;
  assign GEN_21_bits_last = GEN_88;
  assign GEN_21_bits_id = GEN_89;
  assign GEN_21_bits_user = GEN_90;
  assign T_364 = io_out_ready & io_out_valid;
  assign T_366 = locked == 1'h0;
  assign GEN_91 = T_366 ? choice : lockIdx;
  assign GEN_92 = T_366 ? 1'h1 : locked;
  assign GEN_93 = io_out_bits_last ? 1'h0 : GEN_92;
  assign GEN_94 = T_364 ? GEN_91 : lockIdx;
  assign GEN_95 = T_364 ? GEN_93 : locked;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_17 = {1{$random}};
  lockIdx = GEN_17[1:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_18 = {1{$random}};
  locked = GEN_18[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      lockIdx <= 2'h0;
    end else begin
      if (T_364) begin
        if (T_366) begin
          if (T_262_0) begin
            lockIdx <= T_316_0;
          end else begin
            if (T_262_1) begin
              lockIdx <= T_316_1;
            end else begin
              if (T_262_2) begin
                lockIdx <= T_316_2;
              end else begin
                lockIdx <= T_316_3;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      locked <= 1'h0;
    end else begin
      if (T_364) begin
        if (io_out_bits_last) begin
          locked <= 1'h0;
        end else begin
          if (T_366) begin
            locked <= 1'h1;
          end
        end
      end
    end
  end
endmodule
module NastiRouter(
  input   clock,
  input   reset,
  output  io_master_aw_ready,
  input   io_master_aw_valid,
  input  [31:0] io_master_aw_bits_addr,
  input  [7:0] io_master_aw_bits_len,
  input  [2:0] io_master_aw_bits_size,
  input  [1:0] io_master_aw_bits_burst,
  input   io_master_aw_bits_lock,
  input  [3:0] io_master_aw_bits_cache,
  input  [2:0] io_master_aw_bits_prot,
  input  [3:0] io_master_aw_bits_qos,
  input  [3:0] io_master_aw_bits_region,
  input  [11:0] io_master_aw_bits_id,
  input   io_master_aw_bits_user,
  output  io_master_w_ready,
  input   io_master_w_valid,
  input  [31:0] io_master_w_bits_data,
  input   io_master_w_bits_last,
  input  [11:0] io_master_w_bits_id,
  input  [3:0] io_master_w_bits_strb,
  input   io_master_w_bits_user,
  input   io_master_b_ready,
  output  io_master_b_valid,
  output [1:0] io_master_b_bits_resp,
  output [11:0] io_master_b_bits_id,
  output  io_master_b_bits_user,
  output  io_master_ar_ready,
  input   io_master_ar_valid,
  input  [31:0] io_master_ar_bits_addr,
  input  [7:0] io_master_ar_bits_len,
  input  [2:0] io_master_ar_bits_size,
  input  [1:0] io_master_ar_bits_burst,
  input   io_master_ar_bits_lock,
  input  [3:0] io_master_ar_bits_cache,
  input  [2:0] io_master_ar_bits_prot,
  input  [3:0] io_master_ar_bits_qos,
  input  [3:0] io_master_ar_bits_region,
  input  [11:0] io_master_ar_bits_id,
  input   io_master_ar_bits_user,
  input   io_master_r_ready,
  output  io_master_r_valid,
  output [1:0] io_master_r_bits_resp,
  output [31:0] io_master_r_bits_data,
  output  io_master_r_bits_last,
  output [11:0] io_master_r_bits_id,
  output  io_master_r_bits_user,
  input   io_slave_0_aw_ready,
  output  io_slave_0_aw_valid,
  output [31:0] io_slave_0_aw_bits_addr,
  output [7:0] io_slave_0_aw_bits_len,
  output [2:0] io_slave_0_aw_bits_size,
  output [1:0] io_slave_0_aw_bits_burst,
  output  io_slave_0_aw_bits_lock,
  output [3:0] io_slave_0_aw_bits_cache,
  output [2:0] io_slave_0_aw_bits_prot,
  output [3:0] io_slave_0_aw_bits_qos,
  output [3:0] io_slave_0_aw_bits_region,
  output [11:0] io_slave_0_aw_bits_id,
  output  io_slave_0_aw_bits_user,
  input   io_slave_0_w_ready,
  output  io_slave_0_w_valid,
  output [31:0] io_slave_0_w_bits_data,
  output  io_slave_0_w_bits_last,
  output [11:0] io_slave_0_w_bits_id,
  output [3:0] io_slave_0_w_bits_strb,
  output  io_slave_0_w_bits_user,
  output  io_slave_0_b_ready,
  input   io_slave_0_b_valid,
  input  [1:0] io_slave_0_b_bits_resp,
  input  [11:0] io_slave_0_b_bits_id,
  input   io_slave_0_b_bits_user,
  input   io_slave_0_ar_ready,
  output  io_slave_0_ar_valid,
  output [31:0] io_slave_0_ar_bits_addr,
  output [7:0] io_slave_0_ar_bits_len,
  output [2:0] io_slave_0_ar_bits_size,
  output [1:0] io_slave_0_ar_bits_burst,
  output  io_slave_0_ar_bits_lock,
  output [3:0] io_slave_0_ar_bits_cache,
  output [2:0] io_slave_0_ar_bits_prot,
  output [3:0] io_slave_0_ar_bits_qos,
  output [3:0] io_slave_0_ar_bits_region,
  output [11:0] io_slave_0_ar_bits_id,
  output  io_slave_0_ar_bits_user,
  output  io_slave_0_r_ready,
  input   io_slave_0_r_valid,
  input  [1:0] io_slave_0_r_bits_resp,
  input  [31:0] io_slave_0_r_bits_data,
  input   io_slave_0_r_bits_last,
  input  [11:0] io_slave_0_r_bits_id,
  input   io_slave_0_r_bits_user,
  input   io_slave_1_aw_ready,
  output  io_slave_1_aw_valid,
  output [31:0] io_slave_1_aw_bits_addr,
  output [7:0] io_slave_1_aw_bits_len,
  output [2:0] io_slave_1_aw_bits_size,
  output [1:0] io_slave_1_aw_bits_burst,
  output  io_slave_1_aw_bits_lock,
  output [3:0] io_slave_1_aw_bits_cache,
  output [2:0] io_slave_1_aw_bits_prot,
  output [3:0] io_slave_1_aw_bits_qos,
  output [3:0] io_slave_1_aw_bits_region,
  output [11:0] io_slave_1_aw_bits_id,
  output  io_slave_1_aw_bits_user,
  input   io_slave_1_w_ready,
  output  io_slave_1_w_valid,
  output [31:0] io_slave_1_w_bits_data,
  output  io_slave_1_w_bits_last,
  output [11:0] io_slave_1_w_bits_id,
  output [3:0] io_slave_1_w_bits_strb,
  output  io_slave_1_w_bits_user,
  output  io_slave_1_b_ready,
  input   io_slave_1_b_valid,
  input  [1:0] io_slave_1_b_bits_resp,
  input  [11:0] io_slave_1_b_bits_id,
  input   io_slave_1_b_bits_user,
  input   io_slave_1_ar_ready,
  output  io_slave_1_ar_valid,
  output [31:0] io_slave_1_ar_bits_addr,
  output [7:0] io_slave_1_ar_bits_len,
  output [2:0] io_slave_1_ar_bits_size,
  output [1:0] io_slave_1_ar_bits_burst,
  output  io_slave_1_ar_bits_lock,
  output [3:0] io_slave_1_ar_bits_cache,
  output [2:0] io_slave_1_ar_bits_prot,
  output [3:0] io_slave_1_ar_bits_qos,
  output [3:0] io_slave_1_ar_bits_region,
  output [11:0] io_slave_1_ar_bits_id,
  output  io_slave_1_ar_bits_user,
  output  io_slave_1_r_ready,
  input   io_slave_1_r_valid,
  input  [1:0] io_slave_1_r_bits_resp,
  input  [31:0] io_slave_1_r_bits_data,
  input   io_slave_1_r_bits_last,
  input  [11:0] io_slave_1_r_bits_id,
  input   io_slave_1_r_bits_user,
  input   io_slave_2_aw_ready,
  output  io_slave_2_aw_valid,
  output [31:0] io_slave_2_aw_bits_addr,
  output [7:0] io_slave_2_aw_bits_len,
  output [2:0] io_slave_2_aw_bits_size,
  output [1:0] io_slave_2_aw_bits_burst,
  output  io_slave_2_aw_bits_lock,
  output [3:0] io_slave_2_aw_bits_cache,
  output [2:0] io_slave_2_aw_bits_prot,
  output [3:0] io_slave_2_aw_bits_qos,
  output [3:0] io_slave_2_aw_bits_region,
  output [11:0] io_slave_2_aw_bits_id,
  output  io_slave_2_aw_bits_user,
  input   io_slave_2_w_ready,
  output  io_slave_2_w_valid,
  output [31:0] io_slave_2_w_bits_data,
  output  io_slave_2_w_bits_last,
  output [11:0] io_slave_2_w_bits_id,
  output [3:0] io_slave_2_w_bits_strb,
  output  io_slave_2_w_bits_user,
  output  io_slave_2_b_ready,
  input   io_slave_2_b_valid,
  input  [1:0] io_slave_2_b_bits_resp,
  input  [11:0] io_slave_2_b_bits_id,
  input   io_slave_2_b_bits_user,
  input   io_slave_2_ar_ready,
  output  io_slave_2_ar_valid,
  output [31:0] io_slave_2_ar_bits_addr,
  output [7:0] io_slave_2_ar_bits_len,
  output [2:0] io_slave_2_ar_bits_size,
  output [1:0] io_slave_2_ar_bits_burst,
  output  io_slave_2_ar_bits_lock,
  output [3:0] io_slave_2_ar_bits_cache,
  output [2:0] io_slave_2_ar_bits_prot,
  output [3:0] io_slave_2_ar_bits_qos,
  output [3:0] io_slave_2_ar_bits_region,
  output [11:0] io_slave_2_ar_bits_id,
  output  io_slave_2_ar_bits_user,
  output  io_slave_2_r_ready,
  input   io_slave_2_r_valid,
  input  [1:0] io_slave_2_r_bits_resp,
  input  [31:0] io_slave_2_r_bits_data,
  input   io_slave_2_r_bits_last,
  input  [11:0] io_slave_2_r_bits_id,
  input   io_slave_2_r_bits_user
);
  wire  T_1235;
  wire  T_1238;
  wire  T_1240;
  wire  T_1241;
  wire  T_1243;
  wire  T_1245;
  wire  T_1246;
  wire [1:0] T_1247;
  wire [2:0] ar_route;
  wire  T_1251;
  wire  T_1254;
  wire  T_1256;
  wire  T_1257;
  wire  T_1259;
  wire  T_1261;
  wire  T_1262;
  wire [1:0] T_1263;
  wire [2:0] aw_route;
  wire  T_1267;
  wire  T_1268;
  wire  T_1270;
  wire  T_1272;
  wire  T_1273;
  wire  T_1275;
  reg  T_1278;
  reg [31:0] GEN_6;
  wire  T_1279;
  wire  T_1280;
  wire  GEN_0;
  wire  T_1282;
  wire  GEN_1;
  wire  T_1284;
  wire  T_1285;
  wire  T_1287;
  wire  T_1288;
  wire  T_1290;
  wire  T_1291;
  wire  T_1292;
  wire  T_1293;
  wire  T_1295;
  wire  T_1296;
  reg  T_1298;
  reg [31:0] GEN_7;
  wire  T_1299;
  wire  T_1300;
  wire  GEN_2;
  wire  T_1302;
  wire  GEN_3;
  wire  T_1304;
  wire  T_1305;
  wire  T_1306;
  wire  T_1307;
  wire  T_1308;
  wire  T_1310;
  wire  ar_ready;
  wire  T_1311;
  wire  T_1312;
  wire  T_1314;
  wire  aw_ready;
  reg  T_1316;
  reg [31:0] GEN_8;
  wire  T_1317;
  wire  T_1318;
  wire  GEN_4;
  wire  T_1320;
  wire  GEN_5;
  wire  T_1322;
  wire  T_1323;
  wire  w_ready;
  wire  T_1325;
  wire  r_invalid;
  wire  T_1328;
  wire  w_invalid;
  wire  err_slave_clock;
  wire  err_slave_reset;
  wire  err_slave_io_aw_ready;
  wire  err_slave_io_aw_valid;
  wire [31:0] err_slave_io_aw_bits_addr;
  wire [7:0] err_slave_io_aw_bits_len;
  wire [2:0] err_slave_io_aw_bits_size;
  wire [1:0] err_slave_io_aw_bits_burst;
  wire  err_slave_io_aw_bits_lock;
  wire [3:0] err_slave_io_aw_bits_cache;
  wire [2:0] err_slave_io_aw_bits_prot;
  wire [3:0] err_slave_io_aw_bits_qos;
  wire [3:0] err_slave_io_aw_bits_region;
  wire [11:0] err_slave_io_aw_bits_id;
  wire  err_slave_io_aw_bits_user;
  wire  err_slave_io_w_ready;
  wire  err_slave_io_w_valid;
  wire [31:0] err_slave_io_w_bits_data;
  wire  err_slave_io_w_bits_last;
  wire [11:0] err_slave_io_w_bits_id;
  wire [3:0] err_slave_io_w_bits_strb;
  wire  err_slave_io_w_bits_user;
  wire  err_slave_io_b_ready;
  wire  err_slave_io_b_valid;
  wire [1:0] err_slave_io_b_bits_resp;
  wire [11:0] err_slave_io_b_bits_id;
  wire  err_slave_io_b_bits_user;
  wire  err_slave_io_ar_ready;
  wire  err_slave_io_ar_valid;
  wire [31:0] err_slave_io_ar_bits_addr;
  wire [7:0] err_slave_io_ar_bits_len;
  wire [2:0] err_slave_io_ar_bits_size;
  wire [1:0] err_slave_io_ar_bits_burst;
  wire  err_slave_io_ar_bits_lock;
  wire [3:0] err_slave_io_ar_bits_cache;
  wire [2:0] err_slave_io_ar_bits_prot;
  wire [3:0] err_slave_io_ar_bits_qos;
  wire [3:0] err_slave_io_ar_bits_region;
  wire [11:0] err_slave_io_ar_bits_id;
  wire  err_slave_io_ar_bits_user;
  wire  err_slave_io_r_ready;
  wire  err_slave_io_r_valid;
  wire [1:0] err_slave_io_r_bits_resp;
  wire [31:0] err_slave_io_r_bits_data;
  wire  err_slave_io_r_bits_last;
  wire [11:0] err_slave_io_r_bits_id;
  wire  err_slave_io_r_bits_user;
  wire  T_1330;
  wire  T_1331;
  wire  T_1332;
  wire  T_1333;
  wire  T_1334;
  wire  T_1335;
  wire  T_1336;
  wire  b_arb_clock;
  wire  b_arb_reset;
  wire  b_arb_io_in_0_ready;
  wire  b_arb_io_in_0_valid;
  wire [1:0] b_arb_io_in_0_bits_resp;
  wire [11:0] b_arb_io_in_0_bits_id;
  wire  b_arb_io_in_0_bits_user;
  wire  b_arb_io_in_1_ready;
  wire  b_arb_io_in_1_valid;
  wire [1:0] b_arb_io_in_1_bits_resp;
  wire [11:0] b_arb_io_in_1_bits_id;
  wire  b_arb_io_in_1_bits_user;
  wire  b_arb_io_in_2_ready;
  wire  b_arb_io_in_2_valid;
  wire [1:0] b_arb_io_in_2_bits_resp;
  wire [11:0] b_arb_io_in_2_bits_id;
  wire  b_arb_io_in_2_bits_user;
  wire  b_arb_io_in_3_ready;
  wire  b_arb_io_in_3_valid;
  wire [1:0] b_arb_io_in_3_bits_resp;
  wire [11:0] b_arb_io_in_3_bits_id;
  wire  b_arb_io_in_3_bits_user;
  wire  b_arb_io_out_ready;
  wire  b_arb_io_out_valid;
  wire [1:0] b_arb_io_out_bits_resp;
  wire [11:0] b_arb_io_out_bits_id;
  wire  b_arb_io_out_bits_user;
  wire [1:0] b_arb_io_chosen;
  wire  r_arb_clock;
  wire  r_arb_reset;
  wire  r_arb_io_in_0_ready;
  wire  r_arb_io_in_0_valid;
  wire [1:0] r_arb_io_in_0_bits_resp;
  wire [31:0] r_arb_io_in_0_bits_data;
  wire  r_arb_io_in_0_bits_last;
  wire [11:0] r_arb_io_in_0_bits_id;
  wire  r_arb_io_in_0_bits_user;
  wire  r_arb_io_in_1_ready;
  wire  r_arb_io_in_1_valid;
  wire [1:0] r_arb_io_in_1_bits_resp;
  wire [31:0] r_arb_io_in_1_bits_data;
  wire  r_arb_io_in_1_bits_last;
  wire [11:0] r_arb_io_in_1_bits_id;
  wire  r_arb_io_in_1_bits_user;
  wire  r_arb_io_in_2_ready;
  wire  r_arb_io_in_2_valid;
  wire [1:0] r_arb_io_in_2_bits_resp;
  wire [31:0] r_arb_io_in_2_bits_data;
  wire  r_arb_io_in_2_bits_last;
  wire [11:0] r_arb_io_in_2_bits_id;
  wire  r_arb_io_in_2_bits_user;
  wire  r_arb_io_in_3_ready;
  wire  r_arb_io_in_3_valid;
  wire [1:0] r_arb_io_in_3_bits_resp;
  wire [31:0] r_arb_io_in_3_bits_data;
  wire  r_arb_io_in_3_bits_last;
  wire [11:0] r_arb_io_in_3_bits_id;
  wire  r_arb_io_in_3_bits_user;
  wire  r_arb_io_out_ready;
  wire  r_arb_io_out_valid;
  wire [1:0] r_arb_io_out_bits_resp;
  wire [31:0] r_arb_io_out_bits_data;
  wire  r_arb_io_out_bits_last;
  wire [11:0] r_arb_io_out_bits_id;
  wire  r_arb_io_out_bits_user;
  NastiErrorSlave err_slave (
    .clock(err_slave_clock),
    .reset(err_slave_reset),
    .io_aw_ready(err_slave_io_aw_ready),
    .io_aw_valid(err_slave_io_aw_valid),
    .io_aw_bits_addr(err_slave_io_aw_bits_addr),
    .io_aw_bits_len(err_slave_io_aw_bits_len),
    .io_aw_bits_size(err_slave_io_aw_bits_size),
    .io_aw_bits_burst(err_slave_io_aw_bits_burst),
    .io_aw_bits_lock(err_slave_io_aw_bits_lock),
    .io_aw_bits_cache(err_slave_io_aw_bits_cache),
    .io_aw_bits_prot(err_slave_io_aw_bits_prot),
    .io_aw_bits_qos(err_slave_io_aw_bits_qos),
    .io_aw_bits_region(err_slave_io_aw_bits_region),
    .io_aw_bits_id(err_slave_io_aw_bits_id),
    .io_aw_bits_user(err_slave_io_aw_bits_user),
    .io_w_ready(err_slave_io_w_ready),
    .io_w_valid(err_slave_io_w_valid),
    .io_w_bits_data(err_slave_io_w_bits_data),
    .io_w_bits_last(err_slave_io_w_bits_last),
    .io_w_bits_id(err_slave_io_w_bits_id),
    .io_w_bits_strb(err_slave_io_w_bits_strb),
    .io_w_bits_user(err_slave_io_w_bits_user),
    .io_b_ready(err_slave_io_b_ready),
    .io_b_valid(err_slave_io_b_valid),
    .io_b_bits_resp(err_slave_io_b_bits_resp),
    .io_b_bits_id(err_slave_io_b_bits_id),
    .io_b_bits_user(err_slave_io_b_bits_user),
    .io_ar_ready(err_slave_io_ar_ready),
    .io_ar_valid(err_slave_io_ar_valid),
    .io_ar_bits_addr(err_slave_io_ar_bits_addr),
    .io_ar_bits_len(err_slave_io_ar_bits_len),
    .io_ar_bits_size(err_slave_io_ar_bits_size),
    .io_ar_bits_burst(err_slave_io_ar_bits_burst),
    .io_ar_bits_lock(err_slave_io_ar_bits_lock),
    .io_ar_bits_cache(err_slave_io_ar_bits_cache),
    .io_ar_bits_prot(err_slave_io_ar_bits_prot),
    .io_ar_bits_qos(err_slave_io_ar_bits_qos),
    .io_ar_bits_region(err_slave_io_ar_bits_region),
    .io_ar_bits_id(err_slave_io_ar_bits_id),
    .io_ar_bits_user(err_slave_io_ar_bits_user),
    .io_r_ready(err_slave_io_r_ready),
    .io_r_valid(err_slave_io_r_valid),
    .io_r_bits_resp(err_slave_io_r_bits_resp),
    .io_r_bits_data(err_slave_io_r_bits_data),
    .io_r_bits_last(err_slave_io_r_bits_last),
    .io_r_bits_id(err_slave_io_r_bits_id),
    .io_r_bits_user(err_slave_io_r_bits_user)
  );
  RRArbiter b_arb (
    .clock(b_arb_clock),
    .reset(b_arb_reset),
    .io_in_0_ready(b_arb_io_in_0_ready),
    .io_in_0_valid(b_arb_io_in_0_valid),
    .io_in_0_bits_resp(b_arb_io_in_0_bits_resp),
    .io_in_0_bits_id(b_arb_io_in_0_bits_id),
    .io_in_0_bits_user(b_arb_io_in_0_bits_user),
    .io_in_1_ready(b_arb_io_in_1_ready),
    .io_in_1_valid(b_arb_io_in_1_valid),
    .io_in_1_bits_resp(b_arb_io_in_1_bits_resp),
    .io_in_1_bits_id(b_arb_io_in_1_bits_id),
    .io_in_1_bits_user(b_arb_io_in_1_bits_user),
    .io_in_2_ready(b_arb_io_in_2_ready),
    .io_in_2_valid(b_arb_io_in_2_valid),
    .io_in_2_bits_resp(b_arb_io_in_2_bits_resp),
    .io_in_2_bits_id(b_arb_io_in_2_bits_id),
    .io_in_2_bits_user(b_arb_io_in_2_bits_user),
    .io_in_3_ready(b_arb_io_in_3_ready),
    .io_in_3_valid(b_arb_io_in_3_valid),
    .io_in_3_bits_resp(b_arb_io_in_3_bits_resp),
    .io_in_3_bits_id(b_arb_io_in_3_bits_id),
    .io_in_3_bits_user(b_arb_io_in_3_bits_user),
    .io_out_ready(b_arb_io_out_ready),
    .io_out_valid(b_arb_io_out_valid),
    .io_out_bits_resp(b_arb_io_out_bits_resp),
    .io_out_bits_id(b_arb_io_out_bits_id),
    .io_out_bits_user(b_arb_io_out_bits_user),
    .io_chosen(b_arb_io_chosen)
  );
  JunctionsPeekingArbiter r_arb (
    .clock(r_arb_clock),
    .reset(r_arb_reset),
    .io_in_0_ready(r_arb_io_in_0_ready),
    .io_in_0_valid(r_arb_io_in_0_valid),
    .io_in_0_bits_resp(r_arb_io_in_0_bits_resp),
    .io_in_0_bits_data(r_arb_io_in_0_bits_data),
    .io_in_0_bits_last(r_arb_io_in_0_bits_last),
    .io_in_0_bits_id(r_arb_io_in_0_bits_id),
    .io_in_0_bits_user(r_arb_io_in_0_bits_user),
    .io_in_1_ready(r_arb_io_in_1_ready),
    .io_in_1_valid(r_arb_io_in_1_valid),
    .io_in_1_bits_resp(r_arb_io_in_1_bits_resp),
    .io_in_1_bits_data(r_arb_io_in_1_bits_data),
    .io_in_1_bits_last(r_arb_io_in_1_bits_last),
    .io_in_1_bits_id(r_arb_io_in_1_bits_id),
    .io_in_1_bits_user(r_arb_io_in_1_bits_user),
    .io_in_2_ready(r_arb_io_in_2_ready),
    .io_in_2_valid(r_arb_io_in_2_valid),
    .io_in_2_bits_resp(r_arb_io_in_2_bits_resp),
    .io_in_2_bits_data(r_arb_io_in_2_bits_data),
    .io_in_2_bits_last(r_arb_io_in_2_bits_last),
    .io_in_2_bits_id(r_arb_io_in_2_bits_id),
    .io_in_2_bits_user(r_arb_io_in_2_bits_user),
    .io_in_3_ready(r_arb_io_in_3_ready),
    .io_in_3_valid(r_arb_io_in_3_valid),
    .io_in_3_bits_resp(r_arb_io_in_3_bits_resp),
    .io_in_3_bits_data(r_arb_io_in_3_bits_data),
    .io_in_3_bits_last(r_arb_io_in_3_bits_last),
    .io_in_3_bits_id(r_arb_io_in_3_bits_id),
    .io_in_3_bits_user(r_arb_io_in_3_bits_user),
    .io_out_ready(r_arb_io_out_ready),
    .io_out_valid(r_arb_io_out_valid),
    .io_out_bits_resp(r_arb_io_out_bits_resp),
    .io_out_bits_data(r_arb_io_out_bits_data),
    .io_out_bits_last(r_arb_io_out_bits_last),
    .io_out_bits_id(r_arb_io_out_bits_id),
    .io_out_bits_user(r_arb_io_out_bits_user)
  );
  assign io_master_aw_ready = T_1335;
  assign io_master_w_ready = T_1336;
  assign io_master_b_valid = b_arb_io_out_valid;
  assign io_master_b_bits_resp = b_arb_io_out_bits_resp;
  assign io_master_b_bits_id = b_arb_io_out_bits_id;
  assign io_master_b_bits_user = b_arb_io_out_bits_user;
  assign io_master_ar_ready = T_1333;
  assign io_master_r_valid = r_arb_io_out_valid;
  assign io_master_r_bits_resp = r_arb_io_out_bits_resp;
  assign io_master_r_bits_data = r_arb_io_out_bits_data;
  assign io_master_r_bits_last = r_arb_io_out_bits_last;
  assign io_master_r_bits_id = r_arb_io_out_bits_id;
  assign io_master_r_bits_user = r_arb_io_out_bits_user;
  assign io_slave_0_aw_valid = T_1273;
  assign io_slave_0_aw_bits_addr = io_master_aw_bits_addr;
  assign io_slave_0_aw_bits_len = io_master_aw_bits_len;
  assign io_slave_0_aw_bits_size = io_master_aw_bits_size;
  assign io_slave_0_aw_bits_burst = io_master_aw_bits_burst;
  assign io_slave_0_aw_bits_lock = io_master_aw_bits_lock;
  assign io_slave_0_aw_bits_cache = io_master_aw_bits_cache;
  assign io_slave_0_aw_bits_prot = io_master_aw_bits_prot;
  assign io_slave_0_aw_bits_qos = io_master_aw_bits_qos;
  assign io_slave_0_aw_bits_region = io_master_aw_bits_region;
  assign io_slave_0_aw_bits_id = io_master_aw_bits_id;
  assign io_slave_0_aw_bits_user = io_master_aw_bits_user;
  assign io_slave_0_w_valid = T_1284;
  assign io_slave_0_w_bits_data = io_master_w_bits_data;
  assign io_slave_0_w_bits_last = io_master_w_bits_last;
  assign io_slave_0_w_bits_id = io_master_w_bits_id;
  assign io_slave_0_w_bits_strb = io_master_w_bits_strb;
  assign io_slave_0_w_bits_user = io_master_w_bits_user;
  assign io_slave_0_b_ready = b_arb_io_in_0_ready;
  assign io_slave_0_ar_valid = T_1268;
  assign io_slave_0_ar_bits_addr = io_master_ar_bits_addr;
  assign io_slave_0_ar_bits_len = io_master_ar_bits_len;
  assign io_slave_0_ar_bits_size = io_master_ar_bits_size;
  assign io_slave_0_ar_bits_burst = io_master_ar_bits_burst;
  assign io_slave_0_ar_bits_lock = io_master_ar_bits_lock;
  assign io_slave_0_ar_bits_cache = io_master_ar_bits_cache;
  assign io_slave_0_ar_bits_prot = io_master_ar_bits_prot;
  assign io_slave_0_ar_bits_qos = io_master_ar_bits_qos;
  assign io_slave_0_ar_bits_region = io_master_ar_bits_region;
  assign io_slave_0_ar_bits_id = io_master_ar_bits_id;
  assign io_slave_0_ar_bits_user = io_master_ar_bits_user;
  assign io_slave_0_r_ready = r_arb_io_in_0_ready;
  assign io_slave_1_aw_valid = T_1293;
  assign io_slave_1_aw_bits_addr = io_master_aw_bits_addr;
  assign io_slave_1_aw_bits_len = io_master_aw_bits_len;
  assign io_slave_1_aw_bits_size = io_master_aw_bits_size;
  assign io_slave_1_aw_bits_burst = io_master_aw_bits_burst;
  assign io_slave_1_aw_bits_lock = io_master_aw_bits_lock;
  assign io_slave_1_aw_bits_cache = io_master_aw_bits_cache;
  assign io_slave_1_aw_bits_prot = io_master_aw_bits_prot;
  assign io_slave_1_aw_bits_qos = io_master_aw_bits_qos;
  assign io_slave_1_aw_bits_region = io_master_aw_bits_region;
  assign io_slave_1_aw_bits_id = io_master_aw_bits_id;
  assign io_slave_1_aw_bits_user = io_master_aw_bits_user;
  assign io_slave_1_w_valid = T_1304;
  assign io_slave_1_w_bits_data = io_master_w_bits_data;
  assign io_slave_1_w_bits_last = io_master_w_bits_last;
  assign io_slave_1_w_bits_id = io_master_w_bits_id;
  assign io_slave_1_w_bits_strb = io_master_w_bits_strb;
  assign io_slave_1_w_bits_user = io_master_w_bits_user;
  assign io_slave_1_b_ready = b_arb_io_in_1_ready;
  assign io_slave_1_ar_valid = T_1288;
  assign io_slave_1_ar_bits_addr = io_master_ar_bits_addr;
  assign io_slave_1_ar_bits_len = io_master_ar_bits_len;
  assign io_slave_1_ar_bits_size = io_master_ar_bits_size;
  assign io_slave_1_ar_bits_burst = io_master_ar_bits_burst;
  assign io_slave_1_ar_bits_lock = io_master_ar_bits_lock;
  assign io_slave_1_ar_bits_cache = io_master_ar_bits_cache;
  assign io_slave_1_ar_bits_prot = io_master_ar_bits_prot;
  assign io_slave_1_ar_bits_qos = io_master_ar_bits_qos;
  assign io_slave_1_ar_bits_region = io_master_ar_bits_region;
  assign io_slave_1_ar_bits_id = io_master_ar_bits_id;
  assign io_slave_1_ar_bits_user = io_master_ar_bits_user;
  assign io_slave_1_r_ready = r_arb_io_in_1_ready;
  assign io_slave_2_aw_valid = T_1312;
  assign io_slave_2_aw_bits_addr = io_master_aw_bits_addr;
  assign io_slave_2_aw_bits_len = io_master_aw_bits_len;
  assign io_slave_2_aw_bits_size = io_master_aw_bits_size;
  assign io_slave_2_aw_bits_burst = io_master_aw_bits_burst;
  assign io_slave_2_aw_bits_lock = io_master_aw_bits_lock;
  assign io_slave_2_aw_bits_cache = io_master_aw_bits_cache;
  assign io_slave_2_aw_bits_prot = io_master_aw_bits_prot;
  assign io_slave_2_aw_bits_qos = io_master_aw_bits_qos;
  assign io_slave_2_aw_bits_region = io_master_aw_bits_region;
  assign io_slave_2_aw_bits_id = io_master_aw_bits_id;
  assign io_slave_2_aw_bits_user = io_master_aw_bits_user;
  assign io_slave_2_w_valid = T_1322;
  assign io_slave_2_w_bits_data = io_master_w_bits_data;
  assign io_slave_2_w_bits_last = io_master_w_bits_last;
  assign io_slave_2_w_bits_id = io_master_w_bits_id;
  assign io_slave_2_w_bits_strb = io_master_w_bits_strb;
  assign io_slave_2_w_bits_user = io_master_w_bits_user;
  assign io_slave_2_b_ready = b_arb_io_in_2_ready;
  assign io_slave_2_ar_valid = T_1308;
  assign io_slave_2_ar_bits_addr = io_master_ar_bits_addr;
  assign io_slave_2_ar_bits_len = io_master_ar_bits_len;
  assign io_slave_2_ar_bits_size = io_master_ar_bits_size;
  assign io_slave_2_ar_bits_burst = io_master_ar_bits_burst;
  assign io_slave_2_ar_bits_lock = io_master_ar_bits_lock;
  assign io_slave_2_ar_bits_cache = io_master_ar_bits_cache;
  assign io_slave_2_ar_bits_prot = io_master_ar_bits_prot;
  assign io_slave_2_ar_bits_qos = io_master_ar_bits_qos;
  assign io_slave_2_ar_bits_region = io_master_ar_bits_region;
  assign io_slave_2_ar_bits_id = io_master_ar_bits_id;
  assign io_slave_2_ar_bits_user = io_master_ar_bits_user;
  assign io_slave_2_r_ready = r_arb_io_in_2_ready;
  assign T_1235 = io_master_ar_bits_addr < 32'h400;
  assign T_1238 = 32'h400 <= io_master_ar_bits_addr;
  assign T_1240 = io_master_ar_bits_addr < 32'h440;
  assign T_1241 = T_1238 & T_1240;
  assign T_1243 = 32'h440 <= io_master_ar_bits_addr;
  assign T_1245 = io_master_ar_bits_addr < 32'h460;
  assign T_1246 = T_1243 & T_1245;
  assign T_1247 = {T_1246,T_1241};
  assign ar_route = {T_1247,T_1235};
  assign T_1251 = io_master_aw_bits_addr < 32'h400;
  assign T_1254 = 32'h400 <= io_master_aw_bits_addr;
  assign T_1256 = io_master_aw_bits_addr < 32'h440;
  assign T_1257 = T_1254 & T_1256;
  assign T_1259 = 32'h440 <= io_master_aw_bits_addr;
  assign T_1261 = io_master_aw_bits_addr < 32'h460;
  assign T_1262 = T_1259 & T_1261;
  assign T_1263 = {T_1262,T_1257};
  assign aw_route = {T_1263,T_1251};
  assign T_1267 = ar_route[0];
  assign T_1268 = io_master_ar_valid & T_1267;
  assign T_1270 = io_slave_0_ar_ready & T_1267;
  assign T_1272 = aw_route[0];
  assign T_1273 = io_master_aw_valid & T_1272;
  assign T_1275 = io_slave_0_aw_ready & T_1272;
  assign T_1279 = io_slave_0_w_ready & io_slave_0_w_valid;
  assign T_1280 = T_1279 & io_slave_0_w_bits_last;
  assign GEN_0 = T_1280 ? 1'h0 : T_1278;
  assign T_1282 = io_slave_0_aw_ready & io_slave_0_aw_valid;
  assign GEN_1 = T_1282 ? 1'h1 : GEN_0;
  assign T_1284 = io_master_w_valid & T_1278;
  assign T_1285 = io_slave_0_w_ready & T_1278;
  assign T_1287 = ar_route[1];
  assign T_1288 = io_master_ar_valid & T_1287;
  assign T_1290 = io_slave_1_ar_ready & T_1287;
  assign T_1291 = T_1270 | T_1290;
  assign T_1292 = aw_route[1];
  assign T_1293 = io_master_aw_valid & T_1292;
  assign T_1295 = io_slave_1_aw_ready & T_1292;
  assign T_1296 = T_1275 | T_1295;
  assign T_1299 = io_slave_1_w_ready & io_slave_1_w_valid;
  assign T_1300 = T_1299 & io_slave_1_w_bits_last;
  assign GEN_2 = T_1300 ? 1'h0 : T_1298;
  assign T_1302 = io_slave_1_aw_ready & io_slave_1_aw_valid;
  assign GEN_3 = T_1302 ? 1'h1 : GEN_2;
  assign T_1304 = io_master_w_valid & T_1298;
  assign T_1305 = io_slave_1_w_ready & T_1298;
  assign T_1306 = T_1285 | T_1305;
  assign T_1307 = ar_route[2];
  assign T_1308 = io_master_ar_valid & T_1307;
  assign T_1310 = io_slave_2_ar_ready & T_1307;
  assign ar_ready = T_1291 | T_1310;
  assign T_1311 = aw_route[2];
  assign T_1312 = io_master_aw_valid & T_1311;
  assign T_1314 = io_slave_2_aw_ready & T_1311;
  assign aw_ready = T_1296 | T_1314;
  assign T_1317 = io_slave_2_w_ready & io_slave_2_w_valid;
  assign T_1318 = T_1317 & io_slave_2_w_bits_last;
  assign GEN_4 = T_1318 ? 1'h0 : T_1316;
  assign T_1320 = io_slave_2_aw_ready & io_slave_2_aw_valid;
  assign GEN_5 = T_1320 ? 1'h1 : GEN_4;
  assign T_1322 = io_master_w_valid & T_1316;
  assign T_1323 = io_slave_2_w_ready & T_1316;
  assign w_ready = T_1306 | T_1323;
  assign T_1325 = ar_route != 3'h0;
  assign r_invalid = T_1325 == 1'h0;
  assign T_1328 = aw_route != 3'h0;
  assign w_invalid = T_1328 == 1'h0;
  assign err_slave_clock = clock;
  assign err_slave_reset = reset;
  assign err_slave_io_aw_valid = T_1331;
  assign err_slave_io_aw_bits_addr = io_master_aw_bits_addr;
  assign err_slave_io_aw_bits_len = io_master_aw_bits_len;
  assign err_slave_io_aw_bits_size = io_master_aw_bits_size;
  assign err_slave_io_aw_bits_burst = io_master_aw_bits_burst;
  assign err_slave_io_aw_bits_lock = io_master_aw_bits_lock;
  assign err_slave_io_aw_bits_cache = io_master_aw_bits_cache;
  assign err_slave_io_aw_bits_prot = io_master_aw_bits_prot;
  assign err_slave_io_aw_bits_qos = io_master_aw_bits_qos;
  assign err_slave_io_aw_bits_region = io_master_aw_bits_region;
  assign err_slave_io_aw_bits_id = io_master_aw_bits_id;
  assign err_slave_io_aw_bits_user = io_master_aw_bits_user;
  assign err_slave_io_w_valid = io_master_w_valid;
  assign err_slave_io_w_bits_data = io_master_w_bits_data;
  assign err_slave_io_w_bits_last = io_master_w_bits_last;
  assign err_slave_io_w_bits_id = io_master_w_bits_id;
  assign err_slave_io_w_bits_strb = io_master_w_bits_strb;
  assign err_slave_io_w_bits_user = io_master_w_bits_user;
  assign err_slave_io_b_ready = b_arb_io_in_3_ready;
  assign err_slave_io_ar_valid = T_1330;
  assign err_slave_io_ar_bits_addr = io_master_ar_bits_addr;
  assign err_slave_io_ar_bits_len = io_master_ar_bits_len;
  assign err_slave_io_ar_bits_size = io_master_ar_bits_size;
  assign err_slave_io_ar_bits_burst = io_master_ar_bits_burst;
  assign err_slave_io_ar_bits_lock = io_master_ar_bits_lock;
  assign err_slave_io_ar_bits_cache = io_master_ar_bits_cache;
  assign err_slave_io_ar_bits_prot = io_master_ar_bits_prot;
  assign err_slave_io_ar_bits_qos = io_master_ar_bits_qos;
  assign err_slave_io_ar_bits_region = io_master_ar_bits_region;
  assign err_slave_io_ar_bits_id = io_master_ar_bits_id;
  assign err_slave_io_ar_bits_user = io_master_ar_bits_user;
  assign err_slave_io_r_ready = r_arb_io_in_3_ready;
  assign T_1330 = r_invalid & io_master_ar_valid;
  assign T_1331 = w_invalid & io_master_aw_valid;
  assign T_1332 = r_invalid & err_slave_io_ar_ready;
  assign T_1333 = ar_ready | T_1332;
  assign T_1334 = w_invalid & err_slave_io_aw_ready;
  assign T_1335 = aw_ready | T_1334;
  assign T_1336 = w_ready | err_slave_io_w_ready;
  assign b_arb_clock = clock;
  assign b_arb_reset = reset;
  assign b_arb_io_in_0_valid = io_slave_0_b_valid;
  assign b_arb_io_in_0_bits_resp = io_slave_0_b_bits_resp;
  assign b_arb_io_in_0_bits_id = io_slave_0_b_bits_id;
  assign b_arb_io_in_0_bits_user = io_slave_0_b_bits_user;
  assign b_arb_io_in_1_valid = io_slave_1_b_valid;
  assign b_arb_io_in_1_bits_resp = io_slave_1_b_bits_resp;
  assign b_arb_io_in_1_bits_id = io_slave_1_b_bits_id;
  assign b_arb_io_in_1_bits_user = io_slave_1_b_bits_user;
  assign b_arb_io_in_2_valid = io_slave_2_b_valid;
  assign b_arb_io_in_2_bits_resp = io_slave_2_b_bits_resp;
  assign b_arb_io_in_2_bits_id = io_slave_2_b_bits_id;
  assign b_arb_io_in_2_bits_user = io_slave_2_b_bits_user;
  assign b_arb_io_in_3_valid = err_slave_io_b_valid;
  assign b_arb_io_in_3_bits_resp = err_slave_io_b_bits_resp;
  assign b_arb_io_in_3_bits_id = err_slave_io_b_bits_id;
  assign b_arb_io_in_3_bits_user = err_slave_io_b_bits_user;
  assign b_arb_io_out_ready = io_master_b_ready;
  assign r_arb_clock = clock;
  assign r_arb_reset = reset;
  assign r_arb_io_in_0_valid = io_slave_0_r_valid;
  assign r_arb_io_in_0_bits_resp = io_slave_0_r_bits_resp;
  assign r_arb_io_in_0_bits_data = io_slave_0_r_bits_data;
  assign r_arb_io_in_0_bits_last = io_slave_0_r_bits_last;
  assign r_arb_io_in_0_bits_id = io_slave_0_r_bits_id;
  assign r_arb_io_in_0_bits_user = io_slave_0_r_bits_user;
  assign r_arb_io_in_1_valid = io_slave_1_r_valid;
  assign r_arb_io_in_1_bits_resp = io_slave_1_r_bits_resp;
  assign r_arb_io_in_1_bits_data = io_slave_1_r_bits_data;
  assign r_arb_io_in_1_bits_last = io_slave_1_r_bits_last;
  assign r_arb_io_in_1_bits_id = io_slave_1_r_bits_id;
  assign r_arb_io_in_1_bits_user = io_slave_1_r_bits_user;
  assign r_arb_io_in_2_valid = io_slave_2_r_valid;
  assign r_arb_io_in_2_bits_resp = io_slave_2_r_bits_resp;
  assign r_arb_io_in_2_bits_data = io_slave_2_r_bits_data;
  assign r_arb_io_in_2_bits_last = io_slave_2_r_bits_last;
  assign r_arb_io_in_2_bits_id = io_slave_2_r_bits_id;
  assign r_arb_io_in_2_bits_user = io_slave_2_r_bits_user;
  assign r_arb_io_in_3_valid = err_slave_io_r_valid;
  assign r_arb_io_in_3_bits_resp = err_slave_io_r_bits_resp;
  assign r_arb_io_in_3_bits_data = err_slave_io_r_bits_data;
  assign r_arb_io_in_3_bits_last = err_slave_io_r_bits_last;
  assign r_arb_io_in_3_bits_id = err_slave_io_r_bits_id;
  assign r_arb_io_in_3_bits_user = err_slave_io_r_bits_user;
  assign r_arb_io_out_ready = io_master_r_ready;
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_6 = {1{$random}};
  T_1278 = GEN_6[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_7 = {1{$random}};
  T_1298 = GEN_7[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_8 = {1{$random}};
  T_1316 = GEN_8[0:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      T_1278 <= 1'h0;
    end else begin
      if (T_1282) begin
        T_1278 <= 1'h1;
      end else begin
        if (T_1280) begin
          T_1278 <= 1'h0;
        end
      end
    end
    if (reset) begin
      T_1298 <= 1'h0;
    end else begin
      if (T_1302) begin
        T_1298 <= 1'h1;
      end else begin
        if (T_1300) begin
          T_1298 <= 1'h0;
        end
      end
    end
    if (reset) begin
      T_1316 <= 1'h0;
    end else begin
      if (T_1320) begin
        T_1316 <= 1'h1;
      end else begin
        if (T_1318) begin
          T_1316 <= 1'h0;
        end
      end
    end
  end
endmodule
module NastiCrossbar(
  input   clock,
  input   reset,
  output  io_masters_0_aw_ready,
  input   io_masters_0_aw_valid,
  input  [31:0] io_masters_0_aw_bits_addr,
  input  [7:0] io_masters_0_aw_bits_len,
  input  [2:0] io_masters_0_aw_bits_size,
  input  [1:0] io_masters_0_aw_bits_burst,
  input   io_masters_0_aw_bits_lock,
  input  [3:0] io_masters_0_aw_bits_cache,
  input  [2:0] io_masters_0_aw_bits_prot,
  input  [3:0] io_masters_0_aw_bits_qos,
  input  [3:0] io_masters_0_aw_bits_region,
  input  [11:0] io_masters_0_aw_bits_id,
  input   io_masters_0_aw_bits_user,
  output  io_masters_0_w_ready,
  input   io_masters_0_w_valid,
  input  [31:0] io_masters_0_w_bits_data,
  input   io_masters_0_w_bits_last,
  input  [11:0] io_masters_0_w_bits_id,
  input  [3:0] io_masters_0_w_bits_strb,
  input   io_masters_0_w_bits_user,
  input   io_masters_0_b_ready,
  output  io_masters_0_b_valid,
  output [1:0] io_masters_0_b_bits_resp,
  output [11:0] io_masters_0_b_bits_id,
  output  io_masters_0_b_bits_user,
  output  io_masters_0_ar_ready,
  input   io_masters_0_ar_valid,
  input  [31:0] io_masters_0_ar_bits_addr,
  input  [7:0] io_masters_0_ar_bits_len,
  input  [2:0] io_masters_0_ar_bits_size,
  input  [1:0] io_masters_0_ar_bits_burst,
  input   io_masters_0_ar_bits_lock,
  input  [3:0] io_masters_0_ar_bits_cache,
  input  [2:0] io_masters_0_ar_bits_prot,
  input  [3:0] io_masters_0_ar_bits_qos,
  input  [3:0] io_masters_0_ar_bits_region,
  input  [11:0] io_masters_0_ar_bits_id,
  input   io_masters_0_ar_bits_user,
  input   io_masters_0_r_ready,
  output  io_masters_0_r_valid,
  output [1:0] io_masters_0_r_bits_resp,
  output [31:0] io_masters_0_r_bits_data,
  output  io_masters_0_r_bits_last,
  output [11:0] io_masters_0_r_bits_id,
  output  io_masters_0_r_bits_user,
  input   io_slaves_0_aw_ready,
  output  io_slaves_0_aw_valid,
  output [31:0] io_slaves_0_aw_bits_addr,
  output [7:0] io_slaves_0_aw_bits_len,
  output [2:0] io_slaves_0_aw_bits_size,
  output [1:0] io_slaves_0_aw_bits_burst,
  output  io_slaves_0_aw_bits_lock,
  output [3:0] io_slaves_0_aw_bits_cache,
  output [2:0] io_slaves_0_aw_bits_prot,
  output [3:0] io_slaves_0_aw_bits_qos,
  output [3:0] io_slaves_0_aw_bits_region,
  output [11:0] io_slaves_0_aw_bits_id,
  output  io_slaves_0_aw_bits_user,
  input   io_slaves_0_w_ready,
  output  io_slaves_0_w_valid,
  output [31:0] io_slaves_0_w_bits_data,
  output  io_slaves_0_w_bits_last,
  output [11:0] io_slaves_0_w_bits_id,
  output [3:0] io_slaves_0_w_bits_strb,
  output  io_slaves_0_w_bits_user,
  output  io_slaves_0_b_ready,
  input   io_slaves_0_b_valid,
  input  [1:0] io_slaves_0_b_bits_resp,
  input  [11:0] io_slaves_0_b_bits_id,
  input   io_slaves_0_b_bits_user,
  input   io_slaves_0_ar_ready,
  output  io_slaves_0_ar_valid,
  output [31:0] io_slaves_0_ar_bits_addr,
  output [7:0] io_slaves_0_ar_bits_len,
  output [2:0] io_slaves_0_ar_bits_size,
  output [1:0] io_slaves_0_ar_bits_burst,
  output  io_slaves_0_ar_bits_lock,
  output [3:0] io_slaves_0_ar_bits_cache,
  output [2:0] io_slaves_0_ar_bits_prot,
  output [3:0] io_slaves_0_ar_bits_qos,
  output [3:0] io_slaves_0_ar_bits_region,
  output [11:0] io_slaves_0_ar_bits_id,
  output  io_slaves_0_ar_bits_user,
  output  io_slaves_0_r_ready,
  input   io_slaves_0_r_valid,
  input  [1:0] io_slaves_0_r_bits_resp,
  input  [31:0] io_slaves_0_r_bits_data,
  input   io_slaves_0_r_bits_last,
  input  [11:0] io_slaves_0_r_bits_id,
  input   io_slaves_0_r_bits_user,
  input   io_slaves_1_aw_ready,
  output  io_slaves_1_aw_valid,
  output [31:0] io_slaves_1_aw_bits_addr,
  output [7:0] io_slaves_1_aw_bits_len,
  output [2:0] io_slaves_1_aw_bits_size,
  output [1:0] io_slaves_1_aw_bits_burst,
  output  io_slaves_1_aw_bits_lock,
  output [3:0] io_slaves_1_aw_bits_cache,
  output [2:0] io_slaves_1_aw_bits_prot,
  output [3:0] io_slaves_1_aw_bits_qos,
  output [3:0] io_slaves_1_aw_bits_region,
  output [11:0] io_slaves_1_aw_bits_id,
  output  io_slaves_1_aw_bits_user,
  input   io_slaves_1_w_ready,
  output  io_slaves_1_w_valid,
  output [31:0] io_slaves_1_w_bits_data,
  output  io_slaves_1_w_bits_last,
  output [11:0] io_slaves_1_w_bits_id,
  output [3:0] io_slaves_1_w_bits_strb,
  output  io_slaves_1_w_bits_user,
  output  io_slaves_1_b_ready,
  input   io_slaves_1_b_valid,
  input  [1:0] io_slaves_1_b_bits_resp,
  input  [11:0] io_slaves_1_b_bits_id,
  input   io_slaves_1_b_bits_user,
  input   io_slaves_1_ar_ready,
  output  io_slaves_1_ar_valid,
  output [31:0] io_slaves_1_ar_bits_addr,
  output [7:0] io_slaves_1_ar_bits_len,
  output [2:0] io_slaves_1_ar_bits_size,
  output [1:0] io_slaves_1_ar_bits_burst,
  output  io_slaves_1_ar_bits_lock,
  output [3:0] io_slaves_1_ar_bits_cache,
  output [2:0] io_slaves_1_ar_bits_prot,
  output [3:0] io_slaves_1_ar_bits_qos,
  output [3:0] io_slaves_1_ar_bits_region,
  output [11:0] io_slaves_1_ar_bits_id,
  output  io_slaves_1_ar_bits_user,
  output  io_slaves_1_r_ready,
  input   io_slaves_1_r_valid,
  input  [1:0] io_slaves_1_r_bits_resp,
  input  [31:0] io_slaves_1_r_bits_data,
  input   io_slaves_1_r_bits_last,
  input  [11:0] io_slaves_1_r_bits_id,
  input   io_slaves_1_r_bits_user,
  input   io_slaves_2_aw_ready,
  output  io_slaves_2_aw_valid,
  output [31:0] io_slaves_2_aw_bits_addr,
  output [7:0] io_slaves_2_aw_bits_len,
  output [2:0] io_slaves_2_aw_bits_size,
  output [1:0] io_slaves_2_aw_bits_burst,
  output  io_slaves_2_aw_bits_lock,
  output [3:0] io_slaves_2_aw_bits_cache,
  output [2:0] io_slaves_2_aw_bits_prot,
  output [3:0] io_slaves_2_aw_bits_qos,
  output [3:0] io_slaves_2_aw_bits_region,
  output [11:0] io_slaves_2_aw_bits_id,
  output  io_slaves_2_aw_bits_user,
  input   io_slaves_2_w_ready,
  output  io_slaves_2_w_valid,
  output [31:0] io_slaves_2_w_bits_data,
  output  io_slaves_2_w_bits_last,
  output [11:0] io_slaves_2_w_bits_id,
  output [3:0] io_slaves_2_w_bits_strb,
  output  io_slaves_2_w_bits_user,
  output  io_slaves_2_b_ready,
  input   io_slaves_2_b_valid,
  input  [1:0] io_slaves_2_b_bits_resp,
  input  [11:0] io_slaves_2_b_bits_id,
  input   io_slaves_2_b_bits_user,
  input   io_slaves_2_ar_ready,
  output  io_slaves_2_ar_valid,
  output [31:0] io_slaves_2_ar_bits_addr,
  output [7:0] io_slaves_2_ar_bits_len,
  output [2:0] io_slaves_2_ar_bits_size,
  output [1:0] io_slaves_2_ar_bits_burst,
  output  io_slaves_2_ar_bits_lock,
  output [3:0] io_slaves_2_ar_bits_cache,
  output [2:0] io_slaves_2_ar_bits_prot,
  output [3:0] io_slaves_2_ar_bits_qos,
  output [3:0] io_slaves_2_ar_bits_region,
  output [11:0] io_slaves_2_ar_bits_id,
  output  io_slaves_2_ar_bits_user,
  output  io_slaves_2_r_ready,
  input   io_slaves_2_r_valid,
  input  [1:0] io_slaves_2_r_bits_resp,
  input  [31:0] io_slaves_2_r_bits_data,
  input   io_slaves_2_r_bits_last,
  input  [11:0] io_slaves_2_r_bits_id,
  input   io_slaves_2_r_bits_user
);
  wire  NastiRouter_1_clock;
  wire  NastiRouter_1_reset;
  wire  NastiRouter_1_io_master_aw_ready;
  wire  NastiRouter_1_io_master_aw_valid;
  wire [31:0] NastiRouter_1_io_master_aw_bits_addr;
  wire [7:0] NastiRouter_1_io_master_aw_bits_len;
  wire [2:0] NastiRouter_1_io_master_aw_bits_size;
  wire [1:0] NastiRouter_1_io_master_aw_bits_burst;
  wire  NastiRouter_1_io_master_aw_bits_lock;
  wire [3:0] NastiRouter_1_io_master_aw_bits_cache;
  wire [2:0] NastiRouter_1_io_master_aw_bits_prot;
  wire [3:0] NastiRouter_1_io_master_aw_bits_qos;
  wire [3:0] NastiRouter_1_io_master_aw_bits_region;
  wire [11:0] NastiRouter_1_io_master_aw_bits_id;
  wire  NastiRouter_1_io_master_aw_bits_user;
  wire  NastiRouter_1_io_master_w_ready;
  wire  NastiRouter_1_io_master_w_valid;
  wire [31:0] NastiRouter_1_io_master_w_bits_data;
  wire  NastiRouter_1_io_master_w_bits_last;
  wire [11:0] NastiRouter_1_io_master_w_bits_id;
  wire [3:0] NastiRouter_1_io_master_w_bits_strb;
  wire  NastiRouter_1_io_master_w_bits_user;
  wire  NastiRouter_1_io_master_b_ready;
  wire  NastiRouter_1_io_master_b_valid;
  wire [1:0] NastiRouter_1_io_master_b_bits_resp;
  wire [11:0] NastiRouter_1_io_master_b_bits_id;
  wire  NastiRouter_1_io_master_b_bits_user;
  wire  NastiRouter_1_io_master_ar_ready;
  wire  NastiRouter_1_io_master_ar_valid;
  wire [31:0] NastiRouter_1_io_master_ar_bits_addr;
  wire [7:0] NastiRouter_1_io_master_ar_bits_len;
  wire [2:0] NastiRouter_1_io_master_ar_bits_size;
  wire [1:0] NastiRouter_1_io_master_ar_bits_burst;
  wire  NastiRouter_1_io_master_ar_bits_lock;
  wire [3:0] NastiRouter_1_io_master_ar_bits_cache;
  wire [2:0] NastiRouter_1_io_master_ar_bits_prot;
  wire [3:0] NastiRouter_1_io_master_ar_bits_qos;
  wire [3:0] NastiRouter_1_io_master_ar_bits_region;
  wire [11:0] NastiRouter_1_io_master_ar_bits_id;
  wire  NastiRouter_1_io_master_ar_bits_user;
  wire  NastiRouter_1_io_master_r_ready;
  wire  NastiRouter_1_io_master_r_valid;
  wire [1:0] NastiRouter_1_io_master_r_bits_resp;
  wire [31:0] NastiRouter_1_io_master_r_bits_data;
  wire  NastiRouter_1_io_master_r_bits_last;
  wire [11:0] NastiRouter_1_io_master_r_bits_id;
  wire  NastiRouter_1_io_master_r_bits_user;
  wire  NastiRouter_1_io_slave_0_aw_ready;
  wire  NastiRouter_1_io_slave_0_aw_valid;
  wire [31:0] NastiRouter_1_io_slave_0_aw_bits_addr;
  wire [7:0] NastiRouter_1_io_slave_0_aw_bits_len;
  wire [2:0] NastiRouter_1_io_slave_0_aw_bits_size;
  wire [1:0] NastiRouter_1_io_slave_0_aw_bits_burst;
  wire  NastiRouter_1_io_slave_0_aw_bits_lock;
  wire [3:0] NastiRouter_1_io_slave_0_aw_bits_cache;
  wire [2:0] NastiRouter_1_io_slave_0_aw_bits_prot;
  wire [3:0] NastiRouter_1_io_slave_0_aw_bits_qos;
  wire [3:0] NastiRouter_1_io_slave_0_aw_bits_region;
  wire [11:0] NastiRouter_1_io_slave_0_aw_bits_id;
  wire  NastiRouter_1_io_slave_0_aw_bits_user;
  wire  NastiRouter_1_io_slave_0_w_ready;
  wire  NastiRouter_1_io_slave_0_w_valid;
  wire [31:0] NastiRouter_1_io_slave_0_w_bits_data;
  wire  NastiRouter_1_io_slave_0_w_bits_last;
  wire [11:0] NastiRouter_1_io_slave_0_w_bits_id;
  wire [3:0] NastiRouter_1_io_slave_0_w_bits_strb;
  wire  NastiRouter_1_io_slave_0_w_bits_user;
  wire  NastiRouter_1_io_slave_0_b_ready;
  wire  NastiRouter_1_io_slave_0_b_valid;
  wire [1:0] NastiRouter_1_io_slave_0_b_bits_resp;
  wire [11:0] NastiRouter_1_io_slave_0_b_bits_id;
  wire  NastiRouter_1_io_slave_0_b_bits_user;
  wire  NastiRouter_1_io_slave_0_ar_ready;
  wire  NastiRouter_1_io_slave_0_ar_valid;
  wire [31:0] NastiRouter_1_io_slave_0_ar_bits_addr;
  wire [7:0] NastiRouter_1_io_slave_0_ar_bits_len;
  wire [2:0] NastiRouter_1_io_slave_0_ar_bits_size;
  wire [1:0] NastiRouter_1_io_slave_0_ar_bits_burst;
  wire  NastiRouter_1_io_slave_0_ar_bits_lock;
  wire [3:0] NastiRouter_1_io_slave_0_ar_bits_cache;
  wire [2:0] NastiRouter_1_io_slave_0_ar_bits_prot;
  wire [3:0] NastiRouter_1_io_slave_0_ar_bits_qos;
  wire [3:0] NastiRouter_1_io_slave_0_ar_bits_region;
  wire [11:0] NastiRouter_1_io_slave_0_ar_bits_id;
  wire  NastiRouter_1_io_slave_0_ar_bits_user;
  wire  NastiRouter_1_io_slave_0_r_ready;
  wire  NastiRouter_1_io_slave_0_r_valid;
  wire [1:0] NastiRouter_1_io_slave_0_r_bits_resp;
  wire [31:0] NastiRouter_1_io_slave_0_r_bits_data;
  wire  NastiRouter_1_io_slave_0_r_bits_last;
  wire [11:0] NastiRouter_1_io_slave_0_r_bits_id;
  wire  NastiRouter_1_io_slave_0_r_bits_user;
  wire  NastiRouter_1_io_slave_1_aw_ready;
  wire  NastiRouter_1_io_slave_1_aw_valid;
  wire [31:0] NastiRouter_1_io_slave_1_aw_bits_addr;
  wire [7:0] NastiRouter_1_io_slave_1_aw_bits_len;
  wire [2:0] NastiRouter_1_io_slave_1_aw_bits_size;
  wire [1:0] NastiRouter_1_io_slave_1_aw_bits_burst;
  wire  NastiRouter_1_io_slave_1_aw_bits_lock;
  wire [3:0] NastiRouter_1_io_slave_1_aw_bits_cache;
  wire [2:0] NastiRouter_1_io_slave_1_aw_bits_prot;
  wire [3:0] NastiRouter_1_io_slave_1_aw_bits_qos;
  wire [3:0] NastiRouter_1_io_slave_1_aw_bits_region;
  wire [11:0] NastiRouter_1_io_slave_1_aw_bits_id;
  wire  NastiRouter_1_io_slave_1_aw_bits_user;
  wire  NastiRouter_1_io_slave_1_w_ready;
  wire  NastiRouter_1_io_slave_1_w_valid;
  wire [31:0] NastiRouter_1_io_slave_1_w_bits_data;
  wire  NastiRouter_1_io_slave_1_w_bits_last;
  wire [11:0] NastiRouter_1_io_slave_1_w_bits_id;
  wire [3:0] NastiRouter_1_io_slave_1_w_bits_strb;
  wire  NastiRouter_1_io_slave_1_w_bits_user;
  wire  NastiRouter_1_io_slave_1_b_ready;
  wire  NastiRouter_1_io_slave_1_b_valid;
  wire [1:0] NastiRouter_1_io_slave_1_b_bits_resp;
  wire [11:0] NastiRouter_1_io_slave_1_b_bits_id;
  wire  NastiRouter_1_io_slave_1_b_bits_user;
  wire  NastiRouter_1_io_slave_1_ar_ready;
  wire  NastiRouter_1_io_slave_1_ar_valid;
  wire [31:0] NastiRouter_1_io_slave_1_ar_bits_addr;
  wire [7:0] NastiRouter_1_io_slave_1_ar_bits_len;
  wire [2:0] NastiRouter_1_io_slave_1_ar_bits_size;
  wire [1:0] NastiRouter_1_io_slave_1_ar_bits_burst;
  wire  NastiRouter_1_io_slave_1_ar_bits_lock;
  wire [3:0] NastiRouter_1_io_slave_1_ar_bits_cache;
  wire [2:0] NastiRouter_1_io_slave_1_ar_bits_prot;
  wire [3:0] NastiRouter_1_io_slave_1_ar_bits_qos;
  wire [3:0] NastiRouter_1_io_slave_1_ar_bits_region;
  wire [11:0] NastiRouter_1_io_slave_1_ar_bits_id;
  wire  NastiRouter_1_io_slave_1_ar_bits_user;
  wire  NastiRouter_1_io_slave_1_r_ready;
  wire  NastiRouter_1_io_slave_1_r_valid;
  wire [1:0] NastiRouter_1_io_slave_1_r_bits_resp;
  wire [31:0] NastiRouter_1_io_slave_1_r_bits_data;
  wire  NastiRouter_1_io_slave_1_r_bits_last;
  wire [11:0] NastiRouter_1_io_slave_1_r_bits_id;
  wire  NastiRouter_1_io_slave_1_r_bits_user;
  wire  NastiRouter_1_io_slave_2_aw_ready;
  wire  NastiRouter_1_io_slave_2_aw_valid;
  wire [31:0] NastiRouter_1_io_slave_2_aw_bits_addr;
  wire [7:0] NastiRouter_1_io_slave_2_aw_bits_len;
  wire [2:0] NastiRouter_1_io_slave_2_aw_bits_size;
  wire [1:0] NastiRouter_1_io_slave_2_aw_bits_burst;
  wire  NastiRouter_1_io_slave_2_aw_bits_lock;
  wire [3:0] NastiRouter_1_io_slave_2_aw_bits_cache;
  wire [2:0] NastiRouter_1_io_slave_2_aw_bits_prot;
  wire [3:0] NastiRouter_1_io_slave_2_aw_bits_qos;
  wire [3:0] NastiRouter_1_io_slave_2_aw_bits_region;
  wire [11:0] NastiRouter_1_io_slave_2_aw_bits_id;
  wire  NastiRouter_1_io_slave_2_aw_bits_user;
  wire  NastiRouter_1_io_slave_2_w_ready;
  wire  NastiRouter_1_io_slave_2_w_valid;
  wire [31:0] NastiRouter_1_io_slave_2_w_bits_data;
  wire  NastiRouter_1_io_slave_2_w_bits_last;
  wire [11:0] NastiRouter_1_io_slave_2_w_bits_id;
  wire [3:0] NastiRouter_1_io_slave_2_w_bits_strb;
  wire  NastiRouter_1_io_slave_2_w_bits_user;
  wire  NastiRouter_1_io_slave_2_b_ready;
  wire  NastiRouter_1_io_slave_2_b_valid;
  wire [1:0] NastiRouter_1_io_slave_2_b_bits_resp;
  wire [11:0] NastiRouter_1_io_slave_2_b_bits_id;
  wire  NastiRouter_1_io_slave_2_b_bits_user;
  wire  NastiRouter_1_io_slave_2_ar_ready;
  wire  NastiRouter_1_io_slave_2_ar_valid;
  wire [31:0] NastiRouter_1_io_slave_2_ar_bits_addr;
  wire [7:0] NastiRouter_1_io_slave_2_ar_bits_len;
  wire [2:0] NastiRouter_1_io_slave_2_ar_bits_size;
  wire [1:0] NastiRouter_1_io_slave_2_ar_bits_burst;
  wire  NastiRouter_1_io_slave_2_ar_bits_lock;
  wire [3:0] NastiRouter_1_io_slave_2_ar_bits_cache;
  wire [2:0] NastiRouter_1_io_slave_2_ar_bits_prot;
  wire [3:0] NastiRouter_1_io_slave_2_ar_bits_qos;
  wire [3:0] NastiRouter_1_io_slave_2_ar_bits_region;
  wire [11:0] NastiRouter_1_io_slave_2_ar_bits_id;
  wire  NastiRouter_1_io_slave_2_ar_bits_user;
  wire  NastiRouter_1_io_slave_2_r_ready;
  wire  NastiRouter_1_io_slave_2_r_valid;
  wire [1:0] NastiRouter_1_io_slave_2_r_bits_resp;
  wire [31:0] NastiRouter_1_io_slave_2_r_bits_data;
  wire  NastiRouter_1_io_slave_2_r_bits_last;
  wire [11:0] NastiRouter_1_io_slave_2_r_bits_id;
  wire  NastiRouter_1_io_slave_2_r_bits_user;
  NastiRouter NastiRouter_1 (
    .clock(NastiRouter_1_clock),
    .reset(NastiRouter_1_reset),
    .io_master_aw_ready(NastiRouter_1_io_master_aw_ready),
    .io_master_aw_valid(NastiRouter_1_io_master_aw_valid),
    .io_master_aw_bits_addr(NastiRouter_1_io_master_aw_bits_addr),
    .io_master_aw_bits_len(NastiRouter_1_io_master_aw_bits_len),
    .io_master_aw_bits_size(NastiRouter_1_io_master_aw_bits_size),
    .io_master_aw_bits_burst(NastiRouter_1_io_master_aw_bits_burst),
    .io_master_aw_bits_lock(NastiRouter_1_io_master_aw_bits_lock),
    .io_master_aw_bits_cache(NastiRouter_1_io_master_aw_bits_cache),
    .io_master_aw_bits_prot(NastiRouter_1_io_master_aw_bits_prot),
    .io_master_aw_bits_qos(NastiRouter_1_io_master_aw_bits_qos),
    .io_master_aw_bits_region(NastiRouter_1_io_master_aw_bits_region),
    .io_master_aw_bits_id(NastiRouter_1_io_master_aw_bits_id),
    .io_master_aw_bits_user(NastiRouter_1_io_master_aw_bits_user),
    .io_master_w_ready(NastiRouter_1_io_master_w_ready),
    .io_master_w_valid(NastiRouter_1_io_master_w_valid),
    .io_master_w_bits_data(NastiRouter_1_io_master_w_bits_data),
    .io_master_w_bits_last(NastiRouter_1_io_master_w_bits_last),
    .io_master_w_bits_id(NastiRouter_1_io_master_w_bits_id),
    .io_master_w_bits_strb(NastiRouter_1_io_master_w_bits_strb),
    .io_master_w_bits_user(NastiRouter_1_io_master_w_bits_user),
    .io_master_b_ready(NastiRouter_1_io_master_b_ready),
    .io_master_b_valid(NastiRouter_1_io_master_b_valid),
    .io_master_b_bits_resp(NastiRouter_1_io_master_b_bits_resp),
    .io_master_b_bits_id(NastiRouter_1_io_master_b_bits_id),
    .io_master_b_bits_user(NastiRouter_1_io_master_b_bits_user),
    .io_master_ar_ready(NastiRouter_1_io_master_ar_ready),
    .io_master_ar_valid(NastiRouter_1_io_master_ar_valid),
    .io_master_ar_bits_addr(NastiRouter_1_io_master_ar_bits_addr),
    .io_master_ar_bits_len(NastiRouter_1_io_master_ar_bits_len),
    .io_master_ar_bits_size(NastiRouter_1_io_master_ar_bits_size),
    .io_master_ar_bits_burst(NastiRouter_1_io_master_ar_bits_burst),
    .io_master_ar_bits_lock(NastiRouter_1_io_master_ar_bits_lock),
    .io_master_ar_bits_cache(NastiRouter_1_io_master_ar_bits_cache),
    .io_master_ar_bits_prot(NastiRouter_1_io_master_ar_bits_prot),
    .io_master_ar_bits_qos(NastiRouter_1_io_master_ar_bits_qos),
    .io_master_ar_bits_region(NastiRouter_1_io_master_ar_bits_region),
    .io_master_ar_bits_id(NastiRouter_1_io_master_ar_bits_id),
    .io_master_ar_bits_user(NastiRouter_1_io_master_ar_bits_user),
    .io_master_r_ready(NastiRouter_1_io_master_r_ready),
    .io_master_r_valid(NastiRouter_1_io_master_r_valid),
    .io_master_r_bits_resp(NastiRouter_1_io_master_r_bits_resp),
    .io_master_r_bits_data(NastiRouter_1_io_master_r_bits_data),
    .io_master_r_bits_last(NastiRouter_1_io_master_r_bits_last),
    .io_master_r_bits_id(NastiRouter_1_io_master_r_bits_id),
    .io_master_r_bits_user(NastiRouter_1_io_master_r_bits_user),
    .io_slave_0_aw_ready(NastiRouter_1_io_slave_0_aw_ready),
    .io_slave_0_aw_valid(NastiRouter_1_io_slave_0_aw_valid),
    .io_slave_0_aw_bits_addr(NastiRouter_1_io_slave_0_aw_bits_addr),
    .io_slave_0_aw_bits_len(NastiRouter_1_io_slave_0_aw_bits_len),
    .io_slave_0_aw_bits_size(NastiRouter_1_io_slave_0_aw_bits_size),
    .io_slave_0_aw_bits_burst(NastiRouter_1_io_slave_0_aw_bits_burst),
    .io_slave_0_aw_bits_lock(NastiRouter_1_io_slave_0_aw_bits_lock),
    .io_slave_0_aw_bits_cache(NastiRouter_1_io_slave_0_aw_bits_cache),
    .io_slave_0_aw_bits_prot(NastiRouter_1_io_slave_0_aw_bits_prot),
    .io_slave_0_aw_bits_qos(NastiRouter_1_io_slave_0_aw_bits_qos),
    .io_slave_0_aw_bits_region(NastiRouter_1_io_slave_0_aw_bits_region),
    .io_slave_0_aw_bits_id(NastiRouter_1_io_slave_0_aw_bits_id),
    .io_slave_0_aw_bits_user(NastiRouter_1_io_slave_0_aw_bits_user),
    .io_slave_0_w_ready(NastiRouter_1_io_slave_0_w_ready),
    .io_slave_0_w_valid(NastiRouter_1_io_slave_0_w_valid),
    .io_slave_0_w_bits_data(NastiRouter_1_io_slave_0_w_bits_data),
    .io_slave_0_w_bits_last(NastiRouter_1_io_slave_0_w_bits_last),
    .io_slave_0_w_bits_id(NastiRouter_1_io_slave_0_w_bits_id),
    .io_slave_0_w_bits_strb(NastiRouter_1_io_slave_0_w_bits_strb),
    .io_slave_0_w_bits_user(NastiRouter_1_io_slave_0_w_bits_user),
    .io_slave_0_b_ready(NastiRouter_1_io_slave_0_b_ready),
    .io_slave_0_b_valid(NastiRouter_1_io_slave_0_b_valid),
    .io_slave_0_b_bits_resp(NastiRouter_1_io_slave_0_b_bits_resp),
    .io_slave_0_b_bits_id(NastiRouter_1_io_slave_0_b_bits_id),
    .io_slave_0_b_bits_user(NastiRouter_1_io_slave_0_b_bits_user),
    .io_slave_0_ar_ready(NastiRouter_1_io_slave_0_ar_ready),
    .io_slave_0_ar_valid(NastiRouter_1_io_slave_0_ar_valid),
    .io_slave_0_ar_bits_addr(NastiRouter_1_io_slave_0_ar_bits_addr),
    .io_slave_0_ar_bits_len(NastiRouter_1_io_slave_0_ar_bits_len),
    .io_slave_0_ar_bits_size(NastiRouter_1_io_slave_0_ar_bits_size),
    .io_slave_0_ar_bits_burst(NastiRouter_1_io_slave_0_ar_bits_burst),
    .io_slave_0_ar_bits_lock(NastiRouter_1_io_slave_0_ar_bits_lock),
    .io_slave_0_ar_bits_cache(NastiRouter_1_io_slave_0_ar_bits_cache),
    .io_slave_0_ar_bits_prot(NastiRouter_1_io_slave_0_ar_bits_prot),
    .io_slave_0_ar_bits_qos(NastiRouter_1_io_slave_0_ar_bits_qos),
    .io_slave_0_ar_bits_region(NastiRouter_1_io_slave_0_ar_bits_region),
    .io_slave_0_ar_bits_id(NastiRouter_1_io_slave_0_ar_bits_id),
    .io_slave_0_ar_bits_user(NastiRouter_1_io_slave_0_ar_bits_user),
    .io_slave_0_r_ready(NastiRouter_1_io_slave_0_r_ready),
    .io_slave_0_r_valid(NastiRouter_1_io_slave_0_r_valid),
    .io_slave_0_r_bits_resp(NastiRouter_1_io_slave_0_r_bits_resp),
    .io_slave_0_r_bits_data(NastiRouter_1_io_slave_0_r_bits_data),
    .io_slave_0_r_bits_last(NastiRouter_1_io_slave_0_r_bits_last),
    .io_slave_0_r_bits_id(NastiRouter_1_io_slave_0_r_bits_id),
    .io_slave_0_r_bits_user(NastiRouter_1_io_slave_0_r_bits_user),
    .io_slave_1_aw_ready(NastiRouter_1_io_slave_1_aw_ready),
    .io_slave_1_aw_valid(NastiRouter_1_io_slave_1_aw_valid),
    .io_slave_1_aw_bits_addr(NastiRouter_1_io_slave_1_aw_bits_addr),
    .io_slave_1_aw_bits_len(NastiRouter_1_io_slave_1_aw_bits_len),
    .io_slave_1_aw_bits_size(NastiRouter_1_io_slave_1_aw_bits_size),
    .io_slave_1_aw_bits_burst(NastiRouter_1_io_slave_1_aw_bits_burst),
    .io_slave_1_aw_bits_lock(NastiRouter_1_io_slave_1_aw_bits_lock),
    .io_slave_1_aw_bits_cache(NastiRouter_1_io_slave_1_aw_bits_cache),
    .io_slave_1_aw_bits_prot(NastiRouter_1_io_slave_1_aw_bits_prot),
    .io_slave_1_aw_bits_qos(NastiRouter_1_io_slave_1_aw_bits_qos),
    .io_slave_1_aw_bits_region(NastiRouter_1_io_slave_1_aw_bits_region),
    .io_slave_1_aw_bits_id(NastiRouter_1_io_slave_1_aw_bits_id),
    .io_slave_1_aw_bits_user(NastiRouter_1_io_slave_1_aw_bits_user),
    .io_slave_1_w_ready(NastiRouter_1_io_slave_1_w_ready),
    .io_slave_1_w_valid(NastiRouter_1_io_slave_1_w_valid),
    .io_slave_1_w_bits_data(NastiRouter_1_io_slave_1_w_bits_data),
    .io_slave_1_w_bits_last(NastiRouter_1_io_slave_1_w_bits_last),
    .io_slave_1_w_bits_id(NastiRouter_1_io_slave_1_w_bits_id),
    .io_slave_1_w_bits_strb(NastiRouter_1_io_slave_1_w_bits_strb),
    .io_slave_1_w_bits_user(NastiRouter_1_io_slave_1_w_bits_user),
    .io_slave_1_b_ready(NastiRouter_1_io_slave_1_b_ready),
    .io_slave_1_b_valid(NastiRouter_1_io_slave_1_b_valid),
    .io_slave_1_b_bits_resp(NastiRouter_1_io_slave_1_b_bits_resp),
    .io_slave_1_b_bits_id(NastiRouter_1_io_slave_1_b_bits_id),
    .io_slave_1_b_bits_user(NastiRouter_1_io_slave_1_b_bits_user),
    .io_slave_1_ar_ready(NastiRouter_1_io_slave_1_ar_ready),
    .io_slave_1_ar_valid(NastiRouter_1_io_slave_1_ar_valid),
    .io_slave_1_ar_bits_addr(NastiRouter_1_io_slave_1_ar_bits_addr),
    .io_slave_1_ar_bits_len(NastiRouter_1_io_slave_1_ar_bits_len),
    .io_slave_1_ar_bits_size(NastiRouter_1_io_slave_1_ar_bits_size),
    .io_slave_1_ar_bits_burst(NastiRouter_1_io_slave_1_ar_bits_burst),
    .io_slave_1_ar_bits_lock(NastiRouter_1_io_slave_1_ar_bits_lock),
    .io_slave_1_ar_bits_cache(NastiRouter_1_io_slave_1_ar_bits_cache),
    .io_slave_1_ar_bits_prot(NastiRouter_1_io_slave_1_ar_bits_prot),
    .io_slave_1_ar_bits_qos(NastiRouter_1_io_slave_1_ar_bits_qos),
    .io_slave_1_ar_bits_region(NastiRouter_1_io_slave_1_ar_bits_region),
    .io_slave_1_ar_bits_id(NastiRouter_1_io_slave_1_ar_bits_id),
    .io_slave_1_ar_bits_user(NastiRouter_1_io_slave_1_ar_bits_user),
    .io_slave_1_r_ready(NastiRouter_1_io_slave_1_r_ready),
    .io_slave_1_r_valid(NastiRouter_1_io_slave_1_r_valid),
    .io_slave_1_r_bits_resp(NastiRouter_1_io_slave_1_r_bits_resp),
    .io_slave_1_r_bits_data(NastiRouter_1_io_slave_1_r_bits_data),
    .io_slave_1_r_bits_last(NastiRouter_1_io_slave_1_r_bits_last),
    .io_slave_1_r_bits_id(NastiRouter_1_io_slave_1_r_bits_id),
    .io_slave_1_r_bits_user(NastiRouter_1_io_slave_1_r_bits_user),
    .io_slave_2_aw_ready(NastiRouter_1_io_slave_2_aw_ready),
    .io_slave_2_aw_valid(NastiRouter_1_io_slave_2_aw_valid),
    .io_slave_2_aw_bits_addr(NastiRouter_1_io_slave_2_aw_bits_addr),
    .io_slave_2_aw_bits_len(NastiRouter_1_io_slave_2_aw_bits_len),
    .io_slave_2_aw_bits_size(NastiRouter_1_io_slave_2_aw_bits_size),
    .io_slave_2_aw_bits_burst(NastiRouter_1_io_slave_2_aw_bits_burst),
    .io_slave_2_aw_bits_lock(NastiRouter_1_io_slave_2_aw_bits_lock),
    .io_slave_2_aw_bits_cache(NastiRouter_1_io_slave_2_aw_bits_cache),
    .io_slave_2_aw_bits_prot(NastiRouter_1_io_slave_2_aw_bits_prot),
    .io_slave_2_aw_bits_qos(NastiRouter_1_io_slave_2_aw_bits_qos),
    .io_slave_2_aw_bits_region(NastiRouter_1_io_slave_2_aw_bits_region),
    .io_slave_2_aw_bits_id(NastiRouter_1_io_slave_2_aw_bits_id),
    .io_slave_2_aw_bits_user(NastiRouter_1_io_slave_2_aw_bits_user),
    .io_slave_2_w_ready(NastiRouter_1_io_slave_2_w_ready),
    .io_slave_2_w_valid(NastiRouter_1_io_slave_2_w_valid),
    .io_slave_2_w_bits_data(NastiRouter_1_io_slave_2_w_bits_data),
    .io_slave_2_w_bits_last(NastiRouter_1_io_slave_2_w_bits_last),
    .io_slave_2_w_bits_id(NastiRouter_1_io_slave_2_w_bits_id),
    .io_slave_2_w_bits_strb(NastiRouter_1_io_slave_2_w_bits_strb),
    .io_slave_2_w_bits_user(NastiRouter_1_io_slave_2_w_bits_user),
    .io_slave_2_b_ready(NastiRouter_1_io_slave_2_b_ready),
    .io_slave_2_b_valid(NastiRouter_1_io_slave_2_b_valid),
    .io_slave_2_b_bits_resp(NastiRouter_1_io_slave_2_b_bits_resp),
    .io_slave_2_b_bits_id(NastiRouter_1_io_slave_2_b_bits_id),
    .io_slave_2_b_bits_user(NastiRouter_1_io_slave_2_b_bits_user),
    .io_slave_2_ar_ready(NastiRouter_1_io_slave_2_ar_ready),
    .io_slave_2_ar_valid(NastiRouter_1_io_slave_2_ar_valid),
    .io_slave_2_ar_bits_addr(NastiRouter_1_io_slave_2_ar_bits_addr),
    .io_slave_2_ar_bits_len(NastiRouter_1_io_slave_2_ar_bits_len),
    .io_slave_2_ar_bits_size(NastiRouter_1_io_slave_2_ar_bits_size),
    .io_slave_2_ar_bits_burst(NastiRouter_1_io_slave_2_ar_bits_burst),
    .io_slave_2_ar_bits_lock(NastiRouter_1_io_slave_2_ar_bits_lock),
    .io_slave_2_ar_bits_cache(NastiRouter_1_io_slave_2_ar_bits_cache),
    .io_slave_2_ar_bits_prot(NastiRouter_1_io_slave_2_ar_bits_prot),
    .io_slave_2_ar_bits_qos(NastiRouter_1_io_slave_2_ar_bits_qos),
    .io_slave_2_ar_bits_region(NastiRouter_1_io_slave_2_ar_bits_region),
    .io_slave_2_ar_bits_id(NastiRouter_1_io_slave_2_ar_bits_id),
    .io_slave_2_ar_bits_user(NastiRouter_1_io_slave_2_ar_bits_user),
    .io_slave_2_r_ready(NastiRouter_1_io_slave_2_r_ready),
    .io_slave_2_r_valid(NastiRouter_1_io_slave_2_r_valid),
    .io_slave_2_r_bits_resp(NastiRouter_1_io_slave_2_r_bits_resp),
    .io_slave_2_r_bits_data(NastiRouter_1_io_slave_2_r_bits_data),
    .io_slave_2_r_bits_last(NastiRouter_1_io_slave_2_r_bits_last),
    .io_slave_2_r_bits_id(NastiRouter_1_io_slave_2_r_bits_id),
    .io_slave_2_r_bits_user(NastiRouter_1_io_slave_2_r_bits_user)
  );
  assign io_masters_0_aw_ready = NastiRouter_1_io_master_aw_ready;
  assign io_masters_0_w_ready = NastiRouter_1_io_master_w_ready;
  assign io_masters_0_b_valid = NastiRouter_1_io_master_b_valid;
  assign io_masters_0_b_bits_resp = NastiRouter_1_io_master_b_bits_resp;
  assign io_masters_0_b_bits_id = NastiRouter_1_io_master_b_bits_id;
  assign io_masters_0_b_bits_user = NastiRouter_1_io_master_b_bits_user;
  assign io_masters_0_ar_ready = NastiRouter_1_io_master_ar_ready;
  assign io_masters_0_r_valid = NastiRouter_1_io_master_r_valid;
  assign io_masters_0_r_bits_resp = NastiRouter_1_io_master_r_bits_resp;
  assign io_masters_0_r_bits_data = NastiRouter_1_io_master_r_bits_data;
  assign io_masters_0_r_bits_last = NastiRouter_1_io_master_r_bits_last;
  assign io_masters_0_r_bits_id = NastiRouter_1_io_master_r_bits_id;
  assign io_masters_0_r_bits_user = NastiRouter_1_io_master_r_bits_user;
  assign io_slaves_0_aw_valid = NastiRouter_1_io_slave_0_aw_valid;
  assign io_slaves_0_aw_bits_addr = NastiRouter_1_io_slave_0_aw_bits_addr;
  assign io_slaves_0_aw_bits_len = NastiRouter_1_io_slave_0_aw_bits_len;
  assign io_slaves_0_aw_bits_size = NastiRouter_1_io_slave_0_aw_bits_size;
  assign io_slaves_0_aw_bits_burst = NastiRouter_1_io_slave_0_aw_bits_burst;
  assign io_slaves_0_aw_bits_lock = NastiRouter_1_io_slave_0_aw_bits_lock;
  assign io_slaves_0_aw_bits_cache = NastiRouter_1_io_slave_0_aw_bits_cache;
  assign io_slaves_0_aw_bits_prot = NastiRouter_1_io_slave_0_aw_bits_prot;
  assign io_slaves_0_aw_bits_qos = NastiRouter_1_io_slave_0_aw_bits_qos;
  assign io_slaves_0_aw_bits_region = NastiRouter_1_io_slave_0_aw_bits_region;
  assign io_slaves_0_aw_bits_id = NastiRouter_1_io_slave_0_aw_bits_id;
  assign io_slaves_0_aw_bits_user = NastiRouter_1_io_slave_0_aw_bits_user;
  assign io_slaves_0_w_valid = NastiRouter_1_io_slave_0_w_valid;
  assign io_slaves_0_w_bits_data = NastiRouter_1_io_slave_0_w_bits_data;
  assign io_slaves_0_w_bits_last = NastiRouter_1_io_slave_0_w_bits_last;
  assign io_slaves_0_w_bits_id = NastiRouter_1_io_slave_0_w_bits_id;
  assign io_slaves_0_w_bits_strb = NastiRouter_1_io_slave_0_w_bits_strb;
  assign io_slaves_0_w_bits_user = NastiRouter_1_io_slave_0_w_bits_user;
  assign io_slaves_0_b_ready = NastiRouter_1_io_slave_0_b_ready;
  assign io_slaves_0_ar_valid = NastiRouter_1_io_slave_0_ar_valid;
  assign io_slaves_0_ar_bits_addr = NastiRouter_1_io_slave_0_ar_bits_addr;
  assign io_slaves_0_ar_bits_len = NastiRouter_1_io_slave_0_ar_bits_len;
  assign io_slaves_0_ar_bits_size = NastiRouter_1_io_slave_0_ar_bits_size;
  assign io_slaves_0_ar_bits_burst = NastiRouter_1_io_slave_0_ar_bits_burst;
  assign io_slaves_0_ar_bits_lock = NastiRouter_1_io_slave_0_ar_bits_lock;
  assign io_slaves_0_ar_bits_cache = NastiRouter_1_io_slave_0_ar_bits_cache;
  assign io_slaves_0_ar_bits_prot = NastiRouter_1_io_slave_0_ar_bits_prot;
  assign io_slaves_0_ar_bits_qos = NastiRouter_1_io_slave_0_ar_bits_qos;
  assign io_slaves_0_ar_bits_region = NastiRouter_1_io_slave_0_ar_bits_region;
  assign io_slaves_0_ar_bits_id = NastiRouter_1_io_slave_0_ar_bits_id;
  assign io_slaves_0_ar_bits_user = NastiRouter_1_io_slave_0_ar_bits_user;
  assign io_slaves_0_r_ready = NastiRouter_1_io_slave_0_r_ready;
  assign io_slaves_1_aw_valid = NastiRouter_1_io_slave_1_aw_valid;
  assign io_slaves_1_aw_bits_addr = NastiRouter_1_io_slave_1_aw_bits_addr;
  assign io_slaves_1_aw_bits_len = NastiRouter_1_io_slave_1_aw_bits_len;
  assign io_slaves_1_aw_bits_size = NastiRouter_1_io_slave_1_aw_bits_size;
  assign io_slaves_1_aw_bits_burst = NastiRouter_1_io_slave_1_aw_bits_burst;
  assign io_slaves_1_aw_bits_lock = NastiRouter_1_io_slave_1_aw_bits_lock;
  assign io_slaves_1_aw_bits_cache = NastiRouter_1_io_slave_1_aw_bits_cache;
  assign io_slaves_1_aw_bits_prot = NastiRouter_1_io_slave_1_aw_bits_prot;
  assign io_slaves_1_aw_bits_qos = NastiRouter_1_io_slave_1_aw_bits_qos;
  assign io_slaves_1_aw_bits_region = NastiRouter_1_io_slave_1_aw_bits_region;
  assign io_slaves_1_aw_bits_id = NastiRouter_1_io_slave_1_aw_bits_id;
  assign io_slaves_1_aw_bits_user = NastiRouter_1_io_slave_1_aw_bits_user;
  assign io_slaves_1_w_valid = NastiRouter_1_io_slave_1_w_valid;
  assign io_slaves_1_w_bits_data = NastiRouter_1_io_slave_1_w_bits_data;
  assign io_slaves_1_w_bits_last = NastiRouter_1_io_slave_1_w_bits_last;
  assign io_slaves_1_w_bits_id = NastiRouter_1_io_slave_1_w_bits_id;
  assign io_slaves_1_w_bits_strb = NastiRouter_1_io_slave_1_w_bits_strb;
  assign io_slaves_1_w_bits_user = NastiRouter_1_io_slave_1_w_bits_user;
  assign io_slaves_1_b_ready = NastiRouter_1_io_slave_1_b_ready;
  assign io_slaves_1_ar_valid = NastiRouter_1_io_slave_1_ar_valid;
  assign io_slaves_1_ar_bits_addr = NastiRouter_1_io_slave_1_ar_bits_addr;
  assign io_slaves_1_ar_bits_len = NastiRouter_1_io_slave_1_ar_bits_len;
  assign io_slaves_1_ar_bits_size = NastiRouter_1_io_slave_1_ar_bits_size;
  assign io_slaves_1_ar_bits_burst = NastiRouter_1_io_slave_1_ar_bits_burst;
  assign io_slaves_1_ar_bits_lock = NastiRouter_1_io_slave_1_ar_bits_lock;
  assign io_slaves_1_ar_bits_cache = NastiRouter_1_io_slave_1_ar_bits_cache;
  assign io_slaves_1_ar_bits_prot = NastiRouter_1_io_slave_1_ar_bits_prot;
  assign io_slaves_1_ar_bits_qos = NastiRouter_1_io_slave_1_ar_bits_qos;
  assign io_slaves_1_ar_bits_region = NastiRouter_1_io_slave_1_ar_bits_region;
  assign io_slaves_1_ar_bits_id = NastiRouter_1_io_slave_1_ar_bits_id;
  assign io_slaves_1_ar_bits_user = NastiRouter_1_io_slave_1_ar_bits_user;
  assign io_slaves_1_r_ready = NastiRouter_1_io_slave_1_r_ready;
  assign io_slaves_2_aw_valid = NastiRouter_1_io_slave_2_aw_valid;
  assign io_slaves_2_aw_bits_addr = NastiRouter_1_io_slave_2_aw_bits_addr;
  assign io_slaves_2_aw_bits_len = NastiRouter_1_io_slave_2_aw_bits_len;
  assign io_slaves_2_aw_bits_size = NastiRouter_1_io_slave_2_aw_bits_size;
  assign io_slaves_2_aw_bits_burst = NastiRouter_1_io_slave_2_aw_bits_burst;
  assign io_slaves_2_aw_bits_lock = NastiRouter_1_io_slave_2_aw_bits_lock;
  assign io_slaves_2_aw_bits_cache = NastiRouter_1_io_slave_2_aw_bits_cache;
  assign io_slaves_2_aw_bits_prot = NastiRouter_1_io_slave_2_aw_bits_prot;
  assign io_slaves_2_aw_bits_qos = NastiRouter_1_io_slave_2_aw_bits_qos;
  assign io_slaves_2_aw_bits_region = NastiRouter_1_io_slave_2_aw_bits_region;
  assign io_slaves_2_aw_bits_id = NastiRouter_1_io_slave_2_aw_bits_id;
  assign io_slaves_2_aw_bits_user = NastiRouter_1_io_slave_2_aw_bits_user;
  assign io_slaves_2_w_valid = NastiRouter_1_io_slave_2_w_valid;
  assign io_slaves_2_w_bits_data = NastiRouter_1_io_slave_2_w_bits_data;
  assign io_slaves_2_w_bits_last = NastiRouter_1_io_slave_2_w_bits_last;
  assign io_slaves_2_w_bits_id = NastiRouter_1_io_slave_2_w_bits_id;
  assign io_slaves_2_w_bits_strb = NastiRouter_1_io_slave_2_w_bits_strb;
  assign io_slaves_2_w_bits_user = NastiRouter_1_io_slave_2_w_bits_user;
  assign io_slaves_2_b_ready = NastiRouter_1_io_slave_2_b_ready;
  assign io_slaves_2_ar_valid = NastiRouter_1_io_slave_2_ar_valid;
  assign io_slaves_2_ar_bits_addr = NastiRouter_1_io_slave_2_ar_bits_addr;
  assign io_slaves_2_ar_bits_len = NastiRouter_1_io_slave_2_ar_bits_len;
  assign io_slaves_2_ar_bits_size = NastiRouter_1_io_slave_2_ar_bits_size;
  assign io_slaves_2_ar_bits_burst = NastiRouter_1_io_slave_2_ar_bits_burst;
  assign io_slaves_2_ar_bits_lock = NastiRouter_1_io_slave_2_ar_bits_lock;
  assign io_slaves_2_ar_bits_cache = NastiRouter_1_io_slave_2_ar_bits_cache;
  assign io_slaves_2_ar_bits_prot = NastiRouter_1_io_slave_2_ar_bits_prot;
  assign io_slaves_2_ar_bits_qos = NastiRouter_1_io_slave_2_ar_bits_qos;
  assign io_slaves_2_ar_bits_region = NastiRouter_1_io_slave_2_ar_bits_region;
  assign io_slaves_2_ar_bits_id = NastiRouter_1_io_slave_2_ar_bits_id;
  assign io_slaves_2_ar_bits_user = NastiRouter_1_io_slave_2_ar_bits_user;
  assign io_slaves_2_r_ready = NastiRouter_1_io_slave_2_r_ready;
  assign NastiRouter_1_clock = clock;
  assign NastiRouter_1_reset = reset;
  assign NastiRouter_1_io_master_aw_valid = io_masters_0_aw_valid;
  assign NastiRouter_1_io_master_aw_bits_addr = io_masters_0_aw_bits_addr;
  assign NastiRouter_1_io_master_aw_bits_len = io_masters_0_aw_bits_len;
  assign NastiRouter_1_io_master_aw_bits_size = io_masters_0_aw_bits_size;
  assign NastiRouter_1_io_master_aw_bits_burst = io_masters_0_aw_bits_burst;
  assign NastiRouter_1_io_master_aw_bits_lock = io_masters_0_aw_bits_lock;
  assign NastiRouter_1_io_master_aw_bits_cache = io_masters_0_aw_bits_cache;
  assign NastiRouter_1_io_master_aw_bits_prot = io_masters_0_aw_bits_prot;
  assign NastiRouter_1_io_master_aw_bits_qos = io_masters_0_aw_bits_qos;
  assign NastiRouter_1_io_master_aw_bits_region = io_masters_0_aw_bits_region;
  assign NastiRouter_1_io_master_aw_bits_id = io_masters_0_aw_bits_id;
  assign NastiRouter_1_io_master_aw_bits_user = io_masters_0_aw_bits_user;
  assign NastiRouter_1_io_master_w_valid = io_masters_0_w_valid;
  assign NastiRouter_1_io_master_w_bits_data = io_masters_0_w_bits_data;
  assign NastiRouter_1_io_master_w_bits_last = io_masters_0_w_bits_last;
  assign NastiRouter_1_io_master_w_bits_id = io_masters_0_w_bits_id;
  assign NastiRouter_1_io_master_w_bits_strb = io_masters_0_w_bits_strb;
  assign NastiRouter_1_io_master_w_bits_user = io_masters_0_w_bits_user;
  assign NastiRouter_1_io_master_b_ready = io_masters_0_b_ready;
  assign NastiRouter_1_io_master_ar_valid = io_masters_0_ar_valid;
  assign NastiRouter_1_io_master_ar_bits_addr = io_masters_0_ar_bits_addr;
  assign NastiRouter_1_io_master_ar_bits_len = io_masters_0_ar_bits_len;
  assign NastiRouter_1_io_master_ar_bits_size = io_masters_0_ar_bits_size;
  assign NastiRouter_1_io_master_ar_bits_burst = io_masters_0_ar_bits_burst;
  assign NastiRouter_1_io_master_ar_bits_lock = io_masters_0_ar_bits_lock;
  assign NastiRouter_1_io_master_ar_bits_cache = io_masters_0_ar_bits_cache;
  assign NastiRouter_1_io_master_ar_bits_prot = io_masters_0_ar_bits_prot;
  assign NastiRouter_1_io_master_ar_bits_qos = io_masters_0_ar_bits_qos;
  assign NastiRouter_1_io_master_ar_bits_region = io_masters_0_ar_bits_region;
  assign NastiRouter_1_io_master_ar_bits_id = io_masters_0_ar_bits_id;
  assign NastiRouter_1_io_master_ar_bits_user = io_masters_0_ar_bits_user;
  assign NastiRouter_1_io_master_r_ready = io_masters_0_r_ready;
  assign NastiRouter_1_io_slave_0_aw_ready = io_slaves_0_aw_ready;
  assign NastiRouter_1_io_slave_0_w_ready = io_slaves_0_w_ready;
  assign NastiRouter_1_io_slave_0_b_valid = io_slaves_0_b_valid;
  assign NastiRouter_1_io_slave_0_b_bits_resp = io_slaves_0_b_bits_resp;
  assign NastiRouter_1_io_slave_0_b_bits_id = io_slaves_0_b_bits_id;
  assign NastiRouter_1_io_slave_0_b_bits_user = io_slaves_0_b_bits_user;
  assign NastiRouter_1_io_slave_0_ar_ready = io_slaves_0_ar_ready;
  assign NastiRouter_1_io_slave_0_r_valid = io_slaves_0_r_valid;
  assign NastiRouter_1_io_slave_0_r_bits_resp = io_slaves_0_r_bits_resp;
  assign NastiRouter_1_io_slave_0_r_bits_data = io_slaves_0_r_bits_data;
  assign NastiRouter_1_io_slave_0_r_bits_last = io_slaves_0_r_bits_last;
  assign NastiRouter_1_io_slave_0_r_bits_id = io_slaves_0_r_bits_id;
  assign NastiRouter_1_io_slave_0_r_bits_user = io_slaves_0_r_bits_user;
  assign NastiRouter_1_io_slave_1_aw_ready = io_slaves_1_aw_ready;
  assign NastiRouter_1_io_slave_1_w_ready = io_slaves_1_w_ready;
  assign NastiRouter_1_io_slave_1_b_valid = io_slaves_1_b_valid;
  assign NastiRouter_1_io_slave_1_b_bits_resp = io_slaves_1_b_bits_resp;
  assign NastiRouter_1_io_slave_1_b_bits_id = io_slaves_1_b_bits_id;
  assign NastiRouter_1_io_slave_1_b_bits_user = io_slaves_1_b_bits_user;
  assign NastiRouter_1_io_slave_1_ar_ready = io_slaves_1_ar_ready;
  assign NastiRouter_1_io_slave_1_r_valid = io_slaves_1_r_valid;
  assign NastiRouter_1_io_slave_1_r_bits_resp = io_slaves_1_r_bits_resp;
  assign NastiRouter_1_io_slave_1_r_bits_data = io_slaves_1_r_bits_data;
  assign NastiRouter_1_io_slave_1_r_bits_last = io_slaves_1_r_bits_last;
  assign NastiRouter_1_io_slave_1_r_bits_id = io_slaves_1_r_bits_id;
  assign NastiRouter_1_io_slave_1_r_bits_user = io_slaves_1_r_bits_user;
  assign NastiRouter_1_io_slave_2_aw_ready = io_slaves_2_aw_ready;
  assign NastiRouter_1_io_slave_2_w_ready = io_slaves_2_w_ready;
  assign NastiRouter_1_io_slave_2_b_valid = io_slaves_2_b_valid;
  assign NastiRouter_1_io_slave_2_b_bits_resp = io_slaves_2_b_bits_resp;
  assign NastiRouter_1_io_slave_2_b_bits_id = io_slaves_2_b_bits_id;
  assign NastiRouter_1_io_slave_2_b_bits_user = io_slaves_2_b_bits_user;
  assign NastiRouter_1_io_slave_2_ar_ready = io_slaves_2_ar_ready;
  assign NastiRouter_1_io_slave_2_r_valid = io_slaves_2_r_valid;
  assign NastiRouter_1_io_slave_2_r_bits_resp = io_slaves_2_r_bits_resp;
  assign NastiRouter_1_io_slave_2_r_bits_data = io_slaves_2_r_bits_data;
  assign NastiRouter_1_io_slave_2_r_bits_last = io_slaves_2_r_bits_last;
  assign NastiRouter_1_io_slave_2_r_bits_id = io_slaves_2_r_bits_id;
  assign NastiRouter_1_io_slave_2_r_bits_user = io_slaves_2_r_bits_user;
endmodule
module NastiRecursiveInterconnect(
  input   clock,
  input   reset,
  output  io_masters_0_aw_ready,
  input   io_masters_0_aw_valid,
  input  [31:0] io_masters_0_aw_bits_addr,
  input  [7:0] io_masters_0_aw_bits_len,
  input  [2:0] io_masters_0_aw_bits_size,
  input  [1:0] io_masters_0_aw_bits_burst,
  input   io_masters_0_aw_bits_lock,
  input  [3:0] io_masters_0_aw_bits_cache,
  input  [2:0] io_masters_0_aw_bits_prot,
  input  [3:0] io_masters_0_aw_bits_qos,
  input  [3:0] io_masters_0_aw_bits_region,
  input  [11:0] io_masters_0_aw_bits_id,
  input   io_masters_0_aw_bits_user,
  output  io_masters_0_w_ready,
  input   io_masters_0_w_valid,
  input  [31:0] io_masters_0_w_bits_data,
  input   io_masters_0_w_bits_last,
  input  [11:0] io_masters_0_w_bits_id,
  input  [3:0] io_masters_0_w_bits_strb,
  input   io_masters_0_w_bits_user,
  input   io_masters_0_b_ready,
  output  io_masters_0_b_valid,
  output [1:0] io_masters_0_b_bits_resp,
  output [11:0] io_masters_0_b_bits_id,
  output  io_masters_0_b_bits_user,
  output  io_masters_0_ar_ready,
  input   io_masters_0_ar_valid,
  input  [31:0] io_masters_0_ar_bits_addr,
  input  [7:0] io_masters_0_ar_bits_len,
  input  [2:0] io_masters_0_ar_bits_size,
  input  [1:0] io_masters_0_ar_bits_burst,
  input   io_masters_0_ar_bits_lock,
  input  [3:0] io_masters_0_ar_bits_cache,
  input  [2:0] io_masters_0_ar_bits_prot,
  input  [3:0] io_masters_0_ar_bits_qos,
  input  [3:0] io_masters_0_ar_bits_region,
  input  [11:0] io_masters_0_ar_bits_id,
  input   io_masters_0_ar_bits_user,
  input   io_masters_0_r_ready,
  output  io_masters_0_r_valid,
  output [1:0] io_masters_0_r_bits_resp,
  output [31:0] io_masters_0_r_bits_data,
  output  io_masters_0_r_bits_last,
  output [11:0] io_masters_0_r_bits_id,
  output  io_masters_0_r_bits_user,
  input   io_slaves_0_aw_ready,
  output  io_slaves_0_aw_valid,
  output [31:0] io_slaves_0_aw_bits_addr,
  output [7:0] io_slaves_0_aw_bits_len,
  output [2:0] io_slaves_0_aw_bits_size,
  output [1:0] io_slaves_0_aw_bits_burst,
  output  io_slaves_0_aw_bits_lock,
  output [3:0] io_slaves_0_aw_bits_cache,
  output [2:0] io_slaves_0_aw_bits_prot,
  output [3:0] io_slaves_0_aw_bits_qos,
  output [3:0] io_slaves_0_aw_bits_region,
  output [11:0] io_slaves_0_aw_bits_id,
  output  io_slaves_0_aw_bits_user,
  input   io_slaves_0_w_ready,
  output  io_slaves_0_w_valid,
  output [31:0] io_slaves_0_w_bits_data,
  output  io_slaves_0_w_bits_last,
  output [11:0] io_slaves_0_w_bits_id,
  output [3:0] io_slaves_0_w_bits_strb,
  output  io_slaves_0_w_bits_user,
  output  io_slaves_0_b_ready,
  input   io_slaves_0_b_valid,
  input  [1:0] io_slaves_0_b_bits_resp,
  input  [11:0] io_slaves_0_b_bits_id,
  input   io_slaves_0_b_bits_user,
  input   io_slaves_0_ar_ready,
  output  io_slaves_0_ar_valid,
  output [31:0] io_slaves_0_ar_bits_addr,
  output [7:0] io_slaves_0_ar_bits_len,
  output [2:0] io_slaves_0_ar_bits_size,
  output [1:0] io_slaves_0_ar_bits_burst,
  output  io_slaves_0_ar_bits_lock,
  output [3:0] io_slaves_0_ar_bits_cache,
  output [2:0] io_slaves_0_ar_bits_prot,
  output [3:0] io_slaves_0_ar_bits_qos,
  output [3:0] io_slaves_0_ar_bits_region,
  output [11:0] io_slaves_0_ar_bits_id,
  output  io_slaves_0_ar_bits_user,
  output  io_slaves_0_r_ready,
  input   io_slaves_0_r_valid,
  input  [1:0] io_slaves_0_r_bits_resp,
  input  [31:0] io_slaves_0_r_bits_data,
  input   io_slaves_0_r_bits_last,
  input  [11:0] io_slaves_0_r_bits_id,
  input   io_slaves_0_r_bits_user,
  input   io_slaves_1_aw_ready,
  output  io_slaves_1_aw_valid,
  output [31:0] io_slaves_1_aw_bits_addr,
  output [7:0] io_slaves_1_aw_bits_len,
  output [2:0] io_slaves_1_aw_bits_size,
  output [1:0] io_slaves_1_aw_bits_burst,
  output  io_slaves_1_aw_bits_lock,
  output [3:0] io_slaves_1_aw_bits_cache,
  output [2:0] io_slaves_1_aw_bits_prot,
  output [3:0] io_slaves_1_aw_bits_qos,
  output [3:0] io_slaves_1_aw_bits_region,
  output [11:0] io_slaves_1_aw_bits_id,
  output  io_slaves_1_aw_bits_user,
  input   io_slaves_1_w_ready,
  output  io_slaves_1_w_valid,
  output [31:0] io_slaves_1_w_bits_data,
  output  io_slaves_1_w_bits_last,
  output [11:0] io_slaves_1_w_bits_id,
  output [3:0] io_slaves_1_w_bits_strb,
  output  io_slaves_1_w_bits_user,
  output  io_slaves_1_b_ready,
  input   io_slaves_1_b_valid,
  input  [1:0] io_slaves_1_b_bits_resp,
  input  [11:0] io_slaves_1_b_bits_id,
  input   io_slaves_1_b_bits_user,
  input   io_slaves_1_ar_ready,
  output  io_slaves_1_ar_valid,
  output [31:0] io_slaves_1_ar_bits_addr,
  output [7:0] io_slaves_1_ar_bits_len,
  output [2:0] io_slaves_1_ar_bits_size,
  output [1:0] io_slaves_1_ar_bits_burst,
  output  io_slaves_1_ar_bits_lock,
  output [3:0] io_slaves_1_ar_bits_cache,
  output [2:0] io_slaves_1_ar_bits_prot,
  output [3:0] io_slaves_1_ar_bits_qos,
  output [3:0] io_slaves_1_ar_bits_region,
  output [11:0] io_slaves_1_ar_bits_id,
  output  io_slaves_1_ar_bits_user,
  output  io_slaves_1_r_ready,
  input   io_slaves_1_r_valid,
  input  [1:0] io_slaves_1_r_bits_resp,
  input  [31:0] io_slaves_1_r_bits_data,
  input   io_slaves_1_r_bits_last,
  input  [11:0] io_slaves_1_r_bits_id,
  input   io_slaves_1_r_bits_user,
  input   io_slaves_2_aw_ready,
  output  io_slaves_2_aw_valid,
  output [31:0] io_slaves_2_aw_bits_addr,
  output [7:0] io_slaves_2_aw_bits_len,
  output [2:0] io_slaves_2_aw_bits_size,
  output [1:0] io_slaves_2_aw_bits_burst,
  output  io_slaves_2_aw_bits_lock,
  output [3:0] io_slaves_2_aw_bits_cache,
  output [2:0] io_slaves_2_aw_bits_prot,
  output [3:0] io_slaves_2_aw_bits_qos,
  output [3:0] io_slaves_2_aw_bits_region,
  output [11:0] io_slaves_2_aw_bits_id,
  output  io_slaves_2_aw_bits_user,
  input   io_slaves_2_w_ready,
  output  io_slaves_2_w_valid,
  output [31:0] io_slaves_2_w_bits_data,
  output  io_slaves_2_w_bits_last,
  output [11:0] io_slaves_2_w_bits_id,
  output [3:0] io_slaves_2_w_bits_strb,
  output  io_slaves_2_w_bits_user,
  output  io_slaves_2_b_ready,
  input   io_slaves_2_b_valid,
  input  [1:0] io_slaves_2_b_bits_resp,
  input  [11:0] io_slaves_2_b_bits_id,
  input   io_slaves_2_b_bits_user,
  input   io_slaves_2_ar_ready,
  output  io_slaves_2_ar_valid,
  output [31:0] io_slaves_2_ar_bits_addr,
  output [7:0] io_slaves_2_ar_bits_len,
  output [2:0] io_slaves_2_ar_bits_size,
  output [1:0] io_slaves_2_ar_bits_burst,
  output  io_slaves_2_ar_bits_lock,
  output [3:0] io_slaves_2_ar_bits_cache,
  output [2:0] io_slaves_2_ar_bits_prot,
  output [3:0] io_slaves_2_ar_bits_qos,
  output [3:0] io_slaves_2_ar_bits_region,
  output [11:0] io_slaves_2_ar_bits_id,
  output  io_slaves_2_ar_bits_user,
  output  io_slaves_2_r_ready,
  input   io_slaves_2_r_valid,
  input  [1:0] io_slaves_2_r_bits_resp,
  input  [31:0] io_slaves_2_r_bits_data,
  input   io_slaves_2_r_bits_last,
  input  [11:0] io_slaves_2_r_bits_id,
  input   io_slaves_2_r_bits_user
);
  wire  xbar_clock;
  wire  xbar_reset;
  wire  xbar_io_masters_0_aw_ready;
  wire  xbar_io_masters_0_aw_valid;
  wire [31:0] xbar_io_masters_0_aw_bits_addr;
  wire [7:0] xbar_io_masters_0_aw_bits_len;
  wire [2:0] xbar_io_masters_0_aw_bits_size;
  wire [1:0] xbar_io_masters_0_aw_bits_burst;
  wire  xbar_io_masters_0_aw_bits_lock;
  wire [3:0] xbar_io_masters_0_aw_bits_cache;
  wire [2:0] xbar_io_masters_0_aw_bits_prot;
  wire [3:0] xbar_io_masters_0_aw_bits_qos;
  wire [3:0] xbar_io_masters_0_aw_bits_region;
  wire [11:0] xbar_io_masters_0_aw_bits_id;
  wire  xbar_io_masters_0_aw_bits_user;
  wire  xbar_io_masters_0_w_ready;
  wire  xbar_io_masters_0_w_valid;
  wire [31:0] xbar_io_masters_0_w_bits_data;
  wire  xbar_io_masters_0_w_bits_last;
  wire [11:0] xbar_io_masters_0_w_bits_id;
  wire [3:0] xbar_io_masters_0_w_bits_strb;
  wire  xbar_io_masters_0_w_bits_user;
  wire  xbar_io_masters_0_b_ready;
  wire  xbar_io_masters_0_b_valid;
  wire [1:0] xbar_io_masters_0_b_bits_resp;
  wire [11:0] xbar_io_masters_0_b_bits_id;
  wire  xbar_io_masters_0_b_bits_user;
  wire  xbar_io_masters_0_ar_ready;
  wire  xbar_io_masters_0_ar_valid;
  wire [31:0] xbar_io_masters_0_ar_bits_addr;
  wire [7:0] xbar_io_masters_0_ar_bits_len;
  wire [2:0] xbar_io_masters_0_ar_bits_size;
  wire [1:0] xbar_io_masters_0_ar_bits_burst;
  wire  xbar_io_masters_0_ar_bits_lock;
  wire [3:0] xbar_io_masters_0_ar_bits_cache;
  wire [2:0] xbar_io_masters_0_ar_bits_prot;
  wire [3:0] xbar_io_masters_0_ar_bits_qos;
  wire [3:0] xbar_io_masters_0_ar_bits_region;
  wire [11:0] xbar_io_masters_0_ar_bits_id;
  wire  xbar_io_masters_0_ar_bits_user;
  wire  xbar_io_masters_0_r_ready;
  wire  xbar_io_masters_0_r_valid;
  wire [1:0] xbar_io_masters_0_r_bits_resp;
  wire [31:0] xbar_io_masters_0_r_bits_data;
  wire  xbar_io_masters_0_r_bits_last;
  wire [11:0] xbar_io_masters_0_r_bits_id;
  wire  xbar_io_masters_0_r_bits_user;
  wire  xbar_io_slaves_0_aw_ready;
  wire  xbar_io_slaves_0_aw_valid;
  wire [31:0] xbar_io_slaves_0_aw_bits_addr;
  wire [7:0] xbar_io_slaves_0_aw_bits_len;
  wire [2:0] xbar_io_slaves_0_aw_bits_size;
  wire [1:0] xbar_io_slaves_0_aw_bits_burst;
  wire  xbar_io_slaves_0_aw_bits_lock;
  wire [3:0] xbar_io_slaves_0_aw_bits_cache;
  wire [2:0] xbar_io_slaves_0_aw_bits_prot;
  wire [3:0] xbar_io_slaves_0_aw_bits_qos;
  wire [3:0] xbar_io_slaves_0_aw_bits_region;
  wire [11:0] xbar_io_slaves_0_aw_bits_id;
  wire  xbar_io_slaves_0_aw_bits_user;
  wire  xbar_io_slaves_0_w_ready;
  wire  xbar_io_slaves_0_w_valid;
  wire [31:0] xbar_io_slaves_0_w_bits_data;
  wire  xbar_io_slaves_0_w_bits_last;
  wire [11:0] xbar_io_slaves_0_w_bits_id;
  wire [3:0] xbar_io_slaves_0_w_bits_strb;
  wire  xbar_io_slaves_0_w_bits_user;
  wire  xbar_io_slaves_0_b_ready;
  wire  xbar_io_slaves_0_b_valid;
  wire [1:0] xbar_io_slaves_0_b_bits_resp;
  wire [11:0] xbar_io_slaves_0_b_bits_id;
  wire  xbar_io_slaves_0_b_bits_user;
  wire  xbar_io_slaves_0_ar_ready;
  wire  xbar_io_slaves_0_ar_valid;
  wire [31:0] xbar_io_slaves_0_ar_bits_addr;
  wire [7:0] xbar_io_slaves_0_ar_bits_len;
  wire [2:0] xbar_io_slaves_0_ar_bits_size;
  wire [1:0] xbar_io_slaves_0_ar_bits_burst;
  wire  xbar_io_slaves_0_ar_bits_lock;
  wire [3:0] xbar_io_slaves_0_ar_bits_cache;
  wire [2:0] xbar_io_slaves_0_ar_bits_prot;
  wire [3:0] xbar_io_slaves_0_ar_bits_qos;
  wire [3:0] xbar_io_slaves_0_ar_bits_region;
  wire [11:0] xbar_io_slaves_0_ar_bits_id;
  wire  xbar_io_slaves_0_ar_bits_user;
  wire  xbar_io_slaves_0_r_ready;
  wire  xbar_io_slaves_0_r_valid;
  wire [1:0] xbar_io_slaves_0_r_bits_resp;
  wire [31:0] xbar_io_slaves_0_r_bits_data;
  wire  xbar_io_slaves_0_r_bits_last;
  wire [11:0] xbar_io_slaves_0_r_bits_id;
  wire  xbar_io_slaves_0_r_bits_user;
  wire  xbar_io_slaves_1_aw_ready;
  wire  xbar_io_slaves_1_aw_valid;
  wire [31:0] xbar_io_slaves_1_aw_bits_addr;
  wire [7:0] xbar_io_slaves_1_aw_bits_len;
  wire [2:0] xbar_io_slaves_1_aw_bits_size;
  wire [1:0] xbar_io_slaves_1_aw_bits_burst;
  wire  xbar_io_slaves_1_aw_bits_lock;
  wire [3:0] xbar_io_slaves_1_aw_bits_cache;
  wire [2:0] xbar_io_slaves_1_aw_bits_prot;
  wire [3:0] xbar_io_slaves_1_aw_bits_qos;
  wire [3:0] xbar_io_slaves_1_aw_bits_region;
  wire [11:0] xbar_io_slaves_1_aw_bits_id;
  wire  xbar_io_slaves_1_aw_bits_user;
  wire  xbar_io_slaves_1_w_ready;
  wire  xbar_io_slaves_1_w_valid;
  wire [31:0] xbar_io_slaves_1_w_bits_data;
  wire  xbar_io_slaves_1_w_bits_last;
  wire [11:0] xbar_io_slaves_1_w_bits_id;
  wire [3:0] xbar_io_slaves_1_w_bits_strb;
  wire  xbar_io_slaves_1_w_bits_user;
  wire  xbar_io_slaves_1_b_ready;
  wire  xbar_io_slaves_1_b_valid;
  wire [1:0] xbar_io_slaves_1_b_bits_resp;
  wire [11:0] xbar_io_slaves_1_b_bits_id;
  wire  xbar_io_slaves_1_b_bits_user;
  wire  xbar_io_slaves_1_ar_ready;
  wire  xbar_io_slaves_1_ar_valid;
  wire [31:0] xbar_io_slaves_1_ar_bits_addr;
  wire [7:0] xbar_io_slaves_1_ar_bits_len;
  wire [2:0] xbar_io_slaves_1_ar_bits_size;
  wire [1:0] xbar_io_slaves_1_ar_bits_burst;
  wire  xbar_io_slaves_1_ar_bits_lock;
  wire [3:0] xbar_io_slaves_1_ar_bits_cache;
  wire [2:0] xbar_io_slaves_1_ar_bits_prot;
  wire [3:0] xbar_io_slaves_1_ar_bits_qos;
  wire [3:0] xbar_io_slaves_1_ar_bits_region;
  wire [11:0] xbar_io_slaves_1_ar_bits_id;
  wire  xbar_io_slaves_1_ar_bits_user;
  wire  xbar_io_slaves_1_r_ready;
  wire  xbar_io_slaves_1_r_valid;
  wire [1:0] xbar_io_slaves_1_r_bits_resp;
  wire [31:0] xbar_io_slaves_1_r_bits_data;
  wire  xbar_io_slaves_1_r_bits_last;
  wire [11:0] xbar_io_slaves_1_r_bits_id;
  wire  xbar_io_slaves_1_r_bits_user;
  wire  xbar_io_slaves_2_aw_ready;
  wire  xbar_io_slaves_2_aw_valid;
  wire [31:0] xbar_io_slaves_2_aw_bits_addr;
  wire [7:0] xbar_io_slaves_2_aw_bits_len;
  wire [2:0] xbar_io_slaves_2_aw_bits_size;
  wire [1:0] xbar_io_slaves_2_aw_bits_burst;
  wire  xbar_io_slaves_2_aw_bits_lock;
  wire [3:0] xbar_io_slaves_2_aw_bits_cache;
  wire [2:0] xbar_io_slaves_2_aw_bits_prot;
  wire [3:0] xbar_io_slaves_2_aw_bits_qos;
  wire [3:0] xbar_io_slaves_2_aw_bits_region;
  wire [11:0] xbar_io_slaves_2_aw_bits_id;
  wire  xbar_io_slaves_2_aw_bits_user;
  wire  xbar_io_slaves_2_w_ready;
  wire  xbar_io_slaves_2_w_valid;
  wire [31:0] xbar_io_slaves_2_w_bits_data;
  wire  xbar_io_slaves_2_w_bits_last;
  wire [11:0] xbar_io_slaves_2_w_bits_id;
  wire [3:0] xbar_io_slaves_2_w_bits_strb;
  wire  xbar_io_slaves_2_w_bits_user;
  wire  xbar_io_slaves_2_b_ready;
  wire  xbar_io_slaves_2_b_valid;
  wire [1:0] xbar_io_slaves_2_b_bits_resp;
  wire [11:0] xbar_io_slaves_2_b_bits_id;
  wire  xbar_io_slaves_2_b_bits_user;
  wire  xbar_io_slaves_2_ar_ready;
  wire  xbar_io_slaves_2_ar_valid;
  wire [31:0] xbar_io_slaves_2_ar_bits_addr;
  wire [7:0] xbar_io_slaves_2_ar_bits_len;
  wire [2:0] xbar_io_slaves_2_ar_bits_size;
  wire [1:0] xbar_io_slaves_2_ar_bits_burst;
  wire  xbar_io_slaves_2_ar_bits_lock;
  wire [3:0] xbar_io_slaves_2_ar_bits_cache;
  wire [2:0] xbar_io_slaves_2_ar_bits_prot;
  wire [3:0] xbar_io_slaves_2_ar_bits_qos;
  wire [3:0] xbar_io_slaves_2_ar_bits_region;
  wire [11:0] xbar_io_slaves_2_ar_bits_id;
  wire  xbar_io_slaves_2_ar_bits_user;
  wire  xbar_io_slaves_2_r_ready;
  wire  xbar_io_slaves_2_r_valid;
  wire [1:0] xbar_io_slaves_2_r_bits_resp;
  wire [31:0] xbar_io_slaves_2_r_bits_data;
  wire  xbar_io_slaves_2_r_bits_last;
  wire [11:0] xbar_io_slaves_2_r_bits_id;
  wire  xbar_io_slaves_2_r_bits_user;
  NastiCrossbar xbar (
    .clock(xbar_clock),
    .reset(xbar_reset),
    .io_masters_0_aw_ready(xbar_io_masters_0_aw_ready),
    .io_masters_0_aw_valid(xbar_io_masters_0_aw_valid),
    .io_masters_0_aw_bits_addr(xbar_io_masters_0_aw_bits_addr),
    .io_masters_0_aw_bits_len(xbar_io_masters_0_aw_bits_len),
    .io_masters_0_aw_bits_size(xbar_io_masters_0_aw_bits_size),
    .io_masters_0_aw_bits_burst(xbar_io_masters_0_aw_bits_burst),
    .io_masters_0_aw_bits_lock(xbar_io_masters_0_aw_bits_lock),
    .io_masters_0_aw_bits_cache(xbar_io_masters_0_aw_bits_cache),
    .io_masters_0_aw_bits_prot(xbar_io_masters_0_aw_bits_prot),
    .io_masters_0_aw_bits_qos(xbar_io_masters_0_aw_bits_qos),
    .io_masters_0_aw_bits_region(xbar_io_masters_0_aw_bits_region),
    .io_masters_0_aw_bits_id(xbar_io_masters_0_aw_bits_id),
    .io_masters_0_aw_bits_user(xbar_io_masters_0_aw_bits_user),
    .io_masters_0_w_ready(xbar_io_masters_0_w_ready),
    .io_masters_0_w_valid(xbar_io_masters_0_w_valid),
    .io_masters_0_w_bits_data(xbar_io_masters_0_w_bits_data),
    .io_masters_0_w_bits_last(xbar_io_masters_0_w_bits_last),
    .io_masters_0_w_bits_id(xbar_io_masters_0_w_bits_id),
    .io_masters_0_w_bits_strb(xbar_io_masters_0_w_bits_strb),
    .io_masters_0_w_bits_user(xbar_io_masters_0_w_bits_user),
    .io_masters_0_b_ready(xbar_io_masters_0_b_ready),
    .io_masters_0_b_valid(xbar_io_masters_0_b_valid),
    .io_masters_0_b_bits_resp(xbar_io_masters_0_b_bits_resp),
    .io_masters_0_b_bits_id(xbar_io_masters_0_b_bits_id),
    .io_masters_0_b_bits_user(xbar_io_masters_0_b_bits_user),
    .io_masters_0_ar_ready(xbar_io_masters_0_ar_ready),
    .io_masters_0_ar_valid(xbar_io_masters_0_ar_valid),
    .io_masters_0_ar_bits_addr(xbar_io_masters_0_ar_bits_addr),
    .io_masters_0_ar_bits_len(xbar_io_masters_0_ar_bits_len),
    .io_masters_0_ar_bits_size(xbar_io_masters_0_ar_bits_size),
    .io_masters_0_ar_bits_burst(xbar_io_masters_0_ar_bits_burst),
    .io_masters_0_ar_bits_lock(xbar_io_masters_0_ar_bits_lock),
    .io_masters_0_ar_bits_cache(xbar_io_masters_0_ar_bits_cache),
    .io_masters_0_ar_bits_prot(xbar_io_masters_0_ar_bits_prot),
    .io_masters_0_ar_bits_qos(xbar_io_masters_0_ar_bits_qos),
    .io_masters_0_ar_bits_region(xbar_io_masters_0_ar_bits_region),
    .io_masters_0_ar_bits_id(xbar_io_masters_0_ar_bits_id),
    .io_masters_0_ar_bits_user(xbar_io_masters_0_ar_bits_user),
    .io_masters_0_r_ready(xbar_io_masters_0_r_ready),
    .io_masters_0_r_valid(xbar_io_masters_0_r_valid),
    .io_masters_0_r_bits_resp(xbar_io_masters_0_r_bits_resp),
    .io_masters_0_r_bits_data(xbar_io_masters_0_r_bits_data),
    .io_masters_0_r_bits_last(xbar_io_masters_0_r_bits_last),
    .io_masters_0_r_bits_id(xbar_io_masters_0_r_bits_id),
    .io_masters_0_r_bits_user(xbar_io_masters_0_r_bits_user),
    .io_slaves_0_aw_ready(xbar_io_slaves_0_aw_ready),
    .io_slaves_0_aw_valid(xbar_io_slaves_0_aw_valid),
    .io_slaves_0_aw_bits_addr(xbar_io_slaves_0_aw_bits_addr),
    .io_slaves_0_aw_bits_len(xbar_io_slaves_0_aw_bits_len),
    .io_slaves_0_aw_bits_size(xbar_io_slaves_0_aw_bits_size),
    .io_slaves_0_aw_bits_burst(xbar_io_slaves_0_aw_bits_burst),
    .io_slaves_0_aw_bits_lock(xbar_io_slaves_0_aw_bits_lock),
    .io_slaves_0_aw_bits_cache(xbar_io_slaves_0_aw_bits_cache),
    .io_slaves_0_aw_bits_prot(xbar_io_slaves_0_aw_bits_prot),
    .io_slaves_0_aw_bits_qos(xbar_io_slaves_0_aw_bits_qos),
    .io_slaves_0_aw_bits_region(xbar_io_slaves_0_aw_bits_region),
    .io_slaves_0_aw_bits_id(xbar_io_slaves_0_aw_bits_id),
    .io_slaves_0_aw_bits_user(xbar_io_slaves_0_aw_bits_user),
    .io_slaves_0_w_ready(xbar_io_slaves_0_w_ready),
    .io_slaves_0_w_valid(xbar_io_slaves_0_w_valid),
    .io_slaves_0_w_bits_data(xbar_io_slaves_0_w_bits_data),
    .io_slaves_0_w_bits_last(xbar_io_slaves_0_w_bits_last),
    .io_slaves_0_w_bits_id(xbar_io_slaves_0_w_bits_id),
    .io_slaves_0_w_bits_strb(xbar_io_slaves_0_w_bits_strb),
    .io_slaves_0_w_bits_user(xbar_io_slaves_0_w_bits_user),
    .io_slaves_0_b_ready(xbar_io_slaves_0_b_ready),
    .io_slaves_0_b_valid(xbar_io_slaves_0_b_valid),
    .io_slaves_0_b_bits_resp(xbar_io_slaves_0_b_bits_resp),
    .io_slaves_0_b_bits_id(xbar_io_slaves_0_b_bits_id),
    .io_slaves_0_b_bits_user(xbar_io_slaves_0_b_bits_user),
    .io_slaves_0_ar_ready(xbar_io_slaves_0_ar_ready),
    .io_slaves_0_ar_valid(xbar_io_slaves_0_ar_valid),
    .io_slaves_0_ar_bits_addr(xbar_io_slaves_0_ar_bits_addr),
    .io_slaves_0_ar_bits_len(xbar_io_slaves_0_ar_bits_len),
    .io_slaves_0_ar_bits_size(xbar_io_slaves_0_ar_bits_size),
    .io_slaves_0_ar_bits_burst(xbar_io_slaves_0_ar_bits_burst),
    .io_slaves_0_ar_bits_lock(xbar_io_slaves_0_ar_bits_lock),
    .io_slaves_0_ar_bits_cache(xbar_io_slaves_0_ar_bits_cache),
    .io_slaves_0_ar_bits_prot(xbar_io_slaves_0_ar_bits_prot),
    .io_slaves_0_ar_bits_qos(xbar_io_slaves_0_ar_bits_qos),
    .io_slaves_0_ar_bits_region(xbar_io_slaves_0_ar_bits_region),
    .io_slaves_0_ar_bits_id(xbar_io_slaves_0_ar_bits_id),
    .io_slaves_0_ar_bits_user(xbar_io_slaves_0_ar_bits_user),
    .io_slaves_0_r_ready(xbar_io_slaves_0_r_ready),
    .io_slaves_0_r_valid(xbar_io_slaves_0_r_valid),
    .io_slaves_0_r_bits_resp(xbar_io_slaves_0_r_bits_resp),
    .io_slaves_0_r_bits_data(xbar_io_slaves_0_r_bits_data),
    .io_slaves_0_r_bits_last(xbar_io_slaves_0_r_bits_last),
    .io_slaves_0_r_bits_id(xbar_io_slaves_0_r_bits_id),
    .io_slaves_0_r_bits_user(xbar_io_slaves_0_r_bits_user),
    .io_slaves_1_aw_ready(xbar_io_slaves_1_aw_ready),
    .io_slaves_1_aw_valid(xbar_io_slaves_1_aw_valid),
    .io_slaves_1_aw_bits_addr(xbar_io_slaves_1_aw_bits_addr),
    .io_slaves_1_aw_bits_len(xbar_io_slaves_1_aw_bits_len),
    .io_slaves_1_aw_bits_size(xbar_io_slaves_1_aw_bits_size),
    .io_slaves_1_aw_bits_burst(xbar_io_slaves_1_aw_bits_burst),
    .io_slaves_1_aw_bits_lock(xbar_io_slaves_1_aw_bits_lock),
    .io_slaves_1_aw_bits_cache(xbar_io_slaves_1_aw_bits_cache),
    .io_slaves_1_aw_bits_prot(xbar_io_slaves_1_aw_bits_prot),
    .io_slaves_1_aw_bits_qos(xbar_io_slaves_1_aw_bits_qos),
    .io_slaves_1_aw_bits_region(xbar_io_slaves_1_aw_bits_region),
    .io_slaves_1_aw_bits_id(xbar_io_slaves_1_aw_bits_id),
    .io_slaves_1_aw_bits_user(xbar_io_slaves_1_aw_bits_user),
    .io_slaves_1_w_ready(xbar_io_slaves_1_w_ready),
    .io_slaves_1_w_valid(xbar_io_slaves_1_w_valid),
    .io_slaves_1_w_bits_data(xbar_io_slaves_1_w_bits_data),
    .io_slaves_1_w_bits_last(xbar_io_slaves_1_w_bits_last),
    .io_slaves_1_w_bits_id(xbar_io_slaves_1_w_bits_id),
    .io_slaves_1_w_bits_strb(xbar_io_slaves_1_w_bits_strb),
    .io_slaves_1_w_bits_user(xbar_io_slaves_1_w_bits_user),
    .io_slaves_1_b_ready(xbar_io_slaves_1_b_ready),
    .io_slaves_1_b_valid(xbar_io_slaves_1_b_valid),
    .io_slaves_1_b_bits_resp(xbar_io_slaves_1_b_bits_resp),
    .io_slaves_1_b_bits_id(xbar_io_slaves_1_b_bits_id),
    .io_slaves_1_b_bits_user(xbar_io_slaves_1_b_bits_user),
    .io_slaves_1_ar_ready(xbar_io_slaves_1_ar_ready),
    .io_slaves_1_ar_valid(xbar_io_slaves_1_ar_valid),
    .io_slaves_1_ar_bits_addr(xbar_io_slaves_1_ar_bits_addr),
    .io_slaves_1_ar_bits_len(xbar_io_slaves_1_ar_bits_len),
    .io_slaves_1_ar_bits_size(xbar_io_slaves_1_ar_bits_size),
    .io_slaves_1_ar_bits_burst(xbar_io_slaves_1_ar_bits_burst),
    .io_slaves_1_ar_bits_lock(xbar_io_slaves_1_ar_bits_lock),
    .io_slaves_1_ar_bits_cache(xbar_io_slaves_1_ar_bits_cache),
    .io_slaves_1_ar_bits_prot(xbar_io_slaves_1_ar_bits_prot),
    .io_slaves_1_ar_bits_qos(xbar_io_slaves_1_ar_bits_qos),
    .io_slaves_1_ar_bits_region(xbar_io_slaves_1_ar_bits_region),
    .io_slaves_1_ar_bits_id(xbar_io_slaves_1_ar_bits_id),
    .io_slaves_1_ar_bits_user(xbar_io_slaves_1_ar_bits_user),
    .io_slaves_1_r_ready(xbar_io_slaves_1_r_ready),
    .io_slaves_1_r_valid(xbar_io_slaves_1_r_valid),
    .io_slaves_1_r_bits_resp(xbar_io_slaves_1_r_bits_resp),
    .io_slaves_1_r_bits_data(xbar_io_slaves_1_r_bits_data),
    .io_slaves_1_r_bits_last(xbar_io_slaves_1_r_bits_last),
    .io_slaves_1_r_bits_id(xbar_io_slaves_1_r_bits_id),
    .io_slaves_1_r_bits_user(xbar_io_slaves_1_r_bits_user),
    .io_slaves_2_aw_ready(xbar_io_slaves_2_aw_ready),
    .io_slaves_2_aw_valid(xbar_io_slaves_2_aw_valid),
    .io_slaves_2_aw_bits_addr(xbar_io_slaves_2_aw_bits_addr),
    .io_slaves_2_aw_bits_len(xbar_io_slaves_2_aw_bits_len),
    .io_slaves_2_aw_bits_size(xbar_io_slaves_2_aw_bits_size),
    .io_slaves_2_aw_bits_burst(xbar_io_slaves_2_aw_bits_burst),
    .io_slaves_2_aw_bits_lock(xbar_io_slaves_2_aw_bits_lock),
    .io_slaves_2_aw_bits_cache(xbar_io_slaves_2_aw_bits_cache),
    .io_slaves_2_aw_bits_prot(xbar_io_slaves_2_aw_bits_prot),
    .io_slaves_2_aw_bits_qos(xbar_io_slaves_2_aw_bits_qos),
    .io_slaves_2_aw_bits_region(xbar_io_slaves_2_aw_bits_region),
    .io_slaves_2_aw_bits_id(xbar_io_slaves_2_aw_bits_id),
    .io_slaves_2_aw_bits_user(xbar_io_slaves_2_aw_bits_user),
    .io_slaves_2_w_ready(xbar_io_slaves_2_w_ready),
    .io_slaves_2_w_valid(xbar_io_slaves_2_w_valid),
    .io_slaves_2_w_bits_data(xbar_io_slaves_2_w_bits_data),
    .io_slaves_2_w_bits_last(xbar_io_slaves_2_w_bits_last),
    .io_slaves_2_w_bits_id(xbar_io_slaves_2_w_bits_id),
    .io_slaves_2_w_bits_strb(xbar_io_slaves_2_w_bits_strb),
    .io_slaves_2_w_bits_user(xbar_io_slaves_2_w_bits_user),
    .io_slaves_2_b_ready(xbar_io_slaves_2_b_ready),
    .io_slaves_2_b_valid(xbar_io_slaves_2_b_valid),
    .io_slaves_2_b_bits_resp(xbar_io_slaves_2_b_bits_resp),
    .io_slaves_2_b_bits_id(xbar_io_slaves_2_b_bits_id),
    .io_slaves_2_b_bits_user(xbar_io_slaves_2_b_bits_user),
    .io_slaves_2_ar_ready(xbar_io_slaves_2_ar_ready),
    .io_slaves_2_ar_valid(xbar_io_slaves_2_ar_valid),
    .io_slaves_2_ar_bits_addr(xbar_io_slaves_2_ar_bits_addr),
    .io_slaves_2_ar_bits_len(xbar_io_slaves_2_ar_bits_len),
    .io_slaves_2_ar_bits_size(xbar_io_slaves_2_ar_bits_size),
    .io_slaves_2_ar_bits_burst(xbar_io_slaves_2_ar_bits_burst),
    .io_slaves_2_ar_bits_lock(xbar_io_slaves_2_ar_bits_lock),
    .io_slaves_2_ar_bits_cache(xbar_io_slaves_2_ar_bits_cache),
    .io_slaves_2_ar_bits_prot(xbar_io_slaves_2_ar_bits_prot),
    .io_slaves_2_ar_bits_qos(xbar_io_slaves_2_ar_bits_qos),
    .io_slaves_2_ar_bits_region(xbar_io_slaves_2_ar_bits_region),
    .io_slaves_2_ar_bits_id(xbar_io_slaves_2_ar_bits_id),
    .io_slaves_2_ar_bits_user(xbar_io_slaves_2_ar_bits_user),
    .io_slaves_2_r_ready(xbar_io_slaves_2_r_ready),
    .io_slaves_2_r_valid(xbar_io_slaves_2_r_valid),
    .io_slaves_2_r_bits_resp(xbar_io_slaves_2_r_bits_resp),
    .io_slaves_2_r_bits_data(xbar_io_slaves_2_r_bits_data),
    .io_slaves_2_r_bits_last(xbar_io_slaves_2_r_bits_last),
    .io_slaves_2_r_bits_id(xbar_io_slaves_2_r_bits_id),
    .io_slaves_2_r_bits_user(xbar_io_slaves_2_r_bits_user)
  );
  assign io_masters_0_aw_ready = xbar_io_masters_0_aw_ready;
  assign io_masters_0_w_ready = xbar_io_masters_0_w_ready;
  assign io_masters_0_b_valid = xbar_io_masters_0_b_valid;
  assign io_masters_0_b_bits_resp = xbar_io_masters_0_b_bits_resp;
  assign io_masters_0_b_bits_id = xbar_io_masters_0_b_bits_id;
  assign io_masters_0_b_bits_user = xbar_io_masters_0_b_bits_user;
  assign io_masters_0_ar_ready = xbar_io_masters_0_ar_ready;
  assign io_masters_0_r_valid = xbar_io_masters_0_r_valid;
  assign io_masters_0_r_bits_resp = xbar_io_masters_0_r_bits_resp;
  assign io_masters_0_r_bits_data = xbar_io_masters_0_r_bits_data;
  assign io_masters_0_r_bits_last = xbar_io_masters_0_r_bits_last;
  assign io_masters_0_r_bits_id = xbar_io_masters_0_r_bits_id;
  assign io_masters_0_r_bits_user = xbar_io_masters_0_r_bits_user;
  assign io_slaves_0_aw_valid = xbar_io_slaves_0_aw_valid;
  assign io_slaves_0_aw_bits_addr = xbar_io_slaves_0_aw_bits_addr;
  assign io_slaves_0_aw_bits_len = xbar_io_slaves_0_aw_bits_len;
  assign io_slaves_0_aw_bits_size = xbar_io_slaves_0_aw_bits_size;
  assign io_slaves_0_aw_bits_burst = xbar_io_slaves_0_aw_bits_burst;
  assign io_slaves_0_aw_bits_lock = xbar_io_slaves_0_aw_bits_lock;
  assign io_slaves_0_aw_bits_cache = xbar_io_slaves_0_aw_bits_cache;
  assign io_slaves_0_aw_bits_prot = xbar_io_slaves_0_aw_bits_prot;
  assign io_slaves_0_aw_bits_qos = xbar_io_slaves_0_aw_bits_qos;
  assign io_slaves_0_aw_bits_region = xbar_io_slaves_0_aw_bits_region;
  assign io_slaves_0_aw_bits_id = xbar_io_slaves_0_aw_bits_id;
  assign io_slaves_0_aw_bits_user = xbar_io_slaves_0_aw_bits_user;
  assign io_slaves_0_w_valid = xbar_io_slaves_0_w_valid;
  assign io_slaves_0_w_bits_data = xbar_io_slaves_0_w_bits_data;
  assign io_slaves_0_w_bits_last = xbar_io_slaves_0_w_bits_last;
  assign io_slaves_0_w_bits_id = xbar_io_slaves_0_w_bits_id;
  assign io_slaves_0_w_bits_strb = xbar_io_slaves_0_w_bits_strb;
  assign io_slaves_0_w_bits_user = xbar_io_slaves_0_w_bits_user;
  assign io_slaves_0_b_ready = xbar_io_slaves_0_b_ready;
  assign io_slaves_0_ar_valid = xbar_io_slaves_0_ar_valid;
  assign io_slaves_0_ar_bits_addr = xbar_io_slaves_0_ar_bits_addr;
  assign io_slaves_0_ar_bits_len = xbar_io_slaves_0_ar_bits_len;
  assign io_slaves_0_ar_bits_size = xbar_io_slaves_0_ar_bits_size;
  assign io_slaves_0_ar_bits_burst = xbar_io_slaves_0_ar_bits_burst;
  assign io_slaves_0_ar_bits_lock = xbar_io_slaves_0_ar_bits_lock;
  assign io_slaves_0_ar_bits_cache = xbar_io_slaves_0_ar_bits_cache;
  assign io_slaves_0_ar_bits_prot = xbar_io_slaves_0_ar_bits_prot;
  assign io_slaves_0_ar_bits_qos = xbar_io_slaves_0_ar_bits_qos;
  assign io_slaves_0_ar_bits_region = xbar_io_slaves_0_ar_bits_region;
  assign io_slaves_0_ar_bits_id = xbar_io_slaves_0_ar_bits_id;
  assign io_slaves_0_ar_bits_user = xbar_io_slaves_0_ar_bits_user;
  assign io_slaves_0_r_ready = xbar_io_slaves_0_r_ready;
  assign io_slaves_1_aw_valid = xbar_io_slaves_1_aw_valid;
  assign io_slaves_1_aw_bits_addr = xbar_io_slaves_1_aw_bits_addr;
  assign io_slaves_1_aw_bits_len = xbar_io_slaves_1_aw_bits_len;
  assign io_slaves_1_aw_bits_size = xbar_io_slaves_1_aw_bits_size;
  assign io_slaves_1_aw_bits_burst = xbar_io_slaves_1_aw_bits_burst;
  assign io_slaves_1_aw_bits_lock = xbar_io_slaves_1_aw_bits_lock;
  assign io_slaves_1_aw_bits_cache = xbar_io_slaves_1_aw_bits_cache;
  assign io_slaves_1_aw_bits_prot = xbar_io_slaves_1_aw_bits_prot;
  assign io_slaves_1_aw_bits_qos = xbar_io_slaves_1_aw_bits_qos;
  assign io_slaves_1_aw_bits_region = xbar_io_slaves_1_aw_bits_region;
  assign io_slaves_1_aw_bits_id = xbar_io_slaves_1_aw_bits_id;
  assign io_slaves_1_aw_bits_user = xbar_io_slaves_1_aw_bits_user;
  assign io_slaves_1_w_valid = xbar_io_slaves_1_w_valid;
  assign io_slaves_1_w_bits_data = xbar_io_slaves_1_w_bits_data;
  assign io_slaves_1_w_bits_last = xbar_io_slaves_1_w_bits_last;
  assign io_slaves_1_w_bits_id = xbar_io_slaves_1_w_bits_id;
  assign io_slaves_1_w_bits_strb = xbar_io_slaves_1_w_bits_strb;
  assign io_slaves_1_w_bits_user = xbar_io_slaves_1_w_bits_user;
  assign io_slaves_1_b_ready = xbar_io_slaves_1_b_ready;
  assign io_slaves_1_ar_valid = xbar_io_slaves_1_ar_valid;
  assign io_slaves_1_ar_bits_addr = xbar_io_slaves_1_ar_bits_addr;
  assign io_slaves_1_ar_bits_len = xbar_io_slaves_1_ar_bits_len;
  assign io_slaves_1_ar_bits_size = xbar_io_slaves_1_ar_bits_size;
  assign io_slaves_1_ar_bits_burst = xbar_io_slaves_1_ar_bits_burst;
  assign io_slaves_1_ar_bits_lock = xbar_io_slaves_1_ar_bits_lock;
  assign io_slaves_1_ar_bits_cache = xbar_io_slaves_1_ar_bits_cache;
  assign io_slaves_1_ar_bits_prot = xbar_io_slaves_1_ar_bits_prot;
  assign io_slaves_1_ar_bits_qos = xbar_io_slaves_1_ar_bits_qos;
  assign io_slaves_1_ar_bits_region = xbar_io_slaves_1_ar_bits_region;
  assign io_slaves_1_ar_bits_id = xbar_io_slaves_1_ar_bits_id;
  assign io_slaves_1_ar_bits_user = xbar_io_slaves_1_ar_bits_user;
  assign io_slaves_1_r_ready = xbar_io_slaves_1_r_ready;
  assign io_slaves_2_aw_valid = xbar_io_slaves_2_aw_valid;
  assign io_slaves_2_aw_bits_addr = xbar_io_slaves_2_aw_bits_addr;
  assign io_slaves_2_aw_bits_len = xbar_io_slaves_2_aw_bits_len;
  assign io_slaves_2_aw_bits_size = xbar_io_slaves_2_aw_bits_size;
  assign io_slaves_2_aw_bits_burst = xbar_io_slaves_2_aw_bits_burst;
  assign io_slaves_2_aw_bits_lock = xbar_io_slaves_2_aw_bits_lock;
  assign io_slaves_2_aw_bits_cache = xbar_io_slaves_2_aw_bits_cache;
  assign io_slaves_2_aw_bits_prot = xbar_io_slaves_2_aw_bits_prot;
  assign io_slaves_2_aw_bits_qos = xbar_io_slaves_2_aw_bits_qos;
  assign io_slaves_2_aw_bits_region = xbar_io_slaves_2_aw_bits_region;
  assign io_slaves_2_aw_bits_id = xbar_io_slaves_2_aw_bits_id;
  assign io_slaves_2_aw_bits_user = xbar_io_slaves_2_aw_bits_user;
  assign io_slaves_2_w_valid = xbar_io_slaves_2_w_valid;
  assign io_slaves_2_w_bits_data = xbar_io_slaves_2_w_bits_data;
  assign io_slaves_2_w_bits_last = xbar_io_slaves_2_w_bits_last;
  assign io_slaves_2_w_bits_id = xbar_io_slaves_2_w_bits_id;
  assign io_slaves_2_w_bits_strb = xbar_io_slaves_2_w_bits_strb;
  assign io_slaves_2_w_bits_user = xbar_io_slaves_2_w_bits_user;
  assign io_slaves_2_b_ready = xbar_io_slaves_2_b_ready;
  assign io_slaves_2_ar_valid = xbar_io_slaves_2_ar_valid;
  assign io_slaves_2_ar_bits_addr = xbar_io_slaves_2_ar_bits_addr;
  assign io_slaves_2_ar_bits_len = xbar_io_slaves_2_ar_bits_len;
  assign io_slaves_2_ar_bits_size = xbar_io_slaves_2_ar_bits_size;
  assign io_slaves_2_ar_bits_burst = xbar_io_slaves_2_ar_bits_burst;
  assign io_slaves_2_ar_bits_lock = xbar_io_slaves_2_ar_bits_lock;
  assign io_slaves_2_ar_bits_cache = xbar_io_slaves_2_ar_bits_cache;
  assign io_slaves_2_ar_bits_prot = xbar_io_slaves_2_ar_bits_prot;
  assign io_slaves_2_ar_bits_qos = xbar_io_slaves_2_ar_bits_qos;
  assign io_slaves_2_ar_bits_region = xbar_io_slaves_2_ar_bits_region;
  assign io_slaves_2_ar_bits_id = xbar_io_slaves_2_ar_bits_id;
  assign io_slaves_2_ar_bits_user = xbar_io_slaves_2_ar_bits_user;
  assign io_slaves_2_r_ready = xbar_io_slaves_2_r_ready;
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_io_masters_0_aw_valid = io_masters_0_aw_valid;
  assign xbar_io_masters_0_aw_bits_addr = io_masters_0_aw_bits_addr;
  assign xbar_io_masters_0_aw_bits_len = io_masters_0_aw_bits_len;
  assign xbar_io_masters_0_aw_bits_size = io_masters_0_aw_bits_size;
  assign xbar_io_masters_0_aw_bits_burst = io_masters_0_aw_bits_burst;
  assign xbar_io_masters_0_aw_bits_lock = io_masters_0_aw_bits_lock;
  assign xbar_io_masters_0_aw_bits_cache = io_masters_0_aw_bits_cache;
  assign xbar_io_masters_0_aw_bits_prot = io_masters_0_aw_bits_prot;
  assign xbar_io_masters_0_aw_bits_qos = io_masters_0_aw_bits_qos;
  assign xbar_io_masters_0_aw_bits_region = io_masters_0_aw_bits_region;
  assign xbar_io_masters_0_aw_bits_id = io_masters_0_aw_bits_id;
  assign xbar_io_masters_0_aw_bits_user = io_masters_0_aw_bits_user;
  assign xbar_io_masters_0_w_valid = io_masters_0_w_valid;
  assign xbar_io_masters_0_w_bits_data = io_masters_0_w_bits_data;
  assign xbar_io_masters_0_w_bits_last = io_masters_0_w_bits_last;
  assign xbar_io_masters_0_w_bits_id = io_masters_0_w_bits_id;
  assign xbar_io_masters_0_w_bits_strb = io_masters_0_w_bits_strb;
  assign xbar_io_masters_0_w_bits_user = io_masters_0_w_bits_user;
  assign xbar_io_masters_0_b_ready = io_masters_0_b_ready;
  assign xbar_io_masters_0_ar_valid = io_masters_0_ar_valid;
  assign xbar_io_masters_0_ar_bits_addr = io_masters_0_ar_bits_addr;
  assign xbar_io_masters_0_ar_bits_len = io_masters_0_ar_bits_len;
  assign xbar_io_masters_0_ar_bits_size = io_masters_0_ar_bits_size;
  assign xbar_io_masters_0_ar_bits_burst = io_masters_0_ar_bits_burst;
  assign xbar_io_masters_0_ar_bits_lock = io_masters_0_ar_bits_lock;
  assign xbar_io_masters_0_ar_bits_cache = io_masters_0_ar_bits_cache;
  assign xbar_io_masters_0_ar_bits_prot = io_masters_0_ar_bits_prot;
  assign xbar_io_masters_0_ar_bits_qos = io_masters_0_ar_bits_qos;
  assign xbar_io_masters_0_ar_bits_region = io_masters_0_ar_bits_region;
  assign xbar_io_masters_0_ar_bits_id = io_masters_0_ar_bits_id;
  assign xbar_io_masters_0_ar_bits_user = io_masters_0_ar_bits_user;
  assign xbar_io_masters_0_r_ready = io_masters_0_r_ready;
  assign xbar_io_slaves_0_aw_ready = io_slaves_0_aw_ready;
  assign xbar_io_slaves_0_w_ready = io_slaves_0_w_ready;
  assign xbar_io_slaves_0_b_valid = io_slaves_0_b_valid;
  assign xbar_io_slaves_0_b_bits_resp = io_slaves_0_b_bits_resp;
  assign xbar_io_slaves_0_b_bits_id = io_slaves_0_b_bits_id;
  assign xbar_io_slaves_0_b_bits_user = io_slaves_0_b_bits_user;
  assign xbar_io_slaves_0_ar_ready = io_slaves_0_ar_ready;
  assign xbar_io_slaves_0_r_valid = io_slaves_0_r_valid;
  assign xbar_io_slaves_0_r_bits_resp = io_slaves_0_r_bits_resp;
  assign xbar_io_slaves_0_r_bits_data = io_slaves_0_r_bits_data;
  assign xbar_io_slaves_0_r_bits_last = io_slaves_0_r_bits_last;
  assign xbar_io_slaves_0_r_bits_id = io_slaves_0_r_bits_id;
  assign xbar_io_slaves_0_r_bits_user = io_slaves_0_r_bits_user;
  assign xbar_io_slaves_1_aw_ready = io_slaves_1_aw_ready;
  assign xbar_io_slaves_1_w_ready = io_slaves_1_w_ready;
  assign xbar_io_slaves_1_b_valid = io_slaves_1_b_valid;
  assign xbar_io_slaves_1_b_bits_resp = io_slaves_1_b_bits_resp;
  assign xbar_io_slaves_1_b_bits_id = io_slaves_1_b_bits_id;
  assign xbar_io_slaves_1_b_bits_user = io_slaves_1_b_bits_user;
  assign xbar_io_slaves_1_ar_ready = io_slaves_1_ar_ready;
  assign xbar_io_slaves_1_r_valid = io_slaves_1_r_valid;
  assign xbar_io_slaves_1_r_bits_resp = io_slaves_1_r_bits_resp;
  assign xbar_io_slaves_1_r_bits_data = io_slaves_1_r_bits_data;
  assign xbar_io_slaves_1_r_bits_last = io_slaves_1_r_bits_last;
  assign xbar_io_slaves_1_r_bits_id = io_slaves_1_r_bits_id;
  assign xbar_io_slaves_1_r_bits_user = io_slaves_1_r_bits_user;
  assign xbar_io_slaves_2_aw_ready = io_slaves_2_aw_ready;
  assign xbar_io_slaves_2_w_ready = io_slaves_2_w_ready;
  assign xbar_io_slaves_2_b_valid = io_slaves_2_b_valid;
  assign xbar_io_slaves_2_b_bits_resp = io_slaves_2_b_bits_resp;
  assign xbar_io_slaves_2_b_bits_id = io_slaves_2_b_bits_id;
  assign xbar_io_slaves_2_b_bits_user = io_slaves_2_b_bits_user;
  assign xbar_io_slaves_2_ar_ready = io_slaves_2_ar_ready;
  assign xbar_io_slaves_2_r_valid = io_slaves_2_r_valid;
  assign xbar_io_slaves_2_r_bits_resp = io_slaves_2_r_bits_resp;
  assign xbar_io_slaves_2_r_bits_data = io_slaves_2_r_bits_data;
  assign xbar_io_slaves_2_r_bits_last = io_slaves_2_r_bits_last;
  assign xbar_io_slaves_2_r_bits_id = io_slaves_2_r_bits_id;
  assign xbar_io_slaves_2_r_bits_user = io_slaves_2_r_bits_user;
endmodule
module ZynqShim(
  input   clock,
  input   reset,
  output  io_master_aw_ready,
  input   io_master_aw_valid,
  input  [31:0] io_master_aw_bits_addr,
  input  [7:0] io_master_aw_bits_len,
  input  [2:0] io_master_aw_bits_size,
  input  [1:0] io_master_aw_bits_burst,
  input   io_master_aw_bits_lock,
  input  [3:0] io_master_aw_bits_cache,
  input  [2:0] io_master_aw_bits_prot,
  input  [3:0] io_master_aw_bits_qos,
  input  [3:0] io_master_aw_bits_region,
  input  [11:0] io_master_aw_bits_id,
  input   io_master_aw_bits_user,
  output  io_master_w_ready,
  input   io_master_w_valid,
  input  [31:0] io_master_w_bits_data,
  input   io_master_w_bits_last,
  input  [11:0] io_master_w_bits_id,
  input  [3:0] io_master_w_bits_strb,
  input   io_master_w_bits_user,
  input   io_master_b_ready,
  output  io_master_b_valid,
  output [1:0] io_master_b_bits_resp,
  output [11:0] io_master_b_bits_id,
  output  io_master_b_bits_user,
  output  io_master_ar_ready,
  input   io_master_ar_valid,
  input  [31:0] io_master_ar_bits_addr,
  input  [7:0] io_master_ar_bits_len,
  input  [2:0] io_master_ar_bits_size,
  input  [1:0] io_master_ar_bits_burst,
  input   io_master_ar_bits_lock,
  input  [3:0] io_master_ar_bits_cache,
  input  [2:0] io_master_ar_bits_prot,
  input  [3:0] io_master_ar_bits_qos,
  input  [3:0] io_master_ar_bits_region,
  input  [11:0] io_master_ar_bits_id,
  input   io_master_ar_bits_user,
  input   io_master_r_ready,
  output  io_master_r_valid,
  output [1:0] io_master_r_bits_resp,
  output [31:0] io_master_r_bits_data,
  output  io_master_r_bits_last,
  output [11:0] io_master_r_bits_id,
  output  io_master_r_bits_user,
  input   io_slave_aw_ready,
  output  io_slave_aw_valid,
  output [31:0] io_slave_aw_bits_addr,
  output [7:0] io_slave_aw_bits_len,
  output [2:0] io_slave_aw_bits_size,
  output [1:0] io_slave_aw_bits_burst,
  output  io_slave_aw_bits_lock,
  output [3:0] io_slave_aw_bits_cache,
  output [2:0] io_slave_aw_bits_prot,
  output [3:0] io_slave_aw_bits_qos,
  output [3:0] io_slave_aw_bits_region,
  output [5:0] io_slave_aw_bits_id,
  output  io_slave_aw_bits_user,
  input   io_slave_w_ready,
  output  io_slave_w_valid,
  output [63:0] io_slave_w_bits_data,
  output  io_slave_w_bits_last,
  output [5:0] io_slave_w_bits_id,
  output [7:0] io_slave_w_bits_strb,
  output  io_slave_w_bits_user,
  output  io_slave_b_ready,
  input   io_slave_b_valid,
  input  [1:0] io_slave_b_bits_resp,
  input  [5:0] io_slave_b_bits_id,
  input   io_slave_b_bits_user,
  input   io_slave_ar_ready,
  output  io_slave_ar_valid,
  output [31:0] io_slave_ar_bits_addr,
  output [7:0] io_slave_ar_bits_len,
  output [2:0] io_slave_ar_bits_size,
  output [1:0] io_slave_ar_bits_burst,
  output  io_slave_ar_bits_lock,
  output [3:0] io_slave_ar_bits_cache,
  output [2:0] io_slave_ar_bits_prot,
  output [3:0] io_slave_ar_bits_qos,
  output [3:0] io_slave_ar_bits_region,
  output [5:0] io_slave_ar_bits_id,
  output  io_slave_ar_bits_user,
  output  io_slave_r_ready,
  input   io_slave_r_valid,
  input  [1:0] io_slave_r_bits_resp,
  input  [63:0] io_slave_r_bits_data,
  input   io_slave_r_bits_last,
  input  [5:0] io_slave_r_bits_id,
  input   io_slave_r_bits_user
);
  wire  sim_clock;
  wire  sim_reset;
  wire  sim_io_ins_0_ready;
  wire  sim_io_ins_0_valid;
  wire [31:0] sim_io_ins_0_bits;
  wire  sim_io_ins_1_ready;
  wire  sim_io_ins_1_valid;
  wire [31:0] sim_io_ins_1_bits;
  wire  sim_io_ins_2_ready;
  wire  sim_io_ins_2_valid;
  wire [31:0] sim_io_ins_2_bits;
  wire  sim_io_ins_3_ready;
  wire  sim_io_ins_3_valid;
  wire [31:0] sim_io_ins_3_bits;
  wire  sim_io_outs_0_ready;
  wire  sim_io_outs_0_valid;
  wire [31:0] sim_io_outs_0_bits;
  wire  sim_io_outs_1_ready;
  wire  sim_io_outs_1_valid;
  wire [31:0] sim_io_outs_1_bits;
  wire  sim_io_inT_0_ready;
  wire  sim_io_inT_0_valid;
  wire [31:0] sim_io_inT_0_bits;
  wire  sim_io_inT_1_ready;
  wire  sim_io_inT_1_valid;
  wire [31:0] sim_io_inT_1_bits;
  wire  sim_io_inT_2_ready;
  wire  sim_io_inT_2_valid;
  wire [31:0] sim_io_inT_2_bits;
  wire  sim_io_inT_3_ready;
  wire  sim_io_inT_3_valid;
  wire [31:0] sim_io_inT_3_bits;
  wire  sim_io_outT_0_ready;
  wire  sim_io_outT_0_valid;
  wire [31:0] sim_io_outT_0_bits;
  wire  sim_io_outT_1_ready;
  wire  sim_io_outT_1_valid;
  wire [31:0] sim_io_outT_1_bits;
  wire  sim_io_daisy_regs_0_in_ready;
  wire  sim_io_daisy_regs_0_in_valid;
  wire [31:0] sim_io_daisy_regs_0_in_bits;
  wire  sim_io_daisy_regs_0_out_ready;
  wire  sim_io_daisy_regs_0_out_valid;
  wire [31:0] sim_io_daisy_regs_0_out_bits;
  wire  sim_io_daisy_trace_0_in_ready;
  wire  sim_io_daisy_trace_0_in_valid;
  wire [31:0] sim_io_daisy_trace_0_in_bits;
  wire  sim_io_daisy_trace_0_out_ready;
  wire  sim_io_daisy_trace_0_out_valid;
  wire [31:0] sim_io_daisy_trace_0_out_bits;
  wire  sim_io_daisy_cntr_0_in_ready;
  wire  sim_io_daisy_cntr_0_in_valid;
  wire [31:0] sim_io_daisy_cntr_0_in_bits;
  wire  sim_io_daisy_cntr_0_out_ready;
  wire  sim_io_daisy_cntr_0_out_valid;
  wire [31:0] sim_io_daisy_cntr_0_out_bits;
  wire  sim_io_daisy_sram_0_in_ready;
  wire  sim_io_daisy_sram_0_in_valid;
  wire [31:0] sim_io_daisy_sram_0_in_bits;
  wire  sim_io_daisy_sram_0_out_ready;
  wire  sim_io_daisy_sram_0_out_valid;
  wire [31:0] sim_io_daisy_sram_0_out_bits;
  wire  sim_io_daisy_sram_0_restart;
  wire [10:0] sim_io_traceLen;
  wire  simReset;
  wire  hostReset;
  wire  in_buf_0_clock;
  wire  in_buf_0_reset;
  wire  in_buf_0_io_enq_ready;
  wire  in_buf_0_io_enq_valid;
  wire [31:0] in_buf_0_io_enq_bits;
  wire  in_buf_0_io_deq_ready;
  wire  in_buf_0_io_deq_valid;
  wire [31:0] in_buf_0_io_deq_bits;
  wire [1:0] in_buf_0_io_count;
  wire  T_532;
  wire  in_buf_1_clock;
  wire  in_buf_1_reset;
  wire  in_buf_1_io_enq_ready;
  wire  in_buf_1_io_enq_valid;
  wire [31:0] in_buf_1_io_enq_bits;
  wire  in_buf_1_io_deq_ready;
  wire  in_buf_1_io_deq_valid;
  wire [31:0] in_buf_1_io_deq_bits;
  wire [1:0] in_buf_1_io_count;
  wire  in_buf_2_clock;
  wire  in_buf_2_reset;
  wire  in_buf_2_io_enq_ready;
  wire  in_buf_2_io_enq_valid;
  wire [31:0] in_buf_2_io_enq_bits;
  wire  in_buf_2_io_deq_ready;
  wire  in_buf_2_io_deq_valid;
  wire [31:0] in_buf_2_io_deq_bits;
  wire [1:0] in_buf_2_io_count;
  wire  out_buf_0_clock;
  wire  out_buf_0_reset;
  wire  out_buf_0_io_enq_ready;
  wire  out_buf_0_io_enq_valid;
  wire [31:0] out_buf_0_io_enq_bits;
  wire  out_buf_0_io_deq_ready;
  wire  out_buf_0_io_deq_valid;
  wire [31:0] out_buf_0_io_deq_bits;
  wire [1:0] out_buf_0_io_count;
  wire  out_buf_1_clock;
  wire  out_buf_1_reset;
  wire  out_buf_1_io_enq_ready;
  wire  out_buf_1_io_enq_valid;
  wire [31:0] out_buf_1_io_enq_bits;
  wire  out_buf_1_io_deq_ready;
  wire  out_buf_1_io_deq_valid;
  wire [31:0] out_buf_1_io_deq_bits;
  wire [1:0] out_buf_1_io_count;
  reg [31:0] tickCounter;
  reg [31:0] GEN_18;
  reg [31:0] tockCounter;
  reg [31:0] GEN_19;
  wire  T_540;
  wire  T_541;
  wire  T_542;
  wire  T_543;
  wire  T_545;
  wire  T_546;
  wire  T_547;
  wire  T_548;
  wire  tick;
  wire  T_550;
  wire  T_551;
  wire  T_552;
  wire  T_554;
  wire  T_555;
  wire  tock;
  wire  T_559;
  wire  T_563;
  wire  idle;
  wire  T_565;
  wire [32:0] T_567;
  wire [31:0] T_568;
  wire [31:0] GEN_0;
  wire [32:0] T_570;
  wire [31:0] T_571;
  wire [31:0] GEN_1;
  wire [31:0] GEN_2;
  wire [31:0] GEN_3;
  wire  T_578;
  wire  T_579;
  wire  T_587;
  wire  T_588;
  wire  arb_clock;
  wire  arb_reset;
  wire  arb_io_master_0_aw_ready;
  wire  arb_io_master_0_aw_valid;
  wire [31:0] arb_io_master_0_aw_bits_addr;
  wire [7:0] arb_io_master_0_aw_bits_len;
  wire [2:0] arb_io_master_0_aw_bits_size;
  wire [1:0] arb_io_master_0_aw_bits_burst;
  wire  arb_io_master_0_aw_bits_lock;
  wire [3:0] arb_io_master_0_aw_bits_cache;
  wire [2:0] arb_io_master_0_aw_bits_prot;
  wire [3:0] arb_io_master_0_aw_bits_qos;
  wire [3:0] arb_io_master_0_aw_bits_region;
  wire [5:0] arb_io_master_0_aw_bits_id;
  wire  arb_io_master_0_aw_bits_user;
  wire  arb_io_master_0_w_ready;
  wire  arb_io_master_0_w_valid;
  wire [63:0] arb_io_master_0_w_bits_data;
  wire  arb_io_master_0_w_bits_last;
  wire [5:0] arb_io_master_0_w_bits_id;
  wire [7:0] arb_io_master_0_w_bits_strb;
  wire  arb_io_master_0_w_bits_user;
  wire  arb_io_master_0_b_ready;
  wire  arb_io_master_0_b_valid;
  wire [1:0] arb_io_master_0_b_bits_resp;
  wire [5:0] arb_io_master_0_b_bits_id;
  wire  arb_io_master_0_b_bits_user;
  wire  arb_io_master_0_ar_ready;
  wire  arb_io_master_0_ar_valid;
  wire [31:0] arb_io_master_0_ar_bits_addr;
  wire [7:0] arb_io_master_0_ar_bits_len;
  wire [2:0] arb_io_master_0_ar_bits_size;
  wire [1:0] arb_io_master_0_ar_bits_burst;
  wire  arb_io_master_0_ar_bits_lock;
  wire [3:0] arb_io_master_0_ar_bits_cache;
  wire [2:0] arb_io_master_0_ar_bits_prot;
  wire [3:0] arb_io_master_0_ar_bits_qos;
  wire [3:0] arb_io_master_0_ar_bits_region;
  wire [5:0] arb_io_master_0_ar_bits_id;
  wire  arb_io_master_0_ar_bits_user;
  wire  arb_io_master_0_r_ready;
  wire  arb_io_master_0_r_valid;
  wire [1:0] arb_io_master_0_r_bits_resp;
  wire [63:0] arb_io_master_0_r_bits_data;
  wire  arb_io_master_0_r_bits_last;
  wire [5:0] arb_io_master_0_r_bits_id;
  wire  arb_io_master_0_r_bits_user;
  wire  arb_io_slave_aw_ready;
  wire  arb_io_slave_aw_valid;
  wire [31:0] arb_io_slave_aw_bits_addr;
  wire [7:0] arb_io_slave_aw_bits_len;
  wire [2:0] arb_io_slave_aw_bits_size;
  wire [1:0] arb_io_slave_aw_bits_burst;
  wire  arb_io_slave_aw_bits_lock;
  wire [3:0] arb_io_slave_aw_bits_cache;
  wire [2:0] arb_io_slave_aw_bits_prot;
  wire [3:0] arb_io_slave_aw_bits_qos;
  wire [3:0] arb_io_slave_aw_bits_region;
  wire [5:0] arb_io_slave_aw_bits_id;
  wire  arb_io_slave_aw_bits_user;
  wire  arb_io_slave_w_ready;
  wire  arb_io_slave_w_valid;
  wire [63:0] arb_io_slave_w_bits_data;
  wire  arb_io_slave_w_bits_last;
  wire [5:0] arb_io_slave_w_bits_id;
  wire [7:0] arb_io_slave_w_bits_strb;
  wire  arb_io_slave_w_bits_user;
  wire  arb_io_slave_b_ready;
  wire  arb_io_slave_b_valid;
  wire [1:0] arb_io_slave_b_bits_resp;
  wire [5:0] arb_io_slave_b_bits_id;
  wire  arb_io_slave_b_bits_user;
  wire  arb_io_slave_ar_ready;
  wire  arb_io_slave_ar_valid;
  wire [31:0] arb_io_slave_ar_bits_addr;
  wire [7:0] arb_io_slave_ar_bits_len;
  wire [2:0] arb_io_slave_ar_bits_size;
  wire [1:0] arb_io_slave_ar_bits_burst;
  wire  arb_io_slave_ar_bits_lock;
  wire [3:0] arb_io_slave_ar_bits_cache;
  wire [2:0] arb_io_slave_ar_bits_prot;
  wire [3:0] arb_io_slave_ar_bits_qos;
  wire [3:0] arb_io_slave_ar_bits_region;
  wire [5:0] arb_io_slave_ar_bits_id;
  wire  arb_io_slave_ar_bits_user;
  wire  arb_io_slave_r_ready;
  wire  arb_io_slave_r_valid;
  wire [1:0] arb_io_slave_r_bits_resp;
  wire [63:0] arb_io_slave_r_bits_data;
  wire  arb_io_slave_r_bits_last;
  wire [5:0] arb_io_slave_r_bits_id;
  wire  arb_io_slave_r_bits_user;
  wire  Channel_ar_io_0_clock;
  wire  Channel_ar_io_0_reset;
  wire  Channel_ar_io_0_io_in_ready;
  wire  Channel_ar_io_0_io_in_valid;
  wire [31:0] Channel_ar_io_0_io_in_bits;
  wire  Channel_ar_io_0_io_out_ready;
  wire  Channel_ar_io_0_io_out_valid;
  wire [31:0] Channel_ar_io_0_io_out_bits;
  wire  Channel_ar_io_0_io_trace_ready;
  wire  Channel_ar_io_0_io_trace_valid;
  wire [31:0] Channel_ar_io_0_io_trace_bits;
  wire [10:0] Channel_ar_io_0_io_traceLen;
  wire  Channel_aw_io_0_clock;
  wire  Channel_aw_io_0_reset;
  wire  Channel_aw_io_0_io_in_ready;
  wire  Channel_aw_io_0_io_in_valid;
  wire [31:0] Channel_aw_io_0_io_in_bits;
  wire  Channel_aw_io_0_io_out_ready;
  wire  Channel_aw_io_0_io_out_valid;
  wire [31:0] Channel_aw_io_0_io_out_bits;
  wire  Channel_aw_io_0_io_trace_ready;
  wire  Channel_aw_io_0_io_trace_valid;
  wire [31:0] Channel_aw_io_0_io_trace_bits;
  wire [10:0] Channel_aw_io_0_io_traceLen;
  wire  Channel_w_io_0_clock;
  wire  Channel_w_io_0_reset;
  wire  Channel_w_io_0_io_in_ready;
  wire  Channel_w_io_0_io_in_valid;
  wire [31:0] Channel_w_io_0_io_in_bits;
  wire  Channel_w_io_0_io_out_ready;
  wire  Channel_w_io_0_io_out_valid;
  wire [31:0] Channel_w_io_0_io_out_bits;
  wire  Channel_w_io_0_io_trace_ready;
  wire  Channel_w_io_0_io_trace_valid;
  wire [31:0] Channel_w_io_0_io_trace_bits;
  wire [10:0] Channel_w_io_0_io_traceLen;
  wire  Channel_w_io_1_clock;
  wire  Channel_w_io_1_reset;
  wire  Channel_w_io_1_io_in_ready;
  wire  Channel_w_io_1_io_in_valid;
  wire [31:0] Channel_w_io_1_io_in_bits;
  wire  Channel_w_io_1_io_out_ready;
  wire  Channel_w_io_1_io_out_valid;
  wire [31:0] Channel_w_io_1_io_out_bits;
  wire  Channel_w_io_1_io_trace_ready;
  wire  Channel_w_io_1_io_trace_valid;
  wire [31:0] Channel_w_io_1_io_trace_bits;
  wire [10:0] Channel_w_io_1_io_traceLen;
  wire  Channel_r_io_0_clock;
  wire  Channel_r_io_0_reset;
  wire  Channel_r_io_0_io_in_ready;
  wire  Channel_r_io_0_io_in_valid;
  wire [31:0] Channel_r_io_0_io_in_bits;
  wire  Channel_r_io_0_io_out_ready;
  wire  Channel_r_io_0_io_out_valid;
  wire [31:0] Channel_r_io_0_io_out_bits;
  wire  Channel_r_io_0_io_trace_ready;
  wire  Channel_r_io_0_io_trace_valid;
  wire [31:0] Channel_r_io_0_io_trace_bits;
  wire [10:0] Channel_r_io_0_io_traceLen;
  wire  Channel_r_io_1_clock;
  wire  Channel_r_io_1_reset;
  wire  Channel_r_io_1_io_in_ready;
  wire  Channel_r_io_1_io_in_valid;
  wire [31:0] Channel_r_io_1_io_in_bits;
  wire  Channel_r_io_1_io_out_ready;
  wire  Channel_r_io_1_io_out_valid;
  wire [31:0] Channel_r_io_1_io_out_bits;
  wire  Channel_r_io_1_io_trace_ready;
  wire  Channel_r_io_1_io_trace_valid;
  wire [31:0] Channel_r_io_1_io_trace_bits;
  wire [10:0] Channel_r_io_1_io_traceLen;
  wire  ZynqMasterHandler_1_clock;
  wire  ZynqMasterHandler_1_reset;
  wire  ZynqMasterHandler_1_io_ctrl_aw_ready;
  wire  ZynqMasterHandler_1_io_ctrl_aw_valid;
  wire [31:0] ZynqMasterHandler_1_io_ctrl_aw_bits_addr;
  wire [7:0] ZynqMasterHandler_1_io_ctrl_aw_bits_len;
  wire [2:0] ZynqMasterHandler_1_io_ctrl_aw_bits_size;
  wire [1:0] ZynqMasterHandler_1_io_ctrl_aw_bits_burst;
  wire  ZynqMasterHandler_1_io_ctrl_aw_bits_lock;
  wire [3:0] ZynqMasterHandler_1_io_ctrl_aw_bits_cache;
  wire [2:0] ZynqMasterHandler_1_io_ctrl_aw_bits_prot;
  wire [3:0] ZynqMasterHandler_1_io_ctrl_aw_bits_qos;
  wire [3:0] ZynqMasterHandler_1_io_ctrl_aw_bits_region;
  wire [11:0] ZynqMasterHandler_1_io_ctrl_aw_bits_id;
  wire  ZynqMasterHandler_1_io_ctrl_aw_bits_user;
  wire  ZynqMasterHandler_1_io_ctrl_w_ready;
  wire  ZynqMasterHandler_1_io_ctrl_w_valid;
  wire [31:0] ZynqMasterHandler_1_io_ctrl_w_bits_data;
  wire  ZynqMasterHandler_1_io_ctrl_w_bits_last;
  wire [11:0] ZynqMasterHandler_1_io_ctrl_w_bits_id;
  wire [3:0] ZynqMasterHandler_1_io_ctrl_w_bits_strb;
  wire  ZynqMasterHandler_1_io_ctrl_w_bits_user;
  wire  ZynqMasterHandler_1_io_ctrl_b_ready;
  wire  ZynqMasterHandler_1_io_ctrl_b_valid;
  wire [1:0] ZynqMasterHandler_1_io_ctrl_b_bits_resp;
  wire [11:0] ZynqMasterHandler_1_io_ctrl_b_bits_id;
  wire  ZynqMasterHandler_1_io_ctrl_b_bits_user;
  wire  ZynqMasterHandler_1_io_ctrl_ar_ready;
  wire  ZynqMasterHandler_1_io_ctrl_ar_valid;
  wire [31:0] ZynqMasterHandler_1_io_ctrl_ar_bits_addr;
  wire [7:0] ZynqMasterHandler_1_io_ctrl_ar_bits_len;
  wire [2:0] ZynqMasterHandler_1_io_ctrl_ar_bits_size;
  wire [1:0] ZynqMasterHandler_1_io_ctrl_ar_bits_burst;
  wire  ZynqMasterHandler_1_io_ctrl_ar_bits_lock;
  wire [3:0] ZynqMasterHandler_1_io_ctrl_ar_bits_cache;
  wire [2:0] ZynqMasterHandler_1_io_ctrl_ar_bits_prot;
  wire [3:0] ZynqMasterHandler_1_io_ctrl_ar_bits_qos;
  wire [3:0] ZynqMasterHandler_1_io_ctrl_ar_bits_region;
  wire [11:0] ZynqMasterHandler_1_io_ctrl_ar_bits_id;
  wire  ZynqMasterHandler_1_io_ctrl_ar_bits_user;
  wire  ZynqMasterHandler_1_io_ctrl_r_ready;
  wire  ZynqMasterHandler_1_io_ctrl_r_valid;
  wire [1:0] ZynqMasterHandler_1_io_ctrl_r_bits_resp;
  wire [31:0] ZynqMasterHandler_1_io_ctrl_r_bits_data;
  wire  ZynqMasterHandler_1_io_ctrl_r_bits_last;
  wire [11:0] ZynqMasterHandler_1_io_ctrl_r_bits_id;
  wire  ZynqMasterHandler_1_io_ctrl_r_bits_user;
  wire  ZynqMasterHandler_1_io_ins_0_ready;
  wire  ZynqMasterHandler_1_io_ins_0_valid;
  wire [31:0] ZynqMasterHandler_1_io_ins_0_bits;
  wire  ZynqMasterHandler_1_io_ins_1_ready;
  wire  ZynqMasterHandler_1_io_ins_1_valid;
  wire [31:0] ZynqMasterHandler_1_io_ins_1_bits;
  wire  ZynqMasterHandler_1_io_ins_2_ready;
  wire  ZynqMasterHandler_1_io_ins_2_valid;
  wire [31:0] ZynqMasterHandler_1_io_ins_2_bits;
  wire  ZynqMasterHandler_1_io_outs_0_ready;
  wire  ZynqMasterHandler_1_io_outs_0_valid;
  wire [31:0] ZynqMasterHandler_1_io_outs_0_bits;
  wire  ZynqMasterHandler_1_io_outs_1_ready;
  wire  ZynqMasterHandler_1_io_outs_1_valid;
  wire [31:0] ZynqMasterHandler_1_io_outs_1_bits;
  wire  ZynqMasterHandler_1_io_inT_0_ready;
  wire  ZynqMasterHandler_1_io_inT_0_valid;
  wire [31:0] ZynqMasterHandler_1_io_inT_0_bits;
  wire  ZynqMasterHandler_1_io_inT_1_ready;
  wire  ZynqMasterHandler_1_io_inT_1_valid;
  wire [31:0] ZynqMasterHandler_1_io_inT_1_bits;
  wire  ZynqMasterHandler_1_io_inT_2_ready;
  wire  ZynqMasterHandler_1_io_inT_2_valid;
  wire [31:0] ZynqMasterHandler_1_io_inT_2_bits;
  wire  ZynqMasterHandler_1_io_inT_3_ready;
  wire  ZynqMasterHandler_1_io_inT_3_valid;
  wire [31:0] ZynqMasterHandler_1_io_inT_3_bits;
  wire  ZynqMasterHandler_1_io_outT_0_ready;
  wire  ZynqMasterHandler_1_io_outT_0_valid;
  wire [31:0] ZynqMasterHandler_1_io_outT_0_bits;
  wire  ZynqMasterHandler_1_io_outT_1_ready;
  wire  ZynqMasterHandler_1_io_outT_1_valid;
  wire [31:0] ZynqMasterHandler_1_io_outT_1_bits;
  wire  ZynqMasterHandler_1_io_mem_ar_0_ready;
  wire  ZynqMasterHandler_1_io_mem_ar_0_valid;
  wire [31:0] ZynqMasterHandler_1_io_mem_ar_0_bits;
  wire  ZynqMasterHandler_1_io_mem_aw_0_ready;
  wire  ZynqMasterHandler_1_io_mem_aw_0_valid;
  wire [31:0] ZynqMasterHandler_1_io_mem_aw_0_bits;
  wire  ZynqMasterHandler_1_io_mem_r_0_ready;
  wire  ZynqMasterHandler_1_io_mem_r_0_valid;
  wire [31:0] ZynqMasterHandler_1_io_mem_r_0_bits;
  wire  ZynqMasterHandler_1_io_mem_r_1_ready;
  wire  ZynqMasterHandler_1_io_mem_r_1_valid;
  wire [31:0] ZynqMasterHandler_1_io_mem_r_1_bits;
  wire  ZynqMasterHandler_1_io_mem_w_0_ready;
  wire  ZynqMasterHandler_1_io_mem_w_0_valid;
  wire [31:0] ZynqMasterHandler_1_io_mem_w_0_bits;
  wire  ZynqMasterHandler_1_io_mem_w_1_ready;
  wire  ZynqMasterHandler_1_io_mem_w_1_valid;
  wire [31:0] ZynqMasterHandler_1_io_mem_w_1_bits;
  wire  EmulationMaster_1_clock;
  wire  EmulationMaster_1_reset;
  wire  EmulationMaster_1_io_ctrl_aw_ready;
  wire  EmulationMaster_1_io_ctrl_aw_valid;
  wire [31:0] EmulationMaster_1_io_ctrl_aw_bits_addr;
  wire [7:0] EmulationMaster_1_io_ctrl_aw_bits_len;
  wire [2:0] EmulationMaster_1_io_ctrl_aw_bits_size;
  wire [1:0] EmulationMaster_1_io_ctrl_aw_bits_burst;
  wire  EmulationMaster_1_io_ctrl_aw_bits_lock;
  wire [3:0] EmulationMaster_1_io_ctrl_aw_bits_cache;
  wire [2:0] EmulationMaster_1_io_ctrl_aw_bits_prot;
  wire [3:0] EmulationMaster_1_io_ctrl_aw_bits_qos;
  wire [3:0] EmulationMaster_1_io_ctrl_aw_bits_region;
  wire [11:0] EmulationMaster_1_io_ctrl_aw_bits_id;
  wire  EmulationMaster_1_io_ctrl_aw_bits_user;
  wire  EmulationMaster_1_io_ctrl_w_ready;
  wire  EmulationMaster_1_io_ctrl_w_valid;
  wire [31:0] EmulationMaster_1_io_ctrl_w_bits_data;
  wire  EmulationMaster_1_io_ctrl_w_bits_last;
  wire [11:0] EmulationMaster_1_io_ctrl_w_bits_id;
  wire [3:0] EmulationMaster_1_io_ctrl_w_bits_strb;
  wire  EmulationMaster_1_io_ctrl_w_bits_user;
  wire  EmulationMaster_1_io_ctrl_b_ready;
  wire  EmulationMaster_1_io_ctrl_b_valid;
  wire [1:0] EmulationMaster_1_io_ctrl_b_bits_resp;
  wire [11:0] EmulationMaster_1_io_ctrl_b_bits_id;
  wire  EmulationMaster_1_io_ctrl_b_bits_user;
  wire  EmulationMaster_1_io_ctrl_ar_ready;
  wire  EmulationMaster_1_io_ctrl_ar_valid;
  wire [31:0] EmulationMaster_1_io_ctrl_ar_bits_addr;
  wire [7:0] EmulationMaster_1_io_ctrl_ar_bits_len;
  wire [2:0] EmulationMaster_1_io_ctrl_ar_bits_size;
  wire [1:0] EmulationMaster_1_io_ctrl_ar_bits_burst;
  wire  EmulationMaster_1_io_ctrl_ar_bits_lock;
  wire [3:0] EmulationMaster_1_io_ctrl_ar_bits_cache;
  wire [2:0] EmulationMaster_1_io_ctrl_ar_bits_prot;
  wire [3:0] EmulationMaster_1_io_ctrl_ar_bits_qos;
  wire [3:0] EmulationMaster_1_io_ctrl_ar_bits_region;
  wire [11:0] EmulationMaster_1_io_ctrl_ar_bits_id;
  wire  EmulationMaster_1_io_ctrl_ar_bits_user;
  wire  EmulationMaster_1_io_ctrl_r_ready;
  wire  EmulationMaster_1_io_ctrl_r_valid;
  wire [1:0] EmulationMaster_1_io_ctrl_r_bits_resp;
  wire [31:0] EmulationMaster_1_io_ctrl_r_bits_data;
  wire  EmulationMaster_1_io_ctrl_r_bits_last;
  wire [11:0] EmulationMaster_1_io_ctrl_r_bits_id;
  wire  EmulationMaster_1_io_ctrl_r_bits_user;
  wire  EmulationMaster_1_io_hostReset;
  wire  EmulationMaster_1_io_simReset;
  wire  EmulationMaster_1_io_done;
  wire  EmulationMaster_1_io_step_ready;
  wire  EmulationMaster_1_io_step_valid;
  wire [31:0] EmulationMaster_1_io_step_bits;
  wire [31:0] EmulationMaster_1_io_traceLen;
  wire  T_592;
  wire [31:0] GEN_4;
  wire [31:0] GEN_5;
  wire  T_594;
  wire  T_595;
  wire  DaisyChainController_clock;
  wire  DaisyChainController_reset;
  wire  DaisyChainController_io_ctrl_aw_ready;
  wire  DaisyChainController_io_ctrl_aw_valid;
  wire [31:0] DaisyChainController_io_ctrl_aw_bits_addr;
  wire [7:0] DaisyChainController_io_ctrl_aw_bits_len;
  wire [2:0] DaisyChainController_io_ctrl_aw_bits_size;
  wire [1:0] DaisyChainController_io_ctrl_aw_bits_burst;
  wire  DaisyChainController_io_ctrl_aw_bits_lock;
  wire [3:0] DaisyChainController_io_ctrl_aw_bits_cache;
  wire [2:0] DaisyChainController_io_ctrl_aw_bits_prot;
  wire [3:0] DaisyChainController_io_ctrl_aw_bits_qos;
  wire [3:0] DaisyChainController_io_ctrl_aw_bits_region;
  wire [11:0] DaisyChainController_io_ctrl_aw_bits_id;
  wire  DaisyChainController_io_ctrl_aw_bits_user;
  wire  DaisyChainController_io_ctrl_w_ready;
  wire  DaisyChainController_io_ctrl_w_valid;
  wire [31:0] DaisyChainController_io_ctrl_w_bits_data;
  wire  DaisyChainController_io_ctrl_w_bits_last;
  wire [11:0] DaisyChainController_io_ctrl_w_bits_id;
  wire [3:0] DaisyChainController_io_ctrl_w_bits_strb;
  wire  DaisyChainController_io_ctrl_w_bits_user;
  wire  DaisyChainController_io_ctrl_b_ready;
  wire  DaisyChainController_io_ctrl_b_valid;
  wire [1:0] DaisyChainController_io_ctrl_b_bits_resp;
  wire [11:0] DaisyChainController_io_ctrl_b_bits_id;
  wire  DaisyChainController_io_ctrl_b_bits_user;
  wire  DaisyChainController_io_ctrl_ar_ready;
  wire  DaisyChainController_io_ctrl_ar_valid;
  wire [31:0] DaisyChainController_io_ctrl_ar_bits_addr;
  wire [7:0] DaisyChainController_io_ctrl_ar_bits_len;
  wire [2:0] DaisyChainController_io_ctrl_ar_bits_size;
  wire [1:0] DaisyChainController_io_ctrl_ar_bits_burst;
  wire  DaisyChainController_io_ctrl_ar_bits_lock;
  wire [3:0] DaisyChainController_io_ctrl_ar_bits_cache;
  wire [2:0] DaisyChainController_io_ctrl_ar_bits_prot;
  wire [3:0] DaisyChainController_io_ctrl_ar_bits_qos;
  wire [3:0] DaisyChainController_io_ctrl_ar_bits_region;
  wire [11:0] DaisyChainController_io_ctrl_ar_bits_id;
  wire  DaisyChainController_io_ctrl_ar_bits_user;
  wire  DaisyChainController_io_ctrl_r_ready;
  wire  DaisyChainController_io_ctrl_r_valid;
  wire [1:0] DaisyChainController_io_ctrl_r_bits_resp;
  wire [31:0] DaisyChainController_io_ctrl_r_bits_data;
  wire  DaisyChainController_io_ctrl_r_bits_last;
  wire [11:0] DaisyChainController_io_ctrl_r_bits_id;
  wire  DaisyChainController_io_ctrl_r_bits_user;
  wire  DaisyChainController_io_daisy_regs_0_in_ready;
  wire  DaisyChainController_io_daisy_regs_0_in_valid;
  wire [31:0] DaisyChainController_io_daisy_regs_0_in_bits;
  wire  DaisyChainController_io_daisy_regs_0_out_ready;
  wire  DaisyChainController_io_daisy_regs_0_out_valid;
  wire [31:0] DaisyChainController_io_daisy_regs_0_out_bits;
  wire  DaisyChainController_io_daisy_trace_0_in_ready;
  wire  DaisyChainController_io_daisy_trace_0_in_valid;
  wire [31:0] DaisyChainController_io_daisy_trace_0_in_bits;
  wire  DaisyChainController_io_daisy_trace_0_out_ready;
  wire  DaisyChainController_io_daisy_trace_0_out_valid;
  wire [31:0] DaisyChainController_io_daisy_trace_0_out_bits;
  wire  DaisyChainController_io_daisy_cntr_0_in_ready;
  wire  DaisyChainController_io_daisy_cntr_0_in_valid;
  wire [31:0] DaisyChainController_io_daisy_cntr_0_in_bits;
  wire  DaisyChainController_io_daisy_cntr_0_out_ready;
  wire  DaisyChainController_io_daisy_cntr_0_out_valid;
  wire [31:0] DaisyChainController_io_daisy_cntr_0_out_bits;
  wire  DaisyChainController_io_daisy_sram_0_in_ready;
  wire  DaisyChainController_io_daisy_sram_0_in_valid;
  wire [31:0] DaisyChainController_io_daisy_sram_0_in_bits;
  wire  DaisyChainController_io_daisy_sram_0_out_ready;
  wire  DaisyChainController_io_daisy_sram_0_out_valid;
  wire [31:0] DaisyChainController_io_daisy_sram_0_out_bits;
  wire  DaisyChainController_io_daisy_sram_0_restart;
  wire [31:0] T_621_addr;
  wire [7:0] T_621_len;
  wire [2:0] T_621_size;
  wire [1:0] T_621_burst;
  wire  T_621_lock;
  wire [3:0] T_621_cache;
  wire [2:0] T_621_prot;
  wire [3:0] T_621_qos;
  wire [3:0] T_621_region;
  wire [5:0] T_621_id;
  wire  T_621_user;
  wire [31:0] T_654_addr;
  wire [7:0] T_654_len;
  wire [2:0] T_654_size;
  wire [1:0] T_654_burst;
  wire  T_654_lock;
  wire [3:0] T_654_cache;
  wire [2:0] T_654_prot;
  wire [3:0] T_654_qos;
  wire [3:0] T_654_region;
  wire [5:0] T_654_id;
  wire  T_654_user;
  wire [63:0] T_672;
  wire [63:0] T_681_data;
  wire  T_681_last;
  wire [5:0] T_681_id;
  wire [7:0] T_681_strb;
  wire  T_681_user;
  wire [63:0] T_694;
  wire [63:0] T_696;
  wire  T_698;
  wire  T_700;
  wire  T_702;
  wire  T_703;
  wire  T_705;
  wire  T_706;
  wire  T_708;
  wire  T_709;
  wire  T_710;
  wire  T_712;
  wire  NastiRecursiveInterconnect_1_clock;
  wire  NastiRecursiveInterconnect_1_reset;
  wire  NastiRecursiveInterconnect_1_io_masters_0_aw_ready;
  wire  NastiRecursiveInterconnect_1_io_masters_0_aw_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_addr;
  wire [7:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_len;
  wire [2:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_size;
  wire [1:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_burst;
  wire  NastiRecursiveInterconnect_1_io_masters_0_aw_bits_lock;
  wire [3:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_cache;
  wire [2:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_prot;
  wire [3:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_qos;
  wire [3:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_region;
  wire [11:0] NastiRecursiveInterconnect_1_io_masters_0_aw_bits_id;
  wire  NastiRecursiveInterconnect_1_io_masters_0_aw_bits_user;
  wire  NastiRecursiveInterconnect_1_io_masters_0_w_ready;
  wire  NastiRecursiveInterconnect_1_io_masters_0_w_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_masters_0_w_bits_data;
  wire  NastiRecursiveInterconnect_1_io_masters_0_w_bits_last;
  wire [11:0] NastiRecursiveInterconnect_1_io_masters_0_w_bits_id;
  wire [3:0] NastiRecursiveInterconnect_1_io_masters_0_w_bits_strb;
  wire  NastiRecursiveInterconnect_1_io_masters_0_w_bits_user;
  wire  NastiRecursiveInterconnect_1_io_masters_0_b_ready;
  wire  NastiRecursiveInterconnect_1_io_masters_0_b_valid;
  wire [1:0] NastiRecursiveInterconnect_1_io_masters_0_b_bits_resp;
  wire [11:0] NastiRecursiveInterconnect_1_io_masters_0_b_bits_id;
  wire  NastiRecursiveInterconnect_1_io_masters_0_b_bits_user;
  wire  NastiRecursiveInterconnect_1_io_masters_0_ar_ready;
  wire  NastiRecursiveInterconnect_1_io_masters_0_ar_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_addr;
  wire [7:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_len;
  wire [2:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_size;
  wire [1:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_burst;
  wire  NastiRecursiveInterconnect_1_io_masters_0_ar_bits_lock;
  wire [3:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_cache;
  wire [2:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_prot;
  wire [3:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_qos;
  wire [3:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_region;
  wire [11:0] NastiRecursiveInterconnect_1_io_masters_0_ar_bits_id;
  wire  NastiRecursiveInterconnect_1_io_masters_0_ar_bits_user;
  wire  NastiRecursiveInterconnect_1_io_masters_0_r_ready;
  wire  NastiRecursiveInterconnect_1_io_masters_0_r_valid;
  wire [1:0] NastiRecursiveInterconnect_1_io_masters_0_r_bits_resp;
  wire [31:0] NastiRecursiveInterconnect_1_io_masters_0_r_bits_data;
  wire  NastiRecursiveInterconnect_1_io_masters_0_r_bits_last;
  wire [11:0] NastiRecursiveInterconnect_1_io_masters_0_r_bits_id;
  wire  NastiRecursiveInterconnect_1_io_masters_0_r_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_aw_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_aw_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_addr;
  wire [7:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_len;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_size;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_burst;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_lock;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_cache;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_prot;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_qos;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_region;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_w_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_w_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_0_w_bits_data;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_w_bits_last;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_0_w_bits_id;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_0_w_bits_strb;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_w_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_b_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_b_valid;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_0_b_bits_resp;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_0_b_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_b_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_ar_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_ar_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_addr;
  wire [7:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_len;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_size;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_burst;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_lock;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_cache;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_prot;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_qos;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_region;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_r_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_r_valid;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_0_r_bits_resp;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_0_r_bits_data;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_r_bits_last;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_0_r_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_0_r_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_aw_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_aw_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_addr;
  wire [7:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_len;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_size;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_burst;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_lock;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_cache;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_prot;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_qos;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_region;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_w_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_w_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_1_w_bits_data;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_w_bits_last;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_1_w_bits_id;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_1_w_bits_strb;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_w_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_b_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_b_valid;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_1_b_bits_resp;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_1_b_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_b_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_ar_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_ar_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_addr;
  wire [7:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_len;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_size;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_burst;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_lock;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_cache;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_prot;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_qos;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_region;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_r_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_r_valid;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_1_r_bits_resp;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_1_r_bits_data;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_r_bits_last;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_1_r_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_1_r_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_aw_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_aw_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_addr;
  wire [7:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_len;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_size;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_burst;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_lock;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_cache;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_prot;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_qos;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_region;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_w_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_w_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_2_w_bits_data;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_w_bits_last;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_2_w_bits_id;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_2_w_bits_strb;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_w_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_b_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_b_valid;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_2_b_bits_resp;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_2_b_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_b_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_ar_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_ar_valid;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_addr;
  wire [7:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_len;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_size;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_burst;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_lock;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_cache;
  wire [2:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_prot;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_qos;
  wire [3:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_region;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_user;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_r_ready;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_r_valid;
  wire [1:0] NastiRecursiveInterconnect_1_io_slaves_2_r_bits_resp;
  wire [31:0] NastiRecursiveInterconnect_1_io_slaves_2_r_bits_data;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_r_bits_last;
  wire [11:0] NastiRecursiveInterconnect_1_io_slaves_2_r_bits_id;
  wire  NastiRecursiveInterconnect_1_io_slaves_2_r_bits_user;
  wire [12:0] T_714;
  wire [12:0] T_715;
  reg  GEN_6;
  reg [31:0] GEN_20;
  reg [10:0] GEN_7;
  reg [31:0] GEN_21;
  reg  GEN_8;
  reg [31:0] GEN_22;
  reg [10:0] GEN_9;
  reg [31:0] GEN_23;
  reg  GEN_10;
  reg [31:0] GEN_24;
  reg [10:0] GEN_11;
  reg [31:0] GEN_25;
  reg  GEN_12;
  reg [31:0] GEN_26;
  reg [10:0] GEN_13;
  reg [31:0] GEN_27;
  reg  GEN_14;
  reg [31:0] GEN_28;
  reg [10:0] GEN_15;
  reg [31:0] GEN_29;
  reg  GEN_16;
  reg [31:0] GEN_30;
  reg [10:0] GEN_17;
  reg [31:0] GEN_31;
  SimWrapper sim (
    .clock(sim_clock),
    .reset(sim_reset),
    .io_ins_0_ready(sim_io_ins_0_ready),
    .io_ins_0_valid(sim_io_ins_0_valid),
    .io_ins_0_bits(sim_io_ins_0_bits),
    .io_ins_1_ready(sim_io_ins_1_ready),
    .io_ins_1_valid(sim_io_ins_1_valid),
    .io_ins_1_bits(sim_io_ins_1_bits),
    .io_ins_2_ready(sim_io_ins_2_ready),
    .io_ins_2_valid(sim_io_ins_2_valid),
    .io_ins_2_bits(sim_io_ins_2_bits),
    .io_ins_3_ready(sim_io_ins_3_ready),
    .io_ins_3_valid(sim_io_ins_3_valid),
    .io_ins_3_bits(sim_io_ins_3_bits),
    .io_outs_0_ready(sim_io_outs_0_ready),
    .io_outs_0_valid(sim_io_outs_0_valid),
    .io_outs_0_bits(sim_io_outs_0_bits),
    .io_outs_1_ready(sim_io_outs_1_ready),
    .io_outs_1_valid(sim_io_outs_1_valid),
    .io_outs_1_bits(sim_io_outs_1_bits),
    .io_inT_0_ready(sim_io_inT_0_ready),
    .io_inT_0_valid(sim_io_inT_0_valid),
    .io_inT_0_bits(sim_io_inT_0_bits),
    .io_inT_1_ready(sim_io_inT_1_ready),
    .io_inT_1_valid(sim_io_inT_1_valid),
    .io_inT_1_bits(sim_io_inT_1_bits),
    .io_inT_2_ready(sim_io_inT_2_ready),
    .io_inT_2_valid(sim_io_inT_2_valid),
    .io_inT_2_bits(sim_io_inT_2_bits),
    .io_inT_3_ready(sim_io_inT_3_ready),
    .io_inT_3_valid(sim_io_inT_3_valid),
    .io_inT_3_bits(sim_io_inT_3_bits),
    .io_outT_0_ready(sim_io_outT_0_ready),
    .io_outT_0_valid(sim_io_outT_0_valid),
    .io_outT_0_bits(sim_io_outT_0_bits),
    .io_outT_1_ready(sim_io_outT_1_ready),
    .io_outT_1_valid(sim_io_outT_1_valid),
    .io_outT_1_bits(sim_io_outT_1_bits),
    .io_daisy_regs_0_in_ready(sim_io_daisy_regs_0_in_ready),
    .io_daisy_regs_0_in_valid(sim_io_daisy_regs_0_in_valid),
    .io_daisy_regs_0_in_bits(sim_io_daisy_regs_0_in_bits),
    .io_daisy_regs_0_out_ready(sim_io_daisy_regs_0_out_ready),
    .io_daisy_regs_0_out_valid(sim_io_daisy_regs_0_out_valid),
    .io_daisy_regs_0_out_bits(sim_io_daisy_regs_0_out_bits),
    .io_daisy_trace_0_in_ready(sim_io_daisy_trace_0_in_ready),
    .io_daisy_trace_0_in_valid(sim_io_daisy_trace_0_in_valid),
    .io_daisy_trace_0_in_bits(sim_io_daisy_trace_0_in_bits),
    .io_daisy_trace_0_out_ready(sim_io_daisy_trace_0_out_ready),
    .io_daisy_trace_0_out_valid(sim_io_daisy_trace_0_out_valid),
    .io_daisy_trace_0_out_bits(sim_io_daisy_trace_0_out_bits),
    .io_daisy_cntr_0_in_ready(sim_io_daisy_cntr_0_in_ready),
    .io_daisy_cntr_0_in_valid(sim_io_daisy_cntr_0_in_valid),
    .io_daisy_cntr_0_in_bits(sim_io_daisy_cntr_0_in_bits),
    .io_daisy_cntr_0_out_ready(sim_io_daisy_cntr_0_out_ready),
    .io_daisy_cntr_0_out_valid(sim_io_daisy_cntr_0_out_valid),
    .io_daisy_cntr_0_out_bits(sim_io_daisy_cntr_0_out_bits),
    .io_daisy_sram_0_in_ready(sim_io_daisy_sram_0_in_ready),
    .io_daisy_sram_0_in_valid(sim_io_daisy_sram_0_in_valid),
    .io_daisy_sram_0_in_bits(sim_io_daisy_sram_0_in_bits),
    .io_daisy_sram_0_out_ready(sim_io_daisy_sram_0_out_ready),
    .io_daisy_sram_0_out_valid(sim_io_daisy_sram_0_out_valid),
    .io_daisy_sram_0_out_bits(sim_io_daisy_sram_0_out_bits),
    .io_daisy_sram_0_restart(sim_io_daisy_sram_0_restart),
    .io_traceLen(sim_io_traceLen)
  );
  Queue_0 in_buf_0 (
    .clock(in_buf_0_clock),
    .reset(in_buf_0_reset),
    .io_enq_ready(in_buf_0_io_enq_ready),
    .io_enq_valid(in_buf_0_io_enq_valid),
    .io_enq_bits(in_buf_0_io_enq_bits),
    .io_deq_ready(in_buf_0_io_deq_ready),
    .io_deq_valid(in_buf_0_io_deq_valid),
    .io_deq_bits(in_buf_0_io_deq_bits),
    .io_count(in_buf_0_io_count)
  );
  Queue_0 in_buf_1 (
    .clock(in_buf_1_clock),
    .reset(in_buf_1_reset),
    .io_enq_ready(in_buf_1_io_enq_ready),
    .io_enq_valid(in_buf_1_io_enq_valid),
    .io_enq_bits(in_buf_1_io_enq_bits),
    .io_deq_ready(in_buf_1_io_deq_ready),
    .io_deq_valid(in_buf_1_io_deq_valid),
    .io_deq_bits(in_buf_1_io_deq_bits),
    .io_count(in_buf_1_io_count)
  );
  Queue_0 in_buf_2 (
    .clock(in_buf_2_clock),
    .reset(in_buf_2_reset),
    .io_enq_ready(in_buf_2_io_enq_ready),
    .io_enq_valid(in_buf_2_io_enq_valid),
    .io_enq_bits(in_buf_2_io_enq_bits),
    .io_deq_ready(in_buf_2_io_deq_ready),
    .io_deq_valid(in_buf_2_io_deq_valid),
    .io_deq_bits(in_buf_2_io_deq_bits),
    .io_count(in_buf_2_io_count)
  );
  Queue_0 out_buf_0 (
    .clock(out_buf_0_clock),
    .reset(out_buf_0_reset),
    .io_enq_ready(out_buf_0_io_enq_ready),
    .io_enq_valid(out_buf_0_io_enq_valid),
    .io_enq_bits(out_buf_0_io_enq_bits),
    .io_deq_ready(out_buf_0_io_deq_ready),
    .io_deq_valid(out_buf_0_io_deq_valid),
    .io_deq_bits(out_buf_0_io_deq_bits),
    .io_count(out_buf_0_io_count)
  );
  Queue_0 out_buf_1 (
    .clock(out_buf_1_clock),
    .reset(out_buf_1_reset),
    .io_enq_ready(out_buf_1_io_enq_ready),
    .io_enq_valid(out_buf_1_io_enq_valid),
    .io_enq_bits(out_buf_1_io_enq_bits),
    .io_deq_ready(out_buf_1_io_deq_ready),
    .io_deq_valid(out_buf_1_io_deq_valid),
    .io_deq_bits(out_buf_1_io_deq_bits),
    .io_count(out_buf_1_io_count)
  );
  NastiArbiter arb (
    .clock(arb_clock),
    .reset(arb_reset),
    .io_master_0_aw_ready(arb_io_master_0_aw_ready),
    .io_master_0_aw_valid(arb_io_master_0_aw_valid),
    .io_master_0_aw_bits_addr(arb_io_master_0_aw_bits_addr),
    .io_master_0_aw_bits_len(arb_io_master_0_aw_bits_len),
    .io_master_0_aw_bits_size(arb_io_master_0_aw_bits_size),
    .io_master_0_aw_bits_burst(arb_io_master_0_aw_bits_burst),
    .io_master_0_aw_bits_lock(arb_io_master_0_aw_bits_lock),
    .io_master_0_aw_bits_cache(arb_io_master_0_aw_bits_cache),
    .io_master_0_aw_bits_prot(arb_io_master_0_aw_bits_prot),
    .io_master_0_aw_bits_qos(arb_io_master_0_aw_bits_qos),
    .io_master_0_aw_bits_region(arb_io_master_0_aw_bits_region),
    .io_master_0_aw_bits_id(arb_io_master_0_aw_bits_id),
    .io_master_0_aw_bits_user(arb_io_master_0_aw_bits_user),
    .io_master_0_w_ready(arb_io_master_0_w_ready),
    .io_master_0_w_valid(arb_io_master_0_w_valid),
    .io_master_0_w_bits_data(arb_io_master_0_w_bits_data),
    .io_master_0_w_bits_last(arb_io_master_0_w_bits_last),
    .io_master_0_w_bits_id(arb_io_master_0_w_bits_id),
    .io_master_0_w_bits_strb(arb_io_master_0_w_bits_strb),
    .io_master_0_w_bits_user(arb_io_master_0_w_bits_user),
    .io_master_0_b_ready(arb_io_master_0_b_ready),
    .io_master_0_b_valid(arb_io_master_0_b_valid),
    .io_master_0_b_bits_resp(arb_io_master_0_b_bits_resp),
    .io_master_0_b_bits_id(arb_io_master_0_b_bits_id),
    .io_master_0_b_bits_user(arb_io_master_0_b_bits_user),
    .io_master_0_ar_ready(arb_io_master_0_ar_ready),
    .io_master_0_ar_valid(arb_io_master_0_ar_valid),
    .io_master_0_ar_bits_addr(arb_io_master_0_ar_bits_addr),
    .io_master_0_ar_bits_len(arb_io_master_0_ar_bits_len),
    .io_master_0_ar_bits_size(arb_io_master_0_ar_bits_size),
    .io_master_0_ar_bits_burst(arb_io_master_0_ar_bits_burst),
    .io_master_0_ar_bits_lock(arb_io_master_0_ar_bits_lock),
    .io_master_0_ar_bits_cache(arb_io_master_0_ar_bits_cache),
    .io_master_0_ar_bits_prot(arb_io_master_0_ar_bits_prot),
    .io_master_0_ar_bits_qos(arb_io_master_0_ar_bits_qos),
    .io_master_0_ar_bits_region(arb_io_master_0_ar_bits_region),
    .io_master_0_ar_bits_id(arb_io_master_0_ar_bits_id),
    .io_master_0_ar_bits_user(arb_io_master_0_ar_bits_user),
    .io_master_0_r_ready(arb_io_master_0_r_ready),
    .io_master_0_r_valid(arb_io_master_0_r_valid),
    .io_master_0_r_bits_resp(arb_io_master_0_r_bits_resp),
    .io_master_0_r_bits_data(arb_io_master_0_r_bits_data),
    .io_master_0_r_bits_last(arb_io_master_0_r_bits_last),
    .io_master_0_r_bits_id(arb_io_master_0_r_bits_id),
    .io_master_0_r_bits_user(arb_io_master_0_r_bits_user),
    .io_slave_aw_ready(arb_io_slave_aw_ready),
    .io_slave_aw_valid(arb_io_slave_aw_valid),
    .io_slave_aw_bits_addr(arb_io_slave_aw_bits_addr),
    .io_slave_aw_bits_len(arb_io_slave_aw_bits_len),
    .io_slave_aw_bits_size(arb_io_slave_aw_bits_size),
    .io_slave_aw_bits_burst(arb_io_slave_aw_bits_burst),
    .io_slave_aw_bits_lock(arb_io_slave_aw_bits_lock),
    .io_slave_aw_bits_cache(arb_io_slave_aw_bits_cache),
    .io_slave_aw_bits_prot(arb_io_slave_aw_bits_prot),
    .io_slave_aw_bits_qos(arb_io_slave_aw_bits_qos),
    .io_slave_aw_bits_region(arb_io_slave_aw_bits_region),
    .io_slave_aw_bits_id(arb_io_slave_aw_bits_id),
    .io_slave_aw_bits_user(arb_io_slave_aw_bits_user),
    .io_slave_w_ready(arb_io_slave_w_ready),
    .io_slave_w_valid(arb_io_slave_w_valid),
    .io_slave_w_bits_data(arb_io_slave_w_bits_data),
    .io_slave_w_bits_last(arb_io_slave_w_bits_last),
    .io_slave_w_bits_id(arb_io_slave_w_bits_id),
    .io_slave_w_bits_strb(arb_io_slave_w_bits_strb),
    .io_slave_w_bits_user(arb_io_slave_w_bits_user),
    .io_slave_b_ready(arb_io_slave_b_ready),
    .io_slave_b_valid(arb_io_slave_b_valid),
    .io_slave_b_bits_resp(arb_io_slave_b_bits_resp),
    .io_slave_b_bits_id(arb_io_slave_b_bits_id),
    .io_slave_b_bits_user(arb_io_slave_b_bits_user),
    .io_slave_ar_ready(arb_io_slave_ar_ready),
    .io_slave_ar_valid(arb_io_slave_ar_valid),
    .io_slave_ar_bits_addr(arb_io_slave_ar_bits_addr),
    .io_slave_ar_bits_len(arb_io_slave_ar_bits_len),
    .io_slave_ar_bits_size(arb_io_slave_ar_bits_size),
    .io_slave_ar_bits_burst(arb_io_slave_ar_bits_burst),
    .io_slave_ar_bits_lock(arb_io_slave_ar_bits_lock),
    .io_slave_ar_bits_cache(arb_io_slave_ar_bits_cache),
    .io_slave_ar_bits_prot(arb_io_slave_ar_bits_prot),
    .io_slave_ar_bits_qos(arb_io_slave_ar_bits_qos),
    .io_slave_ar_bits_region(arb_io_slave_ar_bits_region),
    .io_slave_ar_bits_id(arb_io_slave_ar_bits_id),
    .io_slave_ar_bits_user(arb_io_slave_ar_bits_user),
    .io_slave_r_ready(arb_io_slave_r_ready),
    .io_slave_r_valid(arb_io_slave_r_valid),
    .io_slave_r_bits_resp(arb_io_slave_r_bits_resp),
    .io_slave_r_bits_data(arb_io_slave_r_bits_data),
    .io_slave_r_bits_last(arb_io_slave_r_bits_last),
    .io_slave_r_bits_id(arb_io_slave_r_bits_id),
    .io_slave_r_bits_user(arb_io_slave_r_bits_user)
  );
  Channel_6 Channel_ar_io_0 (
    .clock(Channel_ar_io_0_clock),
    .reset(Channel_ar_io_0_reset),
    .io_in_ready(Channel_ar_io_0_io_in_ready),
    .io_in_valid(Channel_ar_io_0_io_in_valid),
    .io_in_bits(Channel_ar_io_0_io_in_bits),
    .io_out_ready(Channel_ar_io_0_io_out_ready),
    .io_out_valid(Channel_ar_io_0_io_out_valid),
    .io_out_bits(Channel_ar_io_0_io_out_bits),
    .io_trace_ready(Channel_ar_io_0_io_trace_ready),
    .io_trace_valid(Channel_ar_io_0_io_trace_valid),
    .io_trace_bits(Channel_ar_io_0_io_trace_bits),
    .io_traceLen(Channel_ar_io_0_io_traceLen)
  );
  Channel_6 Channel_aw_io_0 (
    .clock(Channel_aw_io_0_clock),
    .reset(Channel_aw_io_0_reset),
    .io_in_ready(Channel_aw_io_0_io_in_ready),
    .io_in_valid(Channel_aw_io_0_io_in_valid),
    .io_in_bits(Channel_aw_io_0_io_in_bits),
    .io_out_ready(Channel_aw_io_0_io_out_ready),
    .io_out_valid(Channel_aw_io_0_io_out_valid),
    .io_out_bits(Channel_aw_io_0_io_out_bits),
    .io_trace_ready(Channel_aw_io_0_io_trace_ready),
    .io_trace_valid(Channel_aw_io_0_io_trace_valid),
    .io_trace_bits(Channel_aw_io_0_io_trace_bits),
    .io_traceLen(Channel_aw_io_0_io_traceLen)
  );
  Channel_6 Channel_w_io_0 (
    .clock(Channel_w_io_0_clock),
    .reset(Channel_w_io_0_reset),
    .io_in_ready(Channel_w_io_0_io_in_ready),
    .io_in_valid(Channel_w_io_0_io_in_valid),
    .io_in_bits(Channel_w_io_0_io_in_bits),
    .io_out_ready(Channel_w_io_0_io_out_ready),
    .io_out_valid(Channel_w_io_0_io_out_valid),
    .io_out_bits(Channel_w_io_0_io_out_bits),
    .io_trace_ready(Channel_w_io_0_io_trace_ready),
    .io_trace_valid(Channel_w_io_0_io_trace_valid),
    .io_trace_bits(Channel_w_io_0_io_trace_bits),
    .io_traceLen(Channel_w_io_0_io_traceLen)
  );
  Channel_6 Channel_w_io_1 (
    .clock(Channel_w_io_1_clock),
    .reset(Channel_w_io_1_reset),
    .io_in_ready(Channel_w_io_1_io_in_ready),
    .io_in_valid(Channel_w_io_1_io_in_valid),
    .io_in_bits(Channel_w_io_1_io_in_bits),
    .io_out_ready(Channel_w_io_1_io_out_ready),
    .io_out_valid(Channel_w_io_1_io_out_valid),
    .io_out_bits(Channel_w_io_1_io_out_bits),
    .io_trace_ready(Channel_w_io_1_io_trace_ready),
    .io_trace_valid(Channel_w_io_1_io_trace_valid),
    .io_trace_bits(Channel_w_io_1_io_trace_bits),
    .io_traceLen(Channel_w_io_1_io_traceLen)
  );
  Channel_6 Channel_r_io_0 (
    .clock(Channel_r_io_0_clock),
    .reset(Channel_r_io_0_reset),
    .io_in_ready(Channel_r_io_0_io_in_ready),
    .io_in_valid(Channel_r_io_0_io_in_valid),
    .io_in_bits(Channel_r_io_0_io_in_bits),
    .io_out_ready(Channel_r_io_0_io_out_ready),
    .io_out_valid(Channel_r_io_0_io_out_valid),
    .io_out_bits(Channel_r_io_0_io_out_bits),
    .io_trace_ready(Channel_r_io_0_io_trace_ready),
    .io_trace_valid(Channel_r_io_0_io_trace_valid),
    .io_trace_bits(Channel_r_io_0_io_trace_bits),
    .io_traceLen(Channel_r_io_0_io_traceLen)
  );
  Channel_6 Channel_r_io_1 (
    .clock(Channel_r_io_1_clock),
    .reset(Channel_r_io_1_reset),
    .io_in_ready(Channel_r_io_1_io_in_ready),
    .io_in_valid(Channel_r_io_1_io_in_valid),
    .io_in_bits(Channel_r_io_1_io_in_bits),
    .io_out_ready(Channel_r_io_1_io_out_ready),
    .io_out_valid(Channel_r_io_1_io_out_valid),
    .io_out_bits(Channel_r_io_1_io_out_bits),
    .io_trace_ready(Channel_r_io_1_io_trace_ready),
    .io_trace_valid(Channel_r_io_1_io_trace_valid),
    .io_trace_bits(Channel_r_io_1_io_trace_bits),
    .io_traceLen(Channel_r_io_1_io_traceLen)
  );
  ZynqMasterHandler ZynqMasterHandler_1 (
    .clock(ZynqMasterHandler_1_clock),
    .reset(ZynqMasterHandler_1_reset),
    .io_ctrl_aw_ready(ZynqMasterHandler_1_io_ctrl_aw_ready),
    .io_ctrl_aw_valid(ZynqMasterHandler_1_io_ctrl_aw_valid),
    .io_ctrl_aw_bits_addr(ZynqMasterHandler_1_io_ctrl_aw_bits_addr),
    .io_ctrl_aw_bits_len(ZynqMasterHandler_1_io_ctrl_aw_bits_len),
    .io_ctrl_aw_bits_size(ZynqMasterHandler_1_io_ctrl_aw_bits_size),
    .io_ctrl_aw_bits_burst(ZynqMasterHandler_1_io_ctrl_aw_bits_burst),
    .io_ctrl_aw_bits_lock(ZynqMasterHandler_1_io_ctrl_aw_bits_lock),
    .io_ctrl_aw_bits_cache(ZynqMasterHandler_1_io_ctrl_aw_bits_cache),
    .io_ctrl_aw_bits_prot(ZynqMasterHandler_1_io_ctrl_aw_bits_prot),
    .io_ctrl_aw_bits_qos(ZynqMasterHandler_1_io_ctrl_aw_bits_qos),
    .io_ctrl_aw_bits_region(ZynqMasterHandler_1_io_ctrl_aw_bits_region),
    .io_ctrl_aw_bits_id(ZynqMasterHandler_1_io_ctrl_aw_bits_id),
    .io_ctrl_aw_bits_user(ZynqMasterHandler_1_io_ctrl_aw_bits_user),
    .io_ctrl_w_ready(ZynqMasterHandler_1_io_ctrl_w_ready),
    .io_ctrl_w_valid(ZynqMasterHandler_1_io_ctrl_w_valid),
    .io_ctrl_w_bits_data(ZynqMasterHandler_1_io_ctrl_w_bits_data),
    .io_ctrl_w_bits_last(ZynqMasterHandler_1_io_ctrl_w_bits_last),
    .io_ctrl_w_bits_id(ZynqMasterHandler_1_io_ctrl_w_bits_id),
    .io_ctrl_w_bits_strb(ZynqMasterHandler_1_io_ctrl_w_bits_strb),
    .io_ctrl_w_bits_user(ZynqMasterHandler_1_io_ctrl_w_bits_user),
    .io_ctrl_b_ready(ZynqMasterHandler_1_io_ctrl_b_ready),
    .io_ctrl_b_valid(ZynqMasterHandler_1_io_ctrl_b_valid),
    .io_ctrl_b_bits_resp(ZynqMasterHandler_1_io_ctrl_b_bits_resp),
    .io_ctrl_b_bits_id(ZynqMasterHandler_1_io_ctrl_b_bits_id),
    .io_ctrl_b_bits_user(ZynqMasterHandler_1_io_ctrl_b_bits_user),
    .io_ctrl_ar_ready(ZynqMasterHandler_1_io_ctrl_ar_ready),
    .io_ctrl_ar_valid(ZynqMasterHandler_1_io_ctrl_ar_valid),
    .io_ctrl_ar_bits_addr(ZynqMasterHandler_1_io_ctrl_ar_bits_addr),
    .io_ctrl_ar_bits_len(ZynqMasterHandler_1_io_ctrl_ar_bits_len),
    .io_ctrl_ar_bits_size(ZynqMasterHandler_1_io_ctrl_ar_bits_size),
    .io_ctrl_ar_bits_burst(ZynqMasterHandler_1_io_ctrl_ar_bits_burst),
    .io_ctrl_ar_bits_lock(ZynqMasterHandler_1_io_ctrl_ar_bits_lock),
    .io_ctrl_ar_bits_cache(ZynqMasterHandler_1_io_ctrl_ar_bits_cache),
    .io_ctrl_ar_bits_prot(ZynqMasterHandler_1_io_ctrl_ar_bits_prot),
    .io_ctrl_ar_bits_qos(ZynqMasterHandler_1_io_ctrl_ar_bits_qos),
    .io_ctrl_ar_bits_region(ZynqMasterHandler_1_io_ctrl_ar_bits_region),
    .io_ctrl_ar_bits_id(ZynqMasterHandler_1_io_ctrl_ar_bits_id),
    .io_ctrl_ar_bits_user(ZynqMasterHandler_1_io_ctrl_ar_bits_user),
    .io_ctrl_r_ready(ZynqMasterHandler_1_io_ctrl_r_ready),
    .io_ctrl_r_valid(ZynqMasterHandler_1_io_ctrl_r_valid),
    .io_ctrl_r_bits_resp(ZynqMasterHandler_1_io_ctrl_r_bits_resp),
    .io_ctrl_r_bits_data(ZynqMasterHandler_1_io_ctrl_r_bits_data),
    .io_ctrl_r_bits_last(ZynqMasterHandler_1_io_ctrl_r_bits_last),
    .io_ctrl_r_bits_id(ZynqMasterHandler_1_io_ctrl_r_bits_id),
    .io_ctrl_r_bits_user(ZynqMasterHandler_1_io_ctrl_r_bits_user),
    .io_ins_0_ready(ZynqMasterHandler_1_io_ins_0_ready),
    .io_ins_0_valid(ZynqMasterHandler_1_io_ins_0_valid),
    .io_ins_0_bits(ZynqMasterHandler_1_io_ins_0_bits),
    .io_ins_1_ready(ZynqMasterHandler_1_io_ins_1_ready),
    .io_ins_1_valid(ZynqMasterHandler_1_io_ins_1_valid),
    .io_ins_1_bits(ZynqMasterHandler_1_io_ins_1_bits),
    .io_ins_2_ready(ZynqMasterHandler_1_io_ins_2_ready),
    .io_ins_2_valid(ZynqMasterHandler_1_io_ins_2_valid),
    .io_ins_2_bits(ZynqMasterHandler_1_io_ins_2_bits),
    .io_outs_0_ready(ZynqMasterHandler_1_io_outs_0_ready),
    .io_outs_0_valid(ZynqMasterHandler_1_io_outs_0_valid),
    .io_outs_0_bits(ZynqMasterHandler_1_io_outs_0_bits),
    .io_outs_1_ready(ZynqMasterHandler_1_io_outs_1_ready),
    .io_outs_1_valid(ZynqMasterHandler_1_io_outs_1_valid),
    .io_outs_1_bits(ZynqMasterHandler_1_io_outs_1_bits),
    .io_inT_0_ready(ZynqMasterHandler_1_io_inT_0_ready),
    .io_inT_0_valid(ZynqMasterHandler_1_io_inT_0_valid),
    .io_inT_0_bits(ZynqMasterHandler_1_io_inT_0_bits),
    .io_inT_1_ready(ZynqMasterHandler_1_io_inT_1_ready),
    .io_inT_1_valid(ZynqMasterHandler_1_io_inT_1_valid),
    .io_inT_1_bits(ZynqMasterHandler_1_io_inT_1_bits),
    .io_inT_2_ready(ZynqMasterHandler_1_io_inT_2_ready),
    .io_inT_2_valid(ZynqMasterHandler_1_io_inT_2_valid),
    .io_inT_2_bits(ZynqMasterHandler_1_io_inT_2_bits),
    .io_inT_3_ready(ZynqMasterHandler_1_io_inT_3_ready),
    .io_inT_3_valid(ZynqMasterHandler_1_io_inT_3_valid),
    .io_inT_3_bits(ZynqMasterHandler_1_io_inT_3_bits),
    .io_outT_0_ready(ZynqMasterHandler_1_io_outT_0_ready),
    .io_outT_0_valid(ZynqMasterHandler_1_io_outT_0_valid),
    .io_outT_0_bits(ZynqMasterHandler_1_io_outT_0_bits),
    .io_outT_1_ready(ZynqMasterHandler_1_io_outT_1_ready),
    .io_outT_1_valid(ZynqMasterHandler_1_io_outT_1_valid),
    .io_outT_1_bits(ZynqMasterHandler_1_io_outT_1_bits),
    .io_mem_ar_0_ready(ZynqMasterHandler_1_io_mem_ar_0_ready),
    .io_mem_ar_0_valid(ZynqMasterHandler_1_io_mem_ar_0_valid),
    .io_mem_ar_0_bits(ZynqMasterHandler_1_io_mem_ar_0_bits),
    .io_mem_aw_0_ready(ZynqMasterHandler_1_io_mem_aw_0_ready),
    .io_mem_aw_0_valid(ZynqMasterHandler_1_io_mem_aw_0_valid),
    .io_mem_aw_0_bits(ZynqMasterHandler_1_io_mem_aw_0_bits),
    .io_mem_r_0_ready(ZynqMasterHandler_1_io_mem_r_0_ready),
    .io_mem_r_0_valid(ZynqMasterHandler_1_io_mem_r_0_valid),
    .io_mem_r_0_bits(ZynqMasterHandler_1_io_mem_r_0_bits),
    .io_mem_r_1_ready(ZynqMasterHandler_1_io_mem_r_1_ready),
    .io_mem_r_1_valid(ZynqMasterHandler_1_io_mem_r_1_valid),
    .io_mem_r_1_bits(ZynqMasterHandler_1_io_mem_r_1_bits),
    .io_mem_w_0_ready(ZynqMasterHandler_1_io_mem_w_0_ready),
    .io_mem_w_0_valid(ZynqMasterHandler_1_io_mem_w_0_valid),
    .io_mem_w_0_bits(ZynqMasterHandler_1_io_mem_w_0_bits),
    .io_mem_w_1_ready(ZynqMasterHandler_1_io_mem_w_1_ready),
    .io_mem_w_1_valid(ZynqMasterHandler_1_io_mem_w_1_valid),
    .io_mem_w_1_bits(ZynqMasterHandler_1_io_mem_w_1_bits)
  );
  EmulationMaster EmulationMaster_1 (
    .clock(EmulationMaster_1_clock),
    .reset(EmulationMaster_1_reset),
    .io_ctrl_aw_ready(EmulationMaster_1_io_ctrl_aw_ready),
    .io_ctrl_aw_valid(EmulationMaster_1_io_ctrl_aw_valid),
    .io_ctrl_aw_bits_addr(EmulationMaster_1_io_ctrl_aw_bits_addr),
    .io_ctrl_aw_bits_len(EmulationMaster_1_io_ctrl_aw_bits_len),
    .io_ctrl_aw_bits_size(EmulationMaster_1_io_ctrl_aw_bits_size),
    .io_ctrl_aw_bits_burst(EmulationMaster_1_io_ctrl_aw_bits_burst),
    .io_ctrl_aw_bits_lock(EmulationMaster_1_io_ctrl_aw_bits_lock),
    .io_ctrl_aw_bits_cache(EmulationMaster_1_io_ctrl_aw_bits_cache),
    .io_ctrl_aw_bits_prot(EmulationMaster_1_io_ctrl_aw_bits_prot),
    .io_ctrl_aw_bits_qos(EmulationMaster_1_io_ctrl_aw_bits_qos),
    .io_ctrl_aw_bits_region(EmulationMaster_1_io_ctrl_aw_bits_region),
    .io_ctrl_aw_bits_id(EmulationMaster_1_io_ctrl_aw_bits_id),
    .io_ctrl_aw_bits_user(EmulationMaster_1_io_ctrl_aw_bits_user),
    .io_ctrl_w_ready(EmulationMaster_1_io_ctrl_w_ready),
    .io_ctrl_w_valid(EmulationMaster_1_io_ctrl_w_valid),
    .io_ctrl_w_bits_data(EmulationMaster_1_io_ctrl_w_bits_data),
    .io_ctrl_w_bits_last(EmulationMaster_1_io_ctrl_w_bits_last),
    .io_ctrl_w_bits_id(EmulationMaster_1_io_ctrl_w_bits_id),
    .io_ctrl_w_bits_strb(EmulationMaster_1_io_ctrl_w_bits_strb),
    .io_ctrl_w_bits_user(EmulationMaster_1_io_ctrl_w_bits_user),
    .io_ctrl_b_ready(EmulationMaster_1_io_ctrl_b_ready),
    .io_ctrl_b_valid(EmulationMaster_1_io_ctrl_b_valid),
    .io_ctrl_b_bits_resp(EmulationMaster_1_io_ctrl_b_bits_resp),
    .io_ctrl_b_bits_id(EmulationMaster_1_io_ctrl_b_bits_id),
    .io_ctrl_b_bits_user(EmulationMaster_1_io_ctrl_b_bits_user),
    .io_ctrl_ar_ready(EmulationMaster_1_io_ctrl_ar_ready),
    .io_ctrl_ar_valid(EmulationMaster_1_io_ctrl_ar_valid),
    .io_ctrl_ar_bits_addr(EmulationMaster_1_io_ctrl_ar_bits_addr),
    .io_ctrl_ar_bits_len(EmulationMaster_1_io_ctrl_ar_bits_len),
    .io_ctrl_ar_bits_size(EmulationMaster_1_io_ctrl_ar_bits_size),
    .io_ctrl_ar_bits_burst(EmulationMaster_1_io_ctrl_ar_bits_burst),
    .io_ctrl_ar_bits_lock(EmulationMaster_1_io_ctrl_ar_bits_lock),
    .io_ctrl_ar_bits_cache(EmulationMaster_1_io_ctrl_ar_bits_cache),
    .io_ctrl_ar_bits_prot(EmulationMaster_1_io_ctrl_ar_bits_prot),
    .io_ctrl_ar_bits_qos(EmulationMaster_1_io_ctrl_ar_bits_qos),
    .io_ctrl_ar_bits_region(EmulationMaster_1_io_ctrl_ar_bits_region),
    .io_ctrl_ar_bits_id(EmulationMaster_1_io_ctrl_ar_bits_id),
    .io_ctrl_ar_bits_user(EmulationMaster_1_io_ctrl_ar_bits_user),
    .io_ctrl_r_ready(EmulationMaster_1_io_ctrl_r_ready),
    .io_ctrl_r_valid(EmulationMaster_1_io_ctrl_r_valid),
    .io_ctrl_r_bits_resp(EmulationMaster_1_io_ctrl_r_bits_resp),
    .io_ctrl_r_bits_data(EmulationMaster_1_io_ctrl_r_bits_data),
    .io_ctrl_r_bits_last(EmulationMaster_1_io_ctrl_r_bits_last),
    .io_ctrl_r_bits_id(EmulationMaster_1_io_ctrl_r_bits_id),
    .io_ctrl_r_bits_user(EmulationMaster_1_io_ctrl_r_bits_user),
    .io_hostReset(EmulationMaster_1_io_hostReset),
    .io_simReset(EmulationMaster_1_io_simReset),
    .io_done(EmulationMaster_1_io_done),
    .io_step_ready(EmulationMaster_1_io_step_ready),
    .io_step_valid(EmulationMaster_1_io_step_valid),
    .io_step_bits(EmulationMaster_1_io_step_bits),
    .io_traceLen(EmulationMaster_1_io_traceLen)
  );
  DaisyController DaisyChainController (
    .clock(DaisyChainController_clock),
    .reset(DaisyChainController_reset),
    .io_ctrl_aw_ready(DaisyChainController_io_ctrl_aw_ready),
    .io_ctrl_aw_valid(DaisyChainController_io_ctrl_aw_valid),
    .io_ctrl_aw_bits_addr(DaisyChainController_io_ctrl_aw_bits_addr),
    .io_ctrl_aw_bits_len(DaisyChainController_io_ctrl_aw_bits_len),
    .io_ctrl_aw_bits_size(DaisyChainController_io_ctrl_aw_bits_size),
    .io_ctrl_aw_bits_burst(DaisyChainController_io_ctrl_aw_bits_burst),
    .io_ctrl_aw_bits_lock(DaisyChainController_io_ctrl_aw_bits_lock),
    .io_ctrl_aw_bits_cache(DaisyChainController_io_ctrl_aw_bits_cache),
    .io_ctrl_aw_bits_prot(DaisyChainController_io_ctrl_aw_bits_prot),
    .io_ctrl_aw_bits_qos(DaisyChainController_io_ctrl_aw_bits_qos),
    .io_ctrl_aw_bits_region(DaisyChainController_io_ctrl_aw_bits_region),
    .io_ctrl_aw_bits_id(DaisyChainController_io_ctrl_aw_bits_id),
    .io_ctrl_aw_bits_user(DaisyChainController_io_ctrl_aw_bits_user),
    .io_ctrl_w_ready(DaisyChainController_io_ctrl_w_ready),
    .io_ctrl_w_valid(DaisyChainController_io_ctrl_w_valid),
    .io_ctrl_w_bits_data(DaisyChainController_io_ctrl_w_bits_data),
    .io_ctrl_w_bits_last(DaisyChainController_io_ctrl_w_bits_last),
    .io_ctrl_w_bits_id(DaisyChainController_io_ctrl_w_bits_id),
    .io_ctrl_w_bits_strb(DaisyChainController_io_ctrl_w_bits_strb),
    .io_ctrl_w_bits_user(DaisyChainController_io_ctrl_w_bits_user),
    .io_ctrl_b_ready(DaisyChainController_io_ctrl_b_ready),
    .io_ctrl_b_valid(DaisyChainController_io_ctrl_b_valid),
    .io_ctrl_b_bits_resp(DaisyChainController_io_ctrl_b_bits_resp),
    .io_ctrl_b_bits_id(DaisyChainController_io_ctrl_b_bits_id),
    .io_ctrl_b_bits_user(DaisyChainController_io_ctrl_b_bits_user),
    .io_ctrl_ar_ready(DaisyChainController_io_ctrl_ar_ready),
    .io_ctrl_ar_valid(DaisyChainController_io_ctrl_ar_valid),
    .io_ctrl_ar_bits_addr(DaisyChainController_io_ctrl_ar_bits_addr),
    .io_ctrl_ar_bits_len(DaisyChainController_io_ctrl_ar_bits_len),
    .io_ctrl_ar_bits_size(DaisyChainController_io_ctrl_ar_bits_size),
    .io_ctrl_ar_bits_burst(DaisyChainController_io_ctrl_ar_bits_burst),
    .io_ctrl_ar_bits_lock(DaisyChainController_io_ctrl_ar_bits_lock),
    .io_ctrl_ar_bits_cache(DaisyChainController_io_ctrl_ar_bits_cache),
    .io_ctrl_ar_bits_prot(DaisyChainController_io_ctrl_ar_bits_prot),
    .io_ctrl_ar_bits_qos(DaisyChainController_io_ctrl_ar_bits_qos),
    .io_ctrl_ar_bits_region(DaisyChainController_io_ctrl_ar_bits_region),
    .io_ctrl_ar_bits_id(DaisyChainController_io_ctrl_ar_bits_id),
    .io_ctrl_ar_bits_user(DaisyChainController_io_ctrl_ar_bits_user),
    .io_ctrl_r_ready(DaisyChainController_io_ctrl_r_ready),
    .io_ctrl_r_valid(DaisyChainController_io_ctrl_r_valid),
    .io_ctrl_r_bits_resp(DaisyChainController_io_ctrl_r_bits_resp),
    .io_ctrl_r_bits_data(DaisyChainController_io_ctrl_r_bits_data),
    .io_ctrl_r_bits_last(DaisyChainController_io_ctrl_r_bits_last),
    .io_ctrl_r_bits_id(DaisyChainController_io_ctrl_r_bits_id),
    .io_ctrl_r_bits_user(DaisyChainController_io_ctrl_r_bits_user),
    .io_daisy_regs_0_in_ready(DaisyChainController_io_daisy_regs_0_in_ready),
    .io_daisy_regs_0_in_valid(DaisyChainController_io_daisy_regs_0_in_valid),
    .io_daisy_regs_0_in_bits(DaisyChainController_io_daisy_regs_0_in_bits),
    .io_daisy_regs_0_out_ready(DaisyChainController_io_daisy_regs_0_out_ready),
    .io_daisy_regs_0_out_valid(DaisyChainController_io_daisy_regs_0_out_valid),
    .io_daisy_regs_0_out_bits(DaisyChainController_io_daisy_regs_0_out_bits),
    .io_daisy_trace_0_in_ready(DaisyChainController_io_daisy_trace_0_in_ready),
    .io_daisy_trace_0_in_valid(DaisyChainController_io_daisy_trace_0_in_valid),
    .io_daisy_trace_0_in_bits(DaisyChainController_io_daisy_trace_0_in_bits),
    .io_daisy_trace_0_out_ready(DaisyChainController_io_daisy_trace_0_out_ready),
    .io_daisy_trace_0_out_valid(DaisyChainController_io_daisy_trace_0_out_valid),
    .io_daisy_trace_0_out_bits(DaisyChainController_io_daisy_trace_0_out_bits),
    .io_daisy_cntr_0_in_ready(DaisyChainController_io_daisy_cntr_0_in_ready),
    .io_daisy_cntr_0_in_valid(DaisyChainController_io_daisy_cntr_0_in_valid),
    .io_daisy_cntr_0_in_bits(DaisyChainController_io_daisy_cntr_0_in_bits),
    .io_daisy_cntr_0_out_ready(DaisyChainController_io_daisy_cntr_0_out_ready),
    .io_daisy_cntr_0_out_valid(DaisyChainController_io_daisy_cntr_0_out_valid),
    .io_daisy_cntr_0_out_bits(DaisyChainController_io_daisy_cntr_0_out_bits),
    .io_daisy_sram_0_in_ready(DaisyChainController_io_daisy_sram_0_in_ready),
    .io_daisy_sram_0_in_valid(DaisyChainController_io_daisy_sram_0_in_valid),
    .io_daisy_sram_0_in_bits(DaisyChainController_io_daisy_sram_0_in_bits),
    .io_daisy_sram_0_out_ready(DaisyChainController_io_daisy_sram_0_out_ready),
    .io_daisy_sram_0_out_valid(DaisyChainController_io_daisy_sram_0_out_valid),
    .io_daisy_sram_0_out_bits(DaisyChainController_io_daisy_sram_0_out_bits),
    .io_daisy_sram_0_restart(DaisyChainController_io_daisy_sram_0_restart)
  );
  NastiRecursiveInterconnect NastiRecursiveInterconnect_1 (
    .clock(NastiRecursiveInterconnect_1_clock),
    .reset(NastiRecursiveInterconnect_1_reset),
    .io_masters_0_aw_ready(NastiRecursiveInterconnect_1_io_masters_0_aw_ready),
    .io_masters_0_aw_valid(NastiRecursiveInterconnect_1_io_masters_0_aw_valid),
    .io_masters_0_aw_bits_addr(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_addr),
    .io_masters_0_aw_bits_len(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_len),
    .io_masters_0_aw_bits_size(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_size),
    .io_masters_0_aw_bits_burst(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_burst),
    .io_masters_0_aw_bits_lock(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_lock),
    .io_masters_0_aw_bits_cache(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_cache),
    .io_masters_0_aw_bits_prot(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_prot),
    .io_masters_0_aw_bits_qos(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_qos),
    .io_masters_0_aw_bits_region(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_region),
    .io_masters_0_aw_bits_id(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_id),
    .io_masters_0_aw_bits_user(NastiRecursiveInterconnect_1_io_masters_0_aw_bits_user),
    .io_masters_0_w_ready(NastiRecursiveInterconnect_1_io_masters_0_w_ready),
    .io_masters_0_w_valid(NastiRecursiveInterconnect_1_io_masters_0_w_valid),
    .io_masters_0_w_bits_data(NastiRecursiveInterconnect_1_io_masters_0_w_bits_data),
    .io_masters_0_w_bits_last(NastiRecursiveInterconnect_1_io_masters_0_w_bits_last),
    .io_masters_0_w_bits_id(NastiRecursiveInterconnect_1_io_masters_0_w_bits_id),
    .io_masters_0_w_bits_strb(NastiRecursiveInterconnect_1_io_masters_0_w_bits_strb),
    .io_masters_0_w_bits_user(NastiRecursiveInterconnect_1_io_masters_0_w_bits_user),
    .io_masters_0_b_ready(NastiRecursiveInterconnect_1_io_masters_0_b_ready),
    .io_masters_0_b_valid(NastiRecursiveInterconnect_1_io_masters_0_b_valid),
    .io_masters_0_b_bits_resp(NastiRecursiveInterconnect_1_io_masters_0_b_bits_resp),
    .io_masters_0_b_bits_id(NastiRecursiveInterconnect_1_io_masters_0_b_bits_id),
    .io_masters_0_b_bits_user(NastiRecursiveInterconnect_1_io_masters_0_b_bits_user),
    .io_masters_0_ar_ready(NastiRecursiveInterconnect_1_io_masters_0_ar_ready),
    .io_masters_0_ar_valid(NastiRecursiveInterconnect_1_io_masters_0_ar_valid),
    .io_masters_0_ar_bits_addr(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_addr),
    .io_masters_0_ar_bits_len(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_len),
    .io_masters_0_ar_bits_size(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_size),
    .io_masters_0_ar_bits_burst(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_burst),
    .io_masters_0_ar_bits_lock(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_lock),
    .io_masters_0_ar_bits_cache(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_cache),
    .io_masters_0_ar_bits_prot(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_prot),
    .io_masters_0_ar_bits_qos(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_qos),
    .io_masters_0_ar_bits_region(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_region),
    .io_masters_0_ar_bits_id(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_id),
    .io_masters_0_ar_bits_user(NastiRecursiveInterconnect_1_io_masters_0_ar_bits_user),
    .io_masters_0_r_ready(NastiRecursiveInterconnect_1_io_masters_0_r_ready),
    .io_masters_0_r_valid(NastiRecursiveInterconnect_1_io_masters_0_r_valid),
    .io_masters_0_r_bits_resp(NastiRecursiveInterconnect_1_io_masters_0_r_bits_resp),
    .io_masters_0_r_bits_data(NastiRecursiveInterconnect_1_io_masters_0_r_bits_data),
    .io_masters_0_r_bits_last(NastiRecursiveInterconnect_1_io_masters_0_r_bits_last),
    .io_masters_0_r_bits_id(NastiRecursiveInterconnect_1_io_masters_0_r_bits_id),
    .io_masters_0_r_bits_user(NastiRecursiveInterconnect_1_io_masters_0_r_bits_user),
    .io_slaves_0_aw_ready(NastiRecursiveInterconnect_1_io_slaves_0_aw_ready),
    .io_slaves_0_aw_valid(NastiRecursiveInterconnect_1_io_slaves_0_aw_valid),
    .io_slaves_0_aw_bits_addr(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_addr),
    .io_slaves_0_aw_bits_len(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_len),
    .io_slaves_0_aw_bits_size(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_size),
    .io_slaves_0_aw_bits_burst(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_burst),
    .io_slaves_0_aw_bits_lock(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_lock),
    .io_slaves_0_aw_bits_cache(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_cache),
    .io_slaves_0_aw_bits_prot(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_prot),
    .io_slaves_0_aw_bits_qos(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_qos),
    .io_slaves_0_aw_bits_region(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_region),
    .io_slaves_0_aw_bits_id(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_id),
    .io_slaves_0_aw_bits_user(NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_user),
    .io_slaves_0_w_ready(NastiRecursiveInterconnect_1_io_slaves_0_w_ready),
    .io_slaves_0_w_valid(NastiRecursiveInterconnect_1_io_slaves_0_w_valid),
    .io_slaves_0_w_bits_data(NastiRecursiveInterconnect_1_io_slaves_0_w_bits_data),
    .io_slaves_0_w_bits_last(NastiRecursiveInterconnect_1_io_slaves_0_w_bits_last),
    .io_slaves_0_w_bits_id(NastiRecursiveInterconnect_1_io_slaves_0_w_bits_id),
    .io_slaves_0_w_bits_strb(NastiRecursiveInterconnect_1_io_slaves_0_w_bits_strb),
    .io_slaves_0_w_bits_user(NastiRecursiveInterconnect_1_io_slaves_0_w_bits_user),
    .io_slaves_0_b_ready(NastiRecursiveInterconnect_1_io_slaves_0_b_ready),
    .io_slaves_0_b_valid(NastiRecursiveInterconnect_1_io_slaves_0_b_valid),
    .io_slaves_0_b_bits_resp(NastiRecursiveInterconnect_1_io_slaves_0_b_bits_resp),
    .io_slaves_0_b_bits_id(NastiRecursiveInterconnect_1_io_slaves_0_b_bits_id),
    .io_slaves_0_b_bits_user(NastiRecursiveInterconnect_1_io_slaves_0_b_bits_user),
    .io_slaves_0_ar_ready(NastiRecursiveInterconnect_1_io_slaves_0_ar_ready),
    .io_slaves_0_ar_valid(NastiRecursiveInterconnect_1_io_slaves_0_ar_valid),
    .io_slaves_0_ar_bits_addr(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_addr),
    .io_slaves_0_ar_bits_len(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_len),
    .io_slaves_0_ar_bits_size(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_size),
    .io_slaves_0_ar_bits_burst(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_burst),
    .io_slaves_0_ar_bits_lock(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_lock),
    .io_slaves_0_ar_bits_cache(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_cache),
    .io_slaves_0_ar_bits_prot(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_prot),
    .io_slaves_0_ar_bits_qos(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_qos),
    .io_slaves_0_ar_bits_region(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_region),
    .io_slaves_0_ar_bits_id(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_id),
    .io_slaves_0_ar_bits_user(NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_user),
    .io_slaves_0_r_ready(NastiRecursiveInterconnect_1_io_slaves_0_r_ready),
    .io_slaves_0_r_valid(NastiRecursiveInterconnect_1_io_slaves_0_r_valid),
    .io_slaves_0_r_bits_resp(NastiRecursiveInterconnect_1_io_slaves_0_r_bits_resp),
    .io_slaves_0_r_bits_data(NastiRecursiveInterconnect_1_io_slaves_0_r_bits_data),
    .io_slaves_0_r_bits_last(NastiRecursiveInterconnect_1_io_slaves_0_r_bits_last),
    .io_slaves_0_r_bits_id(NastiRecursiveInterconnect_1_io_slaves_0_r_bits_id),
    .io_slaves_0_r_bits_user(NastiRecursiveInterconnect_1_io_slaves_0_r_bits_user),
    .io_slaves_1_aw_ready(NastiRecursiveInterconnect_1_io_slaves_1_aw_ready),
    .io_slaves_1_aw_valid(NastiRecursiveInterconnect_1_io_slaves_1_aw_valid),
    .io_slaves_1_aw_bits_addr(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_addr),
    .io_slaves_1_aw_bits_len(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_len),
    .io_slaves_1_aw_bits_size(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_size),
    .io_slaves_1_aw_bits_burst(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_burst),
    .io_slaves_1_aw_bits_lock(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_lock),
    .io_slaves_1_aw_bits_cache(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_cache),
    .io_slaves_1_aw_bits_prot(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_prot),
    .io_slaves_1_aw_bits_qos(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_qos),
    .io_slaves_1_aw_bits_region(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_region),
    .io_slaves_1_aw_bits_id(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_id),
    .io_slaves_1_aw_bits_user(NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_user),
    .io_slaves_1_w_ready(NastiRecursiveInterconnect_1_io_slaves_1_w_ready),
    .io_slaves_1_w_valid(NastiRecursiveInterconnect_1_io_slaves_1_w_valid),
    .io_slaves_1_w_bits_data(NastiRecursiveInterconnect_1_io_slaves_1_w_bits_data),
    .io_slaves_1_w_bits_last(NastiRecursiveInterconnect_1_io_slaves_1_w_bits_last),
    .io_slaves_1_w_bits_id(NastiRecursiveInterconnect_1_io_slaves_1_w_bits_id),
    .io_slaves_1_w_bits_strb(NastiRecursiveInterconnect_1_io_slaves_1_w_bits_strb),
    .io_slaves_1_w_bits_user(NastiRecursiveInterconnect_1_io_slaves_1_w_bits_user),
    .io_slaves_1_b_ready(NastiRecursiveInterconnect_1_io_slaves_1_b_ready),
    .io_slaves_1_b_valid(NastiRecursiveInterconnect_1_io_slaves_1_b_valid),
    .io_slaves_1_b_bits_resp(NastiRecursiveInterconnect_1_io_slaves_1_b_bits_resp),
    .io_slaves_1_b_bits_id(NastiRecursiveInterconnect_1_io_slaves_1_b_bits_id),
    .io_slaves_1_b_bits_user(NastiRecursiveInterconnect_1_io_slaves_1_b_bits_user),
    .io_slaves_1_ar_ready(NastiRecursiveInterconnect_1_io_slaves_1_ar_ready),
    .io_slaves_1_ar_valid(NastiRecursiveInterconnect_1_io_slaves_1_ar_valid),
    .io_slaves_1_ar_bits_addr(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_addr),
    .io_slaves_1_ar_bits_len(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_len),
    .io_slaves_1_ar_bits_size(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_size),
    .io_slaves_1_ar_bits_burst(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_burst),
    .io_slaves_1_ar_bits_lock(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_lock),
    .io_slaves_1_ar_bits_cache(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_cache),
    .io_slaves_1_ar_bits_prot(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_prot),
    .io_slaves_1_ar_bits_qos(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_qos),
    .io_slaves_1_ar_bits_region(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_region),
    .io_slaves_1_ar_bits_id(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_id),
    .io_slaves_1_ar_bits_user(NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_user),
    .io_slaves_1_r_ready(NastiRecursiveInterconnect_1_io_slaves_1_r_ready),
    .io_slaves_1_r_valid(NastiRecursiveInterconnect_1_io_slaves_1_r_valid),
    .io_slaves_1_r_bits_resp(NastiRecursiveInterconnect_1_io_slaves_1_r_bits_resp),
    .io_slaves_1_r_bits_data(NastiRecursiveInterconnect_1_io_slaves_1_r_bits_data),
    .io_slaves_1_r_bits_last(NastiRecursiveInterconnect_1_io_slaves_1_r_bits_last),
    .io_slaves_1_r_bits_id(NastiRecursiveInterconnect_1_io_slaves_1_r_bits_id),
    .io_slaves_1_r_bits_user(NastiRecursiveInterconnect_1_io_slaves_1_r_bits_user),
    .io_slaves_2_aw_ready(NastiRecursiveInterconnect_1_io_slaves_2_aw_ready),
    .io_slaves_2_aw_valid(NastiRecursiveInterconnect_1_io_slaves_2_aw_valid),
    .io_slaves_2_aw_bits_addr(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_addr),
    .io_slaves_2_aw_bits_len(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_len),
    .io_slaves_2_aw_bits_size(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_size),
    .io_slaves_2_aw_bits_burst(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_burst),
    .io_slaves_2_aw_bits_lock(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_lock),
    .io_slaves_2_aw_bits_cache(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_cache),
    .io_slaves_2_aw_bits_prot(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_prot),
    .io_slaves_2_aw_bits_qos(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_qos),
    .io_slaves_2_aw_bits_region(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_region),
    .io_slaves_2_aw_bits_id(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_id),
    .io_slaves_2_aw_bits_user(NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_user),
    .io_slaves_2_w_ready(NastiRecursiveInterconnect_1_io_slaves_2_w_ready),
    .io_slaves_2_w_valid(NastiRecursiveInterconnect_1_io_slaves_2_w_valid),
    .io_slaves_2_w_bits_data(NastiRecursiveInterconnect_1_io_slaves_2_w_bits_data),
    .io_slaves_2_w_bits_last(NastiRecursiveInterconnect_1_io_slaves_2_w_bits_last),
    .io_slaves_2_w_bits_id(NastiRecursiveInterconnect_1_io_slaves_2_w_bits_id),
    .io_slaves_2_w_bits_strb(NastiRecursiveInterconnect_1_io_slaves_2_w_bits_strb),
    .io_slaves_2_w_bits_user(NastiRecursiveInterconnect_1_io_slaves_2_w_bits_user),
    .io_slaves_2_b_ready(NastiRecursiveInterconnect_1_io_slaves_2_b_ready),
    .io_slaves_2_b_valid(NastiRecursiveInterconnect_1_io_slaves_2_b_valid),
    .io_slaves_2_b_bits_resp(NastiRecursiveInterconnect_1_io_slaves_2_b_bits_resp),
    .io_slaves_2_b_bits_id(NastiRecursiveInterconnect_1_io_slaves_2_b_bits_id),
    .io_slaves_2_b_bits_user(NastiRecursiveInterconnect_1_io_slaves_2_b_bits_user),
    .io_slaves_2_ar_ready(NastiRecursiveInterconnect_1_io_slaves_2_ar_ready),
    .io_slaves_2_ar_valid(NastiRecursiveInterconnect_1_io_slaves_2_ar_valid),
    .io_slaves_2_ar_bits_addr(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_addr),
    .io_slaves_2_ar_bits_len(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_len),
    .io_slaves_2_ar_bits_size(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_size),
    .io_slaves_2_ar_bits_burst(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_burst),
    .io_slaves_2_ar_bits_lock(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_lock),
    .io_slaves_2_ar_bits_cache(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_cache),
    .io_slaves_2_ar_bits_prot(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_prot),
    .io_slaves_2_ar_bits_qos(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_qos),
    .io_slaves_2_ar_bits_region(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_region),
    .io_slaves_2_ar_bits_id(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_id),
    .io_slaves_2_ar_bits_user(NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_user),
    .io_slaves_2_r_ready(NastiRecursiveInterconnect_1_io_slaves_2_r_ready),
    .io_slaves_2_r_valid(NastiRecursiveInterconnect_1_io_slaves_2_r_valid),
    .io_slaves_2_r_bits_resp(NastiRecursiveInterconnect_1_io_slaves_2_r_bits_resp),
    .io_slaves_2_r_bits_data(NastiRecursiveInterconnect_1_io_slaves_2_r_bits_data),
    .io_slaves_2_r_bits_last(NastiRecursiveInterconnect_1_io_slaves_2_r_bits_last),
    .io_slaves_2_r_bits_id(NastiRecursiveInterconnect_1_io_slaves_2_r_bits_id),
    .io_slaves_2_r_bits_user(NastiRecursiveInterconnect_1_io_slaves_2_r_bits_user)
  );
  assign io_master_aw_ready = NastiRecursiveInterconnect_1_io_masters_0_aw_ready;
  assign io_master_w_ready = NastiRecursiveInterconnect_1_io_masters_0_w_ready;
  assign io_master_b_valid = NastiRecursiveInterconnect_1_io_masters_0_b_valid;
  assign io_master_b_bits_resp = NastiRecursiveInterconnect_1_io_masters_0_b_bits_resp;
  assign io_master_b_bits_id = NastiRecursiveInterconnect_1_io_masters_0_b_bits_id;
  assign io_master_b_bits_user = NastiRecursiveInterconnect_1_io_masters_0_b_bits_user;
  assign io_master_ar_ready = NastiRecursiveInterconnect_1_io_masters_0_ar_ready;
  assign io_master_r_valid = NastiRecursiveInterconnect_1_io_masters_0_r_valid;
  assign io_master_r_bits_resp = NastiRecursiveInterconnect_1_io_masters_0_r_bits_resp;
  assign io_master_r_bits_data = NastiRecursiveInterconnect_1_io_masters_0_r_bits_data;
  assign io_master_r_bits_last = NastiRecursiveInterconnect_1_io_masters_0_r_bits_last;
  assign io_master_r_bits_id = NastiRecursiveInterconnect_1_io_masters_0_r_bits_id;
  assign io_master_r_bits_user = NastiRecursiveInterconnect_1_io_masters_0_r_bits_user;
  assign io_slave_aw_valid = arb_io_slave_aw_valid;
  assign io_slave_aw_bits_addr = arb_io_slave_aw_bits_addr;
  assign io_slave_aw_bits_len = arb_io_slave_aw_bits_len;
  assign io_slave_aw_bits_size = arb_io_slave_aw_bits_size;
  assign io_slave_aw_bits_burst = arb_io_slave_aw_bits_burst;
  assign io_slave_aw_bits_lock = arb_io_slave_aw_bits_lock;
  assign io_slave_aw_bits_cache = arb_io_slave_aw_bits_cache;
  assign io_slave_aw_bits_prot = arb_io_slave_aw_bits_prot;
  assign io_slave_aw_bits_qos = arb_io_slave_aw_bits_qos;
  assign io_slave_aw_bits_region = arb_io_slave_aw_bits_region;
  assign io_slave_aw_bits_id = arb_io_slave_aw_bits_id;
  assign io_slave_aw_bits_user = arb_io_slave_aw_bits_user;
  assign io_slave_w_valid = arb_io_slave_w_valid;
  assign io_slave_w_bits_data = arb_io_slave_w_bits_data;
  assign io_slave_w_bits_last = arb_io_slave_w_bits_last;
  assign io_slave_w_bits_id = arb_io_slave_w_bits_id;
  assign io_slave_w_bits_strb = arb_io_slave_w_bits_strb;
  assign io_slave_w_bits_user = arb_io_slave_w_bits_user;
  assign io_slave_b_ready = arb_io_slave_b_ready;
  assign io_slave_ar_valid = arb_io_slave_ar_valid;
  assign io_slave_ar_bits_addr = arb_io_slave_ar_bits_addr;
  assign io_slave_ar_bits_len = arb_io_slave_ar_bits_len;
  assign io_slave_ar_bits_size = arb_io_slave_ar_bits_size;
  assign io_slave_ar_bits_burst = arb_io_slave_ar_bits_burst;
  assign io_slave_ar_bits_lock = arb_io_slave_ar_bits_lock;
  assign io_slave_ar_bits_cache = arb_io_slave_ar_bits_cache;
  assign io_slave_ar_bits_prot = arb_io_slave_ar_bits_prot;
  assign io_slave_ar_bits_qos = arb_io_slave_ar_bits_qos;
  assign io_slave_ar_bits_region = arb_io_slave_ar_bits_region;
  assign io_slave_ar_bits_id = arb_io_slave_ar_bits_id;
  assign io_slave_ar_bits_user = arb_io_slave_ar_bits_user;
  assign io_slave_r_ready = arb_io_slave_r_ready;
  assign sim_clock = clock;
  assign sim_reset = T_532;
  assign sim_io_ins_0_valid = T_565;
  assign sim_io_ins_0_bits = {{31'd0}, simReset};
  assign sim_io_ins_1_valid = T_565;
  assign sim_io_ins_1_bits = in_buf_0_io_deq_bits;
  assign sim_io_ins_2_valid = T_565;
  assign sim_io_ins_2_bits = in_buf_1_io_deq_bits;
  assign sim_io_ins_3_valid = T_565;
  assign sim_io_ins_3_bits = in_buf_2_io_deq_bits;
  assign sim_io_outs_0_ready = tock;
  assign sim_io_outs_1_ready = tock;
  assign sim_io_inT_0_ready = ZynqMasterHandler_1_io_inT_0_ready;
  assign sim_io_inT_1_ready = ZynqMasterHandler_1_io_inT_1_ready;
  assign sim_io_inT_2_ready = ZynqMasterHandler_1_io_inT_2_ready;
  assign sim_io_inT_3_ready = ZynqMasterHandler_1_io_inT_3_ready;
  assign sim_io_outT_0_ready = ZynqMasterHandler_1_io_outT_0_ready;
  assign sim_io_outT_1_ready = ZynqMasterHandler_1_io_outT_1_ready;
  assign sim_io_daisy_regs_0_in_valid = DaisyChainController_io_daisy_regs_0_in_valid;
  assign sim_io_daisy_regs_0_in_bits = DaisyChainController_io_daisy_regs_0_in_bits;
  assign sim_io_daisy_regs_0_out_ready = DaisyChainController_io_daisy_regs_0_out_ready;
  assign sim_io_daisy_trace_0_in_valid = DaisyChainController_io_daisy_trace_0_in_valid;
  assign sim_io_daisy_trace_0_in_bits = DaisyChainController_io_daisy_trace_0_in_bits;
  assign sim_io_daisy_trace_0_out_ready = DaisyChainController_io_daisy_trace_0_out_ready;
  assign sim_io_daisy_cntr_0_in_valid = DaisyChainController_io_daisy_cntr_0_in_valid;
  assign sim_io_daisy_cntr_0_in_bits = DaisyChainController_io_daisy_cntr_0_in_bits;
  assign sim_io_daisy_cntr_0_out_ready = DaisyChainController_io_daisy_cntr_0_out_ready;
  assign sim_io_daisy_sram_0_in_valid = DaisyChainController_io_daisy_sram_0_in_valid;
  assign sim_io_daisy_sram_0_in_bits = DaisyChainController_io_daisy_sram_0_in_bits;
  assign sim_io_daisy_sram_0_out_ready = DaisyChainController_io_daisy_sram_0_out_ready;
  assign sim_io_daisy_sram_0_restart = DaisyChainController_io_daisy_sram_0_restart;
  assign sim_io_traceLen = EmulationMaster_1_io_traceLen[10:0];
  assign simReset = EmulationMaster_1_io_simReset;
  assign hostReset = EmulationMaster_1_io_hostReset;
  assign in_buf_0_clock = clock;
  assign in_buf_0_reset = T_532;
  assign in_buf_0_io_enq_valid = ZynqMasterHandler_1_io_ins_0_valid;
  assign in_buf_0_io_enq_bits = ZynqMasterHandler_1_io_ins_0_bits;
  assign in_buf_0_io_deq_ready = T_579;
  assign T_532 = reset | hostReset;
  assign in_buf_1_clock = clock;
  assign in_buf_1_reset = T_532;
  assign in_buf_1_io_enq_valid = ZynqMasterHandler_1_io_ins_1_valid;
  assign in_buf_1_io_enq_bits = ZynqMasterHandler_1_io_ins_1_bits;
  assign in_buf_1_io_deq_ready = T_579;
  assign in_buf_2_clock = clock;
  assign in_buf_2_reset = T_532;
  assign in_buf_2_io_enq_valid = ZynqMasterHandler_1_io_ins_2_valid;
  assign in_buf_2_io_enq_bits = ZynqMasterHandler_1_io_ins_2_bits;
  assign in_buf_2_io_deq_ready = T_579;
  assign out_buf_0_clock = clock;
  assign out_buf_0_reset = T_532;
  assign out_buf_0_io_enq_valid = T_588;
  assign out_buf_0_io_enq_bits = sim_io_outs_0_bits;
  assign out_buf_0_io_deq_ready = ZynqMasterHandler_1_io_outs_0_ready;
  assign out_buf_1_clock = clock;
  assign out_buf_1_reset = T_532;
  assign out_buf_1_io_enq_valid = T_588;
  assign out_buf_1_io_enq_bits = sim_io_outs_1_bits;
  assign out_buf_1_io_deq_ready = ZynqMasterHandler_1_io_outs_1_ready;
  assign T_540 = tickCounter != 32'h0;
  assign T_541 = T_540 & in_buf_0_io_deq_valid;
  assign T_542 = T_541 & in_buf_1_io_deq_valid;
  assign T_543 = T_542 & in_buf_2_io_deq_valid;
  assign T_545 = sim_io_ins_0_ready;
  assign T_546 = T_545 & sim_io_ins_1_ready;
  assign T_547 = T_546 & sim_io_ins_2_ready;
  assign T_548 = T_547 & sim_io_ins_3_ready;
  assign tick = T_543 & T_548;
  assign T_550 = tockCounter != 32'h0;
  assign T_551 = T_550 & out_buf_0_io_enq_ready;
  assign T_552 = T_551 & out_buf_1_io_enq_ready;
  assign T_554 = sim_io_outs_0_valid;
  assign T_555 = T_554 & sim_io_outs_1_valid;
  assign tock = T_552 & T_555;
  assign T_559 = T_540 == 1'h0;
  assign T_563 = T_550 == 1'h0;
  assign idle = T_559 & T_563;
  assign T_565 = tick | simReset;
  assign T_567 = tickCounter - 32'h1;
  assign T_568 = T_567[31:0];
  assign GEN_0 = tick ? T_568 : tickCounter;
  assign T_570 = tockCounter - 32'h1;
  assign T_571 = T_570[31:0];
  assign GEN_1 = tock ? T_571 : tockCounter;
  assign GEN_2 = simReset ? 32'h0 : GEN_0;
  assign GEN_3 = simReset ? 32'h1 : GEN_1;
  assign T_578 = tickCounter == 32'h1;
  assign T_579 = tick & T_578;
  assign T_587 = tockCounter == 32'h1;
  assign T_588 = tock & T_587;
  assign arb_clock = clock;
  assign arb_reset = reset;
  assign arb_io_master_0_aw_valid = T_698;
  assign arb_io_master_0_aw_bits_addr = T_621_addr;
  assign arb_io_master_0_aw_bits_len = T_621_len;
  assign arb_io_master_0_aw_bits_size = T_621_size;
  assign arb_io_master_0_aw_bits_burst = T_621_burst;
  assign arb_io_master_0_aw_bits_lock = T_621_lock;
  assign arb_io_master_0_aw_bits_cache = T_621_cache;
  assign arb_io_master_0_aw_bits_prot = T_621_prot;
  assign arb_io_master_0_aw_bits_qos = T_621_qos;
  assign arb_io_master_0_aw_bits_region = T_621_region;
  assign arb_io_master_0_aw_bits_id = T_621_id;
  assign arb_io_master_0_aw_bits_user = T_621_user;
  assign arb_io_master_0_w_valid = T_703;
  assign arb_io_master_0_w_bits_data = T_681_data;
  assign arb_io_master_0_w_bits_last = T_681_last;
  assign arb_io_master_0_w_bits_id = T_681_id;
  assign arb_io_master_0_w_bits_strb = T_681_strb;
  assign arb_io_master_0_w_bits_user = T_681_user;
  assign arb_io_master_0_b_ready = 1'h1;
  assign arb_io_master_0_ar_valid = T_700;
  assign arb_io_master_0_ar_bits_addr = T_654_addr;
  assign arb_io_master_0_ar_bits_len = T_654_len;
  assign arb_io_master_0_ar_bits_size = T_654_size;
  assign arb_io_master_0_ar_bits_burst = T_654_burst;
  assign arb_io_master_0_ar_bits_lock = T_654_lock;
  assign arb_io_master_0_ar_bits_cache = T_654_cache;
  assign arb_io_master_0_ar_bits_prot = T_654_prot;
  assign arb_io_master_0_ar_bits_qos = T_654_qos;
  assign arb_io_master_0_ar_bits_region = T_654_region;
  assign arb_io_master_0_ar_bits_id = T_654_id;
  assign arb_io_master_0_ar_bits_user = T_654_user;
  assign arb_io_master_0_r_ready = T_706;
  assign arb_io_slave_aw_ready = io_slave_aw_ready;
  assign arb_io_slave_w_ready = io_slave_w_ready;
  assign arb_io_slave_b_valid = io_slave_b_valid;
  assign arb_io_slave_b_bits_resp = io_slave_b_bits_resp;
  assign arb_io_slave_b_bits_id = io_slave_b_bits_id;
  assign arb_io_slave_b_bits_user = io_slave_b_bits_user;
  assign arb_io_slave_ar_ready = io_slave_ar_ready;
  assign arb_io_slave_r_valid = io_slave_r_valid;
  assign arb_io_slave_r_bits_resp = io_slave_r_bits_resp;
  assign arb_io_slave_r_bits_data = io_slave_r_bits_data;
  assign arb_io_slave_r_bits_last = io_slave_r_bits_last;
  assign arb_io_slave_r_bits_id = io_slave_r_bits_id;
  assign arb_io_slave_r_bits_user = io_slave_r_bits_user;
  assign Channel_ar_io_0_clock = clock;
  assign Channel_ar_io_0_reset = reset;
  assign Channel_ar_io_0_io_in_valid = ZynqMasterHandler_1_io_mem_ar_0_valid;
  assign Channel_ar_io_0_io_in_bits = ZynqMasterHandler_1_io_mem_ar_0_bits;
  assign Channel_ar_io_0_io_out_ready = T_709;
  assign Channel_ar_io_0_io_trace_ready = GEN_6;
  assign Channel_ar_io_0_io_traceLen = GEN_7;
  assign Channel_aw_io_0_clock = clock;
  assign Channel_aw_io_0_reset = reset;
  assign Channel_aw_io_0_io_in_valid = ZynqMasterHandler_1_io_mem_aw_0_valid;
  assign Channel_aw_io_0_io_in_bits = ZynqMasterHandler_1_io_mem_aw_0_bits;
  assign Channel_aw_io_0_io_out_ready = T_708;
  assign Channel_aw_io_0_io_trace_ready = GEN_8;
  assign Channel_aw_io_0_io_traceLen = GEN_9;
  assign Channel_w_io_0_clock = clock;
  assign Channel_w_io_0_reset = reset;
  assign Channel_w_io_0_io_in_valid = ZynqMasterHandler_1_io_mem_w_0_valid;
  assign Channel_w_io_0_io_in_bits = ZynqMasterHandler_1_io_mem_w_0_bits;
  assign Channel_w_io_0_io_out_ready = T_710;
  assign Channel_w_io_0_io_trace_ready = GEN_10;
  assign Channel_w_io_0_io_traceLen = GEN_11;
  assign Channel_w_io_1_clock = clock;
  assign Channel_w_io_1_reset = reset;
  assign Channel_w_io_1_io_in_valid = ZynqMasterHandler_1_io_mem_w_1_valid;
  assign Channel_w_io_1_io_in_bits = ZynqMasterHandler_1_io_mem_w_1_bits;
  assign Channel_w_io_1_io_out_ready = T_710;
  assign Channel_w_io_1_io_trace_ready = GEN_12;
  assign Channel_w_io_1_io_traceLen = GEN_13;
  assign Channel_r_io_0_clock = clock;
  assign Channel_r_io_0_reset = reset;
  assign Channel_r_io_0_io_in_valid = T_712;
  assign Channel_r_io_0_io_in_bits = T_694[31:0];
  assign Channel_r_io_0_io_out_ready = ZynqMasterHandler_1_io_mem_r_0_ready;
  assign Channel_r_io_0_io_trace_ready = GEN_14;
  assign Channel_r_io_0_io_traceLen = GEN_15;
  assign Channel_r_io_1_clock = clock;
  assign Channel_r_io_1_reset = reset;
  assign Channel_r_io_1_io_in_valid = T_712;
  assign Channel_r_io_1_io_in_bits = T_696[31:0];
  assign Channel_r_io_1_io_out_ready = ZynqMasterHandler_1_io_mem_r_1_ready;
  assign Channel_r_io_1_io_trace_ready = GEN_16;
  assign Channel_r_io_1_io_traceLen = GEN_17;
  assign ZynqMasterHandler_1_clock = clock;
  assign ZynqMasterHandler_1_reset = reset;
  assign ZynqMasterHandler_1_io_ctrl_aw_valid = NastiRecursiveInterconnect_1_io_slaves_0_aw_valid;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_addr = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_addr;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_len = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_len;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_size = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_size;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_burst = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_burst;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_lock = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_lock;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_cache = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_cache;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_prot = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_prot;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_qos = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_qos;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_region = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_region;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_id = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_id;
  assign ZynqMasterHandler_1_io_ctrl_aw_bits_user = NastiRecursiveInterconnect_1_io_slaves_0_aw_bits_user;
  assign ZynqMasterHandler_1_io_ctrl_w_valid = NastiRecursiveInterconnect_1_io_slaves_0_w_valid;
  assign ZynqMasterHandler_1_io_ctrl_w_bits_data = NastiRecursiveInterconnect_1_io_slaves_0_w_bits_data;
  assign ZynqMasterHandler_1_io_ctrl_w_bits_last = NastiRecursiveInterconnect_1_io_slaves_0_w_bits_last;
  assign ZynqMasterHandler_1_io_ctrl_w_bits_id = NastiRecursiveInterconnect_1_io_slaves_0_w_bits_id;
  assign ZynqMasterHandler_1_io_ctrl_w_bits_strb = NastiRecursiveInterconnect_1_io_slaves_0_w_bits_strb;
  assign ZynqMasterHandler_1_io_ctrl_w_bits_user = NastiRecursiveInterconnect_1_io_slaves_0_w_bits_user;
  assign ZynqMasterHandler_1_io_ctrl_b_ready = NastiRecursiveInterconnect_1_io_slaves_0_b_ready;
  assign ZynqMasterHandler_1_io_ctrl_ar_valid = NastiRecursiveInterconnect_1_io_slaves_0_ar_valid;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_addr = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_addr;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_len = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_len;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_size = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_size;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_burst = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_burst;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_lock = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_lock;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_cache = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_cache;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_prot = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_prot;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_qos = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_qos;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_region = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_region;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_id = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_id;
  assign ZynqMasterHandler_1_io_ctrl_ar_bits_user = NastiRecursiveInterconnect_1_io_slaves_0_ar_bits_user;
  assign ZynqMasterHandler_1_io_ctrl_r_ready = NastiRecursiveInterconnect_1_io_slaves_0_r_ready;
  assign ZynqMasterHandler_1_io_ins_0_ready = in_buf_0_io_enq_ready;
  assign ZynqMasterHandler_1_io_ins_1_ready = in_buf_1_io_enq_ready;
  assign ZynqMasterHandler_1_io_ins_2_ready = in_buf_2_io_enq_ready;
  assign ZynqMasterHandler_1_io_outs_0_valid = out_buf_0_io_deq_valid;
  assign ZynqMasterHandler_1_io_outs_0_bits = out_buf_0_io_deq_bits;
  assign ZynqMasterHandler_1_io_outs_1_valid = out_buf_1_io_deq_valid;
  assign ZynqMasterHandler_1_io_outs_1_bits = out_buf_1_io_deq_bits;
  assign ZynqMasterHandler_1_io_inT_0_valid = sim_io_inT_0_valid;
  assign ZynqMasterHandler_1_io_inT_0_bits = sim_io_inT_0_bits;
  assign ZynqMasterHandler_1_io_inT_1_valid = sim_io_inT_1_valid;
  assign ZynqMasterHandler_1_io_inT_1_bits = sim_io_inT_1_bits;
  assign ZynqMasterHandler_1_io_inT_2_valid = sim_io_inT_2_valid;
  assign ZynqMasterHandler_1_io_inT_2_bits = sim_io_inT_2_bits;
  assign ZynqMasterHandler_1_io_inT_3_valid = sim_io_inT_3_valid;
  assign ZynqMasterHandler_1_io_inT_3_bits = sim_io_inT_3_bits;
  assign ZynqMasterHandler_1_io_outT_0_valid = sim_io_outT_0_valid;
  assign ZynqMasterHandler_1_io_outT_0_bits = sim_io_outT_0_bits;
  assign ZynqMasterHandler_1_io_outT_1_valid = sim_io_outT_1_valid;
  assign ZynqMasterHandler_1_io_outT_1_bits = sim_io_outT_1_bits;
  assign ZynqMasterHandler_1_io_mem_ar_0_ready = Channel_ar_io_0_io_in_ready;
  assign ZynqMasterHandler_1_io_mem_aw_0_ready = Channel_aw_io_0_io_in_ready;
  assign ZynqMasterHandler_1_io_mem_r_0_valid = Channel_r_io_0_io_out_valid;
  assign ZynqMasterHandler_1_io_mem_r_0_bits = Channel_r_io_0_io_out_bits;
  assign ZynqMasterHandler_1_io_mem_r_1_valid = Channel_r_io_1_io_out_valid;
  assign ZynqMasterHandler_1_io_mem_r_1_bits = Channel_r_io_1_io_out_bits;
  assign ZynqMasterHandler_1_io_mem_w_0_ready = Channel_w_io_0_io_in_ready;
  assign ZynqMasterHandler_1_io_mem_w_1_ready = Channel_w_io_1_io_in_ready;
  assign EmulationMaster_1_clock = clock;
  assign EmulationMaster_1_reset = reset;
  assign EmulationMaster_1_io_ctrl_aw_valid = NastiRecursiveInterconnect_1_io_slaves_2_aw_valid;
  assign EmulationMaster_1_io_ctrl_aw_bits_addr = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_addr;
  assign EmulationMaster_1_io_ctrl_aw_bits_len = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_len;
  assign EmulationMaster_1_io_ctrl_aw_bits_size = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_size;
  assign EmulationMaster_1_io_ctrl_aw_bits_burst = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_burst;
  assign EmulationMaster_1_io_ctrl_aw_bits_lock = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_lock;
  assign EmulationMaster_1_io_ctrl_aw_bits_cache = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_cache;
  assign EmulationMaster_1_io_ctrl_aw_bits_prot = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_prot;
  assign EmulationMaster_1_io_ctrl_aw_bits_qos = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_qos;
  assign EmulationMaster_1_io_ctrl_aw_bits_region = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_region;
  assign EmulationMaster_1_io_ctrl_aw_bits_id = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_id;
  assign EmulationMaster_1_io_ctrl_aw_bits_user = NastiRecursiveInterconnect_1_io_slaves_2_aw_bits_user;
  assign EmulationMaster_1_io_ctrl_w_valid = NastiRecursiveInterconnect_1_io_slaves_2_w_valid;
  assign EmulationMaster_1_io_ctrl_w_bits_data = NastiRecursiveInterconnect_1_io_slaves_2_w_bits_data;
  assign EmulationMaster_1_io_ctrl_w_bits_last = NastiRecursiveInterconnect_1_io_slaves_2_w_bits_last;
  assign EmulationMaster_1_io_ctrl_w_bits_id = NastiRecursiveInterconnect_1_io_slaves_2_w_bits_id;
  assign EmulationMaster_1_io_ctrl_w_bits_strb = NastiRecursiveInterconnect_1_io_slaves_2_w_bits_strb;
  assign EmulationMaster_1_io_ctrl_w_bits_user = NastiRecursiveInterconnect_1_io_slaves_2_w_bits_user;
  assign EmulationMaster_1_io_ctrl_b_ready = NastiRecursiveInterconnect_1_io_slaves_2_b_ready;
  assign EmulationMaster_1_io_ctrl_ar_valid = NastiRecursiveInterconnect_1_io_slaves_2_ar_valid;
  assign EmulationMaster_1_io_ctrl_ar_bits_addr = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_addr;
  assign EmulationMaster_1_io_ctrl_ar_bits_len = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_len;
  assign EmulationMaster_1_io_ctrl_ar_bits_size = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_size;
  assign EmulationMaster_1_io_ctrl_ar_bits_burst = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_burst;
  assign EmulationMaster_1_io_ctrl_ar_bits_lock = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_lock;
  assign EmulationMaster_1_io_ctrl_ar_bits_cache = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_cache;
  assign EmulationMaster_1_io_ctrl_ar_bits_prot = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_prot;
  assign EmulationMaster_1_io_ctrl_ar_bits_qos = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_qos;
  assign EmulationMaster_1_io_ctrl_ar_bits_region = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_region;
  assign EmulationMaster_1_io_ctrl_ar_bits_id = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_id;
  assign EmulationMaster_1_io_ctrl_ar_bits_user = NastiRecursiveInterconnect_1_io_slaves_2_ar_bits_user;
  assign EmulationMaster_1_io_ctrl_r_ready = NastiRecursiveInterconnect_1_io_slaves_2_r_ready;
  assign EmulationMaster_1_io_done = T_595;
  assign EmulationMaster_1_io_step_ready = T_595;
  assign T_592 = EmulationMaster_1_io_step_ready & EmulationMaster_1_io_step_valid;
  assign GEN_4 = T_592 ? EmulationMaster_1_io_step_bits : GEN_2;
  assign GEN_5 = T_592 ? EmulationMaster_1_io_step_bits : GEN_3;
  assign T_594 = hostReset == 1'h0;
  assign T_595 = idle & T_594;
  assign DaisyChainController_clock = clock;
  assign DaisyChainController_reset = reset;
  assign DaisyChainController_io_ctrl_aw_valid = NastiRecursiveInterconnect_1_io_slaves_1_aw_valid;
  assign DaisyChainController_io_ctrl_aw_bits_addr = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_addr;
  assign DaisyChainController_io_ctrl_aw_bits_len = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_len;
  assign DaisyChainController_io_ctrl_aw_bits_size = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_size;
  assign DaisyChainController_io_ctrl_aw_bits_burst = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_burst;
  assign DaisyChainController_io_ctrl_aw_bits_lock = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_lock;
  assign DaisyChainController_io_ctrl_aw_bits_cache = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_cache;
  assign DaisyChainController_io_ctrl_aw_bits_prot = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_prot;
  assign DaisyChainController_io_ctrl_aw_bits_qos = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_qos;
  assign DaisyChainController_io_ctrl_aw_bits_region = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_region;
  assign DaisyChainController_io_ctrl_aw_bits_id = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_id;
  assign DaisyChainController_io_ctrl_aw_bits_user = NastiRecursiveInterconnect_1_io_slaves_1_aw_bits_user;
  assign DaisyChainController_io_ctrl_w_valid = NastiRecursiveInterconnect_1_io_slaves_1_w_valid;
  assign DaisyChainController_io_ctrl_w_bits_data = NastiRecursiveInterconnect_1_io_slaves_1_w_bits_data;
  assign DaisyChainController_io_ctrl_w_bits_last = NastiRecursiveInterconnect_1_io_slaves_1_w_bits_last;
  assign DaisyChainController_io_ctrl_w_bits_id = NastiRecursiveInterconnect_1_io_slaves_1_w_bits_id;
  assign DaisyChainController_io_ctrl_w_bits_strb = NastiRecursiveInterconnect_1_io_slaves_1_w_bits_strb;
  assign DaisyChainController_io_ctrl_w_bits_user = NastiRecursiveInterconnect_1_io_slaves_1_w_bits_user;
  assign DaisyChainController_io_ctrl_b_ready = NastiRecursiveInterconnect_1_io_slaves_1_b_ready;
  assign DaisyChainController_io_ctrl_ar_valid = NastiRecursiveInterconnect_1_io_slaves_1_ar_valid;
  assign DaisyChainController_io_ctrl_ar_bits_addr = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_addr;
  assign DaisyChainController_io_ctrl_ar_bits_len = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_len;
  assign DaisyChainController_io_ctrl_ar_bits_size = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_size;
  assign DaisyChainController_io_ctrl_ar_bits_burst = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_burst;
  assign DaisyChainController_io_ctrl_ar_bits_lock = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_lock;
  assign DaisyChainController_io_ctrl_ar_bits_cache = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_cache;
  assign DaisyChainController_io_ctrl_ar_bits_prot = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_prot;
  assign DaisyChainController_io_ctrl_ar_bits_qos = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_qos;
  assign DaisyChainController_io_ctrl_ar_bits_region = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_region;
  assign DaisyChainController_io_ctrl_ar_bits_id = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_id;
  assign DaisyChainController_io_ctrl_ar_bits_user = NastiRecursiveInterconnect_1_io_slaves_1_ar_bits_user;
  assign DaisyChainController_io_ctrl_r_ready = NastiRecursiveInterconnect_1_io_slaves_1_r_ready;
  assign DaisyChainController_io_daisy_regs_0_in_ready = sim_io_daisy_regs_0_in_ready;
  assign DaisyChainController_io_daisy_regs_0_out_valid = sim_io_daisy_regs_0_out_valid;
  assign DaisyChainController_io_daisy_regs_0_out_bits = sim_io_daisy_regs_0_out_bits;
  assign DaisyChainController_io_daisy_trace_0_in_ready = sim_io_daisy_trace_0_in_ready;
  assign DaisyChainController_io_daisy_trace_0_out_valid = sim_io_daisy_trace_0_out_valid;
  assign DaisyChainController_io_daisy_trace_0_out_bits = sim_io_daisy_trace_0_out_bits;
  assign DaisyChainController_io_daisy_cntr_0_in_ready = sim_io_daisy_cntr_0_in_ready;
  assign DaisyChainController_io_daisy_cntr_0_out_valid = sim_io_daisy_cntr_0_out_valid;
  assign DaisyChainController_io_daisy_cntr_0_out_bits = sim_io_daisy_cntr_0_out_bits;
  assign DaisyChainController_io_daisy_sram_0_in_ready = sim_io_daisy_sram_0_in_ready;
  assign DaisyChainController_io_daisy_sram_0_out_valid = sim_io_daisy_sram_0_out_valid;
  assign DaisyChainController_io_daisy_sram_0_out_bits = sim_io_daisy_sram_0_out_bits;
  assign T_621_addr = Channel_aw_io_0_io_out_bits;
  assign T_621_len = 8'h0;
  assign T_621_size = 3'h3;
  assign T_621_burst = 2'h1;
  assign T_621_lock = 1'h0;
  assign T_621_cache = 4'h0;
  assign T_621_prot = 3'h0;
  assign T_621_qos = 4'h0;
  assign T_621_region = 4'h0;
  assign T_621_id = 6'h0;
  assign T_621_user = 1'h0;
  assign T_654_addr = Channel_ar_io_0_io_out_bits;
  assign T_654_len = 8'h0;
  assign T_654_size = 3'h3;
  assign T_654_burst = 2'h1;
  assign T_654_lock = 1'h0;
  assign T_654_cache = 4'h0;
  assign T_654_prot = 3'h0;
  assign T_654_qos = 4'h0;
  assign T_654_region = 4'h0;
  assign T_654_id = 6'h0;
  assign T_654_user = 1'h0;
  assign T_672 = {Channel_w_io_1_io_out_bits,Channel_w_io_0_io_out_bits};
  assign T_681_data = T_672;
  assign T_681_last = 1'h1;
  assign T_681_id = 6'h0;
  assign T_681_strb = 8'hff;
  assign T_681_user = 1'h0;
  assign T_694 = arb_io_master_0_r_bits_data >> 1'h0;
  assign T_696 = arb_io_master_0_r_bits_data >> 6'h20;
  assign T_698 = Channel_aw_io_0_io_out_valid;
  assign T_700 = Channel_ar_io_0_io_out_valid;
  assign T_702 = Channel_w_io_0_io_out_valid;
  assign T_703 = T_702 & Channel_w_io_1_io_out_valid;
  assign T_705 = Channel_r_io_0_io_in_ready;
  assign T_706 = T_705 & Channel_r_io_1_io_in_ready;
  assign T_708 = arb_io_master_0_aw_ready & arb_io_master_0_aw_valid;
  assign T_709 = arb_io_master_0_ar_ready & arb_io_master_0_ar_valid;
  assign T_710 = arb_io_master_0_w_ready & arb_io_master_0_w_valid;
  assign T_712 = arb_io_master_0_r_ready & arb_io_master_0_r_valid;
  assign NastiRecursiveInterconnect_1_clock = clock;
  assign NastiRecursiveInterconnect_1_reset = reset;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_valid = io_master_aw_valid;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_addr = {{19'd0}, T_714};
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_len = io_master_aw_bits_len;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_size = io_master_aw_bits_size;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_burst = io_master_aw_bits_burst;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_lock = io_master_aw_bits_lock;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_cache = io_master_aw_bits_cache;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_prot = io_master_aw_bits_prot;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_qos = io_master_aw_bits_qos;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_region = io_master_aw_bits_region;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_id = io_master_aw_bits_id;
  assign NastiRecursiveInterconnect_1_io_masters_0_aw_bits_user = io_master_aw_bits_user;
  assign NastiRecursiveInterconnect_1_io_masters_0_w_valid = io_master_w_valid;
  assign NastiRecursiveInterconnect_1_io_masters_0_w_bits_data = io_master_w_bits_data;
  assign NastiRecursiveInterconnect_1_io_masters_0_w_bits_last = io_master_w_bits_last;
  assign NastiRecursiveInterconnect_1_io_masters_0_w_bits_id = io_master_w_bits_id;
  assign NastiRecursiveInterconnect_1_io_masters_0_w_bits_strb = io_master_w_bits_strb;
  assign NastiRecursiveInterconnect_1_io_masters_0_w_bits_user = io_master_w_bits_user;
  assign NastiRecursiveInterconnect_1_io_masters_0_b_ready = io_master_b_ready;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_valid = io_master_ar_valid;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_addr = {{19'd0}, T_715};
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_len = io_master_ar_bits_len;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_size = io_master_ar_bits_size;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_burst = io_master_ar_bits_burst;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_lock = io_master_ar_bits_lock;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_cache = io_master_ar_bits_cache;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_prot = io_master_ar_bits_prot;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_qos = io_master_ar_bits_qos;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_region = io_master_ar_bits_region;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_id = io_master_ar_bits_id;
  assign NastiRecursiveInterconnect_1_io_masters_0_ar_bits_user = io_master_ar_bits_user;
  assign NastiRecursiveInterconnect_1_io_masters_0_r_ready = io_master_r_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_0_aw_ready = ZynqMasterHandler_1_io_ctrl_aw_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_0_w_ready = ZynqMasterHandler_1_io_ctrl_w_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_0_b_valid = ZynqMasterHandler_1_io_ctrl_b_valid;
  assign NastiRecursiveInterconnect_1_io_slaves_0_b_bits_resp = ZynqMasterHandler_1_io_ctrl_b_bits_resp;
  assign NastiRecursiveInterconnect_1_io_slaves_0_b_bits_id = ZynqMasterHandler_1_io_ctrl_b_bits_id;
  assign NastiRecursiveInterconnect_1_io_slaves_0_b_bits_user = ZynqMasterHandler_1_io_ctrl_b_bits_user;
  assign NastiRecursiveInterconnect_1_io_slaves_0_ar_ready = ZynqMasterHandler_1_io_ctrl_ar_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_0_r_valid = ZynqMasterHandler_1_io_ctrl_r_valid;
  assign NastiRecursiveInterconnect_1_io_slaves_0_r_bits_resp = ZynqMasterHandler_1_io_ctrl_r_bits_resp;
  assign NastiRecursiveInterconnect_1_io_slaves_0_r_bits_data = ZynqMasterHandler_1_io_ctrl_r_bits_data;
  assign NastiRecursiveInterconnect_1_io_slaves_0_r_bits_last = ZynqMasterHandler_1_io_ctrl_r_bits_last;
  assign NastiRecursiveInterconnect_1_io_slaves_0_r_bits_id = ZynqMasterHandler_1_io_ctrl_r_bits_id;
  assign NastiRecursiveInterconnect_1_io_slaves_0_r_bits_user = ZynqMasterHandler_1_io_ctrl_r_bits_user;
  assign NastiRecursiveInterconnect_1_io_slaves_1_aw_ready = DaisyChainController_io_ctrl_aw_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_1_w_ready = DaisyChainController_io_ctrl_w_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_1_b_valid = DaisyChainController_io_ctrl_b_valid;
  assign NastiRecursiveInterconnect_1_io_slaves_1_b_bits_resp = DaisyChainController_io_ctrl_b_bits_resp;
  assign NastiRecursiveInterconnect_1_io_slaves_1_b_bits_id = DaisyChainController_io_ctrl_b_bits_id;
  assign NastiRecursiveInterconnect_1_io_slaves_1_b_bits_user = DaisyChainController_io_ctrl_b_bits_user;
  assign NastiRecursiveInterconnect_1_io_slaves_1_ar_ready = DaisyChainController_io_ctrl_ar_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_1_r_valid = DaisyChainController_io_ctrl_r_valid;
  assign NastiRecursiveInterconnect_1_io_slaves_1_r_bits_resp = DaisyChainController_io_ctrl_r_bits_resp;
  assign NastiRecursiveInterconnect_1_io_slaves_1_r_bits_data = DaisyChainController_io_ctrl_r_bits_data;
  assign NastiRecursiveInterconnect_1_io_slaves_1_r_bits_last = DaisyChainController_io_ctrl_r_bits_last;
  assign NastiRecursiveInterconnect_1_io_slaves_1_r_bits_id = DaisyChainController_io_ctrl_r_bits_id;
  assign NastiRecursiveInterconnect_1_io_slaves_1_r_bits_user = DaisyChainController_io_ctrl_r_bits_user;
  assign NastiRecursiveInterconnect_1_io_slaves_2_aw_ready = EmulationMaster_1_io_ctrl_aw_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_2_w_ready = EmulationMaster_1_io_ctrl_w_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_2_b_valid = EmulationMaster_1_io_ctrl_b_valid;
  assign NastiRecursiveInterconnect_1_io_slaves_2_b_bits_resp = EmulationMaster_1_io_ctrl_b_bits_resp;
  assign NastiRecursiveInterconnect_1_io_slaves_2_b_bits_id = EmulationMaster_1_io_ctrl_b_bits_id;
  assign NastiRecursiveInterconnect_1_io_slaves_2_b_bits_user = EmulationMaster_1_io_ctrl_b_bits_user;
  assign NastiRecursiveInterconnect_1_io_slaves_2_ar_ready = EmulationMaster_1_io_ctrl_ar_ready;
  assign NastiRecursiveInterconnect_1_io_slaves_2_r_valid = EmulationMaster_1_io_ctrl_r_valid;
  assign NastiRecursiveInterconnect_1_io_slaves_2_r_bits_resp = EmulationMaster_1_io_ctrl_r_bits_resp;
  assign NastiRecursiveInterconnect_1_io_slaves_2_r_bits_data = EmulationMaster_1_io_ctrl_r_bits_data;
  assign NastiRecursiveInterconnect_1_io_slaves_2_r_bits_last = EmulationMaster_1_io_ctrl_r_bits_last;
  assign NastiRecursiveInterconnect_1_io_slaves_2_r_bits_id = EmulationMaster_1_io_ctrl_r_bits_id;
  assign NastiRecursiveInterconnect_1_io_slaves_2_r_bits_user = EmulationMaster_1_io_ctrl_r_bits_user;
  assign T_714 = io_master_aw_bits_addr[12:0];
  assign T_715 = io_master_ar_bits_addr[12:0];
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_18 = {1{$random}};
  tickCounter = GEN_18[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_19 = {1{$random}};
  tockCounter = GEN_19[31:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_20 = {1{$random}};
  GEN_6 = GEN_20[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_21 = {1{$random}};
  GEN_7 = GEN_21[10:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_22 = {1{$random}};
  GEN_8 = GEN_22[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_23 = {1{$random}};
  GEN_9 = GEN_23[10:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_24 = {1{$random}};
  GEN_10 = GEN_24[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_25 = {1{$random}};
  GEN_11 = GEN_25[10:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_26 = {1{$random}};
  GEN_12 = GEN_26[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_27 = {1{$random}};
  GEN_13 = GEN_27[10:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_28 = {1{$random}};
  GEN_14 = GEN_28[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_29 = {1{$random}};
  GEN_15 = GEN_29[10:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_30 = {1{$random}};
  GEN_16 = GEN_30[0:0];
  `endif
  `ifdef RANDOMIZE_REG_INIT
  GEN_31 = {1{$random}};
  GEN_17 = GEN_31[10:0];
  `endif
  end
`endif
  always @(posedge clock) begin
    if (reset) begin
      tickCounter <= 32'h0;
    end else begin
      if (T_592) begin
        tickCounter <= EmulationMaster_1_io_step_bits;
      end else begin
        if (simReset) begin
          tickCounter <= 32'h0;
        end else begin
          if (tick) begin
            tickCounter <= T_568;
          end
        end
      end
    end
    if (reset) begin
      tockCounter <= 32'h0;
    end else begin
      if (T_592) begin
        tockCounter <= EmulationMaster_1_io_step_bits;
      end else begin
        if (simReset) begin
          tockCounter <= 32'h1;
        end else begin
          if (tock) begin
            tockCounter <= T_571;
          end
        end
      end
    end
  end
endmodule
