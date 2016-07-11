--[[
Ring Meters by londonali1010 (2009)

This script draws percentage meters as rings. It is fully customisable; all options are described in the script.

IMPORTANT: if you are using the 'cpu' function, it will cause a segmentation fault if it tries to draw a ring straight away. The if statement on line 145 uses a delay to make sure that this doesn't happen. It calculates the length of the delay by the number of updates since Conky started. Generally, a value of 5s is long enough, so if you update Conky every 1s, use update_num > 5 in that if statement (the default). If you only update Conky every 2s, you should change it to update_num > 3; conversely if you update Conky every 0.5s, you should use update_num > 10. ALSO, if you change your Conky, is it best to use "killall conky; conky" to update it, otherwise the update_num will not be reset and you will get an error.

To call this script in Conky, use the following (assuming that you save this script to ~/scripts/rings.lua):
    lua_load ~/scripts/rings-v1.2.1.lua
    lua_draw_hook_pre ring_stats

Changelog:
+ v1.2.1 -- Fixed minor bug that caused script to crash if conky_parse() returns a nil value (20.10.2009)
+ v1.2 -- Added option for the ending angle of the rings (07.10.2009)
+ v1.1 -- Added options for the starting angle of the rings, and added the "max" variable, to allow for variables that output a numerical value rather than a percentage (29.09.2009)
+ v1.0 -- Original release (28.09.2009)
]]
--===================================================================================================================================================================================
settings_table = {
{
name="time", arg="%I", max=12,
bg_colour=0xffffff, bg_alpha=0.1,
fg_colour=0x7FFF4F, fg_alpha=0.6,
x=60, y=60,
radius=36, thickness=3,
start_angle=0, end_angle=360
},
{
name="time", arg="%M", max=60,
bg_colour=0xffffff, bg_alpha=0.1,
fg_colour=0x0097AD, fg_alpha=0.6,
x=60, y=60,
radius=43, thickness=3,
start_angle=0, end_angle=360
},
{
name="time",  arg="%S", max=60,
bg_colour=0xffffff, bg_alpha=0.1,
fg_colour=0xFF6565, fg_alpha=0.6,
x=60, y=60,
radius=50, thickness=3,
start_angle=0, end_angle=360
},
{
name="eval",  arg="1", max=1,
bg_colour=0xEEEEEE, bg_alpha=1,
fg_colour=0xEEEEEE, fg_alpha=1,
x=60, y=60,
radius=1, thickness=7,
start_angle=0, end_angle=360
},
{
name="cpu", arg="cpu1", max=100,
bg_colour=0xffffff, bg_alpha=0.1,
fg_colour=0x558888, fg_alpha=0.6,
x=60, y=202,
radius=41, thickness=22,
start_angle=0, end_angle=360
},
{
name="cpu", arg="cpu2", max=100,
bg_colour=0xffffff, bg_alpha=0.1,
fg_colour=0x998899, fg_alpha=0.6,
x=60, y=202,
radius=14, thickness=28,
start_angle=0, end_angle=360
},
{
name='downspeedf', arg='enp2s0', max=190000,
bg_colour=0xffffff, bg_alpha=0.1,
fg_colour=0x558888, fg_alpha=0.6,
x=60, y=370,
radius=41, thickness=22,
start_angle=0, end_angle=360
},
{
name='upspeedf', arg='enp2s0', max=22000,
bg_colour=0xffffff, bg_alpha=0.1,
fg_colour=0x998899, fg_alpha=0.6,
x=60, y=370,
radius=14, thickness=28,
start_angle=0, end_angle=360
},

}
-----------------------------------------------------------------------------------------------------------------
--
-- Use these settings to define the origin and extent of your clock.
--
clock_r=50
--
-- "clock_x" and "clock_y" are the coordinates of the centre of the clock, in pixels, from the top left of the Conky window.
--
clock_x=60
clock_y=60
--
-- Colour & alpha of the clock hands
--
hour_colour=0x7FFF4F
minute_colour=0x0097AD
second_colour=0xFF6565
clock_alpha=0.6
--
-- Do you want to show the seconds hand?
--
show_seconds=true
--
--===============================================================================================================
----------------
require 'cairo'
----------------
function rgb_to_r_g_b(colour,alpha)
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function draw_ring(cr,t,pt)
local w,h=conky_window.width,conky_window.height
local xc,yc,ring_r,ring_w,sa,ea=pt['x'],pt['y'],pt['radius'],pt['thickness'],pt['start_angle'],pt['end_angle']
local bgc, bga, fgc, fga=pt['bg_colour'], pt['bg_alpha'], pt['fg_colour'], pt['fg_alpha']
local angle_0=sa*(2*math.pi/360)-math.pi/2
local angle_f=ea*(2*math.pi/360)-math.pi/2
local t_arc=t*(angle_f-angle_0)

