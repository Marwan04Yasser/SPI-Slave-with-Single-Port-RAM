module spi_tb();
parameter IDLE=3'b000;
parameter CHK_CMD=3'b001;
parameter WRITE=3'b010;
parameter READ_ADD=3'b011;
parameter READ_DATA=3'b100;


parameter MEM_DEPTH=256;
parameter ADD_SIZE=8;

reg MOSI_main_tb,SS_N_tb,CLK_tb,RST_N_tb;
wire MISO_main_tb;



spi_ram #(.IDLE(IDLE),.CHK_CMD(CHK_CMD),.WRITE(WRITE),.READ_ADD(READ_ADD),.READ_DATA(READ_DATA)) 
         my_tb(.MOSI_main(MOSI_main_tb),.MISO_main(MISO_main_tb),.SS_N(SS_N_tb),.clk(CLK_tb),.RST_N(RST_N_tb));


initial begin
    CLK_tb=0;
    forever begin
       #5 CLK_tb=~CLK_tb;
    end
end

initial begin 
    RST_N_tb=0; MOSI_main_tb=0;  SS_N_tb=1;
    @(negedge CLK_tb)
    RST_N_tb=1;
         
         repeat(10)   @(negedge CLK_tb);


          @(negedge CLK_tb); 
          SS_N_tb=0;
            @(negedge CLK_tb);
          MOSI_main_tb=0; 
          @(negedge CLK_tb);
          MOSI_main_tb=0;
            @(negedge CLK_tb);
          MOSI_main_tb=0;
          @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=0;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
          @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=0;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
            
          @(negedge CLK_tb);
         SS_N_tb=1;
         @(negedge CLK_tb);
        /////////////////////dd
          @(negedge CLK_tb); 
         SS_N_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=0; 

         @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
          MOSI_main_tb=1;
         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
  /////////////////////miso=11011110  de
         @(negedge CLK_tb);
         SS_N_tb=1;
         
         @(negedge CLK_tb); 
         @(negedge CLK_tb); 
         SS_N_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1; 

         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
         //dd

        
         @(negedge CLK_tb);
         SS_N_tb=1;
         @(negedge CLK_tb);

         @(negedge CLK_tb); 
         SS_N_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1; 
         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
         @(negedge CLK_tb);
         //data
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
          MOSI_main_tb=1;
         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
         //de
        repeat(12) @(negedge CLK_tb);


         @(negedge CLK_tb);
         SS_N_tb=1;


         //////////new test
          RST_N_tb=0; MOSI_main_tb=0;  SS_N_tb=1;
    @(negedge CLK_tb)
    RST_N_tb=1;


          @(negedge CLK_tb); 
          SS_N_tb=0;
            @(negedge CLK_tb);
          MOSI_main_tb=0; 
          @(negedge CLK_tb);
          MOSI_main_tb=0;
            @(negedge CLK_tb);
          MOSI_main_tb=0;
          @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=0;
          @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
            @(negedge CLK_tb);
          MOSI_main_tb=1;
            
          @(negedge CLK_tb);
         SS_N_tb=1;
         @(negedge CLK_tb);
         /////////
           @(negedge CLK_tb); 
         SS_N_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=0; 

         @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
          MOSI_main_tb=1;
         @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
         //////////// ca
          @(negedge CLK_tb);
         SS_N_tb=1;
         
         @(negedge CLK_tb); 
         @(negedge CLK_tb); 
         SS_N_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1; 

         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
         ////////////
           @(negedge CLK_tb);
         SS_N_tb=1;
         @(negedge CLK_tb);

         @(negedge CLK_tb); 
         SS_N_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1; 
         @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
         @(negedge CLK_tb);
         //data
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
          MOSI_main_tb=1;
         @(negedge CLK_tb);
         MOSI_main_tb=0;
          @(negedge CLK_tb);
         MOSI_main_tb=1;
          @(negedge CLK_tb);
         MOSI_main_tb=0;
         //ca
        repeat(12) @(negedge CLK_tb);
         @(negedge CLK_tb);
         SS_N_tb=1;
      $stop;
end 
endmodule



  
