for i,b in pairs(workspace.FE.Actions:GetChildren()) do
    if b.Name == " " then
        b:Destroy()
    end
end

for i,b in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if b.Name == " " then
        b:Destroy()
    end
end

local a = workspace.FE.Actions

if a:FindFirstChild("KeepYourHeadUp_") then
    a.KeepYourHeadUp_:Destroy()
    local r = Instance.new("RemoteEvent")
    r.Name = "KeepYourHeadUp_"
    r.Parent = a
else
    game.Players.LocalPlayer:Kick(
        "Anti-Cheat Updated! Send a photo of this Message in our Discord Server Moon so we can fix it."
    )
end

local function isWeirdName(name)
    return string.match(name, "^[a-zA-Z]+%-%d+%a*%-%d+%a*$") \~= nil
end

local function deleteWeirdRemoteEvents(parent)
    for _, child in pairs(parent:GetChildren()) do
        if child:IsA("RemoteEvent") and isWeirdName(child.Name) then
            child:Destroy()
        end
        deleteWeirdRemoteEvents(child)
    end
end

deleteWeirdRemoteEvents(game)

-- Embedded WindUI full code
local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()local b=(cloneref or clonereference or function(b)return b end)

local d=b(game:GetService"ReplicatedStorage":WaitForChild("GetIcons",99999):InvokeServer())

local function parseIconString(e)
if type(e)=="string"then
local f=e:find":"
if f then
local g=e:sub(1,f-1)
local h=e:sub(f+1)
return g,h
end
end
return nil,e
end

function d.AddIcons(e,f)
if type(e)\~="string"or type(f)\~="table"then
error"AddIcons: packName must be string, iconsData must be table"
return
end

if not d.Icons[e]then
d.Icons[e]={
Icons={},
Spritesheets={}
}
end

for g,h in pairs(f)do
if type(h)=="number"or(type(h)=="string"and h:match"^rbxassetid://")then
local i=h
if type(h)=="number"then
i="rbxassetid://"..tostring(h)
end

d.Icons[e].Icons[g]={
Image=i,
ImageRectSize=Vector2.new(0,0),
ImageRectPosition=Vector2.new(0,0),
Parts=nil
}
d.Icons[e].Spritesheets[i]=i

elseif type(h)=="table"then
if h.Image and h.ImageRectSize and h.ImageRectPosition then
local i=h.Image
if type(i)=="number"then
i="rbxassetid://"..tostring(i)
end

d.Icons[e].Icons[g]={
Image=i,
ImageRectSize=h.ImageRectSize,
ImageRectPosition=h.ImageRectPosition,
Parts=h.Parts
}

if not d.Icons[e].Spritesheets[i]then
d.Icons[e].Spritesheets[i]=i
end
else
warn("AddIcons: Invalid spritesheet data format for icon '"..g.."'")
end
else
warn("AddIcons: Unsupported data type for icon '"..g.."': "..type(h))
end
end
end

function d.SetIconsType(e)
d.IconsType=e
end

local e
function d.Init(f,g)
d.New=f
d.IconThemeTag=g

e=f
return d
end

function d.Icon(f,g,h)
h=h\~=false
local i,j=parseIconString(f)

local l=i or g or d.IconsType
local m=j

local p=d.Icons[l]

if p and p.Icons and p.Icons[m]then
return{
p.Spritesheets[tostring(p.Icons[m].Image)],
p.Icons[m],
}
elseif p and p[m]and string.find(p[m],"rbxassetid://")then
return h and{
p[m],
{ImageRectSize=Vector2.new(0,0),ImageRectPosition=Vector2.new(0,0)}
}or p[m]
end
return nil
end

function d.GetIcon(f,g)
return d.Icon(f,g,false)
end

function d.Icon2(f,g,h)
return d.Icon(f,g,true)
end

function d.Image(f)
local g={
Icon=f.Icon or nil,
Type=f.Type,
Colors=f.Colors or{(d.IconThemeTag or Color3.new(1,1,1)),Color3.new(1,1,1)},
Transparency=f.Transparency or{0,0},
Size=f.Size or UDim2.new(0,24,0,24),

IconFrame=nil,
}

local h={}
local i={}

for j,l in next,g.Colors do
h[j]={
ThemeTag=typeof(l)=="string"and l,
Color=typeof(l)=="Color3"and l,
}
end

for j,l in next,g.Transparency do
i[j]={
ThemeTag=typeof(l)=="string"and l,
Value=typeof(l)=="number"and l,
}
end

local j=d.Icon2(g.Icon,g.Type)
local l=typeof(j)=="string"and string.find(j,'rbxassetid://')

if d.New then
local m=e or d.New

local p=m("ImageLabel",{
Size=g.Size,
BackgroundTransparency=1,
ImageColor3=h[1].Color or nil,
ImageTransparency=i[1].Value or nil,
ThemeTag=h[1].ThemeTag and{
ImageColor3=h[1].ThemeTag,
ImageTransparency=i[1].ThemeTag,
},
Image=l and j or j[1],
ImageRectSize=l and nil or j[2].ImageRectSize,
ImageRectOffset=l and nil or j[2].ImageRectPosition,
})

if not l and j[2].Parts then
for r,u in next,j[2].Parts do
local v=d.Icon(u,g.Type)

m("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ImageColor3=h[1+r].Color or nil,
ImageTransparency=i[1+r].Value or nil,
ThemeTag=h[1+r].ThemeTag and{
ImageColor3=h[1+r].ThemeTag,
ImageTransparency=i[1+r].ThemeTag,
},
Image=v[1],
ImageRectSize=v[2].ImageRectSize,
ImageRectOffset=v[2].ImageRectPosition,
Parent=p,
})
end
end

g.IconFrame=p
else
local m=Instance.new"ImageLabel"
m.Size=g.Size
m.BackgroundTransparency=1
m.ImageColor3=h[1].Color
m.ImageTransparency=i[1].Value or nil
m.Image=l and j or j[1]
m.ImageRectSize=l and nil or j[2].ImageRectSize
m.ImageRectOffset=l and nil or j[2].ImageRectPosition

if not l and j[2].Parts then
for p,r in next,j[2].Parts do
local u=d.Icon(r,g.Type)

local v=Instance.new"ImageLabel"
v.Size=UDim2.new(1,0,1,0)
v.BackgroundTransparency=1
v.ImageColor3=h[1+p].Color
v.ImageTransparency=i[1+p].Value or nil
v.Image=u[1]
v.ImageRectSize=u[2].ImageRectSize
v.ImageRectOffset=u[2].ImageRectPosition
v.Parent=m
end
end

g.IconFrame=m
end

return g
end

return d end function a.b()

return{

Primary="Icon",

White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),

Dialog="Accent",

Background="Accent",
BackgroundTransparency=0,
Hover="Text",

PanelBackground="White",
PanelBackgroundTransparency=.95,

WindowBackground="Background",

WindowShadow="Black",

WindowTopbarTitle="Text",
WindowTopbarAuthor="Text",
WindowTopbarIcon="Icon",
WindowTopbarButtonIcon="Icon",

WindowSearchBarBackground="Background",