-- Draw background ring

cairo_arc(cr,xc,yc,ring_r,angle_0,angle_f)
cairo_set_source_rgba(cr,rgb_to_r_g_b(bgc,bga))
cairo_set_line_width(cr,ring_w)
cairo_stroke(cr)

-- Draw indicator ring

cairo_arc(cr,xc,yc,ring_r,angle_0,angle_0+t_arc)
cairo_set_source_rgba(cr,rgb_to_r_g_b(fgc,fga))
cairo_stroke(cr)        
end

-- Draw clock hands

function draw_clock_hands(cr,xc,yc)
local secs,mins,hours,secs_arc,mins_arc,hours_arc
local xh,yh,xm,ym,xs,ys
 
secs=os.date("%S")	
mins=os.date("%M")
hours=os.date("%I")
 
secs_arc=(2*math.pi/60)*secs
mins_arc=(2*math.pi/60)*mins+secs_arc/60/60
hours_arc=(2*math.pi/12)*hours+mins_arc/12/12

-- Draw hour hand

xh=xc+0.7*clock_r*math.sin(hours_arc)
yh=yc-0.7*clock_r*math.cos(hours_arc)
cairo_move_to(cr,xc,yc)
cairo_line_to(cr,xh,yh)
 
cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
cairo_set_line_width(cr,4)
cairo_set_source_rgba(cr,rgb_to_r_g_b(hour_colour,clock_alpha))
cairo_stroke(cr)

-- Draw minute hand
 
xm=xc+0.86*clock_r*math.sin(mins_arc)
ym=yc-0.86*clock_r*math.cos(mins_arc)
cairo_move_to(cr,xc,yc)
cairo_line_to(cr,xm,ym)
 
cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND)
cairo_set_line_width(cr,2.5)
cairo_set_source_rgba(cr,rgb_to_r_g_b(minute_colour,clock_alpha))
cairo_stroke(cr)

-- Draw seconds hand

if show_seconds then
xs=xc+1.0*clock_r*math.sin(secs_arc)
ys=yc-1.0*clock_r*math.cos(secs_arc)
cairo_move_to(cr,xc,yc)
cairo_line_to(cr,xs,ys)
 
cairo_set_line_cap(cr,CAIRO_LINE_CAP_ROUND) 
cairo_set_line_width(cr,1)
cairo_set_source_rgba(cr,rgb_to_r_g_b(second_colour,clock_alpha))
cairo_stroke(cr)
end
end

function conky_main_rings()
local function setup_rings(cr,pt)
local str=''
local value=0
str=string.format('${%s %s}',pt['name'],pt['arg'])
str=conky_parse(str)
value=tonumber(str)

if value == nil then value = 0 end
pct=value/pt['max']
draw_ring(cr,pct,pt)
end

-- Check that Conky has been running for at least (default) 5s
if conky_window==nil then return end
local cs=cairo_xlib_surface_create(conky_window.display,conky_window.drawable,conky_window.visual, conky_window.width,conky_window.height)
local cr=cairo_create(cs)
local updates=conky_parse('${updates}')
update_num=tonumber(updates)
if update_num>1 then

for i in pairs(settings_table) do
setup_rings(cr,settings_table[i])
end
draw_clock_hands(cr,clock_x,clock_y)
end
cairo_destroy(cr)
cairo_surface_destroy(cs)
cr=nil
collectgarbage()
end
--=============================================================================================================================================


