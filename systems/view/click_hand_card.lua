local system = {}

system.OnClick = function(_card)
    if _card.isSelected then
        _card.isSelected = false
        _card.cardPosition.y = _card.cardPosition.y + 1
    else 
        _card.isSelected = true
        _card.cardPosition.y = _card.cardPosition.y - 1
    end
    --to do: delete event
    love.event.push("cardpressed")
    print('card pressed')
end 

system.filters = {"clickedTag", "inHandCard", "screenPosition", "collider"}

return system