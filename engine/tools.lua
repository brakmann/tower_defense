local tools = {}

tools.deepcopy = function(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[tools.deepcopy(orig_key)] = tools.deepcopy(orig_value)
        end
        setmetatable(copy, tools.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

tools.renderTable = function (_table)
    if type(_table) == 'table' then
       local s = '\n'
       for k,v in pairs(_table) do
          if type(k) ~= 'number' then 
            k = '"'..k..'"' 
        end
          s = s .. '['..k..'] = ' .. tools.renderTable(v) .. '\n'
       end
       return s .. '\n' 
    else
       return tostring(_table)
    end
 end

 tools.getKeyForValue = function (table, value)
    for k,v in pairs(t) do
      if v==value then return k end
    end
    return nil
  end      
 

return tools