module spi_ram(MOSI_main,MISO_main,SS_N,clk,RST_N);

parameter IDLE=3'b000;
parameter CHK_CMD=3'b001;
parameter WRITE=3'b010;
parameter READ_ADD=3'b011;
parameter READ_DATA=3'b100;


parameter MEM_DEPTH=256;
parameter ADD_SIZE=8;

input MOSI_main,SS_N,clk,RST_N;
output MISO_main;


wire rx_valid_main;
wire tx_valid_main;
wire [9:0]rx_data_main;
wire [7:0]tx_data_main;

syn_ram #(.MEM_DEPTH(MEM_DEPTH),.ADD_SIZE(ADD_SIZE)) 
        my_ram(.din(rx_data_main),.rx_valid_ram(rx_valid_main),.dout(tx_data_main),
               .tx_valid_ram(tx_valid_main),.clk_ram(clk),.rst_n_ram(RST_N));

SPI_slave #(.IDLE(IDLE),.CHK_CMD(CHK_CMD),.WRITE(WRITE),.READ_ADD(READ_ADD),.READ_DATA(READ_DATA)) 
         spi(.MOSI(MOSI_main),.MISO(MISO_main),.ss_n(SS_N),.clk(clk),.rst_n(RST_N),.tx_data(tx_data_main),
             .tx_valid(tx_valid_main),.rx_data(rx_data_main),.rx_valid(rx_valid_main));
          
endmodule


         