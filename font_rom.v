`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2017 03:12:25 PM
// Design Name: 
// Module Name: font_rom
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


module font_rom(
    
    input  [1:0] address,
    input  [3:0] row_address_s,
    output [7:0] dataout

    );
    reg [7:0] data;
    reg [5:0] address_reg;
    
    

   assign dataout = data;
   
   always@*
    begin
    address_reg <= {address,row_address_s};
    end
    
    always @ (*)
    begin
        case (address_reg)
        //R
        6'h00: data <= 8'b11111111;
        6'h01: data <= 8'b11111111;
        6'h02: data <= 8'b11000011;
        6'h03: data <= 8'b11000011;
        6'h04: data <= 8'b11000011;
        6'h05: data <= 8'b11000011;
        6'h06: data <= 8'b11111111;
        6'h07: data <= 8'b11111111;
        6'h08: data <= 8'b11110000;
        6'h09: data <= 8'b11111000;
        6'h0a: data <= 8'b11111100;
        6'h0b: data <= 8'b11011100;
        6'h0c: data <= 8'b11001110;
        6'h0d: data <= 8'b11000111;
        6'h0e: data <= 8'b11000111;
        6'h0f: data <= 8'b11000011;
            
         //E
        6'h10: data <= 8'b11111111;
        6'h11: data <= 8'b11111111;
        6'h12: data <= 8'b11111111;
        6'h13: data <= 8'b11000000;
        6'h14: data <= 8'b11000000;
        6'h15: data <= 8'b11000000;
        6'h16: data <= 8'b11111100;
        6'h17: data <= 8'b11111100;
        6'h18: data <= 8'b11000000;
        6'h19: data <= 8'b11000000;
        6'h1a: data <= 8'b11000000;
        6'h1b: data <= 8'b11000000;
        6'h1c: data <= 8'b11000000;
        6'h1d: data <= 8'b11111111;
        6'h1e: data <= 8'b11111111;
        6'h1f: data <= 8'b11111111;
       
       //D
       
        6'h20: data <= 8'b11111100;
        6'h21: data <= 8'b11111110;
        6'h22: data <= 8'b11000111;
        6'h23: data <= 8'b11000011;
        6'h24: data <= 8'b11000011;
        6'h25: data <= 8'b11000011;
        6'h26: data <= 8'b11000011;
        6'h27: data <= 8'b11000011; 
        6'h28: data <= 8'b11000011; 
        6'h29: data <= 8'b11000011;
        6'h2a: data <= 8'b11000011;
        6'h2b: data <= 8'b11000011;
        6'h2c: data <= 8'b11000011;
        6'h2d: data <= 8'b11000111;
        6'h2e: data <= 8'b11111110;
        6'h2f: data <= 8'b11111100;
        
        default: data <= 8'b00000000;
         
        endcase
        end
    
endmodule