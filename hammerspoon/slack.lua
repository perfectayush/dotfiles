-- Improving Slack
-- Use C-j, C-k bindings for scrolling in slack

function hsAppWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.activated) then
    if (appName == "Slack") then
      hs.fnutils.each(scrollKeys, function(k) k:enable() end)
    else
      hs.fnutils.each(scrollKeys, function(k) k:disable() end)
    end
  end
end

scrollKeys = {}
hs.fnutils.each({{key = "j", dir = -3}, {key = "k", dir = 3}}, function(k)
    function scrollFn()
      hs.eventtap.scrollWheel({0, k.dir}, {})
    end
    scrollKeys[k.key] = hs.hotkey.new({"ctrl"}, k.key, scrollFn, nil, scrollFn)
end)

local appWatcher = hs.application.watcher.new(hsAppWatcher)
appWatcher:start()
