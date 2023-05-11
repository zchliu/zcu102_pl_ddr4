#ifndef IP_DDR4_CORE_H_
#define IP_DDR4_CORE_H_

// (c) Copyright 1995-2023 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


#ifndef XTLM
#include "xtlm.h"
#endif
#ifndef SYSTEMC_INCLUDED
#include <systemc>
#endif

#if defined(_MSC_VER)
#define DllExport __declspec(dllexport)
#elif defined(__GNUC__)
#define DllExport __attribute__ ((visibility("default")))
#else
#define DllExport
#endif

#include "ddr4_core_sc.h"




#ifdef XILINX_SIMULATOR
class DllExport ddr4_core : public ddr4_core_sc
{
public:

  ddr4_core(const sc_core::sc_module_name& nm);
  virtual ~ddr4_core();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > c0_init_calib_complete;
  sc_core::sc_out< bool > dbg_clk;
  sc_core::sc_in< bool > c0_sys_clk_p;
  sc_core::sc_in< bool > c0_sys_clk_n;
  sc_core::sc_out< sc_dt::sc_bv<512> > dbg_bus;
  sc_core::sc_out< sc_dt::sc_bv<17> > c0_ddr4_adr;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_ba;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cke;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cs_n;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dm_dbi_n;
  sc_core::sc_out< sc_dt::sc_bv<16> > c0_ddr4_dq;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dqs_c;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dqs_t;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_odt;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_bg;
  sc_core::sc_out< bool > c0_ddr4_reset_n;
  sc_core::sc_out< bool > c0_ddr4_act_n;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_c;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_t;
  sc_core::sc_out< bool > c0_ddr4_ui_clk;
  sc_core::sc_out< bool > c0_ddr4_ui_clk_sync_rst;
  sc_core::sc_in< bool > c0_ddr4_app_en;
  sc_core::sc_in< bool > c0_ddr4_app_hi_pri;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_end;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_wren;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_end;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_valid;
  sc_core::sc_out< bool > c0_ddr4_app_rdy;
  sc_core::sc_out< bool > c0_ddr4_app_wdf_rdy;
  sc_core::sc_in< sc_dt::sc_bv<28> > c0_ddr4_app_addr;
  sc_core::sc_in< sc_dt::sc_bv<3> > c0_ddr4_app_cmd;
  sc_core::sc_in< sc_dt::sc_bv<128> > c0_ddr4_app_wdf_data;
  sc_core::sc_in< sc_dt::sc_bv<16> > c0_ddr4_app_wdf_mask;
  sc_core::sc_out< sc_dt::sc_bv<128> > c0_ddr4_app_rd_data;
  sc_core::sc_out< bool > addn_ui_clkout1;
  sc_core::sc_in< bool > sys_rst;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


};
#endif // XILINX_SIMULATOR




#ifdef XM_SYSTEMC
class DllExport ddr4_core : public ddr4_core_sc
{
public:

  ddr4_core(const sc_core::sc_module_name& nm);
  virtual ~ddr4_core();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > c0_init_calib_complete;
  sc_core::sc_out< bool > dbg_clk;
  sc_core::sc_in< bool > c0_sys_clk_p;
  sc_core::sc_in< bool > c0_sys_clk_n;
  sc_core::sc_out< sc_dt::sc_bv<512> > dbg_bus;
  sc_core::sc_out< sc_dt::sc_bv<17> > c0_ddr4_adr;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_ba;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cke;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cs_n;
  sc_core::sc_inout< sc_dt::sc_bv<2> > c0_ddr4_dm_dbi_n;
  sc_core::sc_inout< sc_dt::sc_bv<16> > c0_ddr4_dq;
  sc_core::sc_inout< sc_dt::sc_bv<2> > c0_ddr4_dqs_c;
  sc_core::sc_inout< sc_dt::sc_bv<2> > c0_ddr4_dqs_t;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_odt;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_bg;
  sc_core::sc_out< bool > c0_ddr4_reset_n;
  sc_core::sc_out< bool > c0_ddr4_act_n;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_c;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_t;
  sc_core::sc_out< bool > c0_ddr4_ui_clk;
  sc_core::sc_out< bool > c0_ddr4_ui_clk_sync_rst;
  sc_core::sc_in< bool > c0_ddr4_app_en;
  sc_core::sc_in< bool > c0_ddr4_app_hi_pri;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_end;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_wren;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_end;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_valid;
  sc_core::sc_out< bool > c0_ddr4_app_rdy;
  sc_core::sc_out< bool > c0_ddr4_app_wdf_rdy;
  sc_core::sc_in< sc_dt::sc_bv<28> > c0_ddr4_app_addr;
  sc_core::sc_in< sc_dt::sc_bv<3> > c0_ddr4_app_cmd;
  sc_core::sc_in< sc_dt::sc_bv<128> > c0_ddr4_app_wdf_data;
  sc_core::sc_in< sc_dt::sc_bv<16> > c0_ddr4_app_wdf_mask;
  sc_core::sc_out< sc_dt::sc_bv<128> > c0_ddr4_app_rd_data;
  sc_core::sc_out< bool > addn_ui_clkout1;
  sc_core::sc_in< bool > sys_rst;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


};
#endif // XM_SYSTEMC




