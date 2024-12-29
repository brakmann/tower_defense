local draw = {}
draw.drawBoard = function(startPosX, startPosY, size, cellSize)
    local currentColor = draw.color.purple
    for i = 1, size do
      for j = 1, size do
        currentColor = toggleColor(currentColor)
        love.graphics.setColor(currentColor)
        love.graphics.rectangle("fill", i*cellSize,j*cellSize, cellSize, cellSize)
      end
    end 
  end
  
  function toggleColor(inColor)
    if inColor == draw.color.white then
      return draw.color.purple 
    elseif inColor == draw.color.purple then
      return draw.color.white
    end
  end

draw.color = {}
draw.color.white = {0.9, 0.9, 0.9, 1}
draw.color.purple = {0.4, 0.4, 0.9, 1}
return draw