TabBackground="Hover",
TabBackgroundHover="Hover",
TabBackgroundHoverTransparency=.97,
TabBackgroundActive="Hover",
TabBackgroundActiveTransparency=0.93,
TabText="Text",
TabTextTransparency=0.3,
TabTextTransparencyActive=0,
TabTitle="Text",
TabIcon="Icon",
TabIconTransparency=0.4,
TabIconTransparencyActive=0.1,
TabBorderTransparency=1,
TabBorderTransparencyActive=0.75,
TabBorder="White",

ElementBackground="Text",
ElementTitle="Text",
ElementDesc="Text",
ElementIcon="Icon",

PopupBackground="Background",
PopupBackgroundTransparency="BackgroundTransparency",
PopupTitle="Text",
PopupContent="Text",
PopupIcon="Icon",

DialogBackground="Background",
DialogBackgroundTransparency="BackgroundTransparency",
DialogTitle="Text",
DialogContent="Text",
DialogIcon="Icon",

Toggle="Button",
ToggleBar="White",

Checkbox="Primary",
CheckboxIcon="White",
CheckboxBorder="White",
CheckboxBorderTransparency=.75,

SliderIcon="Icon",

Slider="Primary",
SliderThumb="White",
SliderIconFrom="SliderIcon",
SliderIconTo="SliderIcon",

Tooltip=Color3.fromHex"4C4C4C",
TooltipText="White",
TooltipSecondary="Primary",
TooltipSecondaryText="White",

SectionExpandIcon="White",
SectionExpandIconTransparency=.4,
SectionBox="White",
SectionBoxTransparency=.95,
SectionBoxBorder="White",
SectionBoxBorderTransparency=.75,
SectionBoxBackground="White",
SectionBoxBackgroundTransparency=.95,

SearchBarBorder="White",
SearchBarBorderTransparency=.75,

Notification="Background",
NotificationTitle="Text",
NotificationTitleTransparency=0,
NotificationContent="Text",
NotificationContentTransparency=.4,
NotificationDuration="White",
NotificationDurationTransparency=.95,
NotificationBorder="White",
NotificationBorderTransparency=.75,

DropdownTabBorder="White",

LabelBackground="White",
LabelBackgroundTransparency=.95,
}end function a.c()

local b=(cloneref or clonereference or function(b)return b end)

local d=b(game:GetService"RunService")
local e=b(game:GetService"UserInputService")
local f=b(game:GetService"TweenService")
local g=b(game:GetService"LocalizationService")
local h=b(game:GetService"HttpService")local i=

d.Heartbeat

local j="https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"

local l
if d:IsStudio()or not writefile then
l=a.load'a'
else
l=loadstring(
game.HttpGetAsync and game:HttpGetAsync(j)
or h:GetAsync(j)
)()
end

l.SetIconsType"lucide"

local m

local p={
Font="rbxassetid://12187365364",
Localization=nil,
CanDraggable=true,
Theme=nil,
Themes=nil,
Icons=l,
Signals={},
Objects={},
LocalizationObjects={},
FontObjects={},
Language=string.match(g.SystemLocaleId,"^[a-z]+"),
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
},
VideoFrame={
BorderSizePixel=0,
}
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
},
ThemeFallbacks=a.load'b',
Shapes={Square=
"rbxassetid://82909646051652",
["Square-Outline"]="rbxassetid://72946211851948",Squircle=

"rbxassetid://80999662900595",SquircleOutline=
"rbxassetid://117788349049947",
["Squircle-Outline"]="rbxassetid://117817408534198",SquircleOutline2=

"rbxassetid://117817408534198",

["Shadow-sm"]="rbxassetid://84825982946844",

["Squircle-TL-TR"]="rbxassetid://73569156276236",
["Squircle-BL-BR"]="rbxassetid://93853842912264",
["Squircle-TL-TR-Outline"]="rbxassetid://136702870075563",
["Squircle-BL-BR-Outline"]="rbxassetid://75035847706564",

["Glass-0.7"]="rbxassetid://79047752995006",
["Glass-1"]="rbxassetid://97324581055162",
["Glass-1.4"]="rbxassetid://95071123641270",
}
}

function p.Init(r)
m=r
end

function p.AddSignal(r,u)
local v=r:Connect(u)
table.insert(p.Signals,v)
return v
end

function p.DisconnectAll()
for r,u in next,p.Signals do
local v=table.remove(p.Signals,r)
v:Disconnect()
end
end

function p.Disconnect(r)
for u,v in next,p.Signals do
if v==r then
table.remove(p.Signals,u)
v:Disconnect()
break
end
end
end

function p.New(r,u,v)
local w=Instance.new(r)
w.Name=v or r
for x,y in next,p.DefaultProperties[r]or{}do
w[x]=y
end

for x,y in next,u or{}do
if type(y)=="table"and y.ThemeTag then
p.AddThemeObject(w,x,y.ThemeTag)
else
w[x]=y
end
end

return w
end

function p.AddThemeObject(r,u,v)
table.insert(p.Objects,{
Object=r,
Setting=u,
ThemeTag=v,
})
return r
end

function p.SetTheme(r)
p.Theme=r
if p.Themes and p.Themes[r]then
for u,v in next,p.Objects do
if v.ThemeTag then
local w=p.Themes[r][v.ThemeTag]or p.ThemeFallbacks[v.ThemeTag]
v.Object[v.Setting]=w
end
end
end
end

function p.AddLocalizationObject(r,u,v)
table.insert(p.LocalizationObjects,{
Object=r,
Setting=u,
LocalizationTag=v,
})
return r
end

function p.SetLocalization(r)
p.Localization=r
p.SetLanguage(p.Language)
end

function p.SetLanguage(r)
p.Language=r
if p.Localization then
for u,v in next,p.LocalizationObjects do
if v.LocalizationTag then
local w=p.Localization[v.LocalizationTag][r]or p.Localization[v.LocalizationTag].en
v.Object[v.Setting]=w
end
end
end
end

function p.AddFontObject(r,u,v)
table.insert(p.FontObjects,{
Object=r,
Setting=u,
FontTag=v,
})
return r
end

function p.SetFont(r)
p.Font=r
for u,v in next,p.FontObjects do
if v.FontTag then
local w=p.Fonts[v.FontTag]or p.Fonts.Regular
v.Object[v.Setting]=w
end
end
end

function p.GetMousePosition()
return e:GetMouseLocation()
end

function p.GetIcon(r,u)
return p.Icons.Icon(r,u)
end

function p.GetImage(r)
return p.Icons.Image(r)
end

function p.CreateWindow(r)
local u=r.Title or"WindUI"
local v=r.Folder or"WindUI"
local w=r.Icon or p.GetIcon("wind")
local x=r.IconSize or 44
local y=r.NewElements or true
local z=r.Size or UDim2.fromOffset(550,550)
local A=r.HideSearchBar or false

local B=r.OpenButton or{
Title="WindUI",
CornerRadius=UDim.new(1,0),
StrokeThickness=3,
Enabled=true,
Draggable=true,
OnlyMobile=false,
Scale=1,
Color=ColorSequence.new(Color3.fromHex"#0400ff",Color3.fromHex"#2f00ff"),
}

local C=r.Topbar or{
Height=44,
ButtonsType="Windows",
Config={
Close=true,
Minimize=true,
Maximize=true,
},
}

local D=game:GetService"CoreGui"or game.Players.LocalPlayer.PlayerGui
local E=p.New("ScreenGui",{
Parent=D,
Name=v,
IgnoreGuiInset=true,
})
p.AddSignal(E.Destroying,function()
p.DisconnectAll()
end)

