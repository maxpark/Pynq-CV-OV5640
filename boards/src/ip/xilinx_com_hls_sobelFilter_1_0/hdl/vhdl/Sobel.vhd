-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2018.2
-- Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Sobel is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    src_rows_V_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    src_rows_V_empty_n : IN STD_LOGIC;
    src_rows_V_read : OUT STD_LOGIC;
    src_cols_V_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    src_cols_V_empty_n : IN STD_LOGIC;
    src_cols_V_read : OUT STD_LOGIC;
    src_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
    src_data_stream_V_empty_n : IN STD_LOGIC;
    src_data_stream_V_read : OUT STD_LOGIC;
    dst_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
    dst_data_stream_V_full_n : IN STD_LOGIC;
    dst_data_stream_V_write : OUT STD_LOGIC;
    order_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    order_empty_n : IN STD_LOGIC;
    order_read : OUT STD_LOGIC );
end;


architecture behav of Sobel is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv3_6 : STD_LOGIC_VECTOR (2 downto 0) := "110";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_const_lv3_2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal src_rows_V_blk_n : STD_LOGIC;
    signal src_cols_V_blk_n : STD_LOGIC;
    signal order_blk_n : STD_LOGIC;
    signal tmp_i_fu_150_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_i_reg_156 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal src_rows_V_read_reg_160 : STD_LOGIC_VECTOR (31 downto 0);
    signal src_cols_V_read_reg_165 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_Filter2D_fu_120_ap_start : STD_LOGIC;
    signal grp_Filter2D_fu_120_ap_done : STD_LOGIC;
    signal grp_Filter2D_fu_120_ap_idle : STD_LOGIC;
    signal grp_Filter2D_fu_120_ap_ready : STD_LOGIC;
    signal grp_Filter2D_fu_120_p_src_data_stream_V_read : STD_LOGIC;
    signal grp_Filter2D_fu_120_p_dst_data_stream_V_din : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_Filter2D_fu_120_p_dst_data_stream_V_write : STD_LOGIC;
    signal grp_Filter2D_fu_120_p_kernel_val_0_V_1_read : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Filter2D_fu_120_p_kernel_val_0_V_2_read : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Filter2D_fu_120_p_kernel_val_1_V_0_read : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Filter2D_fu_120_p_kernel_val_1_V_2_read : STD_LOGIC_VECTOR (3 downto 0);
    signal grp_Filter2D_fu_120_p_kernel_val_2_V_0_read : STD_LOGIC_VECTOR (1 downto 0);
    signal grp_Filter2D_fu_120_p_kernel_val_2_V_1_read : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_Filter2D_fu_120_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_state1_ignore_call0 : BOOLEAN;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal ap_block_state2_on_subcall_done : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component Filter2D IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        p_src_rows_V_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_src_cols_V_read : IN STD_LOGIC_VECTOR (31 downto 0);
        p_src_data_stream_V_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        p_src_data_stream_V_empty_n : IN STD_LOGIC;
        p_src_data_stream_V_read : OUT STD_LOGIC;
        p_dst_data_stream_V_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        p_dst_data_stream_V_full_n : IN STD_LOGIC;
        p_dst_data_stream_V_write : OUT STD_LOGIC;
        p_kernel_val_0_V_1_read : IN STD_LOGIC_VECTOR (1 downto 0);
        p_kernel_val_0_V_2_read : IN STD_LOGIC_VECTOR (1 downto 0);
        p_kernel_val_1_V_0_read : IN STD_LOGIC_VECTOR (2 downto 0);
        p_kernel_val_1_V_2_read : IN STD_LOGIC_VECTOR (3 downto 0);
        p_kernel_val_2_V_0_read : IN STD_LOGIC_VECTOR (1 downto 0);
        p_kernel_val_2_V_1_read : IN STD_LOGIC_VECTOR (2 downto 0) );
    end component;



