# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"


}


proc update_MODELPARAM_VALUE.CHANNEL { MODELPARAM_VALUE.CHANNEL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "CHANNEL". Setting updated value from the model parameter.
set_property value 16 ${MODELPARAM_VALUE.CHANNEL}
}

proc update_MODELPARAM_VALUE.DATA_BITS { MODELPARAM_VALUE.DATA_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	# WARNING: There is no corresponding user parameter named "DATA_BITS". Setting updated value from the model parameter.
set_property value 16 ${MODELPARAM_VALUE.DATA_BITS}
}