local F=p.New("Frame",{
Parent=E,
Size=z,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
})

local G=p.New("Frame",{
Parent=F,
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
ThemeTag="WindowBackground",
BackgroundTransparency=0.1,
})

local H=p.New("UICorner",{
Parent=G,
CornerRadius=UDim.new(0,8),
})

local I=p.New("Frame",{
Parent=G,
Size=UDim2.new(1,0,0,C.Height),
BackgroundTransparency=1,
})

local J=p.New("TextLabel",{
Parent=I,
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Text=u,
TextSize=18,
TextColor3=Color3.new(1,1,1),
ThemeTag="WindowTopbarTitle",
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Center,
Padding=UDim.new(0,12),
})

local K=p.New("UIPadding",{
Parent=J,
PaddingLeft=UDim.new(0,12),
})

local L=p.New("ImageLabel",{
Parent=I,
Size=UDim2.new(0,x,0,x),
BackgroundTransparency=1,
Image=w,
ThemeTag="WindowTopbarIcon",
Position=UDim2.new(0,4,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
})

local M=p.New("Frame",{
Parent=G,
Size=UDim2.new(1,0,1,-C.Height),
Position=UDim2.new(0,0,0,C.Height),
BackgroundTransparency=1,
ClipsDescendants=true,
})

local N=p.New("UIListLayout",{
Parent=M,
FillDirection=Enum.FillDirection.Horizontal,
SortOrder=Enum.SortOrder.LayoutOrder,
})

local O=p.New("Frame",{
Parent=M,
Size=UDim2.new(0,150,1,0),
BackgroundTransparency=1,
})

local P=p.New("ScrollingFrame",{
Parent=O,
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,
})

local Q=p.New("UIListLayout",{
Parent=P,
Padding=UDim.new(0,4),
SortOrder=Enum.SortOrder.LayoutOrder,
})

local R=p.New("UIPadding",{
Parent=P,
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,8),
})

local S=p.New("Frame",{
Parent=M,
Size=UDim2.new(1,-150,1,0),
BackgroundTransparency=1,
ClipsDescendants=true,
})

local T=p.New("ScrollingFrame",{
Parent=S,
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,
})

local U=p.New("UIListLayout",{
Parent=T,
Padding=UDim.new(0,8),
SortOrder=Enum.SortOrder.LayoutOrder,
})

local V=p.New("UIPadding",{
Parent=T,
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,8),
})

local W={
Window=F,
Topbar=I,
Title=J,
Icon=L,
TabsFrame=O,
Tabs=P,
ElementsFrame=S,
Elements=T,
Tabs={},
Elements={},
Sections={},
}

function W:Section(X)
local Y=X.Title or"Section"

local Z=p.New("Frame",{
Parent=self.Elements,
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
})

local aa=p.New("TextLabel",{
Parent=Z,
Size=UDim2.new(1,0,0,20),
BackgroundTransparency=1,
Text=Y,
TextSize=14,
TextColor3=Color3.new(1,1,1),
ThemeTag="SectionTitle",
TextXAlignment=Enum.TextXAlignment.Left,
})

local ab=p.New("Frame",{
Parent=Z,
Size=UDim2.new(1,0,1,-20),
Position=UDim2.new(0,0,0,20),
BackgroundTransparency=1,
})

local ac=p.New("UIListLayout",{
Parent=ab,
Padding=UDim.new(0,4),
SortOrder=Enum.SortOrder.LayoutOrder,
})

local ad={
Section=Z,
Content=ab,
}

function ad:Tab(ae)
local af=ae.Title or"Tab"
local ag=ae.Icon or p.GetIcon("tab")

local ah=p.New("TextButton",{
Parent=self.Content,
Size=UDim2.new(1,0,0,32),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=0.95,
ThemeTag="TabBackground",
Text="",
AutoButtonColor=false,
})

local ai=p.New("UICorner",{
Parent=ah,
CornerRadius=UDim.new(0,4),
})

local aj=p.New("TextLabel",{
Parent=ah,
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Text=af,
TextSize=14,
TextColor3=Color3.new(1,1,1),
ThemeTag="TabText",
TextXAlignment=Enum.TextXAlignment.Left,
})

local ak=p.New("UIPadding",{
Parent=aj,
PaddingLeft=UDim.new(0,8),
})

local al=p.New("ImageLabel",{
Parent=ah,
Size=UDim2.new(0,24,0,24),
BackgroundTransparency=1,
Image=ag,
ThemeTag="TabIcon",
Position=UDim2.new(1,-8,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
})

local am=p.New("Frame",{
Parent=self.ElementsFrame,
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
ClipsDescendants=true,
})

local an=p.New("UIListLayout",{
Parent=am,
Padding=UDim.new(0,8),
SortOrder=Enum.SortOrder.LayoutOrder,
})

local ao=p.New("UIPadding",{
Parent=am,
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,8),
})

local ap={
Tab=ah,
Title=aj,
Icon=al,
Elements=am,
Sections={},
}

p.AddSignal(ah.MouseButton1Click,function()
for aq,ar in next,W.Elements do
ar.Visible=false
end

ap.Elements.Visible=true
end)

table.insert(W.Elements,ap.Elements)

if #W.Elements==1 then
ap.Elements.Visible=true
end

function ap:Section(as)
local at=as.Title or"Section"

local au=p.New("Frame",{
Parent=self.Elements,
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
})

local av=p.New("TextLabel",{
Parent=au,
Size=UDim2.new(1,0,0,20),
BackgroundTransparency=1,
Text=at,
TextSize=14,
TextColor3=Color3.new(1,1,1),
ThemeTag="SectionTitle",
TextXAlignment=Enum.TextXAlignment.Left,
})

local aw=p.New("Frame",{
Parent=au,
Size=UDim2.new(1,0,1,-20),
Position=UDim2.new(0,0,0,20),
BackgroundTransparency=1,
})

local ax=p.New("UIListLayout",{
Parent=aw,
Padding=UDim.new(0,4),
SortOrder=Enum.SortOrder.LayoutOrder,
})

local ay={
Section=au,
Content=aw,
}

table.insert(self.Sections,ay)

return ay
end

return ap
end

table.insert(W.Sections,ad)

return ad
end

return W
end

return p end

local WindUI = a.load'c'()

WindUI.Init(p.New)

local Window = WindUI:CreateWindow({
    Title = "Moon Hub | if u need anything dm us or open a ticket",
    Folder = "Cezar Hub",
    IconSize = 44,
    NewElements = true,
    Size = UDim2.fromOffset(550, 550),
    HideSearchBar = false,

    OpenButton = {
        Title = "Cezar Hub",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Scale = 1,
        Color = ColorSequence.new(
            Color3.fromHex("#0400ff"),
            Color3.fromHex("#2f00ff")
        )
    },

    Topbar = {
        Height = 44,
        ButtonsType = "Windows",
        Config = {
            Close = true,
            Minimize = true,
            Maximize = true
        }
    },
})

