-- open/hide app on shift + f12

function bring_forward_application(application)
  local app = hs.application.get(application)
  if app == nil then
    hs.application.launchOrFocus(application)
  elseif app:isFrontmost() then
    app:hide()
  else
    app:activate()
  end
end

hs.hotkey.bind("shift", "F12", function() bring_forward_application("Emacs") end)

