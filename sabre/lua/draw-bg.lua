--[[ =====================================================
=================== BACKGROUND ===========================
==========================================================
== Background script originally by londonali1010 (2009) ==
==========================================================
The change is that if you set width, and/or height to 0
then it assumes the width and/or height of the conky window

The command before line "TEXT" in conkyrc file is for load/call script
The command after line "TEXT" in conkyrc file is for setting background (see below)

lua_load ~/.conky/Conky-Name/scripts/lua/draw_bg.lua

TEXT

${lua conky_draw_bg 20 0 0 0 0 0x000000 0.4}
---------------------------------------------------------------------------------
See below:          1 2 3 4 5 6 7
---------------------------------------------------------------------------------
${lua conky_draw_bg corner_radius x_position y_position width height color alpha}
---------------------------------------------------------------------------------
A covers the whole window and will change if you change the minimum_size setting
---------------------------------------------------------------------------------
1 = 20            corner_radius background
2 = 0             x_position (across background)
3 = 0             y_position (down background)
4 = 0             width background
5 = 0             height background
6 = 0x000000      color background
7 = 0.4           alpha background
----------------------------------------------------------------------------------
You can load/call this script with full command before line "TEXT" in conkyrc file
----------------------------------------------------------------------------------
lua_load ~/.conky/Conky-Name/scripts/lua/draw_bg.lua
lua_draw_hook_pre draw_bg 0 0 0 0 0 0x000000 0.4

TEXT

]]
------------------------------------------------------------------------------------------------------------

require 'cairo'

------------------------------------------------------------------------------------------------------------
local    cs, cr = nil
function rgb_to_r_g_b(colour,alpha)
return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end
function conky_draw_bg(r,x,y,w,h,color,alpha)
if conky_window == nil then return end
if cs == nil then cairo_surface_destroy(cs) end
if cr == nil then cairo_destroy(cr) end
local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
local cr = cairo_create(cs)
w=w
h=h
if w=="0" then w=tonumber(conky_window.width) end
if h=="0" then h=tonumber(conky_window.height) end
cairo_set_source_rgba (cr,rgb_to_r_g_b(color,alpha))

--[[ TOP LEFT MID CIRCLE ]]--
local xtl=x+r
local ytl=y+r

--[[ TOP RIGHT MID CIRCLE ]]--
local xtr=(x+r)+((w)-(2*r))
local ytr=y+r

--[[ BOTTOM LEFT MID CIRCLE ]]--
local xbr=(x+r)+((w)-(2*r))
local ybr=(y+r)+((h)-(2*r))

--[[ BOTTOM RIGHT MID CIRCLE ]]--
local xbl=(x+r)
local ybl=(y+r)+((h)-(2*r))
----------------------------------------------------------
cairo_move_to (cr,xtl,ytl-r)
cairo_line_to (cr,xtr,ytr-r)
cairo_arc(cr,xtr,ytr,r,((2*math.pi/4)*3),((2*math.pi/4)*4))
cairo_line_to (cr,xbr+r,ybr)
cairo_arc(cr,xbr,ybr,r,((2*math.pi/4)*4),((2*math.pi/4)*1))
cairo_line_to (cr,xbl,ybl+r)
cairo_arc(cr,xbl,ybl,r,((2*math.pi/4)*1),((2*math.pi/4)*2))
cairo_line_to (cr,xtl-r,ytl)
cairo_arc(cr,xtl,ytl,r,((2*math.pi/4)*2),((2*math.pi/4)*3))
cairo_close_path(cr)
cairo_fill (cr)
------------------------------------------------------------
cairo_surface_destroy(cs)
cairo_destroy(cr)
return ""
end
--############################################################--