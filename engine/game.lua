local game = {}

game.findNearest = function(object, targets)
    if targets then
        local minDistance = 9007199254740991
        local minDistanceIndex = 0
        for i=1, #targets do
            local distance = math.sqrt((targets[i].screenPosition.x - object.screenPosition.x)^2 + (targets[i].screenPosition.y - object.screenPosition.y)^2)
            if distance < minDistance then
                minDistance = distance
                minDistanceIndex = i
            end
        end
        return targets[minDistanceIndex]
    end
end

return game