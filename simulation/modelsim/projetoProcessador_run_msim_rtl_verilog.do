transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/projetoProcessador.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/memoriaPrincipal.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/barrel.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/Alu.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/pc_counter.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/regn.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/F.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/regW.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/display.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/dec3to8.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/Main.v}
vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/instr_memory.v}

vlog -vlog01compat -work work +incdir+C:/altera/projetoProcessador {C:/altera/projetoProcessador/projetoProcessador_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  projetoProcessador_tb

add wave *
view structure
view signals
run -all
