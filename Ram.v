module syn_ram(din,rx_valid_ram,dout,tx_valid_ram,clk_ram,rst_n_ram);

parameter MEM_DEPTH=256;
parameter ADD_SIZE=8;
input [9:0]din;
input rx_valid_ram,clk_ram,rst_n_ram;
output reg [7:0]dout;
output reg tx_valid_ram;

  reg [7:0] mem[MEM_DEPTH-1:0];
  reg [ADD_SIZE-1:0]rd_add;
  reg [ADD_SIZE-1:0]wr_add;
 

always@(posedge clk_ram)begin
    if(~rst_n_ram)begin
         dout<=0;
         tx_valid_ram<=0;
    end     
    else begin 
        if(rx_valid_ram==1)begin
            case(din[9:8])
                2'b00: wr_add<=din[7:0];  
                2'b01:mem[wr_add]<=din[7:0];
                2'b10:rd_add<=din[7:0];
                2'b11:begin
                      dout<=mem[rd_add];
                      tx_valid_ram<=1;
                 end                   
            endcase  
        end
    end
end
endmodule              

                 



