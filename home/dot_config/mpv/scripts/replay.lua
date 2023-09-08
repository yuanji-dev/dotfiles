-- https://github.com/mpv-player/mpv/issues/11183
mp.observe_property("pause", "bool", function(name, value)
  if value == true and mp.get_property("eof-reached") == "yes" then
    mp.command("no-osd seek 0 absolute")
  end
end)
