--[[
                   __                                ___       ____     __                __      
 /'\_/`\          /\ \__                __          /\_ \     /\  _`\  /\ \              /\ \__   
/\      \     __  \ \ ,_\    __   _ __ /\_\     __  \//\ \    \ \ \/\_\\ \ \___      __  \ \ ,_\  
\ \ \__\ \  /'__`\ \ \ \/  /'__`\/\`'__\/\ \  /'__`\  \ \ \    \ \ \/_/_\ \  _ `\  /'__`\ \ \ \/  
 \ \ \_/\ \/\ \L\.\_\ \ \_/\  __/\ \ \/ \ \ \/\ \L\.\_ \_\ \_   \ \ \L\ \\ \ \ \ \/\ \L\.\_\ \ \_ 
  \ \_\\ \_\ \__/.\_\\ \__\ \____\\ \_\  \ \_\ \__/.\_\/\____\   \ \____/ \ \_\ \_\ \__/.\_\\ \__\
   \/_/ \/_/\/__/\/_/ \/__/\/____/ \/_/   \/_/\/__/\/_/\/____/    \/___/   \/_/\/_/\/__/\/_/ \/__/                                                                                       

 __  __                                                  _          __     
/\ \/\ \                       __                      /' \       /'__`\   
\ \ \ \ \     __   _ __   ____/\_\    ___     ___     /\_, \     /\ \/\ \  
 \ \ \ \ \  /'__`\/\`'__\/',__\/\ \  / __`\ /' _ `\   \/_/\ \    \ \ \ \ \ 
  \ \ \_/ \/\  __/\ \ \//\__, `\ \ \/\ \L\ \/\ \/\ \     \ \ \  __\ \ \_\ \
   \ `\___/\ \____\\ \_\\/\____/\ \_\ \____/\ \_\ \_\     \ \_\/\_\\ \____/
    `\/__/  \/____/ \/_/ \/___/  \/_/\/___/  \/_/\/_/      \/_/\/_/ \/___/ 
]]
include("cl_config.lua")

--FlatUI Colours

local Turquoise = Color(26,188,156 )
local Emerland = Color(46,204,113)
local Peterriver = Color(52,152,219)
local Amethyst = Color(52,152,219)
local Wetasphalt = Color(52,73,94)
local Greensea = Color(22,160,133)
local Nephritis = Color(39,174,96)
local Belizehole = Color(41,128,185)
local Wisteria = Color(142,68,173)
local Midnightblue = Color(44,62,80)
local Sunflower = Color(241,196,15)
local Carrot = Color(230,126,34)
local Alizarin = Color(231,76,60)
local Clouds = Color(236,240,241)
local Concrete = Color(149,165,166)
local Orange = Color(243,156,18)
local Pumpkin = Color(211,84,0)
local Pomegranate = Color(192,57,43)
local Silver = Color(189,195,199)
local Asbestos = Color(127,140,141)


--Transparent Colours
local tred                                      = Color(150,0,0,125) 
local tblack                                    = Color(0,0,0,225)
local tgreen                                    = Color(0,150,0,125)
local tblue                                     = Color(0,0,150,125)
local trans                                     = Color(0,0,0,0)


MenuColour = Alizarin
local rtbox = nil
local IsOpen = false

local messages = ""

net.Receive("receiveMessage",function()
local message = net.ReadString()
local sender = net.ReadEntity()

messages = messages.."\n"..sender:Name().." : "..message

if IsOpen then
rtbox:SetText(messages)
end
end)


function MaterialChatConfig()
local CFrame = vgui.Create( "DFrame" )
CFrame:SetSize( 400, 400)
CFrame:SetTitle( "" )
CFrame:SetDraggable( true )
CFrame:SetSizable( false )
CFrame:ShowCloseButton( true )
CFrame:MakePopup()
CFrame:SetPos( 100, 100 )
CFrame.OnClose = function(s)
s:Remove()
end
CFrame.Paint = function()
draw.RoundedBox(0,0,0, CFrame:GetWide()-0, CFrame:GetTall()-0, Midnightblue)
draw.DrawText( "Material Config", "MainFont", CFrame:GetWide()/2, CFrame:GetTall()/CFrame:GetWide()+10, Clouds, TEXT_ALIGN_CENTER )
draw.DrawText( "Chat Font", "CloseButFont", CFrame:GetWide()/2, CFrame:GetTall()/CFrame:GetWide()+70, Clouds, TEXT_ALIGN_CENTER )
end

