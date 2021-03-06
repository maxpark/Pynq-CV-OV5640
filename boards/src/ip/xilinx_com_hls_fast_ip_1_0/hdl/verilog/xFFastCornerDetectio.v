// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module xFFastCornerDetectio (
        p_strm_in_V_V_dout,
        p_strm_in_V_V_empty_n,
        p_strm_in_V_V_read,
        p_strm_out_V_V_din,
        p_strm_out_V_V_full_n,
        p_strm_out_V_V_write,
        p_src_mat_rows_read_dout,
        p_src_mat_rows_read_empty_n,
        p_src_mat_rows_read_read,
        p_src_mat_cols_read_dout,
        p_src_mat_cols_read_empty_n,
        p_src_mat_cols_read_read,
        p_threshold_dout,
        p_threshold_empty_n,
        p_threshold_read,
        ap_clk,
        ap_rst,
        ap_done,
        ap_start,
        ap_ready,
        ap_idle,
        ap_continue
);


input  [7:0] p_strm_in_V_V_dout;
input   p_strm_in_V_V_empty_n;
output   p_strm_in_V_V_read;
output  [7:0] p_strm_out_V_V_din;
input   p_strm_out_V_V_full_n;
output   p_strm_out_V_V_write;
input  [31:0] p_src_mat_rows_read_dout;
input   p_src_mat_rows_read_empty_n;
output   p_src_mat_rows_read_read;
input  [31:0] p_src_mat_cols_read_dout;
input   p_src_mat_cols_read_empty_n;
output   p_src_mat_cols_read_read;
input  [7:0] p_threshold_dout;
input   p_threshold_empty_n;
output   p_threshold_read;
input   ap_clk;
input   ap_rst;
output   ap_done;
input   ap_start;
output   ap_ready;
output   ap_idle;
input   ap_continue;

wire    xFfast7x755_U0_ap_start;
wire    xFfast7x755_U0_ap_done;
wire    xFfast7x755_U0_ap_continue;
wire    xFfast7x755_U0_ap_idle;
wire    xFfast7x755_U0_ap_ready;
wire    xFfast7x755_U0_start_out;
wire    xFfast7x755_U0_start_write;
wire    xFfast7x755_U0_p_strm_in_V_V_read;
wire   [7:0] xFfast7x755_U0_p_dst_V_V_din;
wire    xFfast7x755_U0_p_dst_V_V_write;
wire    xFfast7x755_U0_p_src_mat_rows_read_read;
wire    xFfast7x755_U0_p_src_mat_cols_read_read;
wire    xFfast7x755_U0_p_threshold_read;
wire   [15:0] xFfast7x755_U0_p_c_i_din;
wire    xFfast7x755_U0_p_c_i_write;
wire   [15:0] xFfast7x755_U0_p_c1_i_din;
wire    xFfast7x755_U0_p_c1_i_write;
wire    xFfastnms56_U0_ap_start;
wire    xFfastnms56_U0_ap_done;
wire    xFfastnms56_U0_ap_continue;
wire    xFfastnms56_U0_ap_idle;
wire    xFfastnms56_U0_ap_ready;
wire    xFfastnms56_U0_p_dst_V_V_read;
wire   [7:0] xFfastnms56_U0_p_strm_out_V_V_din;
wire    xFfastnms56_U0_p_strm_out_V_V_write;
wire    xFfastnms56_U0_p_image_height_read;
wire    xFfastnms56_U0_p_image_width_read;
wire    ap_sync_continue;
wire    p_dst_V_V_full_n;
wire   [7:0] p_dst_V_V_dout;
wire    p_dst_V_V_empty_n;
wire    p_c_i_full_n;
wire   [15:0] p_c_i_dout;
wire    p_c_i_empty_n;
wire    p_c1_i_full_n;
wire   [15:0] p_c1_i_dout;
wire    p_c1_i_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
wire   [0:0] start_for_xFfastnms56_U0_din;
wire    start_for_xFfastnms56_U0_full_n;
wire   [0:0] start_for_xFfastnms56_U0_dout;
wire    start_for_xFfastnms56_U0_empty_n;
wire    xFfastnms56_U0_start_full_n;
wire    xFfastnms56_U0_start_write;

xFfast7x755 xFfast7x755_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(xFfast7x755_U0_ap_start),
    .start_full_n(start_for_xFfastnms56_U0_full_n),
    .ap_done(xFfast7x755_U0_ap_done),
    .ap_continue(xFfast7x755_U0_ap_continue),
    .ap_idle(xFfast7x755_U0_ap_idle),
    .ap_ready(xFfast7x755_U0_ap_ready),
    .start_out(xFfast7x755_U0_start_out),
    .start_write(xFfast7x755_U0_start_write),
    .p_strm_in_V_V_dout(p_strm_in_V_V_dout),
    .p_strm_in_V_V_empty_n(p_strm_in_V_V_empty_n),
    .p_strm_in_V_V_read(xFfast7x755_U0_p_strm_in_V_V_read),
    .p_dst_V_V_din(xFfast7x755_U0_p_dst_V_V_din),
    .p_dst_V_V_full_n(p_dst_V_V_full_n),
    .p_dst_V_V_write(xFfast7x755_U0_p_dst_V_V_write),
    .p_src_mat_rows_read_dout(p_src_mat_rows_read_dout),
    .p_src_mat_rows_read_empty_n(p_src_mat_rows_read_empty_n),
    .p_src_mat_rows_read_read(xFfast7x755_U0_p_src_mat_rows_read_read),
    .p_src_mat_cols_read_dout(p_src_mat_cols_read_dout),
    .p_src_mat_cols_read_empty_n(p_src_mat_cols_read_empty_n),
    .p_src_mat_cols_read_read(xFfast7x755_U0_p_src_mat_cols_read_read),
    .p_threshold_dout(p_threshold_dout),
    .p_threshold_empty_n(p_threshold_empty_n),
    .p_threshold_read(xFfast7x755_U0_p_threshold_read),
    .p_c_i_din(xFfast7x755_U0_p_c_i_din),
    .p_c_i_full_n(p_c_i_full_n),
    .p_c_i_write(xFfast7x755_U0_p_c_i_write),
    .p_c1_i_din(xFfast7x755_U0_p_c1_i_din),
    .p_c1_i_full_n(p_c1_i_full_n),
    .p_c1_i_write(xFfast7x755_U0_p_c1_i_write)
);

