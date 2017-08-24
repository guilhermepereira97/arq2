onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider CPU
add wave -noupdate /tbsincrono/MaquinaCPU/clock
add wave -noupdate /tbsincrono/MaquinaCPU/reset
add wave -noupdate /tbsincrono/MaquinaCPU/dadoParaInterface
add wave -noupdate /tbsincrono/MaquinaCPU/transmitirDado
add wave -noupdate /tbsincrono/MaquinaCPU/dado
add wave -noupdate /tbsincrono/MaquinaCPU/contador
add wave -noupdate -divider {Interface CPU}
add wave -noupdate /tbsincrono/InterfaceCPU/clock
add wave -noupdate /tbsincrono/InterfaceCPU/reset
add wave -noupdate /tbsincrono/InterfaceCPU/send
add wave -noupdate /tbsincrono/InterfaceCPU/dataOut
add wave -noupdate /tbsincrono/InterfaceCPU/dadoDaMaq
add wave -noupdate /tbsincrono/InterfaceCPU/transmitirDado
add wave -noupdate /tbsincrono/InterfaceCPU/estadoTx
add wave -noupdate /tbsincrono/InterfaceCPU/regDataOut
add wave -noupdate -divider {Interface Periferico}
add wave -noupdate /tbsincrono/InterfacePeriferico/clock
add wave -noupdate /tbsincrono/InterfacePeriferico/reset
add wave -noupdate /tbsincrono/InterfacePeriferico/receive
add wave -noupdate /tbsincrono/InterfacePeriferico/dataIn
add wave -noupdate /tbsincrono/InterfacePeriferico/dadoParaMaq
add wave -noupdate /tbsincrono/InterfacePeriferico/dadoRecebido
add wave -noupdate /tbsincrono/InterfacePeriferico/regDataIn
add wave -noupdate /tbsincrono/InterfacePeriferico/estadoTx
add wave -noupdate -divider Periferico
add wave -noupdate /tbsincrono/MaquinaPeriferico/clock
add wave -noupdate /tbsincrono/MaquinaPeriferico/reset
add wave -noupdate /tbsincrono/MaquinaPeriferico/dadoDaInterface
add wave -noupdate /tbsincrono/MaquinaPeriferico/dadoRecebido
add wave -noupdate /tbsincrono/MaquinaPeriferico/dado
add wave -noupdate /tbsincrono/MaquinaPeriferico/contador
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {298 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