begin
    grp_Filter2D_fu_120 : component Filter2D
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_Filter2D_fu_120_ap_start,
        ap_done => grp_Filter2D_fu_120_ap_done,
        ap_idle => grp_Filter2D_fu_120_ap_idle,
        ap_ready => grp_Filter2D_fu_120_ap_ready,
        p_src_rows_V_read => src_rows_V_read_reg_160,
        p_src_cols_V_read => src_cols_V_read_reg_165,
        p_src_data_stream_V_dout => src_data_stream_V_dout,
        p_src_data_stream_V_empty_n => src_data_stream_V_empty_n,
        p_src_data_stream_V_read => grp_Filter2D_fu_120_p_src_data_stream_V_read,
        p_dst_data_stream_V_din => grp_Filter2D_fu_120_p_dst_data_stream_V_din,
        p_dst_data_stream_V_full_n => dst_data_stream_V_full_n,
        p_dst_data_stream_V_write => grp_Filter2D_fu_120_p_dst_data_stream_V_write,
        p_kernel_val_0_V_1_read => grp_Filter2D_fu_120_p_kernel_val_0_V_1_read,
        p_kernel_val_0_V_2_read => grp_Filter2D_fu_120_p_kernel_val_0_V_2_read,
        p_kernel_val_1_V_0_read => grp_Filter2D_fu_120_p_kernel_val_1_V_0_read,
        p_kernel_val_1_V_2_read => grp_Filter2D_fu_120_p_kernel_val_1_V_2_read,
        p_kernel_val_2_V_0_read => grp_Filter2D_fu_120_p_kernel_val_2_V_0_read,
        p_kernel_val_2_V_1_read => grp_Filter2D_fu_120_p_kernel_val_2_V_1_read);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    grp_Filter2D_fu_120_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_Filter2D_fu_120_ap_start_reg <= ap_const_logic_0;
            else
                if (((not(((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (tmp_i_fu_150_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1)) or (not(((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (tmp_i_fu_150_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then 
                    grp_Filter2D_fu_120_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_Filter2D_fu_120_ap_ready = ap_const_logic_1)) then 
                    grp_Filter2D_fu_120_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                src_cols_V_read_reg_165 <= src_cols_V_dout;
                src_rows_V_read_reg_160 <= src_rows_V_dout;
                tmp_i_reg_156 <= tmp_i_fu_150_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, src_rows_V_empty_n, src_cols_V_empty_n, order_empty_n, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, src_rows_V_empty_n, src_cols_V_empty_n, order_empty_n)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state1_ignore_call0_assign_proc : process(ap_start, ap_done_reg, src_rows_V_empty_n, src_cols_V_empty_n, order_empty_n)
    begin
                ap_block_state1_ignore_call0 <= ((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state2_on_subcall_done_assign_proc : process(tmp_i_reg_156, grp_Filter2D_fu_120_ap_done)
    begin
                ap_block_state2_on_subcall_done <= (((tmp_i_reg_156 = ap_const_lv1_1) and (grp_Filter2D_fu_120_ap_done = ap_const_logic_0)) or ((tmp_i_reg_156 = ap_const_lv1_0) and (grp_Filter2D_fu_120_ap_done = ap_const_logic_0)));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, ap_block_state2_on_subcall_done)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_const_boolean_0 = ap_block_state2_on_subcall_done))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    dst_data_stream_V_din <= grp_Filter2D_fu_120_p_dst_data_stream_V_din;

    dst_data_stream_V_write_assign_proc : process(tmp_i_reg_156, grp_Filter2D_fu_120_p_dst_data_stream_V_write, ap_CS_fsm_state2)
    begin
        if ((((tmp_i_reg_156 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((tmp_i_reg_156 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            dst_data_stream_V_write <= grp_Filter2D_fu_120_p_dst_data_stream_V_write;
        else 
            dst_data_stream_V_write <= ap_const_logic_0;
        end if; 
    end process;

    grp_Filter2D_fu_120_ap_start <= grp_Filter2D_fu_120_ap_start_reg;

    grp_Filter2D_fu_120_p_kernel_val_0_V_1_read_assign_proc : process(tmp_i_reg_156, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
            if ((tmp_i_reg_156 = ap_const_lv1_1)) then 
                grp_Filter2D_fu_120_p_kernel_val_0_V_1_read <= ap_const_lv2_0;
            elsif ((tmp_i_reg_156 = ap_const_lv1_0)) then 
                grp_Filter2D_fu_120_p_kernel_val_0_V_1_read <= ap_const_lv2_2;
            else 
                grp_Filter2D_fu_120_p_kernel_val_0_V_1_read <= "XX";
            end if;
        else 
            grp_Filter2D_fu_120_p_kernel_val_0_V_1_read <= "XX";
        end if; 
    end process;


    grp_Filter2D_fu_120_p_kernel_val_0_V_2_read_assign_proc : process(tmp_i_reg_156, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
            if ((tmp_i_reg_156 = ap_const_lv1_1)) then 
                grp_Filter2D_fu_120_p_kernel_val_0_V_2_read <= ap_const_lv2_1;
            elsif ((tmp_i_reg_156 = ap_const_lv1_0)) then 
                grp_Filter2D_fu_120_p_kernel_val_0_V_2_read <= ap_const_lv2_3;
            else 
                grp_Filter2D_fu_120_p_kernel_val_0_V_2_read <= "XX";
            end if;
        else 
            grp_Filter2D_fu_120_p_kernel_val_0_V_2_read <= "XX";
        end if; 
    end process;


    grp_Filter2D_fu_120_p_kernel_val_1_V_0_read_assign_proc : process(tmp_i_reg_156, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
            if ((tmp_i_reg_156 = ap_const_lv1_1)) then 
                grp_Filter2D_fu_120_p_kernel_val_1_V_0_read <= ap_const_lv3_6;
            elsif ((tmp_i_reg_156 = ap_const_lv1_0)) then 
                grp_Filter2D_fu_120_p_kernel_val_1_V_0_read <= ap_const_lv3_0;
            else 
                grp_Filter2D_fu_120_p_kernel_val_1_V_0_read <= "XXX";
            end if;
        else 
            grp_Filter2D_fu_120_p_kernel_val_1_V_0_read <= "XXX";
        end if; 
    end process;


    grp_Filter2D_fu_120_p_kernel_val_1_V_2_read_assign_proc : process(tmp_i_reg_156, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
            if ((tmp_i_reg_156 = ap_const_lv1_1)) then 
                grp_Filter2D_fu_120_p_kernel_val_1_V_2_read <= ap_const_lv4_2;
            elsif ((tmp_i_reg_156 = ap_const_lv1_0)) then 
                grp_Filter2D_fu_120_p_kernel_val_1_V_2_read <= ap_const_lv4_0;
            else 
                grp_Filter2D_fu_120_p_kernel_val_1_V_2_read <= "XXXX";
            end if;
        else 
            grp_Filter2D_fu_120_p_kernel_val_1_V_2_read <= "XXXX";
        end if; 
    end process;


    grp_Filter2D_fu_120_p_kernel_val_2_V_0_read_assign_proc : process(tmp_i_reg_156, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
            if ((tmp_i_reg_156 = ap_const_lv1_1)) then 
                grp_Filter2D_fu_120_p_kernel_val_2_V_0_read <= ap_const_lv2_3;
            elsif ((tmp_i_reg_156 = ap_const_lv1_0)) then 
                grp_Filter2D_fu_120_p_kernel_val_2_V_0_read <= ap_const_lv2_1;
            else 
                grp_Filter2D_fu_120_p_kernel_val_2_V_0_read <= "XX";
            end if;
        else 
            grp_Filter2D_fu_120_p_kernel_val_2_V_0_read <= "XX";
        end if; 
    end process;


    grp_Filter2D_fu_120_p_kernel_val_2_V_1_read_assign_proc : process(tmp_i_reg_156, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
            if ((tmp_i_reg_156 = ap_const_lv1_1)) then 
                grp_Filter2D_fu_120_p_kernel_val_2_V_1_read <= ap_const_lv3_0;
            elsif ((tmp_i_reg_156 = ap_const_lv1_0)) then 
                grp_Filter2D_fu_120_p_kernel_val_2_V_1_read <= ap_const_lv3_2;
            else 
                grp_Filter2D_fu_120_p_kernel_val_2_V_1_read <= "XXX";
            end if;
        else 
            grp_Filter2D_fu_120_p_kernel_val_2_V_1_read <= "XXX";
        end if; 
    end process;


    order_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, order_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            order_blk_n <= order_empty_n;
        else 
            order_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    order_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_empty_n, src_cols_V_empty_n, order_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            order_read <= ap_const_logic_1;
        else 
            order_read <= ap_const_logic_0;
        end if; 
    end process;


    src_cols_V_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_cols_V_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_cols_V_blk_n <= src_cols_V_empty_n;
        else 
            src_cols_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_cols_V_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_empty_n, src_cols_V_empty_n, order_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_cols_V_read <= ap_const_logic_1;
        else 
            src_cols_V_read <= ap_const_logic_0;
        end if; 
    end process;


    src_data_stream_V_read_assign_proc : process(tmp_i_reg_156, grp_Filter2D_fu_120_p_src_data_stream_V_read, ap_CS_fsm_state2)
    begin
        if ((((tmp_i_reg_156 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2)) or ((tmp_i_reg_156 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2)))) then 
            src_data_stream_V_read <= grp_Filter2D_fu_120_p_src_data_stream_V_read;
        else 
            src_data_stream_V_read <= ap_const_logic_0;
        end if; 
    end process;


    src_rows_V_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_rows_V_blk_n <= src_rows_V_empty_n;
        else 
            src_rows_V_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    src_rows_V_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, src_rows_V_empty_n, src_cols_V_empty_n, order_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (order_empty_n = ap_const_logic_0) or (src_cols_V_empty_n = ap_const_logic_0) or (src_rows_V_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            src_rows_V_read <= ap_const_logic_1;
        else 
            src_rows_V_read <= ap_const_logic_0;
        end if; 
    end process;

    tmp_i_fu_150_p2 <= "1" when (order_dout = ap_const_lv32_0) else "0";
end behav;
