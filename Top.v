`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2017 04:17:15 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input wire clk_100MHz,
    input wire [2:0] rgb_in,
    input wire reset,
    output h_sync_out, v_sync_out,
    output wire [2:0] rgb_out
    );
    
    
   wire reloj_25;
   wire video_on; 
   wire [9:0] pixel_x;
   wire [8:0] pixel_y;
    
   clk_25MHz clk_25MHz_unit(
   .CLK_in (clk_100MHz),
   .CLK_out (reloj_25),
   .reset (reset)
   );
   
   
   
   vga_sync vga_sync_unit (
    .clk (reloj_25), 
    .clk_100 (clk_100MHz),
    .reset (reset),
    .hsync (h_sync_out), 
    .vsync (v_sync_out), 
    .video_on (video_on),
    .pixel_x (pixel_x), 
    .pixel_y (pixel_y)
     );
     
     
    font_gen font_gen_unit (
     //.clk (reloj_25),
     
     .video_on (video_on),
     .pixel_x (pixel_x), 
     .pixel_y (pixel_y),    
     .color (rgb_in),
     .rgb_text (rgb_out)
     
    );
   
endmodule