local DComboBox = vgui.Create( "DComboBox", CFrame )
DComboBox:SetPos( CFrame:GetWide()/2-50, CFrame:GetTall()/CFrame:GetWide()+100 )
DComboBox:SetSize( 100, 20 )
DComboBox:SetValue( "Alizarin" )
DComboBox:AddChoice( "Alizarin" )
DComboBox:AddChoice( "Midnightblue" )
DComboBox:AddChoice( "Pumpkin" )
DComboBox.OnSelect = function( panel, index, value )
	print( value .." was selected!" )
end
end

MenuColour = DComboBox:GetOptionText()

--Starting the menu
function MaterialChat() -- this is the function used to open the menu!
local Frame = vgui.Create( "DFrame" )
Frame:SetSize( 400, 600)
Frame:SetTitle( "" )
Frame:SetDraggable( true )
Frame:SetSizable( false )
Frame:ShowCloseButton( true )
Frame:MakePopup()
Frame:SetPos( 100, 100 )
Frame.OnClose = function(s)
IsOpen = false
s:Remove()
end
Frame.Paint = function()
draw.RoundedBox(0,0,0, Frame:GetWide()-0, Frame:GetTall()-0, Clouds)
draw.RoundedBox(0,0,0, Frame:GetWide()-0, 80, MenuColour)
draw.DrawText( "Material Chat", "MainFont", Frame:GetWide()/2, Frame:GetTall()/Frame:GetWide()+10, Clouds, TEXT_ALIGN_CENTER )
draw.RoundedBox(0,0,140, Frame:GetWide()-0, 1, Color(0,0,0))
end

local MainFrame = vgui.Create( "DPanel", Frame )
MainFrame:SetSize( Frame:GetWide()-0, Frame:GetTall()-120 )
MainFrame:Center()
MainFrame.Paint = function()
draw.RoundedBox(0,0,0, Frame:GetWide()-0, Frame:GetTall()-0, trans)
end

local config = vgui.Create( "DButton", Frame )
config:SetPos( 0, 70 )
config:SetText( "" )
config:SetSize( 120, 60 )
config.Paint = function()
draw.RoundedBox(0,0,0, config:GetWide()-0, config:GetTall()-0, trans)
draw.DrawText( "config", "ButFont", config:GetWide()/2, config:GetTall()/config:GetWide()+20, Midnightblue, TEXT_ALIGN_CENTER )
end
config.DoClick = function()
	surface.PlaySound("UI/buttonclick.wav")
	MaterialChatConfig()
end

rtbox = vgui.Create("RichText", Frame)
rtbox:SetPos(0, 150)
rtbox:SetSize(400, 400)
rtbox:SetText(messages)
rtbox.Paint = function()
    rtbox.m_FontName = "CloseButFont"
    rtbox:SetFontInternal( "CloseButFont" )	
    rtbox:SetBGColor(Color(0,0,0,0))		
    rtbox.Paint = nil
end

local entry = vgui.Create("DTextEntry", Frame)
entry:SetPos(0, 550)
entry:SetSize(500-20,40)
entry.OnEnter = function(s)
net.Start("sendMessage")
net.WriteString(s:GetText())
net.SendToServer()
s:SetText("")
s:RequestFocus()
end

local close = vgui.Create("DButton", Frame)
close:SetPos(400, 100)
close:SetSize(40,30)
close:SetText("")
close.Paint = function()
draw.RoundedBox(0,0,0, close:GetWide(), close:GetTall(), blue)
draw.DrawText( "X", "CloseButFont", close:GetWide()/2, close:GetTall()/close:GetWide()+5, Color(255,255,255), TEXT_ALIGN_CENTER )
end
close.DoClick = function() Frame:Close() IsOpen = false end
end


--????????
hook.Add("Think","aye",function()
if input.IsKeyDown(KEY_INSERT) && !OpenDelay then
	OpenDelay = true
	MaterialChat()
	IsOpen = true -- Not using this yet m8

	timer.Simple(3,function() OpenDelay = false end)
end
end)