#ifdef RIVIERA
class DllExport ddr4_core : public ddr4_core_sc
{
public:

  ddr4_core(const sc_core::sc_module_name& nm);
  virtual ~ddr4_core();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > c0_init_calib_complete;
  sc_core::sc_out< bool > dbg_clk;
  sc_core::sc_in< bool > c0_sys_clk_p;
  sc_core::sc_in< bool > c0_sys_clk_n;
  sc_core::sc_out< sc_dt::sc_bv<512> > dbg_bus;
  sc_core::sc_out< sc_dt::sc_bv<17> > c0_ddr4_adr;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_ba;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cke;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cs_n;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dm_dbi_n;
  sc_core::sc_out< sc_dt::sc_bv<16> > c0_ddr4_dq;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dqs_c;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dqs_t;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_odt;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_bg;
  sc_core::sc_out< bool > c0_ddr4_reset_n;
  sc_core::sc_out< bool > c0_ddr4_act_n;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_c;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_t;
  sc_core::sc_out< bool > c0_ddr4_ui_clk;
  sc_core::sc_out< bool > c0_ddr4_ui_clk_sync_rst;
  sc_core::sc_in< bool > c0_ddr4_app_en;
  sc_core::sc_in< bool > c0_ddr4_app_hi_pri;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_end;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_wren;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_end;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_valid;
  sc_core::sc_out< bool > c0_ddr4_app_rdy;
  sc_core::sc_out< bool > c0_ddr4_app_wdf_rdy;
  sc_core::sc_in< sc_dt::sc_bv<28> > c0_ddr4_app_addr;
  sc_core::sc_in< sc_dt::sc_bv<3> > c0_ddr4_app_cmd;
  sc_core::sc_in< sc_dt::sc_bv<128> > c0_ddr4_app_wdf_data;
  sc_core::sc_in< sc_dt::sc_bv<16> > c0_ddr4_app_wdf_mask;
  sc_core::sc_out< sc_dt::sc_bv<128> > c0_ddr4_app_rd_data;
  sc_core::sc_out< bool > addn_ui_clkout1;
  sc_core::sc_in< bool > sys_rst;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


};
#endif // RIVIERA




#ifdef VCSSYSTEMC
class DllExport ddr4_core : public ddr4_core_sc
{
public:

