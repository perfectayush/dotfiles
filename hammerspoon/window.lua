-- define modal for window management
modal = hs.hotkey.modal.new();
winmanText = "cmd + hjkl \t jumping\n" ..
  "hjkl \t\t\t\t halves\n" ..
  "alt + hjkl \t\t increments\n" ..
  "shift + hjkl \t resize\n" ..
  "n, p \t\t\t\t next, prev screen\n" ..
  "g \t\t\t\t\t grid\n" ..
  "m \t\t\t\t maximize\n" ..
  "u \t\t\t\t\t undo"

function modal:entered() hs.alert.closeAll(); alert(winmanText, 999999) end
function modal:exited() hs.alert.closeAll() end
modal:bind("","escape", function() modal:exit() end)

-- hs.window.setFrameCorrectness = true

-- define window movement/resize operation mappings
local arrowMap = {
  k = { half = { 0, 0, 1,.5}, movement = { 0,-20}, complement = "h", resize = "Shorter" },
  j = { half = { 0,.5, 1,.5}, movement = { 0, 20}, complement = "l", resize = "Taller" },
  h = { half = { 0, 0,.5, 1}, movement = {-20, 0}, complement = "j", resize = "Thinner" },
  l = { half = {.5, 0,.5, 1}, movement = { 20, 0}, complement = "k", resize = "Wider" },
}

-- compose screen quadrants from halves
local function quadrant(t1, t2)
  return {t1[1] + t2[1], t1[2] + t2[2], .5, .5}
end

-- move and/or resize windows
local function rect(rect)
  return function()
    undo:push()
    local win = fw()
    if win then win:move(rect) end
  end
end

-- window modal management

-- maximize window
modal:bind("","m", function() rect({0, 0, 1, 1})() end)

-- moving/re-sizing windows
hs.fnutils.each({"h", "l", "k", "j"}, function(arrow)
    local dir = { h = "Left", j = "Down", k = "Up", l = "Right"}
    -- screen halves
    modal:bind({}, arrow, function()
                  undo:push()
                  rect(arrowMap[arrow].half)()
    end)
    -- incrementally
    modal:bind({"alt"}, arrow, function()
        undo:push()
        hs.grid['pushWindow'..dir[arrow]](fw())
    end)

    modal:bind({"shift"}, arrow, function()
        undo:push()
        hs.grid['resizeWindow'..arrowMap[arrow].resize](fw())
    end)
end)

-- moving windows around screens
modal:bind({}, 'n', function() undo:push(); fw():moveOneScreenWest() end)
modal:bind({}, 'p', function() undo:push(); fw():moveOneScreenEast() end)

-- hs.window.setFrameCorrectness = true

-- jumping between windows
hs.fnutils.each({"h", "l", "k", "j"}, function(arrow)
    local dir = { h = "West", j = "South", k = "North", l = "East"}
    modal:bind({"cmd"}, arrow, function()
                  hs.window.filter['focus'..dir[arrow]]()
                  highlighActiveWin()
 exitModals()
    end)
end)

-- window grid
hs.grid.setMargins({0, 0})
modal:bind("", "g", function()
              local gridSize = hs.grid.getGrid()
              undo:push()
              hs.grid.setGrid("2x2")
              hs.grid.show(function() hs.grid.setGrid(gridSize) end)
              exitModals()
end)

-- undo for window operations
undo = {}

function undo:push()
  local win = fw()
  if win and not undo[win:id()] then
    self[win:id()] = win:frame()
  end
end

function undo:pop()
  local win = fw()
  if win and self[win:id()] then
    win:setFrame(self[win:id()])
    self[win:id()] = nil
  end
end

modal:bind("", "u", function() undo:pop() end)

function highlighActiveWin()
  local rect = hs.drawing.rectangle(fw():frame())
  rect:setStrokeColor({["red"]=1,  ["blue"]=0, ["green"]=1, ["alpha"]=1})
  rect:setStrokeWidth(5)
  rect:setFill(false)
  rect:show()
  hs.timer.doAfter(0.5, function() rect:delete() end)
end

function maximize_window()
  rect({0,0,1,1})()
end
