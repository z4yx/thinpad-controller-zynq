
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
}


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: video_capture
proc create_hier_cell_video_capture { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_video_capture() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 dma_ctrl
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 v_tc_ctrl
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:vid_io_rtl:1.0 vid_io_in

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 aresetn
  create_bd_pin -dir I axi_clk
  create_bd_pin -dir O dma_interrupt
  create_bd_pin -dir I ext_reset_in
  create_bd_pin -dir O overflow
  create_bd_pin -dir I vid_in_clk
  create_bd_pin -dir I -type rst vid_io_in_reset
  create_bd_pin -dir O -from 0 -to 0 vtc_locked

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: v_frmbuf_wr_0, and set properties
  set v_frmbuf_wr_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_frmbuf_wr:1.0 v_frmbuf_wr_0 ]
  set_property -dict [ list \
CONFIG.AXIMM_DATA_WIDTH {64} \
CONFIG.C_M_AXI_MM_VIDEO_DATA_WIDTH {64} \
CONFIG.MAX_COLS {2048} \
CONFIG.MAX_ROWS {2018} \
CONFIG.SAMPLES_PER_CLOCK {1} \
 ] $v_frmbuf_wr_0

  # Create instance: v_tc_0, and set properties
  set v_tc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 v_tc_0 ]
  set_property -dict [ list \
CONFIG.GEN_F0_VBLANK_HEND {640} \
CONFIG.GEN_F0_VBLANK_HSTART {640} \
CONFIG.GEN_F0_VFRAME_SIZE {525} \
CONFIG.GEN_F0_VSYNC_HEND {640} \
CONFIG.GEN_F0_VSYNC_HSTART {640} \
CONFIG.GEN_F0_VSYNC_VEND {491} \
CONFIG.GEN_F0_VSYNC_VSTART {489} \
CONFIG.GEN_F1_VBLANK_HEND {640} \
CONFIG.GEN_F1_VBLANK_HSTART {640} \
CONFIG.GEN_F1_VFRAME_SIZE {525} \
CONFIG.GEN_F1_VSYNC_HEND {640} \
CONFIG.GEN_F1_VSYNC_HSTART {640} \
CONFIG.GEN_F1_VSYNC_VEND {491} \
CONFIG.GEN_F1_VSYNC_VSTART {489} \
CONFIG.GEN_HACTIVE_SIZE {640} \
CONFIG.GEN_HFRAME_SIZE {800} \
CONFIG.GEN_HSYNC_END {752} \
CONFIG.GEN_HSYNC_START {656} \
CONFIG.GEN_VACTIVE_SIZE {480} \
CONFIG.HAS_INTC_IF {true} \
CONFIG.VIDEO_MODE {640x480p} \
CONFIG.active_video_generation {true} \
CONFIG.auto_generation_mode {false} \
CONFIG.enable_generation {false} \
CONFIG.frame_syncs {1} \
CONFIG.horizontal_blank_detection {false} \
CONFIG.horizontal_blank_generation {true} \
CONFIG.horizontal_sync_generation {true} \
CONFIG.max_clocks_per_line {2048} \
CONFIG.max_lines_per_frame {2048} \
CONFIG.vertical_blank_detection {false} \
CONFIG.vertical_blank_generation {true} \
CONFIG.vertical_sync_generation {true} \
 ] $v_tc_0

  # Create instance: v_vid_in_axi4s_0, and set properties
  set v_vid_in_axi4s_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_vid_in_axi4s:4.0 v_vid_in_axi4s_0 ]
  set_property -dict [ list \
CONFIG.C_HAS_ASYNC_CLK {1} \
CONFIG.C_PIXELS_PER_CLOCK {1} \
 ] $v_vid_in_axi4s_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {8} \