  ddr4_core(const sc_core::sc_module_name& nm);
  virtual ~ddr4_core();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > c0_init_calib_complete;
  sc_core::sc_out< bool > dbg_clk;
  sc_core::sc_in< bool > c0_sys_clk_p;
  sc_core::sc_in< bool > c0_sys_clk_n;
  sc_core::sc_out< sc_dt::sc_bv<512> > dbg_bus;
  sc_core::sc_out< sc_dt::sc_bv<17> > c0_ddr4_adr;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_ba;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cke;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cs_n;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dm_dbi_n;
  sc_core::sc_out< sc_dt::sc_bv<16> > c0_ddr4_dq;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dqs_c;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dqs_t;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_odt;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_bg;
  sc_core::sc_out< bool > c0_ddr4_reset_n;
  sc_core::sc_out< bool > c0_ddr4_act_n;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_c;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_t;
  sc_core::sc_out< bool > c0_ddr4_ui_clk;
  sc_core::sc_out< bool > c0_ddr4_ui_clk_sync_rst;
  sc_core::sc_in< bool > c0_ddr4_app_en;
  sc_core::sc_in< bool > c0_ddr4_app_hi_pri;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_end;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_wren;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_end;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_valid;
  sc_core::sc_out< bool > c0_ddr4_app_rdy;
  sc_core::sc_out< bool > c0_ddr4_app_wdf_rdy;
  sc_core::sc_in< sc_dt::sc_bv<28> > c0_ddr4_app_addr;
  sc_core::sc_in< sc_dt::sc_bv<3> > c0_ddr4_app_cmd;
  sc_core::sc_in< sc_dt::sc_bv<128> > c0_ddr4_app_wdf_data;
  sc_core::sc_in< sc_dt::sc_bv<16> > c0_ddr4_app_wdf_mask;
  sc_core::sc_out< sc_dt::sc_bv<128> > c0_ddr4_app_rd_data;
  sc_core::sc_out< bool > addn_ui_clkout1;
  sc_core::sc_in< bool > sys_rst;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


  // Transactor stubs

  // Socket stubs

};
#endif // VCSSYSTEMC




#ifdef MTI_SYSTEMC
class DllExport ddr4_core : public ddr4_core_sc
{
public:

  ddr4_core(const sc_core::sc_module_name& nm);
  virtual ~ddr4_core();

  // module pin-to-pin RTL interface

  sc_core::sc_out< bool > c0_init_calib_complete;
  sc_core::sc_out< bool > dbg_clk;
  sc_core::sc_in< bool > c0_sys_clk_p;
  sc_core::sc_in< bool > c0_sys_clk_n;
  sc_core::sc_out< sc_dt::sc_bv<512> > dbg_bus;
  sc_core::sc_out< sc_dt::sc_bv<17> > c0_ddr4_adr;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_ba;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cke;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_cs_n;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dm_dbi_n;
  sc_core::sc_out< sc_dt::sc_bv<16> > c0_ddr4_dq;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dqs_c;
  sc_core::sc_out< sc_dt::sc_bv<2> > c0_ddr4_dqs_t;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_odt;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_bg;
  sc_core::sc_out< bool > c0_ddr4_reset_n;
  sc_core::sc_out< bool > c0_ddr4_act_n;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_c;
  sc_core::sc_out< sc_dt::sc_bv<1> > c0_ddr4_ck_t;
  sc_core::sc_out< bool > c0_ddr4_ui_clk;
  sc_core::sc_out< bool > c0_ddr4_ui_clk_sync_rst;
  sc_core::sc_in< bool > c0_ddr4_app_en;
  sc_core::sc_in< bool > c0_ddr4_app_hi_pri;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_end;
  sc_core::sc_in< bool > c0_ddr4_app_wdf_wren;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_end;
  sc_core::sc_out< bool > c0_ddr4_app_rd_data_valid;
  sc_core::sc_out< bool > c0_ddr4_app_rdy;
  sc_core::sc_out< bool > c0_ddr4_app_wdf_rdy;
  sc_core::sc_in< sc_dt::sc_bv<28> > c0_ddr4_app_addr;
  sc_core::sc_in< sc_dt::sc_bv<3> > c0_ddr4_app_cmd;
  sc_core::sc_in< sc_dt::sc_bv<128> > c0_ddr4_app_wdf_data;
  sc_core::sc_in< sc_dt::sc_bv<16> > c0_ddr4_app_wdf_mask;
  sc_core::sc_out< sc_dt::sc_bv<128> > c0_ddr4_app_rd_data;
  sc_core::sc_out< bool > addn_ui_clkout1;
  sc_core::sc_in< bool > sys_rst;

  // Dummy Signals for IP Ports


protected:

  virtual void before_end_of_elaboration();

private:


  // Transactor stubs

  // Socket stubs

};
#endif // MTI_SYSTEMC
#endif // IP_DDR4_CORE_H_
