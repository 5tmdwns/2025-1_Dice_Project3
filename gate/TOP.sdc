###################################################################
# === Using this sdc in single domain clock ===
###################################################################

###################################################################
# MAINCLOCK
###################################################################
#MAINCLOCK
create_clock -name "CLOCK" -period 3 -waveform {0 1.5} [get_ports CLK1K]

set_clock_latency 1 [get_clock CLOCK] 
set_clock_uncertainty -setup 0.1 [get_clock CLOCK]
set_clock_uncertainty -hold 0.05 [get_clock CLOCK]
set_clock_transition 0.05 [get_clock CLOCK]

#HOLDTIMEFIX
set_fix_hold [all_clocks]

#GENCLOCK
create_generated_clock -name "CLK1KX10" -divide_by 10 -source [get_ports CLK1K] [get_pins gen_clock/CLK100_reg/Q]

#RESET
set_ideal_network [get_port RSTN]

#SET CLOCK GROUP
#set_clock_groups -asynchronous -group CLOCK -group CLK1KX10

###################################################################
# INPUT
################################################################### 
set_input_delay 1.5 -clock [get_clock CLK1KX10] [remove_from_collection [all_inputs] [get_port {CLK1K RSTN}]]


###################################################################
# OUTPUT
################################################################### 
set_output_delay 1.5 -clock [get_clock CLK1KX10] [all_outputs]

set_load 1 [all_outputs]

