-- open/hide emacs on shift + f12
hs.hotkey.bind("shift", "F12", function()
                 local emacs = hs.application.get('Emacs')
                 if emacs == nil then
                   hs.application.launchOrFocus('Emacs')
                 elseif emacs:isFrontmost() then
                   emacs:hide()
                 else
                   emacs:activate()
                 end
end)