-- PURE VOID BLACK THEME
do
    WindUI:AddTheme({
        Name = "VoidBlack",
        Accent = Color3.fromHex("#00AAAA"),
        Dialog = Color3.fromHex("#000000"),
        Outline = Color3.fromHex("#003333"),
        Text = Color3.fromHex("#FFFFFF"),
        Placeholder = Color3.fromHex("#888888"),
        Button = Color3.fromHex("#111111"),
        Icon = Color3.fromHex("#00AAAA"),
        WindowBackground = Color3.fromHex("#000000"),
        TopbarButtonIcon = Color3.fromHex("#00AAAA"),
        TopbarTitle = Color3.fromHex("#FFFFFF"),
        TopbarAuthor = Color3.fromHex("#888888"),
        TopbarIcon = Color3.fromHex("#00AAAA"),
        TabBackground = Color3.fromHex("#000000"),
        TabTitle = Color3.fromHex("#FFFFFF"),
        TabIcon = Color3.fromHex("#00AAAA"),
        ElementBackground = Color3.fromHex("#111111"),
        ElementTitle = Color3.fromHex("#FFFFFF"),
        ElementDesc = Color3.fromHex("#AAAAAA"),
        ElementIcon = Color3.fromHex("#00AAAA"),
    })

    WindUI:SetTheme("VoidBlack")
end

local M = Window:Section({ Title = "Main" })
local MI = Window:Section({ Title = "Misc" })

local Reach = M:Tab({ Title = "Reach", Icon = "volleyball" })
local Moss = M:Tab({ Title = "Moss", Icon = "user" })
local Khalid = M:Tab({ Title = "Khalid", Icon = "zap" })
local React = M:Tab({ Title = "React", Icon = "apple" })
local GKReact = M:Tab({ Title = "GK React", Icon = "shield" })

local Player = MI:Tab({ Title = "Player", Icon = "user-round-cog" })
local Helpers = MI:Tab({ Title = "Helpers", Icon = "heart-handshake" })
local BallMods = MI:Tab({ Title = "Ball Mods", Icon = "pencil-off" })
local Teleport = MI:Tab({ Title = "Teleporting", Icon = "bird" })
local Cezar5 = MI:Tab({ Title = "Cezar 5%", Icon = "star" })

-- ====================== XYZ LEG REACH (NEW) ======================
Reach:Section({ Title = "rlly good for mob and sm pc executors" })

local legXYZEnabled = false
local legXYZSize = Vector3.new(4, 4, 4)
local legXYZTransparency = 0.5
local legXYZBox
local legXYZConnection
local legPredictionTime = 0.165  -- Added for reach physics (velocity prediction)

-- Function to update the visual box
local function updateLegBox()
    if legXYZBox then legXYZBox:Destroy() end
    legXYZBox = Instance.new("Part")
    legXYZBox.Size = legXYZSize
    legXYZBox.Transparency = legXYZTransparency
    legXYZBox.Anchored = true
    legXYZBox.CanCollide = false
    legXYZBox.Color = Color3.fromRGB(0, 255, 255) -- Cyan color to tell difference from Header
    legXYZBox.Material = Enum.Material.Neon
    legXYZBox.Name = "LegReachBox"
    legXYZBox.Parent = workspace
end

local function startLegXYZ()
    if not legXYZEnabled then return end
    if legXYZConnection then legXYZConnection:Disconnect() end
    updateLegBox()

    legXYZConnection = game:GetService("RunService").RenderStepped:Connect(function()
        local player = game.Players.LocalPlayer
        local char = player.Character
        if not char then return end
        
        local root = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChild("Humanoid")
        local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
        
        if not (root and humanoid and tps and legXYZBox) then return end

        -- Position the box at the player's feet (Offset Y by -2 usually hits feet level)
        legXYZBox.CFrame = root.CFrame * CFrame.new(0, -2, 0)

        -- Added reach physics: predict ball position (velocity prediction + desync comp via slight forward offset)
        local predictedPos = tps.Position + tps.Velocity * legPredictionTime + Vector3.new(0, 0, -0.5)  -- Slight desync comp offset

        local boxCFrame, boxSize = legXYZBox.CFrame, legXYZBox.Size
        local relative = boxCFrame:PointToObjectSpace(predictedPos)

        -- Check if predicted ball pos is inside the box
        if math.abs(relative.X) <= boxSize.X / 2 
            and math.abs(relative.Y) <= boxSize.Y / 2 
            and math.abs(relative.Z) <= boxSize.Z / 2 then
            
            -- Determine which leg to use based on Rig Type and Preferred Foot
            local preferredFoot = game.Lighting:FindFirstChild(player.Name) and game.Lighting[player.Name]:FindFirstChild("PreferredFoot")
            local limbName = "Right Leg" -- Default
            
            if humanoid.RigType == Enum.HumanoidRigType.R6 then
                 if preferredFoot then
                    limbName = (preferredFoot.Value == 1) and "Right Leg" or "Left Leg"
                 end
            else -- R15
                 limbName = "RightLowerLeg"
                 if preferredFoot then
                    limbName = (preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg"
                 end
            end

            local limb = char:FindFirstChild(limbName)
            if limb then
                firetouchinterest(limb, tps, 0)
                firetouchinterest(limb, tps, 1)
            end
        end
    end)
end

local function stopLegXYZ()
    if legXYZConnection then legXYZConnection:Disconnect() end
    if legXYZBox then legXYZBox:Destroy() end
end

Reach:Toggle({
    Title = "Enable XYZ Leg Reach",
    Default = false,
    Callback = function(state)
        legXYZEnabled = state
        if state then startLegXYZ() else stopLegXYZ() end
    end
})

Reach:Slider({
    Title = "Reach X (Width)",
    Desc = "size nigga",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = { Min = 0, Max = 25, Default = 4 },
    Callback = function(val)
        legXYZSize = Vector3.new(val, legXYZSize.Y, legXYZSize.Z)
        if legXYZEnabled then updateLegBox() end
    end
})

Reach:Slider({
    Title = "Reach Y (Height)",
    Desc = "up nigger",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = { Min = 0, Max = 25, Default = 4 },
    Callback = function(val)
        legXYZSize = Vector3.new(legXYZSize.X, val, legXYZSize.Z)
        if legXYZEnabled then updateLegBox() end
    end
})

Reach:Slider({
    Title = "Reach Z (Forward)",
    Desc = "front or back",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = { Min = 0, Max = 25, Default = 4 },
    Callback = function(val)
        legXYZSize = Vector3.new(legXYZSize.X, legXYZSize.Y, val)
        if legXYZEnabled then updateLegBox() end
    end
})

Reach:Toggle({
    Title = "Visualize Hitbox",
    Default = true,
    Callback = function(v)
        legXYZTransparency = v and 0.5 or 1
        if legXYZEnabled and legXYZBox then
            legXYZBox.Transparency = legXYZTransparency
        end
    end
})

-- FIXED SLIDER SYNTAX
Reach:Slider({
    Title = "Reach Distance",
    Desc = "The Size Of The Reach",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = { Min = 1, Max = 15, Default = 1 },
    Callback = function(val)
        reachDistance = tonumber(val)

        if reachConnection then
            reachConnection:Disconnect()
            reachConnection = nil
        end

        if reachEnabled then
            reachConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local player = game.Players.LocalPlayer
                local character = player and player.Character
                local rootPart = character and character:FindFirstChild("HumanoidRootPart")
                local humanoid = character and character:FindFirstChild("Humanoid")

                if not (character and rootPart and humanoid) then return end

                local tps = workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS")
                if not tps then return end

                local distance = (rootPart.Position - tps.Position).Magnitude
                if distance <= reachDistance then
                    local preferredFoot = game.Lighting:FindFirstChild(player.Name) and game.Lighting[player.Name]:FindFirstChild("PreferredFoot")
                    if preferredFoot then
                        local limbName = (humanoid.RigType == Enum.HumanoidRigType.R6)
                            and ((preferredFoot.Value == 1) and "Right Leg" or "Left Leg")
                            or ((preferredFoot.Value == 1) and "RightLowerLeg" or "LeftLowerLeg")

                        local limb = character:FindFirstChild(limbName)
                        if limb then
                            firetouchinterest(limb, tps, 0)
                            firetouchinterest(limb, tps, 1)
                        end
                    end
                end
            end)
        end
    end
})

