
local blurBoxElementt = nil
local currentStatee = false
local timetoshow = 5000
local fontscale = 1
local x,y = guiGetScreenSize()
if ( x <= 1440 ) and ( y <= 900 ) then
fontscale = 0.85
end
if ( x <= 1280 ) and ( y <= 1024 ) then
fontscale = 0.80
end --1280 1024

if ( x <= 1176 ) and ( y <= 664 ) then
fontscale = 0.75
end --1
if ( x <= 1024 ) and ( y <= 768 ) then
fontscale = 0.65
end
if ( x <= 800 ) and ( y <= 600 ) then
fontscale = 0.48
end
-- 1024 768
function ShowInformationNoti(state,texttonoti)
if state == true and texttonoti then
gData = {}
gData.text = texttonoti
if currentStatee == false then
				currentStatee = true
				addEventHandler ("onClientRender",getRootElement(),RenderNotificationInfo)
				sound = playSound("files/beep.mp3")
				blurBoxElementt = exports.blur_box:createBlurBox( 40*px, 699*py, 500*px, 29*py, 255, 255, 255, 255, false )
				-- exports.blur_box:setBlurBoxPosition( blurBoxElement, 63*px, 699*py, )
				-- exports.blur_box:setBlurBoxSize( blurBoxElement, 63*px, 699*py, )
				exports.blur_box:setBlurIntensity(1.0)
				outputConsole ( "[NOTI] "..gData.text )
				endTimerr = setTimer (HideNoti,timetoshow,1)
			else
				if endTimerr and isTimer (endTimerr) then
					killTimer (endTimerr)
					endTimerr = setTimer (HideNoti,timetoshow,1)
				end
			end
elseif state == false then
removeEventHandler ("onClientRender",getRootElement(),RenderNotificationInfo)
			gData = {}
			currentStatee = false
			sound = playSound("files/beepquit.mp3")


end
end
function HideNoti()
ShowInformationNoti(false)
blurBoxElementt = not exports.blur_box:destroyBlurBox( blurBoxElementt )
end
function RenderNotificationInfo()
dxDrawRectangle(40*px, 699*py, 500*px, 29*py, tocolor(1, 0, 0, 100), false)
dxDrawText(gData.text, 40*px, 699*py, 538*px, 728*py, tocolor(255, 255, 255, 255), fontscale, "default-bold", "center", "center", true, false, true, false, false)
end


function NewNotification(texttonoti)
ShowInformationNoti(true,texttonoti)
end
addEvent( "NotificationReleased", true )
addEventHandler( "NotificationReleased", root, NewNotification )