xFfastnms56 xFfastnms56_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(xFfastnms56_U0_ap_start),
    .ap_done(xFfastnms56_U0_ap_done),
    .ap_continue(xFfastnms56_U0_ap_continue),
    .ap_idle(xFfastnms56_U0_ap_idle),
    .ap_ready(xFfastnms56_U0_ap_ready),
    .p_dst_V_V_dout(p_dst_V_V_dout),
    .p_dst_V_V_empty_n(p_dst_V_V_empty_n),
    .p_dst_V_V_read(xFfastnms56_U0_p_dst_V_V_read),
    .p_strm_out_V_V_din(xFfastnms56_U0_p_strm_out_V_V_din),
    .p_strm_out_V_V_full_n(p_strm_out_V_V_full_n),
    .p_strm_out_V_V_write(xFfastnms56_U0_p_strm_out_V_V_write),
    .p_image_height_dout(p_c_i_dout),
    .p_image_height_empty_n(p_c_i_empty_n),
    .p_image_height_read(xFfastnms56_U0_p_image_height_read),
    .p_image_width_dout(p_c1_i_dout),
    .p_image_width_empty_n(p_c1_i_empty_n),
    .p_image_width_read(xFfastnms56_U0_p_image_width_read)
);

fifo_w8_d2_A p_dst_V_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(xFfast7x755_U0_p_dst_V_V_din),
    .if_full_n(p_dst_V_V_full_n),
    .if_write(xFfast7x755_U0_p_dst_V_V_write),
    .if_dout(p_dst_V_V_dout),
    .if_empty_n(p_dst_V_V_empty_n),
    .if_read(xFfastnms56_U0_p_dst_V_V_read)
);

fifo_w16_d2_A p_c_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(xFfast7x755_U0_p_c_i_din),
    .if_full_n(p_c_i_full_n),
    .if_write(xFfast7x755_U0_p_c_i_write),
    .if_dout(p_c_i_dout),
    .if_empty_n(p_c_i_empty_n),
    .if_read(xFfastnms56_U0_p_image_height_read)
);

fifo_w16_d2_A p_c1_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(xFfast7x755_U0_p_c1_i_din),
    .if_full_n(p_c1_i_full_n),
    .if_write(xFfast7x755_U0_p_c1_i_write),
    .if_dout(p_c1_i_dout),
    .if_empty_n(p_c1_i_empty_n),
    .if_read(xFfastnms56_U0_p_image_width_read)
);

start_for_xFfastnfYi start_for_xFfastnfYi_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_xFfastnms56_U0_din),
    .if_full_n(start_for_xFfastnms56_U0_full_n),
    .if_write(xFfast7x755_U0_start_write),
    .if_dout(start_for_xFfastnms56_U0_dout),
    .if_empty_n(start_for_xFfastnms56_U0_empty_n),
    .if_read(xFfastnms56_U0_ap_ready)
);

assign ap_done = xFfastnms56_U0_ap_done;

assign ap_idle = (xFfastnms56_U0_ap_idle & xFfast7x755_U0_ap_idle);

assign ap_ready = xFfast7x755_U0_ap_ready;

assign ap_sync_continue = ap_continue;

assign ap_sync_done = xFfastnms56_U0_ap_done;

assign ap_sync_ready = xFfast7x755_U0_ap_ready;

assign p_src_mat_cols_read_read = xFfast7x755_U0_p_src_mat_cols_read_read;

assign p_src_mat_rows_read_read = xFfast7x755_U0_p_src_mat_rows_read_read;

assign p_strm_in_V_V_read = xFfast7x755_U0_p_strm_in_V_V_read;

assign p_strm_out_V_V_din = xFfastnms56_U0_p_strm_out_V_V_din;

assign p_strm_out_V_V_write = xFfastnms56_U0_p_strm_out_V_V_write;

assign p_threshold_read = xFfast7x755_U0_p_threshold_read;

assign start_for_xFfastnms56_U0_din = 1'b1;

assign xFfast7x755_U0_ap_continue = 1'b1;

assign xFfast7x755_U0_ap_start = ap_start;

assign xFfastnms56_U0_ap_continue = ap_continue;

assign xFfastnms56_U0_ap_start = start_for_xFfastnms56_U0_empty_n;

assign xFfastnms56_U0_start_full_n = 1'b1;

assign xFfastnms56_U0_start_write = 1'b0;

endmodule //xFFastCornerDetectio
