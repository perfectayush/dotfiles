-- manage screen brightness

function brightness_toggle()
  local current_brightness = hs.brightness.get()
  if current_brightness > 0 then
    hs.brightness.set(0)
  else
    hs.brightness.set(100)
  end
end
