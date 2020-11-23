

function NewNotification(player,text)
	if isElement(player) then
		triggerClientEvent(player, "NotificationReleased", player,text)
	end
end


