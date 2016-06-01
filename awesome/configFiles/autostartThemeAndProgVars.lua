-- 40 -> 86
-- {{{ Autostart applications
function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
     findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

run_once("urxvtd")
run_once("unclutter -root")
-- }}}


-- {{{ Variable definitions

-- beautiful init
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/steamburn/theme.lua")

-- common
modkey     = "Mod4"
altkey     = "Mod1"
terminal   = "terminator" or "xterm"
editor     = os.getenv("EDITOR") or "subl" or "gedit"
editor_cmd = terminal .. " -e " .. editor

-- user defined
browser    = "firefox"
browser2   = "iron"
gui_editor = "gvim"
graphics   = "gimp"

-- lain
lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol    = 1

local layouts = {
    awful.layout.suit.floating,
    lain.layout.uselessfair.horizontal,
    lain.layout.uselesstile,
    lain.layout.uselessfair,
    lain.layout.termfair,
    lain.layout.uselesspiral.dwindle
}
-- }}}