--[[ TEXT WIDGET v1.42 by Wlourf 07 Feb. 2011

This widget can drawn texts set in the "text_settings" table with some parameters
http://u-scripts.blogspot.com/2010/06/text-widget.html

To call the script in a conky, use, before TEXT
	lua_load /path/to/the/script/graph.lua
	lua_draw_hook_pre main_graph
and add one line (blank or not) after TEXT
		
]]
--------------------------
require 'cairo'
--------------------------
function conky_draw_text()
local text_settings={
-------[ BEGIN OF PARAMETERS ]-------
{
text="${time %a, %d %b %Y}",
x=12, y=130,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=12,
orientation="nn"
},
{text="CORE-1",
x=8, y=270,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=11,
orientation="nn"
},
{text="${cpu cpu1} %",
x=11, y=293,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=14,
orientation="nn"
},
{text="CORE-2",
x=72, y=270,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=11,
orientation="nn"
},
{text="${cpu cpu2} %",
x=75, y=293,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=14,
orientation="nn"
},
{text="Down :",
x=9, y=447,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=13,
orientation="nn"
},
{text="${downspeedf enp2s0}",
x=60, y=447,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=13,
orientation="nn"
},
{text="Up :",
x=9, y=479,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=13,
orientation="nn"
},
{text="${upspeedf enp2s0}",
x=60, y=479,
colour={{0,0xDDDDDD,0.5},
       {0.6,0xEEEEEE,1},
       {1,0xDDDDDD,0.5}
       },
font_name="Decker",
font_size=13,
orientation="nn"
},

}
--------------[ END OF PARAMETERS ]----------------

    if conky_window == nil then return end
    if tonumber(conky_parse("$updates"))<1 then return end
       
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)

    for i,v in pairs(text_settings) do    
        cr = cairo_create (cs)
        display_text(v)
        cairo_destroy(cr)
	    cr = nil
    end
    
    cairo_surface_destroy(cs)

end

function rgb_to_r_g_b2(tcolour)
    local colour,alpha=tcolour[2],tcolour[3]
    return ((colour / 0x10000) % 0x100) / 255., ((colour / 0x100) % 0x100) / 255., (colour % 0x100) / 255., alpha
end