CONFIG.DIN_TO {8} \
CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins vid_io_in] [get_bd_intf_pins v_vid_in_axi4s_0/vid_io_in]
  connect_bd_intf_net -intf_net dma_ctrl_1 [get_bd_intf_pins dma_ctrl] [get_bd_intf_pins v_frmbuf_wr_0/s_axi_CTRL]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins smartconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net v_frmbuf_wr_0_m_axi_mm_video [get_bd_intf_pins smartconnect_0/S00_AXI] [get_bd_intf_pins v_frmbuf_wr_0/m_axi_mm_video]
  connect_bd_intf_net -intf_net v_tc_ctrl_1 [get_bd_intf_pins v_tc_ctrl] [get_bd_intf_pins v_tc_0/ctrl]
  connect_bd_intf_net -intf_net v_vid_in_axi4s_0_video_out [get_bd_intf_pins v_frmbuf_wr_0/s_axis_video] [get_bd_intf_pins v_vid_in_axi4s_0/video_out]
  set_property -dict [ list \
HDL_ATTRIBUTE.DEBUG {true} \
 ] [get_bd_intf_nets v_vid_in_axi4s_0_video_out]
  connect_bd_intf_net -intf_net v_vid_in_axi4s_0_vtiming_out [get_bd_intf_pins v_tc_0/vtiming_in] [get_bd_intf_pins v_vid_in_axi4s_0/vtiming_out]

  # Create port connections
  connect_bd_net -net axi_clk_1 [get_bd_pins axi_clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins smartconnect_0/aclk] [get_bd_pins v_frmbuf_wr_0/ap_clk] [get_bd_pins v_tc_0/s_axi_aclk] [get_bd_pins v_vid_in_axi4s_0/aclk]
  connect_bd_net -net ext_reset_in_1 [get_bd_pins ext_reset_in] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins v_frmbuf_wr_0/ap_rst_n] [get_bd_pins v_tc_0/s_axi_aresetn] [get_bd_pins v_vid_in_axi4s_0/aresetn]
  connect_bd_net -net v_frmbuf_wr_0_interrupt [get_bd_pins dma_interrupt] [get_bd_pins v_frmbuf_wr_0/interrupt]
  connect_bd_net -net v_tc_0_intc_if [get_bd_pins v_tc_0/intc_if] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net v_vid_in_axi4s_0_overflow [get_bd_pins overflow] [get_bd_pins v_vid_in_axi4s_0/overflow]
  set_property -dict [ list \
HDL_ATTRIBUTE.DEBUG {true} \
 ] [get_bd_nets v_vid_in_axi4s_0_overflow]
  connect_bd_net -net vid_in_clk_1 [get_bd_pins vid_in_clk] [get_bd_pins v_tc_0/clk] [get_bd_pins v_vid_in_axi4s_0/vid_io_in_clk]
  connect_bd_net -net vid_io_in_reset_1 [get_bd_pins vid_io_in_reset] [get_bd_pins v_vid_in_axi4s_0/vid_io_in_reset]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins v_tc_0/clken] [get_bd_pins v_tc_0/det_clken] [get_bd_pins v_tc_0/resetn] [get_bd_pins v_tc_0/s_axi_aclken] [get_bd_pins v_vid_in_axi4s_0/aclken] [get_bd_pins v_vid_in_axi4s_0/vid_io_in_ce] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins vtc_locked] [get_bd_pins v_vid_in_axi4s_0/axis_enable] [get_bd_pins xlslice_0/Dout]
  set_property -dict [ list \
HDL_ATTRIBUTE.DEBUG {true} \
 ] [get_bd_nets xlslice_0_Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: la_storage
proc create_hier_cell_la_storage { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_la_storage() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type clk M00_ACLK
  create_bd_pin -dir I -type rst axi_resetn
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir I -type clk fifo_aclk
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_aresetn
  create_bd_pin -dir O -type intr s2mm_introut
  create_bd_pin -dir I -type rst s_aresetn
  create_bd_pin -dir I -type clk s_axi_lite_aclk

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list \
CONFIG.c_include_mm2s {0} \
CONFIG.c_include_s2mm {1} \
CONFIG.c_include_sg {0} \
CONFIG.c_micro_dma {0} \
CONFIG.c_s2mm_burst_size {32} \
CONFIG.c_sg_length_width {23} \
 ] $axi_dma_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
 ] $axi_interconnect_1

  # Create instance: fifo_generator_0, and set properties
  set fifo_generator_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.1 fifo_generator_0 ]
  set_property -dict [ list \
CONFIG.Clock_Type_AXI {Independent_Clock} \
CONFIG.Enable_TLAST {true} \
CONFIG.FIFO_Implementation_axis {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_rach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_rdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wach {Independent_Clocks_Distributed_RAM} \
CONFIG.FIFO_Implementation_wdch {Independent_Clocks_Block_RAM} \
CONFIG.FIFO_Implementation_wrch {Independent_Clocks_Distributed_RAM} \
CONFIG.Full_Flags_Reset_Value {1} \
CONFIG.INTERFACE_TYPE {AXI_STREAM} \
CONFIG.Input_Depth_axis {1024} \
CONFIG.TDATA_NUM_BYTES {32} \
CONFIG.TUSER_WIDTH {0} \
 ] $fifo_generator_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net S00_AXI_2 [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins fifo_generator_0/S_AXIS]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_interconnect_1/M00_AXI]
  connect_bd_intf_net -intf_net fifo_generator_0_M_AXIS [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM] [get_bd_intf_pins fifo_generator_0/M_AXIS]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net axi_dma_0_s2mm_introut [get_bd_pins s2mm_introut] [get_bd_pins axi_dma_0/s2mm_introut]
  set_property -dict [ list \
HDL_ATTRIBUTE.DEBUG {true} \
 ] [get_bd_nets axi_dma_0_s2mm_introut]
  connect_bd_net -net axi_resetn_1 [get_bd_pins axi_resetn] [get_bd_pins axi_dma_0/axi_resetn]
  connect_bd_net -net ext_reset_in_1 [get_bd_pins ext_reset_in] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net m_aclk_1 [get_bd_pins fifo_aclk] [get_bd_pins fifo_generator_0/s_aclk]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins peripheral_aresetn] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net ps7_0_FCLK_CLK1 [get_bd_pins M00_ACLK] [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins fifo_generator_0/m_aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net s_aresetn_1 [get_bd_pins s_aresetn] [get_bd_pins fifo_generator_0/s_aresetn]
  connect_bd_net -net s_axi_lite_aclk_1 [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: bus_analyze
proc create_hier_cell_bus_analyze { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_bus_analyze() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE

  # Create pins
  create_bd_pin -dir I -type clk M00_ACLK
  create_bd_pin -dir I -type rst axi_resetn
  create_bd_pin -dir I -type rst ext_reset_in
  create_bd_pin -dir O -from 0 -to 0 -type rst peripheral_aresetn
  create_bd_pin -dir O -type intr s2mm_introut
  create_bd_pin -dir I -type clk s_axi_lite_aclk

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list \
CONFIG.c_include_mm2s {0} \
CONFIG.c_include_s2mm {1} \
CONFIG.c_include_sg {0} \
CONFIG.c_m_axi_mm2s_data_width {32} \
CONFIG.c_m_axi_s2mm_data_width {64} \
CONFIG.c_m_axis_mm2s_tdata_width {32} \
CONFIG.c_micro_dma {0} \
CONFIG.c_mm2s_burst_size {16} \
CONFIG.c_s2mm_burst_size {32} \
CONFIG.c_sg_include_stscntrl_strm {0} \
CONFIG.c_sg_length_width {23} \
 ] $axi_dma_0

  # Create instance: axi_interconnect_1, and set properties
  set axi_interconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_1 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
 ] $axi_interconnect_1

  # Create instance: axis_data_fifo_0, and set properties
  set axis_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_0 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_data_fifo_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net S00_AXI_2 [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_interconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_interconnect_1/M00_AXI]
  connect_bd_intf_net -intf_net axis_data_fifo_0_M_AXIS [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM] [get_bd_intf_pins axis_data_fifo_0/M_AXIS]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_interconnect_1/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net axi_dma_0_s2mm_introut [get_bd_pins s2mm_introut] [get_bd_pins axi_dma_0/s2mm_introut]
  set_property -dict [ list \
HDL_ATTRIBUTE.DEBUG {true} \
 ] [get_bd_nets axi_dma_0_s2mm_introut]
  connect_bd_net -net axi_resetn_1 [get_bd_pins axi_resetn] [get_bd_pins axi_dma_0/axi_resetn]
  connect_bd_net -net ext_reset_in_1 [get_bd_pins ext_reset_in] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins peripheral_aresetn] [get_bd_pins axi_interconnect_1/M00_ARESETN] [get_bd_pins axi_interconnect_1/S00_ARESETN] [get_bd_pins axis_data_fifo_0/s_axis_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net ps7_0_FCLK_CLK1 [get_bd_pins M00_ACLK] [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axi_interconnect_1/ACLK] [get_bd_pins axi_interconnect_1/M00_ACLK] [get_bd_pins axi_interconnect_1/S00_ACLK] [get_bd_pins axis_data_fifo_0/s_axis_aclk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net s_axi_lite_aclk_1 [get_bd_pins s_axi_lite_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set UART_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART_1 ]
  set UART_CPLD [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART_CPLD ]
  set bus_analyze_axis [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 bus_analyze_axis ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TLAST {1} \
CONFIG.HAS_TREADY {1} \
CONFIG.HAS_TSTRB {0} \
CONFIG.LAYERED_METADATA {undef} \
CONFIG.TDATA_NUM_BYTES {4} \
CONFIG.TDEST_WIDTH {0} \
CONFIG.TID_WIDTH {0} \
CONFIG.TUSER_WIDTH {0} \
 ] $bus_analyze_axis
  set gpio_rtl [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_rtl ]
  set gpio_rtl_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 gpio_rtl_0 ]
  set la_storage_axis [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 la_storage_axis ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TLAST {0} \
CONFIG.HAS_TREADY {1} \
CONFIG.HAS_TSTRB {0} \
CONFIG.LAYERED_METADATA {undef} \
CONFIG.TDATA_NUM_BYTES {32} \
CONFIG.TDEST_WIDTH {0} \
CONFIG.TID_WIDTH {0} \
CONFIG.TUSER_WIDTH {0} \
 ] $la_storage_axis
  set vid_io_in [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:vid_io_rtl:1.0 vid_io_in ]

  # Create ports
  set SPI0_MOSI_O [ create_bd_port -dir O SPI0_MOSI_O ]
  set SPI0_SCLK_O [ create_bd_port -dir O SPI0_SCLK_O ]
  set bus_analyze_clk [ create_bd_port -dir O -type clk bus_analyze_clk ]
  set_property -dict [ list \
CONFIG.ASSOCIATED_BUSIF {bus_analyze_axis} \
CONFIG.ASSOCIATED_RESET {bus_analyze_rst_n} \
 ] $bus_analyze_clk
  set bus_analyze_rst_n [ create_bd_port -dir O -from 0 -to 0 -type rst bus_analyze_rst_n ]
  set clk_out1 [ create_bd_port -dir O -type clk clk_out1 ]
  set clk_out2 [ create_bd_port -dir O -type clk clk_out2 ]
  set clk_serdes [ create_bd_port -dir O -type clk clk_serdes ]
  set done [ create_bd_port -dir I done ]
  set emc_rtl_addr [ create_bd_port -dir O -from 31 -to 0 emc_rtl_addr ]
  set emc_rtl_ben [ create_bd_port -dir O -from 3 -to 0 emc_rtl_ben ]
  set emc_rtl_ce_n [ create_bd_port -dir O -from 0 -to 0 emc_rtl_ce_n ]
  set emc_rtl_dq_i [ create_bd_port -dir I -from 31 -to 0 emc_rtl_dq_i ]
  set emc_rtl_dq_o [ create_bd_port -dir O -from 31 -to 0 emc_rtl_dq_o ]
  set emc_rtl_dq_t [ create_bd_port -dir O -from 31 -to 0 emc_rtl_dq_t ]
  set emc_rtl_oen [ create_bd_port -dir O -from 0 -to 0 emc_rtl_oen ]
  set emc_rtl_wen [ create_bd_port -dir O emc_rtl_wen ]
  set gpio_sw_i [ create_bd_port -dir I -from 31 -to 0 gpio_sw_i ]
  set gpio_sw_o [ create_bd_port -dir O -from 31 -to 0 gpio_sw_o ]
  set gpio_sw_t [ create_bd_port -dir O -from 31 -to 0 gpio_sw_t ]
  set initb [ create_bd_port -dir I initb ]
  set la_fifo_aclk [ create_bd_port -dir I -type clk la_fifo_aclk ]
  set la_fifo_aresetn [ create_bd_port -dir I -type rst la_fifo_aresetn ]
  set la_rst_n [ create_bd_port -dir O -from 0 -to 0 -type rst la_rst_n ]
  set port2reg [ create_bd_port -dir I -from 287 -to 0 port2reg ]
  set pp_csel [ create_bd_port -dir O pp_csel ]
  set pp_data_i [ create_bd_port -dir I -from 23 -to 0 pp_data_i ]
  set pp_data_o [ create_bd_port -dir O -from 23 -to 0 pp_data_o ]
  set pp_data_t [ create_bd_port -dir O -from 23 -to 0 pp_data_t ]
  set pp_nrst [ create_bd_port -dir O pp_nrst ]
  set pp_rd [ create_bd_port -dir O pp_rd ]
  set pp_rs [ create_bd_port -dir O pp_rs ]
  set pp_wr [ create_bd_port -dir O pp_wr ]
  set progb [ create_bd_port -dir O -from 0 -to 0 progb ]
  set ps_perph_rstn [ create_bd_port -dir O -from 0 -to 0 ps_perph_rstn ]
  set reg2port [ create_bd_port -dir O -from 127 -to 0 -type data reg2port ]
  set vid_in_clk [ create_bd_port -dir I -type clk vid_in_clk ]
  set_property -dict [ list \
CONFIG.FREQ_HZ {150000000} \
 ] $vid_in_clk
  set vid_io_in_reset [ create_bd_port -dir I -type rst vid_io_in_reset ]
  set_property -dict [ list \
CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $vid_io_in_reset
  set vid_overflow [ create_bd_port -dir O vid_overflow ]
  set vtc_locked [ create_bd_port -dir O -from 0 -to 0 vtc_locked ]

  # Create instance: axi_apb_0, and set properties
  set axi_apb_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_apb_bridge:3.0 axi_apb_0 ]
  set_property -dict [ list \
CONFIG.C_APB_NUM_SLAVES {1} \
CONFIG.C_M_APB_PROTOCOL {apb4} \
 ] $axi_apb_0

  # Create instance: axi_emc_0, and set properties
  set axi_emc_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_emc:3.0 axi_emc_0 ]
  set_property -dict [ list \
CONFIG.C_INCLUDE_DATAWIDTH_MATCHING_0 {0} \
CONFIG.C_MAX_MEM_WIDTH {32} \
CONFIG.C_MEM0_TYPE {1} \
CONFIG.C_MEM0_WIDTH {32} \
CONFIG.C_SYNCH_PIPEDELAY_0 {1} \
CONFIG.C_S_AXI_EN_REG {0} \
 ] $axi_emc_0

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {0} \
CONFIG.C_ALL_INPUTS_2 {0} \
CONFIG.C_ALL_OUTPUTS {0} \
CONFIG.C_INTERRUPT_PRESENT {0} \
CONFIG.C_IS_DUAL {0} \
 ] $axi_gpio_0

  # Create instance: axi_gpio_1, and set properties
  set axi_gpio_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_1 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {0} \