Reach:Section({ Title = "use ts if ur on xeno or solara" })

Reach:Input({
    Title = "R6 Leg Size",
    Value = "1",
    Type = "Textarea",
    Placeholder = "Size",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then
            local rl = char:FindFirstChild("Right Leg")
            local ll = char:FindFirstChild("Left Leg")
            if rl and ll then
                rl.Size = Vector3.new(v, 2, v)
                ll.Size = Vector3.new(v, 2, v)
                rl.CanCollide = false
                ll.CanCollide = false
            end
        end
    end
})

Reach:Input({
    Title = "R15 Leg Size",
    Value = "1",
    Type = "Textarea",
    Placeholder = "Size",
    Callback = function(v)
        local char = game.Players.LocalPlayer.Character
        if char then
            local rll = char:FindFirstChild("RightLowerLeg")
            local lll = char:FindFirstChild("LeftLowerLeg")
            if rll and lll then
                rll.Size = Vector3.new(v, 2, v)
                lll.Size = Vector3.new(v, 2, v)
                rll.CanCollide = false
                lll.CanCollide = false
            end
        end
    end
})

Reach:Button({
    Title = "Fake Legs (Appear Normal)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        if humanoid.RigType == Enum.HumanoidRigType.R6 then
            game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
            game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1

            game.Players.LocalPlayer.Character["Left Leg"].Massless = true
            local LeftLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
            LeftLegM.Name = "Left Leg"
            LeftLegM.CanCollide = false
            LeftLegM.Color = game.Players.LocalPlayer.Character["Left Leg"].Color
            LeftLegM.Size = Vector3.new(1, 2, 1)
            LeftLegM.Locked = true
            LeftLegM.Position = game.Players.LocalPlayer.Character["Left Leg"].Position

            local Attachment = Instance.new("Attachment", LeftLegM)
            Attachment.Name = "LeftFootAttachment"
            Attachment.Position = Vector3.new(0, -1, 0)

            local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
            MotorHip.Name = "Fake Left Hip"
            MotorHip.C0 = CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            MotorHip.C1 = CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            MotorHip.CurrentAngle = 0
            MotorHip.DesiredAngle = 0
            MotorHip.MaxVelocity = 0.1
            MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
            MotorHip.Part1 = LeftLegM

            game.Players.LocalPlayer.Character["Right Leg"].Massless = true
            local RightLegM = Instance.new("Part", game.Players.LocalPlayer.Character)
            RightLegM.Name = "Right Leg"
            RightLegM.CanCollide = false
            RightLegM.Color = game.Players.LocalPlayer.Character["Right Leg"].Color
            RightLegM.Size = Vector3.new(1, 2, 1)
            RightLegM.Locked = true
            RightLegM.Position = game.Players.LocalPlayer.Character["Right Leg"].Position

            local Attachment = Instance.new("Attachment", RightLegM)
            Attachment.Name = "RightFootAttachment"
            Attachment.Position = Vector3.new(0, -1, 0)

            local MotorHip = Instance.new("Motor6D", game.Players.LocalPlayer.Character.Torso)
            MotorHip.Name = "Fake Right Hip"
            MotorHip.C0 = CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            MotorHip.C1 = CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            MotorHip.CurrentAngle = 0
            MotorHip.DesiredAngle = 0
            MotorHip.MaxVelocity = 0.1
            MotorHip.Part0 = game.Players.LocalPlayer.Character.Torso
            MotorHip.Part1 = RightLegM

        elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
            game.Players.LocalPlayer.Character["RightLowerLeg"].Transparency = 1
            game.Players.LocalPlayer.Character["LeftLowerLeg"].Transparency = 1
        end
    end
})

-- ====================== MOSS TAB (Fixed Sliders) ======================
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local headReachEnabled = false
local headReachSize = Vector3.new(1, 1.5, 1)
local headTransparency = 0.5
local headOffset = Vector3.new(0, 0, 0)
local headBoxPart
local headConnection
local headPredictionTime = 0.165  -- Added for reach physics

local function updateHeadOffset()
    headOffset = Vector3.new(headOffset.X, headReachSize.Y / 2.5, headOffset.Z)
end

local function updateHeadBox()
    if headBoxPart then headBoxPart:Destroy() end
    headBoxPart = Instance.new("Part")
    headBoxPart.Size = headReachSize
    headBoxPart.Transparency = headTransparency
    headBoxPart.Anchored = true
    headBoxPart.CanCollide = false
    headBoxPart.Color = Color3.fromRGB(255, 105, 180)
    headBoxPart.Material = Enum.Material.Neon
    headBoxPart.Name = "HeadReachBox"
    headBoxPart.Parent = Workspace
end

local function startHeadReach()
    if not headReachEnabled then return end
    if headConnection then headConnection:Disconnect() end
    updateHeadBox()

    headConnection = RunService.RenderStepped:Connect(function()
        local character = player.Character
        if not character then return end
        local head = character:FindFirstChild("Head")
        local tps = Workspace:FindFirstChild("TPSSystem") and Workspace.TPSSystem:FindFirstChild("TPS")
        if not (head and tps) then return end

        headBoxPart.CFrame = head.CFrame * CFrame.new(headOffset)

        -- Added reach physics: predict ball position (velocity prediction + desync comp)
        local predictedPos = tps.Position + tps.Velocity * headPredictionTime + Vector3.new(0, 0, -0.5)  -- Slight desync comp offset

        local boxCFrame, boxSize = headBoxPart.CFrame, headBoxPart.Size
        local relative = boxCFrame:PointToObjectSpace(predictedPos)

        if math.abs(relative.X) <= boxSize.X / 2 
            and math.abs(relative.Y) <= boxSize.Y / 2 
            and math.abs(relative.Z) <= boxSize.Z / 2 then
            firetouchinterest(head, tps, 0)
            firetouchinterest(head, tps, 1)
        end
    end)
end

local function stopHeadReach()
    if headConnection then headConnection:Disconnect() end
    if headBoxPart then headBoxPart:Destroy() end
end

Moss:Toggle({
    Title = "lmao normal reach sh cuz cezars bum ahh thinks his sh expenisve",
    Default = false,
    Callback = function(state)
        headReachEnabled = state
        if state then startHeadReach() else stopHeadReach() end
    end
})

