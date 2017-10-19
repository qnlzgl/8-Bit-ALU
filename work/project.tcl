set projDir "/home/dudu/Desktop/8-Bit-ALU/work/planAhead"
set projName "mojoALU"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "/home/dudu/Desktop/8-Bit-ALU/work/verilog/mojo_top_0.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/reset_conditioner_1.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/alu_2.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/testcase_3.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/adder_4.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/comparator_5.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/boolean_6.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/shifter_7.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/multiply_8.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/multi_seven_seg_9.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/edge_detector_10.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/button_conditioner_11.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/multi_seven_seg_9.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/counter_13.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/seven_seg_14.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/decoder_15.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/pipeline_16.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/counter_13.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/seven_seg_14.v" "/home/dudu/Desktop/8-Bit-ALU/work/verilog/decoder_15.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list  "/home/dudu/Mojo\ IDE/library/components/mojo.ucf" "/home/dudu/Mojo\ IDE/library/components/io_shield.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