CONFIG.C_ALL_INPUTS_2 {0} \
CONFIG.C_ALL_OUTPUTS {0} \
CONFIG.C_GPIO_WIDTH {6} \
CONFIG.C_INTERRUPT_PRESENT {0} \
CONFIG.C_IS_DUAL {0} \
 ] $axi_gpio_1

  # Create instance: axi_gpio_2, and set properties
  set axi_gpio_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_2 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {0} \
CONFIG.C_ALL_INPUTS_2 {0} \
CONFIG.C_ALL_OUTPUTS {0} \
CONFIG.C_INTERRUPT_PRESENT {0} \
CONFIG.C_IS_DUAL {0} \
 ] $axi_gpio_2

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
CONFIG.NUM_MI {12} \
 ] $axi_interconnect_0

  # Create instance: axi_register_0, and set properties
  set axi_register_0 [ create_bd_cell -type ip -vlnv user.org:user:axi_register:1.1 axi_register_0 ]

  # Create instance: axi_uart16550_0, and set properties
  set axi_uart16550_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart16550_0 ]

  # Create instance: bus_analyze
  create_hier_cell_bus_analyze [current_bd_instance .] bus_analyze

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKIN1_JITTER_PS {200.0} \
CONFIG.CLKOUT1_JITTER {190.710} \
CONFIG.CLKOUT1_PHASE_ERROR {163.922} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
CONFIG.CLKOUT2_JITTER {278.968} \
CONFIG.CLKOUT2_PHASE_ERROR {163.922} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {11.0592} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.MMCM_CLKFBOUT_MULT_F {20.125} \
CONFIG.MMCM_CLKIN1_PERIOD {20.000} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.125} \
CONFIG.MMCM_CLKOUT1_DIVIDE {91} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.PRIM_SOURCE {Global_buffer} \
CONFIG.USE_DYN_RECONFIG {true} \
 ] $clk_wiz_0

  # Create instance: la_storage
  create_hier_cell_la_storage [current_bd_instance .] la_storage

  # Create instance: parallel_apb_adapter_0, and set properties
  set parallel_apb_adapter_0 [ create_bd_cell -type ip -vlnv user.org:user:nt35510_apb_adapter:1.0 parallel_apb_adapter_0 ]
  set_property -dict [ list \
CONFIG.NT35510_RD_CYCLE {6} \
CONFIG.NT35510_RS_CYCLE {2} \
 ] $parallel_apb_adapter_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: ps7_0, and set properties
  set ps7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 ps7_0 ]
  set_property -dict [ list \
CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {50.000000} \
CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {166.666672} \
CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_APU_CLK_RATIO_ENABLE {6:2:1} \
CONFIG.PCW_CLK1_FREQ {100000000} \
CONFIG.PCW_CLK2_FREQ {200000000} \
CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_ENET_RESET_ENABLE {1} \
CONFIG.PCW_ENET_RESET_SELECT {Share reset pin} \
CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_EN_CLK2_PORT {1} \
CONFIG.PCW_EN_EMIO_GPIO {1} \
CONFIG.PCW_EN_EMIO_SPI0 {1} \
CONFIG.PCW_EN_EMIO_UART1 {1} \
CONFIG.PCW_EN_ENET0 {1} \
CONFIG.PCW_EN_GPIO {1} \
CONFIG.PCW_EN_QSPI {1} \
CONFIG.PCW_EN_SDIO0 {1} \
CONFIG.PCW_EN_SPI0 {1} \
CONFIG.PCW_EN_UART0 {1} \
CONFIG.PCW_EN_UART1 {1} \
CONFIG.PCW_EN_USB0 {1} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {2} \
CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_FCLK_CLK1_BUF {TRUE} \
CONFIG.PCW_FCLK_CLK2_BUF {TRUE} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
CONFIG.PCW_FPGA_FCLK2_ENABLE {1} \
CONFIG.PCW_FTM_CTI_IN0 {<Select>} \
CONFIG.PCW_FTM_CTI_IN1 {<Select>} \
CONFIG.PCW_FTM_CTI_IN2 {<Select>} \
CONFIG.PCW_FTM_CTI_IN3 {<Select>} \
CONFIG.PCW_FTM_CTI_OUT0 {<Select>} \
CONFIG.PCW_FTM_CTI_OUT1 {<Select>} \
CONFIG.PCW_FTM_CTI_OUT2 {<Select>} \
CONFIG.PCW_FTM_CTI_OUT3 {<Select>} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_EMIO_GPIO_IO {3} \
CONFIG.PCW_GPIO_EMIO_GPIO_WIDTH {3} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_MIO_GPIO_IO {MIO} \
CONFIG.PCW_I2C_RESET_ENABLE {1} \
CONFIG.PCW_IOPLL_CTRL_FBDIV {30} \
CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_MIO_0_DIRECTION {inout} \
CONFIG.PCW_MIO_0_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_0_PULLUP {enabled} \
CONFIG.PCW_MIO_0_SLEW {slow} \
CONFIG.PCW_MIO_10_DIRECTION {inout} \
CONFIG.PCW_MIO_10_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_10_PULLUP {enabled} \
CONFIG.PCW_MIO_10_SLEW {slow} \
CONFIG.PCW_MIO_11_DIRECTION {inout} \
CONFIG.PCW_MIO_11_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_11_PULLUP {enabled} \
CONFIG.PCW_MIO_11_SLEW {slow} \
CONFIG.PCW_MIO_12_DIRECTION {inout} \
CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_12_PULLUP {enabled} \
CONFIG.PCW_MIO_12_SLEW {slow} \
CONFIG.PCW_MIO_13_DIRECTION {inout} \
CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_13_PULLUP {enabled} \
CONFIG.PCW_MIO_13_SLEW {slow} \
CONFIG.PCW_MIO_14_DIRECTION {inout} \
CONFIG.PCW_MIO_14_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_14_PULLUP {enabled} \
CONFIG.PCW_MIO_14_SLEW {slow} \
CONFIG.PCW_MIO_15_DIRECTION {inout} \
CONFIG.PCW_MIO_15_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_15_PULLUP {enabled} \
CONFIG.PCW_MIO_15_SLEW {slow} \
CONFIG.PCW_MIO_16_DIRECTION {out} \
CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_16_PULLUP {enabled} \
CONFIG.PCW_MIO_16_SLEW {slow} \
CONFIG.PCW_MIO_17_DIRECTION {out} \
CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_17_PULLUP {enabled} \
CONFIG.PCW_MIO_17_SLEW {slow} \
CONFIG.PCW_MIO_18_DIRECTION {out} \
CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_18_PULLUP {enabled} \
CONFIG.PCW_MIO_18_SLEW {slow} \
CONFIG.PCW_MIO_19_DIRECTION {out} \
CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_19_PULLUP {enabled} \
CONFIG.PCW_MIO_19_SLEW {slow} \
CONFIG.PCW_MIO_1_DIRECTION {out} \
CONFIG.PCW_MIO_1_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_1_PULLUP {enabled} \
CONFIG.PCW_MIO_1_SLEW {slow} \
CONFIG.PCW_MIO_20_DIRECTION {out} \
CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_20_PULLUP {enabled} \
CONFIG.PCW_MIO_20_SLEW {slow} \
CONFIG.PCW_MIO_21_DIRECTION {out} \
CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_21_PULLUP {enabled} \
CONFIG.PCW_MIO_21_SLEW {slow} \
CONFIG.PCW_MIO_22_DIRECTION {in} \
CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_22_PULLUP {enabled} \
CONFIG.PCW_MIO_22_SLEW {slow} \
CONFIG.PCW_MIO_23_DIRECTION {in} \
CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_23_PULLUP {enabled} \
CONFIG.PCW_MIO_23_SLEW {slow} \
CONFIG.PCW_MIO_24_DIRECTION {in} \
CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_24_PULLUP {enabled} \
CONFIG.PCW_MIO_24_SLEW {slow} \
CONFIG.PCW_MIO_25_DIRECTION {in} \
CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_25_PULLUP {enabled} \
CONFIG.PCW_MIO_25_SLEW {slow} \
CONFIG.PCW_MIO_26_DIRECTION {in} \
CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_26_PULLUP {enabled} \
CONFIG.PCW_MIO_26_SLEW {slow} \
CONFIG.PCW_MIO_27_DIRECTION {in} \
CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_27_PULLUP {enabled} \
CONFIG.PCW_MIO_27_SLEW {slow} \
CONFIG.PCW_MIO_28_DIRECTION {inout} \
CONFIG.PCW_MIO_28_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_28_PULLUP {enabled} \
CONFIG.PCW_MIO_28_SLEW {slow} \
CONFIG.PCW_MIO_29_DIRECTION {in} \
CONFIG.PCW_MIO_29_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_29_PULLUP {enabled} \
CONFIG.PCW_MIO_29_SLEW {slow} \
CONFIG.PCW_MIO_2_DIRECTION {inout} \
CONFIG.PCW_MIO_2_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_2_PULLUP {disabled} \
CONFIG.PCW_MIO_2_SLEW {slow} \
CONFIG.PCW_MIO_30_DIRECTION {out} \
CONFIG.PCW_MIO_30_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_30_PULLUP {enabled} \
CONFIG.PCW_MIO_30_SLEW {slow} \
CONFIG.PCW_MIO_31_DIRECTION {in} \
CONFIG.PCW_MIO_31_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_31_PULLUP {enabled} \
CONFIG.PCW_MIO_31_SLEW {slow} \
CONFIG.PCW_MIO_32_DIRECTION {inout} \
CONFIG.PCW_MIO_32_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_32_PULLUP {enabled} \
CONFIG.PCW_MIO_32_SLEW {slow} \
CONFIG.PCW_MIO_33_DIRECTION {inout} \
CONFIG.PCW_MIO_33_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_33_PULLUP {enabled} \
CONFIG.PCW_MIO_33_SLEW {slow} \
CONFIG.PCW_MIO_34_DIRECTION {inout} \
CONFIG.PCW_MIO_34_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_34_PULLUP {enabled} \
CONFIG.PCW_MIO_34_SLEW {slow} \
CONFIG.PCW_MIO_35_DIRECTION {inout} \
CONFIG.PCW_MIO_35_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_35_PULLUP {enabled} \
CONFIG.PCW_MIO_35_SLEW {slow} \
CONFIG.PCW_MIO_36_DIRECTION {in} \
CONFIG.PCW_MIO_36_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_36_PULLUP {enabled} \
CONFIG.PCW_MIO_36_SLEW {slow} \
CONFIG.PCW_MIO_37_DIRECTION {inout} \
CONFIG.PCW_MIO_37_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_37_PULLUP {enabled} \
CONFIG.PCW_MIO_37_SLEW {slow} \
CONFIG.PCW_MIO_38_DIRECTION {inout} \
CONFIG.PCW_MIO_38_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_38_PULLUP {enabled} \
CONFIG.PCW_MIO_38_SLEW {slow} \
CONFIG.PCW_MIO_39_DIRECTION {inout} \
CONFIG.PCW_MIO_39_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_39_PULLUP {enabled} \
CONFIG.PCW_MIO_39_SLEW {slow} \
CONFIG.PCW_MIO_3_DIRECTION {inout} \
CONFIG.PCW_MIO_3_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_3_PULLUP {disabled} \
CONFIG.PCW_MIO_3_SLEW {slow} \
CONFIG.PCW_MIO_40_DIRECTION {inout} \
CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_40_PULLUP {enabled} \
CONFIG.PCW_MIO_40_SLEW {slow} \
CONFIG.PCW_MIO_41_DIRECTION {inout} \
CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_41_PULLUP {enabled} \
CONFIG.PCW_MIO_41_SLEW {slow} \
CONFIG.PCW_MIO_42_DIRECTION {inout} \
CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_42_PULLUP {enabled} \
CONFIG.PCW_MIO_42_SLEW {slow} \
CONFIG.PCW_MIO_43_DIRECTION {inout} \
CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_43_PULLUP {enabled} \
CONFIG.PCW_MIO_43_SLEW {slow} \
CONFIG.PCW_MIO_44_DIRECTION {inout} \
CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_44_PULLUP {enabled} \
CONFIG.PCW_MIO_44_SLEW {slow} \
CONFIG.PCW_MIO_45_DIRECTION {inout} \
CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_45_PULLUP {enabled} \
CONFIG.PCW_MIO_45_SLEW {slow} \
CONFIG.PCW_MIO_46_DIRECTION {in} \
CONFIG.PCW_MIO_46_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_46_PULLUP {enabled} \
CONFIG.PCW_MIO_46_SLEW {slow} \
CONFIG.PCW_MIO_47_DIRECTION {out} \
CONFIG.PCW_MIO_47_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_47_PULLUP {enabled} \
CONFIG.PCW_MIO_47_SLEW {slow} \
CONFIG.PCW_MIO_48_DIRECTION {in} \
CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_48_PULLUP {enabled} \
CONFIG.PCW_MIO_48_SLEW {slow} \
CONFIG.PCW_MIO_49_DIRECTION {out} \
CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_49_PULLUP {enabled} \
CONFIG.PCW_MIO_49_SLEW {slow} \
CONFIG.PCW_MIO_4_DIRECTION {inout} \
CONFIG.PCW_MIO_4_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_4_PULLUP {disabled} \
CONFIG.PCW_MIO_4_SLEW {slow} \
CONFIG.PCW_MIO_50_DIRECTION {inout} \
CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_50_PULLUP {enabled} \
CONFIG.PCW_MIO_50_SLEW {slow} \
CONFIG.PCW_MIO_51_DIRECTION {inout} \
CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_51_PULLUP {enabled} \
CONFIG.PCW_MIO_51_SLEW {slow} \
CONFIG.PCW_MIO_52_DIRECTION {out} \
CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_52_PULLUP {enabled} \
CONFIG.PCW_MIO_52_SLEW {slow} \
CONFIG.PCW_MIO_53_DIRECTION {inout} \
CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 2.5V} \
CONFIG.PCW_MIO_53_PULLUP {enabled} \
CONFIG.PCW_MIO_53_SLEW {slow} \
CONFIG.PCW_MIO_5_DIRECTION {inout} \
CONFIG.PCW_MIO_5_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_5_PULLUP {disabled} \
CONFIG.PCW_MIO_5_SLEW {slow} \
CONFIG.PCW_MIO_6_DIRECTION {out} \
CONFIG.PCW_MIO_6_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_6_PULLUP {disabled} \
CONFIG.PCW_MIO_6_SLEW {slow} \
CONFIG.PCW_MIO_7_DIRECTION {out} \
CONFIG.PCW_MIO_7_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_7_PULLUP {disabled} \
CONFIG.PCW_MIO_7_SLEW {slow} \
CONFIG.PCW_MIO_8_DIRECTION {out} \
CONFIG.PCW_MIO_8_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_8_PULLUP {disabled} \
CONFIG.PCW_MIO_8_SLEW {slow} \
CONFIG.PCW_MIO_9_DIRECTION {inout} \
CONFIG.PCW_MIO_9_IOTYPE {LVCMOS 3.3V} \
CONFIG.PCW_MIO_9_PULLUP {enabled} \
CONFIG.PCW_MIO_9_SLEW {slow} \
CONFIG.PCW_MIO_TREE_PERIPHERALS {GPIO#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#GPIO#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#UART 0#UART 0#SD 0#USB Reset#GPIO#GPIO#Enet 0#Enet 0} \
CONFIG.PCW_MIO_TREE_SIGNALS {gpio[0]#qspi0_ss_b#qspi0_io[0]#qspi0_io[1]#qspi0_io[2]#qspi0_io[3]#qspi0_sclk#gpio[7]#gpio[8]#gpio[9]#gpio[10]#gpio[11]#gpio[12]#gpio[13]#gpio[14]#gpio[15]#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#data[4]#dir#stp#nxt#data[0]#data[1]#data[2]#data[3]#clk#data[5]#data[6]#data[7]#clk#cmd#data[0]#data[1]#data[2]#data[3]#rx#tx#cd#reset#gpio[50]#gpio[51]#mdc#mdio} \
CONFIG.PCW_OVERRIDE_BASIC_CLOCK {0} \
CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 2.5V} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {MIO 1 .. 6} \
CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_QSPI_QSPI_IO {MIO 1 .. 6} \
CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
CONFIG.PCW_SD0_GRP_CD_IO {MIO 48} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {20} \
CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
CONFIG.PCW_SPI0_GRP_SS0_ENABLE {1} \
CONFIG.PCW_SPI0_GRP_SS0_IO {EMIO} \
CONFIG.PCW_SPI0_GRP_SS1_ENABLE {1} \
CONFIG.PCW_SPI0_GRP_SS1_IO {EMIO} \
CONFIG.PCW_SPI0_GRP_SS2_ENABLE {1} \
CONFIG.PCW_SPI0_GRP_SS2_IO {EMIO} \
CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SPI0_SPI0_IO {EMIO} \
CONFIG.PCW_SPI_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {6} \
CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ {166.666672} \
CONFIG.PCW_SPI_PERIPHERAL_VALID {1} \
CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART0_UART0_IO {MIO 46 .. 47} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_UART1_IO {EMIO} \
CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {10} \
CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit} \
CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3 (Low Voltage)} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125} \
CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
CONFIG.PCW_UIPARAM_DDR_T_FAW {40.0} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_USB0_RESET_ENABLE {1} \
CONFIG.PCW_USB0_RESET_IO {MIO 49} \
CONFIG.PCW_USB0_USB0_IO {MIO 28 .. 39} \
CONFIG.PCW_USB_RESET_ENABLE {1} \
CONFIG.PCW_USB_RESET_SELECT {Share reset pin} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.PCW_USE_S_AXI_HP1 {1} \
CONFIG.PCW_USE_S_AXI_HP2 {1} \
 ] $ps7_0

  # Create instance: video_capture
  create_hier_cell_video_capture [current_bd_instance .] video_capture

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {4} \
 ] $xlconcat_1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