Moss:Slider({
    Title = "Header X",
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 20,
        Default = 2,
    },
    Callback = function(val)
        headReachSize = Vector3.new(val, headReachSize.Y, headReachSize.Z)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

Moss:Slider({
    Title = "Header Y",
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 20,
        Default = 3,
    },
    Callback = function(val)
        headReachSize = Vector3.new(headReachSize.X, val, headReachSize.Z)
        headOffset = Vector3.new(headOffset.X, val / 2.5, headOffset.Z)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

Moss:Slider({
    Title = "Header Z",
    Desc = "",
    IsTooltip = false,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = {
        Min = 0,
        Max = 20,
        Default = 2,
    },
    Callback = function(val)
        headReachSize = Vector3.new(headReachSize.X, headReachSize.Y, val)
        if headReachEnabled then
            updateHeadBox()
        end
    end
})

Moss:Toggle({
    Title = "hide hitbox",
    Default = false,
    Callback = function(v)
        headTransparency = v and 1 or 0.5
        if headReachEnabled and headBoxPart then
            headBoxPart.Transparency = headTransparency
        end
    end
})

Moss:Section({ Title = "Moss Presets" })

Moss:Button({ Title = "15%", Callback = function() 
    headReachSize = Vector3.new(3.5, 4.8, 3.0)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })
Moss:Button({ Title = "25%", Callback = function() 
    headReachSize = Vector3.new(3.7, 5.0, 3.2)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })
Moss:Button({ Title = "50%", Callback = function() 
    headReachSize = Vector3.new(3.9, 5.3, 3.1)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })
Moss:Button({ Title = "75%", Callback = function() 
    headReachSize = Vector3.new(4.2, 5.3, 3.3)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })
Moss:Button({ Title = "100% DIAGALA MOSSED", Callback = function() 
    headReachSize = Vector3.new(5, 7, 3.5)
    updateHeadOffset()
    if headReachEnabled then updateHeadBox() end 
end })

-- ====================== KHALID TAB (Jump Leg Only) ======================
local khalidEnabled = false
local J_REACH = 5
local khalidPredictionTime = 0.165  -- Added for reach physics

Khalid:Toggle({
    Title = "Enable Khalid",
    Default = false,
    Callback = function(v) khalidEnabled = v end
})

Khalid:Slider({
    Title = "Khalid volley",
    Desc = "This volley script is not normal 1 its from the real khalid so do not use a lot power cuz its rlly obv",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = { Min = 1, Max = 20, Default = 5 },
    Callback = function(v) J_REACH = v end
})

Khalid:Section({ Title = "Khalid Presets" })
Khalid:Button({ Title = "15%", Callback = function() J_REACH = 5 end })
Khalid:Button({ Title = "25%", Callback = function() J_REACH = 6.7 end })
Khalid:Button({ Title = "50%", Callback = function() J_REACH = 10.1 end })
Khalid:Button({ Title = "75%", Callback = function() J_REACH = 13.5 end })
Khalid:Button({ Title = "100%", Callback = function() J_REACH = 16.9 end })

-- Jump leg physics
game:GetService("RunService").Heartbeat:Connect(function()
    if khalidEnabled then
        local char = game.Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local ball = workspace:FindFirstChild("TPS") or (workspace:FindFirstChild("TPSSystem") and workspace.TPSSystem:FindFirstChild("TPS"))
        if root and ball then
            -- Added reach physics: predict ball position
            local predictedPos = ball.Position + ball.Velocity * khalidPredictionTime + Vector3.new(0, 0, -0.5)  -- Desync comp
            if (predictedPos - root.Position).Magnitude <= J_REACH then
                firetouchinterest(root, ball, 0)
                firetouchinterest(root, ball, 1)
            end
        end
    end
end)

-- ====================== REACT TAB ======================
React:Section({ Title = "Ball React Presets" })
for _, p in {10, 25, 50, 75, 100} do
    React:Button({
        Title = p .. "%",
        Callback = function()
            local tps = workspace.TPSSystem.TPS
            if tps then tps.Velocity = Vector3.new(100 * (p/100), 100 * (p/100), 100 * (p/100)) end
        end
    })
end

React:Button({ Title = "Reduce Ball Delay", Callback = function()
    local tps = workspace.TPSSystem.TPS
    if tps and tps:FindFirstChild("MainAttachment") then tps.MainAttachment:Destroy() end
end })

-- ====================== GK REACT TAB ======================
local gkReactEnabled = false

GKReact:Toggle({
    Title = "Enable Goalkeeper React",
    Default = false,
    Callback = function(v)
        gkReactEnabled = v
        if v then
            local gkActions = {"SaveRA", "SaveLA", "SaveRL", "SaveLL", "SaveT", "Tackle", "Header"}
            local meta = getrawmetatable(game)
            local old = meta.__namecall
            setreadonly(meta, false)
            meta.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if method == "FireServer" and table.find(gkActions, tostring(self)) then
                    local args = {...}
                    args[2] = game.Players.LocalPlayer.Character.Humanoid.LLCL
                    return old(self, unpack(args))
                end
                return old(self, ...)
            end)
            setreadonly(meta, true)
        end
    end
})

GKReact:Section({ Title = "GK React Presets" })
for _, p in {15, 25, 50, 75, 100} do
    GKReact:Button({
        Title = p .. "%",
        Callback = function()
            if gkReactEnabled then
                local tps = workspace.TPSSystem.TPS
                if tps then tps.Velocity = Vector3.new(100 * (p/100), 100 * (p/100), 100 * (p/100)) end
            end
        end
    })
end

-- ====================== PLAYER TAB ======================
Player:Section({ Title = "Walkspeed" })

local WalkspeedEnabled = false
local CurrentSpeed = 23 

Player:Toggle({
    Title = "Enable / Disable Walkspeed",
    Default = false,
    Callback = function(v)
        WalkspeedEnabled = v
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            if v then
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = CurrentSpeed
            else
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = 23 
            end
        end
    end
})

Player:Slider({
    Title = "Walkspeed Size",
    Desc = "using even above 2 size is already obvious",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
        Min = 23,
        Max = 75,
        Default = 23,
    },
    Callback = function(v)
        CurrentSpeed = v
        if WalkspeedEnabled then
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").WalkSpeed = v
            end
        end
    end
})

Player:Section({ Title = "Jump Power" })

local JumpEnabled = false
local CurrentJump = 50 

Player:Toggle({
    Title = "Enable / Disable Jump Power",
    Default = false,
    Callback = function(v)
        JumpEnabled = v
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            if v then
                character:FindFirstChildOfClass("Humanoid").JumpPower = CurrentJump
            else
                character:FindFirstChildOfClass("Humanoid").JumpPower = 50 
            end
        end
    end
})

Player:Slider({
    Title = "Jump Power",
    Desc = "i usually say its a jumo flags js dont use above 60 if u tryna stay clean",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 1,
    Value = {
        Min = 50,
        Max = 120,
        Default = 50,
    },
    Callback = function(v)
        CurrentJump = v
        if JumpEnabled then
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChildOfClass("Humanoid") then
                character:FindFirstChildOfClass("Humanoid").JumpPower = v
            end
        end
    end
})

Player:Section({ Title = "Avatar Stealer" })

local Players = game:GetService("Players")
local lplr = Players.LocalPlayer

local Disguise = {Enabled = false}
local DisguiseUsername = {Value = ""}
local DisguiseDescription = nil

local function RemoveOldParts(character)
    for _, child in ipairs(character:GetChildren()) do
        if child:IsA("Accessory") or child:IsA("Clothing") or child:IsA("ShirtGraphic") then
            child:Destroy()
        elseif child:IsA("BodyColors") then
            child:Destroy()
        end
    end
