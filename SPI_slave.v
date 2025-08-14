module SPI_slave(
    input   MOSI,
    output reg  MISO,
    input   ss_n,
    input   clk,
    input   rst_n,
    input   [7:0] tx_data,
    input         tx_valid,
    output reg  [9:0] rx_data,
    output reg        rx_valid
);

    parameter IDLE     =3'b000;
    parameter CHK_CMD  =3'b001;
    parameter WRITE    =3'b010;
    parameter READ_ADD =3'b011;
    parameter READ_DATA=3'b100;

       (*fsm_encoding = "gray"*)
    // (fsm_encoding = "one_hot")
    // (fsm_encoding = "sequential")
    

    reg [2:0] cs, ns;
    reg       rd_check;
    reg [3:0] counter ;   
    reg [2:0] counter2 ;
    reg [9:0] rx_data_reg;
    reg  rx_done;
    always @(posedge clk) begin
        if (~rst_n)
            cs <= IDLE;
        else
            cs <= ns;
    end

    always @(*) begin
        case (cs)
             IDLE:  ns =  (~ss_n)?  CHK_CMD :  IDLE;
                
             CHK_CMD: begin
                if (ss_n)
                    ns = IDLE;
                else if (MOSI == 0)
                    ns = WRITE;
                else if (MOSI == 1 && rd_check == 0)
                    ns = READ_ADD;
                else if (MOSI == 1 && rd_check == 1)
                    ns = READ_DATA;
                else
                    ns = CHK_CMD; 
            end


             WRITE: ns = (ss_n) ? IDLE : WRITE;

             READ_ADD: ns = (ss_n) ?  IDLE : READ_ADD;
                   
             READ_DATA:ns = (ss_n) ?  IDLE : READ_DATA;

        endcase
    end

    always @(posedge clk) begin
        if (~rst_n) begin
            rx_data   <= 0;
            rx_data_reg<=0;
            rx_valid  <= 1'b0;
            counter   <= 9;
            counter2  <= 7;
            rd_check  <= 0;
            MISO      <= 1'b0;
             rx_done<=0;
        end else begin 
             
            case (cs)
                IDLE: begin 
                    rx_valid<=0; 
                    counter <= 9;
                    counter2  <= 7;
                    rx_data_reg<=0;
                    MISO<=1'b0;
                     rx_done<=0;
                end 

                WRITE: begin
                        rx_data_reg[counter] <= MOSI;
                        if (counter > 0) begin
                            counter <= counter - 1;   
                        end 
                        else begin
                            rx_valid <= 1;
                            rx_done<=1; 
                        end
                    end
                
                READ_ADD: begin
                       rx_data_reg[counter] <= MOSI;
                        if (counter > 0) begin
                            counter <= counter - 1;
                        end else begin
                             rx_valid<=1;
                             rd_check<=1;
                             rx_done<=1;
                        end
                    end
            
                READ_DATA: begin
                      rx_data_reg[counter] <= MOSI;
                        if (counter > 0) begin 
                            counter <= counter - 1;
                        end
                         else begin
                             rx_valid <= 1;
                             rd_check<=0;
                             rx_done<=1;
                        end
                       
                        if (tx_valid ==1) begin
                              rx_done<=0;
                              MISO <= tx_data[counter2];
                             if (counter2 > 0)
                                 counter2 <= counter2 - 1;
                        end
                end
             endcase

              if (rx_done) begin
                rx_data  <= rx_data_reg;
                rx_valid <= 1;
                rx_done  <= 0; 
                end else begin
                    rx_valid <= 0;
                end

        end  
    end 
endmodule