function display_text(t)
    if t.draw_me==true then t.draw_me = nil end
    if t.draw_me~=nil and conky_parse(tostring(t.draw_me)) ~= "1" then return end
    local function set_pattern(te)
        --this function set the pattern
        if #t.colour==1 then 
            cairo_set_source_rgba(cr,rgb_to_r_g_b2(t.colour[1]))
        else
            local pat
            
            if t.radial==nil then
                local pts=linear_orientation(t,te)
                pat = cairo_pattern_create_linear (pts[1],pts[2],pts[3],pts[4])
            else
                pat = cairo_pattern_create_radial (t.radial[1],t.radial[2],t.radial[3],t.radial[4],t.radial[5],t.radial[6])
            end
        
            for i=1, #t.colour do
                cairo_pattern_add_color_stop_rgba (pat, t.colour[i][1], rgb_to_r_g_b2(t.colour[i]))
            end
            cairo_set_source (cr, pat)
            cairo_pattern_destroy(pat)
        end
    end
    
    --set default values if needed
    if t.text==nil then t.text="Conky is good for you !" end
    if t.x==nil then t.x = conky_window.width/2 end
    if t.y==nil then t.y = conky_window.height/2 end
    if t.colour==nil then t.colour={{1,0xFFFFFF,1}} end
    if t.font_name==nil then t.font_name="Free Sans" end
    if t.font_size==nil then t.font_size=14 end
    if t.angle==nil then t.angle=0 end
    if t.italic==nil then t.italic=false end
    if t.oblique==nil then t.oblique=false end
    if t.bold==nil then t.bold=false end
    if t.radial ~= nil then
        if #t.radial~=6 then 
            print ("error in radial table")
            t.radial=nil 
        end
    end
    if t.orientation==nil then t.orientation="ww" end
    if t.h_align==nil then t.h_align="l" end
    if t.v_align==nil then t.v_align="b" end    
    if t.reflection_alpha == nil then t.reflection_alpha=0 end
    if t.reflection_length == nil then t.reflection_length=1 end
    if t.reflection_scale == nil then t.reflection_scale=1 end
    if t.skew_x==nil then t.skew_x=0 end
    if t.skew_y==nil then t.skew_y=0 end    
    cairo_translate(cr,t.x,t.y)
    cairo_rotate(cr,t.angle*math.pi/180)
    cairo_save(cr)       
     
    local slant = CAIRO_FONT_SLANT_NORMAL
    local weight = CAIRO_FONT_WEIGHT_NORMAL
    if t.italic then slant = CAIRO_FONT_SLANT_ITALIC end
    if t.oblique then slant = CAIRO_FONT_SLANT_OBLIQUE end
    if t.bold then weight = CAIRO_FONT_WEIGHT_BOLD end
    
    cairo_select_font_face(cr, t.font_name, slant,weight)
 
    for i=1, #t.colour do    
        if #t.colour[i]~=3 then 
            print ("error in color table")
            t.colour[i]={1,0xFFFFFF,1} 
        end
    end

    local matrix0 = cairo_matrix_t:create()
    tolua.takeownership(matrix0) 
    local skew_x,skew_y=t.skew_x/t.font_size,t.skew_y/t.font_size
    cairo_matrix_init (matrix0, 1,skew_y,skew_x,1,0,0)
    cairo_transform(cr,matrix0)
    cairo_set_font_size(cr,t.font_size)
    local te=cairo_text_extents_t:create()
    tolua.takeownership(te) 
    t.text=conky_parse(t.text)
    cairo_text_extents (cr,t.text,te)
    set_pattern(te)
            
    local mx,my=0,0
    
    if t.h_align=="c" then
        mx=-te.width/2-te.x_bearing
    elseif t.h_align=="r" then
        mx=-te.width
    end
    if t.v_align=="m" then
        my=-te.height/2-te.y_bearing
    elseif t.v_align=="t" then
        my=-te.y_bearing
    end
    cairo_move_to(cr,mx,my)
    
    cairo_show_text(cr,t.text)
       
   if t.reflection_alpha ~= 0 then 
        local matrix1 = cairo_matrix_t:create()
		tolua.takeownership(matrix1)         
        cairo_set_font_size(cr,t.font_size)

        cairo_matrix_init (matrix1,1,0,0,-1*t.reflection_scale,0,(te.height+te.y_bearing+my)*(1+t.reflection_scale))
        cairo_set_font_size(cr,t.font_size)
        te=nil
        local te=cairo_text_extents_t:create()
        tolua.takeownership(te) 
        cairo_text_extents (cr,t.text,te)
        
                
        cairo_transform(cr,matrix1)
        set_pattern(te)
        cairo_move_to(cr,mx,my)
        cairo_show_text(cr,t.text)

        local pat2 = cairo_pattern_create_linear (0,
                                        (te.y_bearing+te.height+my),
                                        0,
                                        te.y_bearing+my)
        cairo_pattern_add_color_stop_rgba (pat2, 0,1,0,0,1-t.reflection_alpha)
        cairo_pattern_add_color_stop_rgba (pat2, t.reflection_length,0,0,0,1)    
        
        --line is not drawn but with a size of zero, the mask won't be nice
        cairo_set_line_width(cr,1)
        local dy=te.x_bearing
        if dy<0 then dy=dy*(-1) end
        cairo_rectangle(cr,mx+te.x_bearing,te.y_bearing+te.height+my,te.width+dy,-te.height*1.05)
        cairo_clip_preserve(cr)
        cairo_set_operator(cr,CAIRO_OPERATOR_CLEAR)
        --cairo_stroke(cr)
        cairo_mask(cr,pat2)
        cairo_pattern_destroy(pat2)
        cairo_set_operator(cr,CAIRO_OPERATOR_OVER)
        te=nil
    end
    
end

function linear_orientation(t,te)
    local w,h=te.width,te.height
    local xb,yb=te.x_bearing,te.y_bearing
    
    if t.h_align=="c" then
        xb=xb-w/2
    elseif t.h_align=="r" then
        xb=xb-w
       end    
    if t.v_align=="m" then
        yb=-h/2
    elseif t.v_align=="t" then
        yb=0
       end    
    local p=0
    if t.orientation=="nn" then
        p={xb+w/2,yb,xb+w/2,yb+h}
    elseif t.orientation=="ne" then
        p={xb+w,yb,xb,yb+h}
    elseif t.orientation=="ww" then
        p={xb,h/2,xb+w,h/2}
    elseif vorientation=="se" then
        p={xb+w,yb+h,xb,yb}
    elseif t.orientation=="ss" then
        p={xb+w/2,yb+h,xb+w/2,yb}
    elseif t.orientation=="ee" then
        p={xb+w,h/2,xb,h/2}        
    elseif t.orientation=="sw" then
        p={xb,yb+h,xb+w,yb}
    elseif t.orientation=="nw" then
        p={xb,yb,xb+w,yb+h}
    end
    return p
end
--===================================================================================================

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
--================================
--===[ REGARDS, ETLES_TEAM ] ===--
--================================