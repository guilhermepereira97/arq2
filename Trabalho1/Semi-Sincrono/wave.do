onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider CPU
add wave -noupdate /tbassincrono/MaquinaCPU/clock
add wave -noupdate /tbassincrono/MaquinaCPU/reset
add wave -noupdate /tbassincrono/MaquinaCPU/dadoParaInterface
add wave -noupdate /tbassincrono/MaquinaCPU/prontoParaProximoDado
add wave -noupdate /tbassincrono/MaquinaCPU/transmitirDado
add wave -noupdate /tbassincrono/MaquinaCPU/dado
add wave -noupdate /tbassincrono/MaquinaCPU/contador
add wave -noupdate -divider {Interface CPU}
add wave -noupdate /tbassincrono/InterfaceCPU/clock
add wave -noupdate /tbassincrono/InterfaceCPU/reset
add wave -noupdate /tbassincrono/InterfaceCPU/send
add wave -noupdate /tbassincrono/InterfaceCPU/ack
add wave -noupdate /tbassincrono/InterfaceCPU/dataOut
add wave -noupdate /tbassincrono/InterfaceCPU/dadoDaMaq
add wave -noupdate /tbassincrono/InterfaceCPU/prontoParaProximoDado
add wave -noupdate /tbassincrono/InterfaceCPU/transmitirDado
add wave -noupdate /tbassincrono/InterfaceCPU/estadoTx
add wave -noupdate /tbassincrono/InterfaceCPU/regDataOut
add wave -noupdate -divider {Interface Periferico}
add wave -noupdate /tbassincrono/InterfacePeriferico/clock
add wave -noupdate /tbassincrono/InterfacePeriferico/reset
add wave -noupdate /tbassincrono/InterfacePeriferico/receive
add wave -noupdate /tbassincrono/InterfacePeriferico/accept
add wave -noupdate /tbassincrono/InterfacePeriferico/dataIn
add wave -noupdate /tbassincrono/InterfacePeriferico/dadoParaMaq
add wave -noupdate /tbassincrono/InterfacePeriferico/dadoRecebido
add wave -noupdate /tbassincrono/InterfacePeriferico/regDataIn
add wave -noupdate /tbassincrono/InterfacePeriferico/estadoTx
add wave -noupdate -divider Periferico
add wave -noupdate /tbassincrono/MaquinaPeriferico/clock
add wave -noupdate /tbassincrono/MaquinaPeriferico/reset
add wave -noupdate /tbassincrono/MaquinaPeriferico/dadoDaInterface
add wave -noupdate /tbassincrono/MaquinaPeriferico/dadoRecebido
add wave -noupdate /tbassincrono/MaquinaPeriferico/dado
add wave -noupdate /tbassincrono/MaquinaPeriferico/contador
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