end

local function FetchDisguiseDescription()
    if DisguiseUsername.Value == "" then return end
    local success
    repeat
        success = pcall(function()
            local userId = Players:GetUserIdFromNameAsync(DisguiseUsername.Value)
            DisguiseDescription = Players:GetHumanoidDescriptionFromUserId(userId)
        end)
        if not success then
            task.wait(1)
        end
    until success or not Disguise.Enabled
end

local function DisguiseCharacter(char)
    task.spawn(function()
        if not char then return end
        local hum = char:WaitForChild("Humanoid", 9e9)
        RemoveOldParts(char)

        if not DisguiseDescription then
            FetchDisguiseDescription()
        end

        if Disguise.Enabled and DisguiseDescription then
            hum:ApplyDescriptionClientServer(DisguiseDescription)
        end
    end)
end

lplr.CharacterAdded:Connect(function(char)
    if Disguise.Enabled then
        DisguiseCharacter(char)
    else
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ApplyDescriptionClientServer(Players:GetHumanoidDescriptionFromUserId(lplr.UserId))
        end
    end
end)

Player:Toggle({
    Title = "Enable / Disable Avatar Stealer",
    Default = false,
    Callback = function(state)
        Disguise.Enabled = state
        if state and DisguiseUsername.Value \~= "" and lplr.Character then
            DisguiseCharacter(lplr.Character)
        elseif not state and lplr.Character then
            local hum = lplr.Character:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:ApplyDescriptionClientServer(Players:GetHumanoidDescriptionFromUserId(lplr.UserId))
            end
        end
    end
})

Player:Input({
    Title = "Avatar Stealer Username",
    Desc = "Write user here.",
    Value = "",
    Type = "Input",
    Placeholder = "Enter username...",
    Callback = function(input)
        DisguiseUsername.Value = input
        if Disguise.Enabled and lplr.Character then
            DisguiseCharacter(lplr.Character)
        end
    end
})

-- ====================== HELPERS TAB ======================
Helpers:Section({ Title = "ZZZZ Helper" })

local zzzzEnabled = false

Helpers:Toggle({
    Title = "Enable / Disable ZZZZ Helper",
    Default = false,
    Callback = function(state)
        zzzzEnabled = state
        if state then
            local part = Instance.new("Part")
            part.Name = "TPS1"
            part.Size = Vector3.new(9, 0.1, 9)  
            part.Anchored = true
            part.BrickColor = BrickColor.new("Bright red")
            part.Transparency = 1 
            part.Parent = game.Workspace

            local tpsSystem = game:GetService("Workspace"):FindFirstChild("TPSSystem")
            local tpsTarget = tpsSystem and tpsSystem:FindFirstChild("TPS")

            local function updatePartPosition()
                if tpsTarget then
                    part.Position = tpsTarget.Position - Vector3.new(0, 1, 0)
                end
            end

            updatePartPosition()
            local runService = game:GetService("RunService")
            runService.RenderStepped:Connect(updatePartPosition)
        else
            for _, child in ipairs(game.Workspace:GetChildren()) do
                if child.Name == "TPS1" then
                    child:Destroy()
                end
            end
        end
    end
})

Helpers:Section({ Title = "Air Dribble Helper" })

local airDribbleEnabled = false
local airDribbleSize = 1

Helpers:Toggle({
    Title = "Enable / Disable Air Dribble Helper",
    Default = false,
    Callback = function(state)
        airDribbleEnabled = state
        if state then
            local part = Instance.new("Part")
            part.Name = "TPS"
            part.Size = Vector3.new(airDribbleSize, 0.1, airDribbleSize)  
            part.Anchored = true
            part.BrickColor = BrickColor.new("Bright red")
            part.Transparency = 1  
            part.Parent = game.Workspace

            local tpsSystem = game:GetService("Workspace"):FindFirstChild("TPSSystem")
            local tpsTarget = tpsSystem and tpsSystem:FindFirstChild("TPS")

            local function updatePartPosition()
                if tpsTarget then
                    part.Position = tpsTarget.Position - Vector3.new(0, 1, 0)
                end
            end

            updatePartPosition()
            local runService = game:GetService("RunService")
            runService.RenderStepped:Connect(updatePartPosition)
        else
            for _, child in ipairs(game.Workspace:GetChildren()) do
                if child.Name == "TPS" then
                    child:Destroy()
                end
            end
        end
    end
})

Helpers:Slider({
    Title = "Air Dribble Helper Size",
    Desc = "The Size Of The Reach",
    IsTooltip = true,
    IsTextbox = false,
    Width = 200,
    Step = 0.1,
    Value = { Min = 1, Max = 15, Default = 1 },
    Callback = function(val)
        airDribbleSize = val
        if airDribbleEnabled then
            for _, child in ipairs(game.Workspace:GetChildren()) do
                if child.Name == "TPS" then
                    child:Destroy()
                end
            end
            
            local part = Instance.new("Part")
            part.Name = "TPS"
            part.Size = Vector3.new(val, 0.1, val)  
            part.Anchored = true
            part.BrickColor = BrickColor.new("Bright red")
            part.Transparency = 1  
            part.Parent = game.Workspace

            local tpsSystem = game:GetService("Workspace"):FindFirstChild("TPSSystem")
            local tpsTarget = tpsSystem and tpsSystem:FindFirstChild("TPS")

            local function updatePartPosition()
                if tpsTarget then
                    part.Position = tpsTarget.Position - Vector3.new(0, 1, 0)
                end
            end

            updatePartPosition()
            local runService = game:GetService("RunService")
            runService.RenderStepped:Connect(updatePartPosition)
        end
    end
})

Helpers:Section({ Title = "Inf Dribble Helper" })

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local ball = game.Workspace.TPSSystem.TPS
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

local followBall = false
local isMovingManually = false
local infDribbleEnabled = false 

local function follow()
    if followBall and not isMovingManually and infDribbleEnabled then
        character.Humanoid:MoveTo(ball.Position)
    end
end

userInputService.InputEnded:Connect(function(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.Keyboard or input.UserInputType == Enum.UserInputType.MouseMovement then
        isMovingManually = false
    end
end)

userInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.B and not gameProcessed and infDribbleEnabled then
        followBall = not followBall
    end
end)

runService.RenderStepped:Connect(function()
    if followBall and infDribbleEnabled then
        follow()
    end
end)

player.CharacterAdded:Connect(function(char)
    character = char
end)

Helpers:Toggle({
    Title = "Enable / Disable Inf Dribble Helper [PC]",
    Desc = "Toggle it by pressing (B)",
    Default = false,
    Callback = function(state)
        infDribbleEnabled = state
        if not state then
            followBall = false
        end
    end
})

