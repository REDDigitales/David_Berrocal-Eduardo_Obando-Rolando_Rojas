`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2017 07:27:06 PM
// Design Name: 
// Module Name: font_gen
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


module font_gen(
    //input wire clk,
    input wire video_on,
    input wire [9:0] pixel_x, 
    input wire [8:0] pixel_y,
    
    output reg [2:0] rgb_text,            // RECORDAR CREAR UN CABLE PARA LA SALIDA DE ESTE REGISTRO
    input wire [2:0] color
    );
                                 
    
    reg [1:0] rom_address;
    wire [3:0] row_address; 
    wire [2:0] bit_address; 
    wire [7:0] font_word;           // Salida de datos de la ROM
    wire font_bit;
    
    //reg text_bit_on; 
    
    
    wire r,e,d;
    
    
  
    
   assign row_address = pixel_y [3:0]; // Cambio de linea en el bit grande
   assign bit_address = pixel_x [2:0]; // Cambio en bits x del bit grande
   
   assign r = (pixel_x  >= 10'd304) && (pixel_x < 10'd312) && (pixel_y  >= 9'd240) && (pixel_y  < 9'd256);
   assign e = (pixel_x  >= 10'd320) && (pixel_x < 10'd328) && (pixel_y  >= 9'd240) && (pixel_y  < 9'd256);
   assign d = (pixel_x  >= 10'd336) && (pixel_x < 10'd344) && (pixel_y  >= 9'd240) && (pixel_y  < 9'd256);
  assign l=(pixel_x  >= 10'd100) && (pixel_x < 10'd200) || (pixel_x  >= 10'd448) && (pixel_x < 10'd558);
  //
  
   always @*
   begin
   if (r)
    rom_address <= 2'h0;
   else if (e)
    rom_address <= 2'h1;
   else if (d)
    rom_address <= 2'h2; 
   else 
    rom_address <= 2'h3;
   end
   
  
   font_rom font_unit(
       .address(rom_address),
       .row_address_s (row_address),
       .dataout(font_word)
       ); 

   
    assign font_bit = font_word [~bit_address];
   
    // Circuito multiplexor para la salida
    always @(*)
    begin
       
        if (~ video_on)
           rgb_text = 3'b000;
           
        else 
            if ((r | e | d) && font_bit)
                rgb_text = color;    //  ENTRADA DE LOS SWITCH DE LA FPGA PARA ASIGNAR EL COLOR
            else if (l)
                rgb_text = color;
            else 
                rgb_text = 3'b000;
    end
    
    
    
endmodule