CONFIG.DIN_FROM {0} \
CONFIG.DIN_TO {0} \
CONFIG.DIN_WIDTH {3} \
 ] $xlslice_0

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXI_1 [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins ps7_0/M_AXI_GP0]
  connect_bd_intf_net -intf_net S_AXIS_1 [get_bd_intf_ports la_storage_axis] [get_bd_intf_pins la_storage/S_AXIS]
  connect_bd_intf_net -intf_net S_AXI_LITE_1 [get_bd_intf_pins axi_interconnect_0/M05_AXI] [get_bd_intf_pins la_storage/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_apb_bridge_0_APB_M [get_bd_intf_pins axi_apb_0/APB_M] [get_bd_intf_pins parallel_apb_adapter_0/APB]
  connect_bd_intf_net -intf_net axi_gpio_0_GPIO [get_bd_intf_ports gpio_rtl] [get_bd_intf_pins axi_gpio_0/GPIO]
  connect_bd_intf_net -intf_net axi_gpio_1_GPIO [get_bd_intf_ports gpio_rtl_0] [get_bd_intf_pins axi_gpio_1/GPIO]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins clk_wiz_0/s_axi_lite]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins axi_uart16550_0/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins axi_gpio_1/S_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins axi_gpio_2/S_AXI] [get_bd_intf_pins axi_interconnect_0/M04_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M06_AXI [get_bd_intf_pins axi_emc_0/S_AXI_MEM] [get_bd_intf_pins axi_interconnect_0/M06_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M07_AXI [get_bd_intf_pins axi_interconnect_0/M07_AXI] [get_bd_intf_pins axi_register_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M08_AXI [get_bd_intf_pins axi_interconnect_0/M08_AXI] [get_bd_intf_pins bus_analyze/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_interconnect_0_M09_AXI [get_bd_intf_pins axi_apb_0/AXI4_LITE] [get_bd_intf_pins axi_interconnect_0/M09_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins bus_analyze/M00_AXI] [get_bd_intf_pins ps7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_uart16550_0_UART [get_bd_intf_ports UART_CPLD] [get_bd_intf_pins axi_uart16550_0/UART]
  connect_bd_intf_net -intf_net bus_analyze_axis_1 [get_bd_intf_ports bus_analyze_axis] [get_bd_intf_pins bus_analyze/S_AXIS]
  connect_bd_intf_net -intf_net dma_ctrl_1 [get_bd_intf_pins axi_interconnect_0/M11_AXI] [get_bd_intf_pins video_capture/dma_ctrl]
  connect_bd_intf_net -intf_net la_storage_M00_AXI [get_bd_intf_pins la_storage/M00_AXI] [get_bd_intf_pins ps7_0/S_AXI_HP2]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins ps7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins ps7_0/FIXED_IO]
  connect_bd_intf_net -intf_net ps7_0_UART_1 [get_bd_intf_ports UART_1] [get_bd_intf_pins ps7_0/UART_1]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins ps7_0/S_AXI_HP1] [get_bd_intf_pins video_capture/M00_AXI]
  connect_bd_intf_net -intf_net v_tc_ctrl_1 [get_bd_intf_pins axi_interconnect_0/M10_AXI] [get_bd_intf_pins video_capture/v_tc_ctrl]
  connect_bd_intf_net -intf_net vid_io_in_1 [get_bd_intf_ports vid_io_in] [get_bd_intf_pins video_capture/vid_io_in]

  # Create port connections
  connect_bd_net -net LCD_data_in_1 [get_bd_ports pp_data_i] [get_bd_pins parallel_apb_adapter_0/LCD_data_in]
  connect_bd_net -net axi_emc_0_mem_a [get_bd_ports emc_rtl_addr] [get_bd_pins axi_emc_0/mem_a]
  connect_bd_net -net axi_emc_0_mem_ben [get_bd_ports emc_rtl_ben] [get_bd_pins axi_emc_0/mem_ben]
  connect_bd_net -net axi_emc_0_mem_cen [get_bd_ports emc_rtl_ce_n] [get_bd_pins axi_emc_0/mem_cen]
  connect_bd_net -net axi_emc_0_mem_dq_o [get_bd_ports emc_rtl_dq_o] [get_bd_pins axi_emc_0/mem_dq_o]
  connect_bd_net -net axi_emc_0_mem_dq_t [get_bd_ports emc_rtl_dq_t] [get_bd_pins axi_emc_0/mem_dq_t]
  connect_bd_net -net axi_emc_0_mem_oen [get_bd_ports emc_rtl_oen] [get_bd_pins axi_emc_0/mem_oen]
  connect_bd_net -net axi_emc_0_mem_wen [get_bd_ports emc_rtl_wen] [get_bd_pins axi_emc_0/mem_wen]
  connect_bd_net -net axi_gpio_2_gpio_io_o [get_bd_ports gpio_sw_o] [get_bd_pins axi_gpio_2/gpio_io_o]
  connect_bd_net -net axi_gpio_2_gpio_io_t [get_bd_ports gpio_sw_t] [get_bd_pins axi_gpio_2/gpio_io_t]
  connect_bd_net -net axi_register_0_reg2port [get_bd_ports reg2port] [get_bd_pins axi_register_0/reg2port]
  connect_bd_net -net axi_uart16550_0_ip2intc_irpt [get_bd_pins axi_uart16550_0/ip2intc_irpt] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net bus_analyze_peripheral_aresetn [get_bd_ports bus_analyze_rst_n] [get_bd_pins bus_analyze/peripheral_aresetn]
  connect_bd_net -net bus_analyze_s2mm_introut [get_bd_pins bus_analyze/s2mm_introut] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_ports clk_out1] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_ports clk_out2] [get_bd_pins clk_wiz_0/clk_out2]
  connect_bd_net -net done_1 [get_bd_ports done] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net gpio_io_i_1 [get_bd_ports gpio_sw_i] [get_bd_pins axi_gpio_2/gpio_io_i]
  connect_bd_net -net initb_1 [get_bd_ports initb] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net la_storage_peripheral_aresetn [get_bd_ports la_rst_n] [get_bd_pins la_storage/peripheral_aresetn]
  connect_bd_net -net la_storage_s2mm_introut [get_bd_pins la_storage/s2mm_introut] [get_bd_pins xlconcat_1/In2]
  connect_bd_net -net m_aclk_1 [get_bd_ports la_fifo_aclk] [get_bd_pins la_storage/fifo_aclk]
  connect_bd_net -net mem_dq_i_1 [get_bd_ports emc_rtl_dq_i] [get_bd_pins axi_emc_0/mem_dq_i]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_csel [get_bd_ports pp_csel] [get_bd_pins parallel_apb_adapter_0/LCD_csel]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_nrst [get_bd_ports pp_nrst] [get_bd_pins parallel_apb_adapter_0/LCD_nrst]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_rd [get_bd_ports pp_rd] [get_bd_pins parallel_apb_adapter_0/LCD_rd]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_rs [get_bd_ports pp_rs] [get_bd_pins parallel_apb_adapter_0/LCD_rs]
  connect_bd_net -net nt35510_apb_adapter_0_LCD_wr [get_bd_ports pp_wr] [get_bd_pins parallel_apb_adapter_0/LCD_wr]
  connect_bd_net -net parallel_apb_adapter_0_LCD_data_out [get_bd_ports pp_data_o] [get_bd_pins parallel_apb_adapter_0/LCD_data_out]
  connect_bd_net -net parallel_apb_adapter_0_LCD_data_z [get_bd_ports pp_data_t] [get_bd_pins parallel_apb_adapter_0/LCD_data_z]
  connect_bd_net -net port2reg_1 [get_bd_ports port2reg] [get_bd_pins axi_register_0/port2reg]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_ports ps_perph_rstn] [get_bd_pins axi_apb_0/s_axi_aresetn] [get_bd_pins axi_emc_0/s_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_gpio_1/s_axi_aresetn] [get_bd_pins axi_gpio_2/s_axi_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins axi_interconnect_0/M06_ARESETN] [get_bd_pins axi_interconnect_0/M07_ARESETN] [get_bd_pins axi_interconnect_0/M08_ARESETN] [get_bd_pins axi_interconnect_0/M09_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_register_0/s00_axi_aresetn] [get_bd_pins axi_uart16550_0/s_axi_aresetn] [get_bd_pins bus_analyze/axi_resetn] [get_bd_pins clk_wiz_0/s_axi_aresetn] [get_bd_pins la_storage/axi_resetn] [get_bd_pins parallel_apb_adapter_0/nrst] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins axi_apb_0/s_axi_aclk] [get_bd_pins axi_emc_0/rdclk] [get_bd_pins axi_emc_0/s_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_gpio_1/s_axi_aclk] [get_bd_pins axi_gpio_2/s_axi_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/M06_ACLK] [get_bd_pins axi_interconnect_0/M07_ACLK] [get_bd_pins axi_interconnect_0/M08_ACLK] [get_bd_pins axi_interconnect_0/M09_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_register_0/s00_axi_aclk] [get_bd_pins axi_uart16550_0/s_axi_aclk] [get_bd_pins bus_analyze/s_axi_lite_aclk] [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins clk_wiz_0/s_axi_aclk] [get_bd_pins la_storage/s_axi_lite_aclk] [get_bd_pins parallel_apb_adapter_0/clk] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins ps7_0/FCLK_CLK0] [get_bd_pins ps7_0/M_AXI_GP0_ACLK]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins bus_analyze/ext_reset_in] [get_bd_pins la_storage/ext_reset_in] [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins ps7_0/FCLK_RESET0_N] [get_bd_pins video_capture/ext_reset_in]
  connect_bd_net -net ps7_0_FCLK_CLK1 [get_bd_ports bus_analyze_clk] [get_bd_pins axi_interconnect_0/M10_ACLK] [get_bd_pins axi_interconnect_0/M11_ACLK] [get_bd_pins bus_analyze/M00_ACLK] [get_bd_pins la_storage/M00_ACLK] [get_bd_pins ps7_0/FCLK_CLK1] [get_bd_pins ps7_0/S_AXI_HP0_ACLK] [get_bd_pins ps7_0/S_AXI_HP1_ACLK] [get_bd_pins ps7_0/S_AXI_HP2_ACLK] [get_bd_pins video_capture/axi_clk]
  connect_bd_net -net ps7_0_FCLK_CLK2 [get_bd_ports clk_serdes] [get_bd_pins ps7_0/FCLK_CLK2]
  connect_bd_net -net ps7_0_GPIO_O [get_bd_pins ps7_0/GPIO_O] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net ps7_0_SPI0_MOSI_O [get_bd_ports SPI0_MOSI_O] [get_bd_pins ps7_0/SPI0_MOSI_O]
  connect_bd_net -net ps7_0_SPI0_SCLK_O [get_bd_ports SPI0_SCLK_O] [get_bd_pins ps7_0/SPI0_SCLK_O]
  connect_bd_net -net s_aresetn_1 [get_bd_ports la_fifo_aresetn] [get_bd_pins la_storage/s_aresetn]
  connect_bd_net -net vid_in_clk_1 [get_bd_ports vid_in_clk] [get_bd_pins video_capture/vid_in_clk]
  connect_bd_net -net vid_io_in_reset_1 [get_bd_ports vid_io_in_reset] [get_bd_pins video_capture/vid_io_in_reset]
  connect_bd_net -net video_capture_aresetn [get_bd_pins axi_interconnect_0/M10_ARESETN] [get_bd_pins axi_interconnect_0/M11_ARESETN] [get_bd_pins video_capture/aresetn]
  connect_bd_net -net video_capture_dma_interrupt [get_bd_pins video_capture/dma_interrupt] [get_bd_pins xlconcat_1/In3]
  connect_bd_net -net video_capture_overflow [get_bd_ports vid_overflow] [get_bd_pins video_capture/overflow]
  connect_bd_net -net video_capture_vtc_locked [get_bd_ports vtc_locked] [get_bd_pins video_capture/vtc_locked]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins ps7_0/GPIO_I] [get_bd_pins xlconcat_0/dout]
  set_property -dict [ list \
HDL_ATTRIBUTE.DEBUG {true} \
 ] [get_bd_nets xlconcat_0_dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins ps7_0/IRQ_F2P] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xlconcat_0/In0] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_ports progb] [get_bd_pins xlslice_0/Dout]

  # Create address segments
  create_bd_addr_seg -range 0x00001000 -offset 0x43C11000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs bus_analyze/axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x43C12000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs la_storage/axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg1
  create_bd_addr_seg -range 0x02000000 -offset 0x60000000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs axi_emc_0/S_AXI_MEM/MEM0] SEG_axi_emc_0_MEM0
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41210000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs axi_gpio_1/S_AXI/Reg] SEG_axi_gpio_1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41220000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs axi_gpio_2/S_AXI/Reg] SEG_axi_gpio_2_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x43C10000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs axi_register_0/S00_AXI/S00_AXI_reg] SEG_axi_register_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C20000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs axi_uart16550_0/S_AXI/Reg] SEG_axi_uart16550_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs clk_wiz_0/s_axi_lite/Reg] SEG_clk_wiz_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41230000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs parallel_apb_adapter_0/APB/Ctrl] SEG_parallel_apb_adapter_0_Ctrl
  create_bd_addr_seg -range 0x00001000 -offset 0x43C13000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video_capture/v_frmbuf_wr_0/s_axi_CTRL/Reg] SEG_v_frmbuf_wr_0_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x43C14000 [get_bd_addr_spaces ps7_0/Data] [get_bd_addr_segs video_capture/v_tc_0/ctrl/Reg] SEG_v_tc_0_Reg
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces bus_analyze/axi_dma_0/Data_S2MM] [get_bd_addr_segs ps7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_ps7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces la_storage/axi_dma_0/Data_S2MM] [get_bd_addr_segs ps7_0/S_AXI_HP2/HP2_DDR_LOWOCM] SEG_ps7_0_HP2_DDR_LOWOCM
  create_bd_addr_seg -range 0x20000000 -offset 0x00000000 [get_bd_addr_spaces video_capture/v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs ps7_0/S_AXI_HP1/HP1_DDR_LOWOCM] SEG_ps7_0_HP1_DDR_LOWOCM


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


