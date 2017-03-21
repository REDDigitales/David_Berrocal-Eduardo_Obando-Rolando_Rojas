`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2017 03:34:48 PM
// Design Name: 
// Module Name: clk_25MHz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_25MHz(
    input wire CLK_in,   // le puse wire
    output reg CLK_out,
    input wire reset
    );
    
    reg [1:0] count;
    
    always @ (posedge CLK_in, posedge reset)
    begin
        if (reset)
            begin
                count <= 2'b00;
                CLK_out <= 0;
            end
        else if (count == 2'b11)
            begin
                CLK_out <= 1;
                count <= 2'b00;
            end
            
        else begin
            CLK_out <= 0;
            count <= count + 1;
        end
    end
    
    
   // parameter frecuencia = 100000000;  //100Mhz
    //parameter freq_out = 25000000;   // 25MHz
    // parameter max_count = frecuencia/(2*freq_out);
    
//    reg[2:0] count; //contador de flancos
    
//    initial begin
//    count = 0;
//    CLK_out = 0;
//    end
    
//    always @(posedge CLK_in )
//    begin
//        if (count == 3'b100) begin
//        CLK_out = ~CLK_out;
//        count = count + 1;
//        //count = 0;
//        end 
//        else if (count == 3'b101) begin
//        CLK_out = ~CLK_out;
//        count = 0;
//        end
//     end
     
endmodule