Helpers:Toggle({
    Title = "Enable / Disable Inf Dribble Helper [MOB]",
    Desc = "it will make a GUI in your screen to control it.",
    Default = false,
    Callback = function(Value)
        infDribbleEnabled = Value

        if Value then
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "InfDribbleGui"
            screenGui.ResetOnSpawn = false
            screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

            local toggleButton = Instance.new("TextButton")
            toggleButton.Name = "InfDribbleButton"
            toggleButton.Size = UDim2.new(0, 120, 0, 40)
            toggleButton.Position = UDim2.new(0, 20, 0.5, -20)
            toggleButton.Text = "Inf Dribble: OFF"
            toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            toggleButton.TextColor3 = Color3.new(1, 1, 1)
            toggleButton.TextScaled = true
            toggleButton.Parent = screenGui

            toggleButton.MouseButton1Click:Connect(function()
                followBall = not followBall
                if followBall then
                    toggleButton.Text = "Inf Dribble: ON"
                else
                    toggleButton.Text = "Inf Dribble: OFF"
                end
            end)
        else
            followBall = false
            local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
            if playerGui then
                local screenGui = playerGui:FindFirstChild("InfDribbleGui")
                if screenGui then
                    screenGui:Destroy()
                end
            end
        end
    end
})

-- ====================== BALL MODS TAB ======================
BallMods:Section({ Title = "Ball Modifications" })

BallMods:Input({
    Title = "Ball Size",
    Desc = "",
    Value = "2.6",
    Type = "Textarea",
    Placeholder = "Size",
    Callback = function(size) 
        workspace.TPSSystem.TPS.Size = Vector3.new(size, size, size)
    end
})

local RunService = game:GetService("RunService")
local ball = workspace.TPSSystem.TPS
local gravity = workspace.Gravity or 196.2

local predictionDuration = 0.5   
local timeStep = 0.05            
local predictionParts = {}
local lineParts = {}

local function createOrGetPart(list, index, size, color, transparency)
    if list[index] then
        return list[index]
    else
        local part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.Size = size
        part.Material = Enum.Material.Neon
        part.Color = color
        part.Transparency = transparency
        part.CastShadow = false
        part.Parent = workspace
        list[index] = part
        return part
    end
end

local connection

BallMods:Toggle({
    Title = "Enable / Disable Ball Prediction",
    Default = false,
    Callback = function(state)
        if state then
            if connection then connection:Disconnect() end

            connection = RunService.Heartbeat:Connect(function()
                if not ball or not ball:IsA("BasePart") then return end

                local startPos = ball.Position
                local startVel = ball.Velocity
                local pointsCount = math.floor(predictionDuration / timeStep)
                local positions = {}

                for i = 1, pointsCount do
                    local t = i * timeStep
                    local predictedPos = startPos + (startVel * t) + Vector3.new(0, -0.5 * gravity * t * t, 0)
                    positions[i] = predictedPos

                    local pointPart = createOrGetPart(predictionParts, i, Vector3.new(0.3,0.3,0.3), Color3.fromRGB(0,255,0), 0.4)
                    pointPart.CFrame = CFrame.new(predictedPos)
                    pointPart.Transparency = 0.4
                end

                for i = 1, pointsCount - 1 do
                    local pos1 = positions[i]
                    local pos2 = positions[i + 1)
                    local direction = pos2 - pos1
                    local distance = direction.Magnitude
                    local midPoint = pos1 + direction / 2
                    local linePart = createOrGetPart(lineParts, i, Vector3.new(0.1,0.1,distance), Color3.fromRGB(0,255,0), 0.6)
                    linePart.CFrame = CFrame.new(midPoint, pos2)
                    linePart.Transparency = 0.6
                end

                for i = pointsCount + 1, #predictionParts do
                    predictionParts[i].Transparency = 1
                end
                for i = pointsCount, #lineParts do
                    lineParts[i].Transparency = 1
                end
            end)
        else
            if connection then connection:Disconnect() end
            connection = nil
            for _, part in pairs(predictionParts) do
                part.Transparency = 1
            end
            for _, part in pairs(lineParts) do
                part.Transparency = 1
            end
        end
    end
})

BallMods:Toggle({
    Title = "Enable / Disable Ball Collision",
    Default = false,
    Callback = function(state)
        if state then
            local TPS = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")

            local follower = Instance.new("Part")
            follower.Name = "FollowerPart"
            follower.Shape = Enum.PartType.Ball
            follower.Anchored = true
            follower.CanCollide = true
            follower.Material = Enum.Material.Air
            follower.Color = TPS.Color
            follower.Parent = workspace

            local RunService = game:GetService("RunService")

            RunService.Heartbeat:Connect(function()
                if TPS then
                    follower.Size = TPS.Size
                    follower.CFrame = TPS.CFrame
                    follower.Color = TPS.Color
                end
            end)
        else 
            if workspace:FindFirstChild("FollowerPart") then 
                workspace.FollowerPart:Destroy()
            end
        end
    end
})

-- ====================== TELEPORTING TAB ======================
Teleport:Section({ Title = "Ball Teleporting" })

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local TPS = workspace:WaitForChild("TPSSystem"):WaitForChild("TPS")

local Target = nil
local teleporting = false
local connection

Teleport:Toggle({
    Title = "Loop Teleporting to the Ball",
    Desc = "Continuously teleports you near the ball",
    Default = false,
    Callback = function(state)
        teleporting = state

        if teleporting then
            connection = RunService.Heartbeat:Connect(function()
                local character = player.Character
                if character then
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if hrp and TPS then
                        local offset = -TPS.CFrame.LookVector * 5 + Vector3.new(0, 3, 0)
                        hrp.CFrame = TPS.CFrame + offset
                    end
                end
            end)
        else
            if connection then
                connection:Disconnect()
                connection = nil
            end
        end
    end
})

Teleport:Section({ Title = "Player Teleporting" })

Teleport:Input({
    Title = "Target Player Username",
    Callback = function(value)
        local targetPlayer = Players:FindFirstChild(value)
        Target = targetPlayer
    end
})

Teleport:Button({
    Title = "Teleport To Player",
    Justify = "Center",
    Callback = function()
        if Target
        and player.Character
        and Target.Character
        and player.Character:FindFirstChild("HumanoidRootPart")
        and Target.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame =
                Target.Character.HumanoidRootPart.CFrame
        end
    end
})

Teleport:Button({
    Title = "Teleport To Red Goal",
    Justify = "Center",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        hrp.CFrame = workspace.RedGoal.Part.CFrame + Vector3.new(0, 3, 0)
    end
})

Teleport:Button({
    Title = "Teleport To Blue Goal",
    Justify = "Center",
    Callback = function()
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        hrp.CFrame = workspace.BlueGoal.Part.CFrame + Vector3.new(0, 3, 0)
    end
})

-- ====================== CEZAR 5% TAB ======================
local cezar5Enabled = false

Cezar5:Toggle({
    Title = "Enable Cezar 5%",
    Default = false,
    Callback = function(v)
        cezar5Enabled = v
        if v then
            headReachSize = Vector3.new(4, 6.3, 4)
            updateHeadOffset()
            if headReachEnabled then updateHeadBox() end
            J_REACH = 5
        end
    end
})

-- ====================== BLOXTRAP TAB ======================
local BloxtrapTab = MI:Tab({ Title = "Bloxtrap", Icon = "monitor" }) 
BloxtrapTab:Section({ Title = "Bloxtrap Initiate" })

BloxtrapTab:Button({
    Title = "Load Bloxtrap Script",
    Desc = "Executes the installation/initiate script",
    Callback = function()
        -- Setting your custom environment variables
        getgenv().autosetup = {
            path = 'Bloxstrap',
            setup = true
        }
        
        -- Executing the external script
        loadstring(game:HttpGet('https://raw.githubusercontent.com/qwertyui-is-back/Bloxstrap/main/Initiate.lua'), 'lol')()
    end
})
Window:Open()
