require 'mp.msg'

function disable_hr_seek()
  local format = mp.get_property("video-format")
  if format == "hevc" then
    mp.set_property("hr-seek","no")
    mp.msg.info("disable hr seek for hevc")
  end
end

mp.register_event("file-loaded", disable_hr_seek)
