local system = {}

system.OnClick = function(_card)
    if _card.isSelected then
        _card.isSelected = false
        _card.screenPosition.y = _card.screenPosition.y + 50
    else 
        _card.isSelected = true
        _card.screenPosition.y = _card.screenPosition.y - 50
    end
    --to do: delete event
    love.event.push("cardpressed")
    print('card pressed')
end 

system.filters = {"clickedTag", "clickableHandCard", "screenPosition", "collider"}

return system