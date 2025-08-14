vlib work
vlog SPI_slave.v Ram.v  SPI_Wrapper.v  spi_tb.v
vsim -voptargs=+acc work.spi_tb
add wave -position insertpoint sim:/spi_tb/my_tb/*
run -all
#quit -sim