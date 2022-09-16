-- manage screen brightness

hs.redshift.start(3000, '20:00', '7:00', '2h')

function brightness_toggle()
  local current_brightness = hs.brightness.get()
  if current_brightness > 0 then
    hs.brightness.set(0)
  else
    hs.brightness.set(100)
  end
end


function greyscale_toggle()
  hs.screen.setForceToGray(not hs.screen.getForceToGray())
end

function night_toggle()
  hs.redshift.toggle()
end
