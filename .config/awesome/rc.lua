-- {{{ Required libraries
local awful      = require("awful")
awful.rules      = require("awful.rules")
local gears      = require("gears")
local wibox      = require("wibox")
local beautiful  = require("beautiful")
local naughty    = require("naughty")
local lain       = require("lain")
local blingbling = require("blingbling")
local awpomodoro = require("awpomodoro")
require("awful.autofocus")
require("eminent")
require("revelation")
require('couth.couth')
require('couth.alsa')
-- }}}

-- {{{ Move the cursor
local safeCoords               = {x=1600, y=900}
local chromeCloseDownloadBar = {x=3180, y=876}
local mouseMoveInterval        = 15
local moveMouseOnStartup       = true
if moveMouseOnStartup then
    awful.util.spawn("xdotool mousemove " .. safeCoords.x .. " " .. safeCoords.y)
end
-- }}}

-- {{{ Error handling
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
        title = "Oops, an error happened!",
        text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Autostart applications
function run_once(cmd)
    findme = cmd
    firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace-1)
    end
    awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

run_once("goldendict")
run_once("fcitx")
run_once("conky -c ~/.conky/.conkyrc-2-dark&")
run_once("compton --config ~/.compton.conf -b")
run_once("nm-applet")
run_once("udisks-glue")

function run_or_raise(cmd, properties)
    local clients = client.get()
    local focused = awful.client.next(0)
    local findex = 0
    local matched_clients = {}
    local n = 0
    for i, c in pairs(clients) do
        --make an array of matched clients
        if match(properties, c) then
            n = n + 1
            matched_clients[n] = c
            if c == focused then
                findex = n
            end
        end
    end
    if n > 0 then
        local c = matched_clients[1]
        -- if the focused window matched switch focus to next in list
        if 0 < findex and findex < n then
            c = matched_clients[findex+1]
        end
        local ctags = c:tags()
        if #ctags == 0 then
            -- ctags is empty, show client on current tag
            local curtag = awful.tag.selected()
            awful.client.movetotag(curtag, c)
        else
            -- Otherwise, pop to first tag client is visible on
            awful.tag.viewonly(ctags[1])
        end
        -- And then focus the client
        client.focus = c
        c:raise()
        return
    end
    awful.util.spawn(cmd)
end

-- Returns true if all pairs in table1 are present in table2
function match (table1, table2)
    for k, v in pairs(table1) do
        if table2[k] ~= v and not table2[k]:find(v) then
            return false
        end
    end
    return true
end
-- }}}

-- {{{ Variable definitions
naughty.config.presets.normal.opacity      = 0.7
naughty.config.presets.low.opacity         = 0.7
naughty.config.presets.critical.opacity    = 0.7
naughty.config.defaults.font               = 'Monaco for powerline 9'
couth.CONFIG.NOTIFIER_FONT                 = 'Monaco for powerline 10'

-- localization
os.setlocale(os.getenv("LANG"))

-- beautiful init
beautiful.init(awful.util.getdir("config") .. "/themes/powerarrow-darker/theme.lua")

-- common
modkey     = "Mod4"
altkey     = "Mod1"
terminal   = "urxvt"
terminalp  = "urxvt -e tmux -2"
editor     = "vim"
geditor    = "gvim"
graphics   = "gimp"
editor_cmd = terminal .. " -e " .. editor

-- user defined
browser   = "google-chrome-stable"
mail      = terminal .. " -e mutt"
fm        = terminal .. " -e vifm"
chat      = terminal .. " -e weechat-curses"
mixer     = terminal .. " -e alsamixer"
musicplr  = terminal .. " -e ncmpcpp"
processes = terminal .. " -e htop"

local layouts = {
    awful.layout.suit.max,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
}
-- }}}

-- {{{ Tags
tags = {
    names = { 'あ ','い ','う ','え ','お ' },
    layout = { layouts[1], layouts[1], layouts[1], layouts[1], layouts[1] }
}

for s = 1, screen.count() do
    tags[s] = awful.tag(tags.names, s, tags.layout)
end
-- }}}

-- {{{ Menu
-- Auto generated menu
--require('freedesktop.utils')
--require('freedesktop.menu')
--freedesktop.utils.terminal = terminal
--freedesktop.utils.icon_theme = 'gnome'
--menu_items = freedesktop.menu.new()

menu_items = {}
myawesomemenu = {
    { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua"},
    { "manual",      terminal .. " -e man awesome"},
    { "restart",     awesome.restart},
    { "quit",        awesome.quit}
}
table.insert(menu_items, { "awesome", myawesomemenu, beautiful.awesome_icon })
table.insert(menu_items, { "open terminal", terminal})

mymainmenu = awful.menu.new({ items = menu_items, width = 150 })
-- }}}

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- {{{ Wibox
markup = lain.util.markup
red    = "#EA6F81"

-- Textclock
mytextclock = awful.widget.textclock(" %a %d %b  %H:%M  ")
pmdr = awpomodoro()

-- calendar
--calendar = blingbling.calendar()
--calendar:set_link_to_external_calendar(true)
lain.widgets.calendar:attach(mytextclock, { font_size = 10 })

-- Mail IMAP check
mailicon = wibox.widget.imagebox(beautiful.widget_mail)
mailicon:buttons(awful.util.table.join(awful.button({ }, 1, function () awful.util.spawn(mail) end)))
--mailwidget = wibox.widget.background(lain.widgets.imap({
--    timeout  = 180,
--    server   = "stmp.gmail.com",
--    mail     = "",
--    password = "",
--    settings = function()
--        if mailcount > 0 then
--            widget:set_text(" " .. mailcount .. " ")
--            mailicon:set_image(beautiful.widget_mail_on)
--        else
--            widget:set_text("")
--            mailicon:set_image(beautiful.widget_mail)
--        end
--    end
--}), "#313131")

-- MPD
artist = ""
title  = ""
mpdicon = wibox.widget.imagebox(beautiful.widget_music)
mpdicon:buttons(awful.util.table.join(
awful.button({ }, 1, function () awful.util.spawn_with_shell(musicplr) end),
awful.button({ }, 3, function () awful.util.spawn_with_shell("mpc toggle") end)
))

mpdwidget = lain.widgets.mpd({
    settings = function()
        if mpd_now.state == "play" and mpd_now.artist ~= "N/A" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(beautiful.widget_music_on)
        elseif mpd_now.state == "pause" then
            artist = " mpd "
            title  = "paused "
        elseif mpd_now.state == "stop" then
            artist = ""
            title  = ""
            mpdicon:set_image(beautiful.widget_music)
        end

        widget:set_markup(markup(red, artist) .. title)
    end
})
mpdwidgetbg = wibox.widget.background(mpdwidget, "#313131")

-- MEM
memicon = blingbling.task_warrior.new({
    menu_icon    = beautiful.widget_mem,
    project_icon = beautiful.project_icon,
    task_icon    = beautiful.task_icon,
    task_done    = beautiful.task_done_icon,
    width        = 150
})
memwidget = lain.widgets.mem({
    settings = function()
        widget:set_text(" " .. mem_now.used .. "MB ")
    end
})
blingbling.popups.htop(memwidget,
{
    title_color = beautiful.notify_font_color_1,
    user_color  = beautiful.notify_font_color_2,
    root_color  = beautiful.notify_font_color_3,
    sort_order  = 'mem'
})

-- CPU
cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
cpuwidget = wibox.widget.background(lain.widgets.cpu({
    settings = function()
        widget:set_markup(markup("#9abcde", string.format(" %02d%% ", cpu_now.usage)))
    end
}), "#313131")
blingbling.popups.htop(cpuwidget,
{
    title_color = beautiful.notify_font_color_1,
    user_color  = beautiful.notify_font_color_2,
    root_color  = beautiful.notify_font_color_3,
    sort_order  = 'cpu'
})
blingbling.popups.cpufreq(cpuicon,
{
    title_color = beautiful.notify_font_color_1,
    low_color   = beautiful.notify_font_color_2,
    high_color  = beautiful.notify_font_color_3,
})

-- Coretemp
tempicon = wibox.widget.imagebox(beautiful.widget_temp)
tempwidget = lain.widgets.temp({
    settings = function()
        widget:set_text(" " .. coretemp_now .. "°C ")
    end
})
blingbling.popups.cpusensors(tempwidget,
{
    cpu_color   = "#9fcfff",
    safe_color  = beautiful.notify_font_color_2,
    high_color  = beautiful.notify_font_color_1,
    crit_color  = beautiful.notify_font_color_3,
})

-- / fs
udisks_glue = blingbling.udisks_glue.new({
    menu_icon   = beautiful.widget_hdd,
    Cdrom_icon  = beautiful.cdrom,
    Usb_icon    = beautiful.usb,
    mount_icon  = beautiful.accept,
    umount_icon = beautiful.cancel
})
fswidget = lain.widgets.fs({
    settings  = function()
        widget:set_text(" " .. fs_now.used .. "% ")
    end
})
-- blingbling.popups.fstat(fswidget,
-- {
--     title_color      = "#9fcfff",
--     total_color      = beautiful.notify_font_color_1,
--     percentage_color = beautiful.notify_font_color_2,
--     tmp_color        = beautiful.notify_font_color_3
-- })

fswidgetbg = wibox.widget.background(fswidget, "#313131")

-- Battery
baticon = wibox.widget.imagebox(beautiful.widget_battery)
batwidget = lain.widgets.bat({
    settings = function()
        if  bat_now.perc == "N/A" then
            bat_now.perc = "AC"
            baticon:set_image(beautiful.widget_ac)
        elseif tonumber(bat_now.perc) <= 5 then
            baticon:set_image(beautiful.widget_battery_empty)
        elseif tonumber(bat_now.perc) <= 15 then
            baticon:set_image(beautiful.widget_battery_low)
        else
            baticon:set_image(beautiful.widget_battery)
        end
        widget:set_markup(" " .. bat_now.perc .. "% ")
    end,
    battery = 'BAT1'
})

-- ALSA volume
volicon = wibox.widget.imagebox(beautiful.widget_vol)
volicon:buttons(awful.util.table.join(
awful.button({ }, 1, function () awful.util.spawn_with_shell(mixer) end),
awful.button({ }, 4, function () couth.notifier:notify( couth.alsa:setVolume('Master','2dB+')) volumewidget.update() end),
awful.button({ }, 5, function () couth.notifier:notify( couth.alsa:setVolume('Master','2dB-')) volumewidget.update() end)
))
volumewidget = lain.widgets.alsa({
    settings = function()
        if volume_now.status == "off" then
            volicon:set_image(beautiful.widget_vol_mute)
        elseif tonumber(volume_now.level) == 0 then
            volicon:set_image(beautiful.widget_vol_no)
        elseif tonumber(volume_now.level) <= 50 then
            volicon:set_image(beautiful.widget_vol_low)
        else
            volicon:set_image(beautiful.widget_vol)
        end

        widget:set_text(" " .. volume_now.level .. "% ")
    end
})

-- Net
neticon = wibox.widget.imagebox(beautiful.widget_net)
netwidget = wibox.widget.background(lain.widgets.net({
    settings = function()
        widget:set_markup(markup.font("Monofur 12",
        markup("#7AC82E", " " .. string.format("%05.1f", net_now.received))
        .. " " ..
        markup("#46A8C3", " " .. string.format("%05.1f", net_now.sent) .. " ")))
    end
}), "#313131")
blingbling.popups.ipstat(neticon,
{
    title_color = beautiful.notify_font_color_1,
    ip_color    = beautiful.notify_font_color_2
})
blingbling.popups.netstat(netwidget,
{
    title_color       = beautiful.notify_font_color_1,
    established_color = beautiful.notify_font_color_3,
    listen_color      = beautiful.notify_font_color_2
})


-- Separators
spr = wibox.widget.textbox(' ')
arrl = wibox.widget.imagebox()
arrl:set_image(beautiful.arrl)
arrl_dl = wibox.widget.imagebox()
arrl_dl:set_image(beautiful.arrl_dl)
arrl_ld = wibox.widget.imagebox()
arrl_ld:set_image(beautiful.arrl_ld)

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
awful.button({ }, 1, awful.tag.viewonly),
awful.button({ modkey }, 1, awful.client.movetotag),
awful.button({ }, 3, awful.tag.viewtoggle),
awful.button({ modkey }, 3, awful.client.toggletag),
awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
)
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
awful.button({ }, 1, function (c)
    if c == client.focus then
        c.minimized = true
    else
        -- Without this, the following
        -- :isvisible() makes no sense
        c.minimized = false
        if not c:isvisible() then
            awful.tag.viewonly(c:tags()[1])
        end
        -- This will also un-minimize
        -- the client, if needed
        client.focus = c
        c:raise()
    end
end),
awful.button({ }, 3, function ()
    if instance then
        instance:hide()
        instance = nil
    else
        instance = awful.menu.clients({ width=250 })
    end
end),
awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
end),
awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
end))

for s = 1, screen.count() do

    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()

    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
    awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, height = 18 })

    -- Widgets that are aligned to the upper left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(spr)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])
    left_layout:add(spr)

    -- Widgets that are aligned to the upper right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(spr)
    right_layout:add(arrl)
    right_layout:add(arrl_ld)
    right_layout:add(mpdicon)
    right_layout:add(mpdwidgetbg)
    right_layout:add(arrl_dl)
    right_layout:add(volicon)
    right_layout:add(volumewidget)
    right_layout:add(arrl_ld)
    right_layout:add(mailicon)
    --right_layout:add(mailwidget)
    right_layout:add(arrl_dl)
    right_layout:add(memicon)
    right_layout:add(memwidget)
    right_layout:add(arrl_ld)
    right_layout:add(cpuicon)
    right_layout:add(cpuwidget)
    right_layout:add(arrl_dl)
    right_layout:add(tempicon)
    right_layout:add(tempwidget)
    right_layout:add(arrl_ld)
    right_layout:add(udisks_glue)
    right_layout:add(fswidgetbg)
    right_layout:add(arrl_dl)
    right_layout:add(baticon)
    right_layout:add(batwidget)
    right_layout:add(arrl_ld)
    right_layout:add(neticon)
    right_layout:add(netwidget)
    right_layout:add(arrl_dl)
    right_layout:add(mytextclock)
    right_layout:add(pmdr)
    right_layout:add(spr)
    right_layout:add(arrl_ld)
    right_layout:add(mylayoutbox[s])
    if s == 1 then right_layout:add(wibox.widget.systray()) end

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)
    mywibox[s]:set_widget(layout)

end
-- }}}

-- {{{ Mouse Bindings
root.buttons(awful.util.table.join(
awful.button({ }, 3, function () mymainmenu:toggle() end),
awful.button({ }, 4, awful.tag.viewnext),
awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Multiple screens
-- Get active outputs
local function outputs()
    local outputs = {}
    local xrandr = io.popen("xrandr -q")
    if xrandr then
        for line in xrandr:lines() do
            output = line:match("^([%w-]+) connected ")
            if output then
                outputs[#outputs + 1] = output
            end
        end
        xrandr:close()
    end

    return outputs
end

local function arrange(out)
    -- We need to enumerate all the way to combinate output. We assume
    -- we want only an horizontal layout.
    local choices  = {}
    local previous = { {} }
    for i = 1, #out do
        -- Find all permutation of length `i`: we take the permutation
        -- of length `i-1` and for each of them, we create new
        -- permutations by adding each output at the end of it if it is
        -- not already present.
        local new = {}
        for _, p in pairs(previous) do
            for _, o in pairs(out) do
                if not awful.util.table.hasitem(p, o) then
                    new[#new + 1] = awful.util.table.join(p, {o})
                end
            end
        end
        choices = awful.util.table.join(choices, new)
        previous = new
    end

    return choices
end

-- Build available choices
local function menu()
    local menu = {}
    local out = outputs()
    local choices = arrange(out)

    for _, choice in pairs(choices) do
        local cmd = "xrandr"
        -- Enabled outputs
        for i, o in pairs(choice) do
            cmd = cmd .. " --output " .. o .. " --auto"
            if i > 1 then
                cmd = cmd .. " --right-of " .. choice[i-1]
            end
        end
        -- Disabled outputs
        for _, o in pairs(out) do
            if not awful.util.table.hasitem(choice, o) then
                cmd = cmd .. " --output " .. o .. " --off"
            end
        end

        local label = ""
        if #choice == 1 then
            label = 'Only <span weight="bold">' .. choice[1] .. '</span>'
        else
            for i, o in pairs(choice) do
                if i > 1 then label = label .. " + " end
                label = label .. '<span weight="bold">' .. o .. '</span>'
            end
        end

        menu[#menu + 1] = { label,
        cmd,
        "/usr/share/icons/Faenza/devices/96/display.png"}
    end

    dlabel = 'Duplicate'
    dcmd = "xrandr"
    for i, o in pairs(out) do
        dcmd = dcmd .. " --output " .. o .. " --auto"
        if i > 1 then
            dcmd = dcmd .. " --same-as " .. out[1]
        end
    end
    menu[#menu + 1] = { dlabel,
    dcmd,
    "/usr/share/icons/Faenza/devices/96/display.png"}

    return menu
end

-- Display xrandr notifications from choices
local state = { iterator = nil,
timer = nil,
cid = nil }
local function xrandr()
    -- Stop any previous timer
    if state.timer then
        state.timer:stop()
        state.timer = nil
    end

    -- Build the list of choices
    if not state.iterator then
        state.iterator = awful.util.table.iterate(menu(),
        function() return true end)
    end

    -- Select one and display the appropriate notification
    local next  = state.iterator()
    local label, action, icon
    if not next then
        label, icon = "Keep the current configuration", "/usr/share/icons/Faenza/devices/96/display.png"
        state.iterator = nil
    else
        label, action, icon = unpack(next)
    end
    state.cid = naughty.notify({ text = label,
    icon = icon,
    timeout = 4,
    screen = mouse.screen, -- Important, not all screens may be visible
    font = "Monaco 18",
    replaces_id = state.cid }).id

    -- Setup the timer
    state.timer = timer { timeout = 4 }
    state.timer:connect_signal("timeout",
    function()
        state.timer:stop()
        state.timer = nil
        state.iterator = nil
        if action then
            awful.util.spawn(action, false)
        end
    end)
    state.timer:start()
end
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(

-- {{ mouse control
awful.key({ modkey, altkey }, "m", function() awful.util.spawn("xdotool mousemove " .. safeCoords.x .. " " .. safeCoords.y) end),
awful.key({ modkey, altkey }, "d", function() awful.util.spawn("xdotool mousemove " .. chromeCloseDownloadBar.x .. " " .. chromeCloseDownloadBar.y .. " click 1") end),
awful.key({ modkey, altkey }, "j", function() awful.util.spawn("xdotool mousemove_relative 0 " .. mouseMoveInterval) end),
awful.key({ modkey, altkey }, "k", function() awful.util.spawn("xdotool mousemove_relative 0 -" .. mouseMoveInterval) end),
awful.key({ modkey, altkey }, "h", function() awful.util.spawn("xdotool mousemove_relative -- -" .. mouseMoveInterval .. " 0") end),
awful.key({ modkey, altkey }, "l", function() awful.util.spawn("xdotool mousemove_relative " .. mouseMoveInterval .. " 0") end),
-- }}

-- {{ Transparency
awful.key({ modkey }, "=",  function() awful.util.spawn("transset-df -a --inc 0.05") end),
awful.key({ modkey }, "-",  function() awful.util.spawn("transset-df -a --dec 0.05") end),
-- }}

-- {{ Navigate
awful.key({ modkey }, "Left",   awful.tag.viewprev       ),
awful.key({ modkey }, "Right",  awful.tag.viewnext       ),
awful.key({ modkey }, "Escape", awful.tag.history.restore),
awful.key({ modkey }, "w",      revelation),
-- }}

-- {{ Non-empty tag browsing
awful.key({ altkey }, "w",     function () mymainmenu:show({ keygrabber = true }) end),
awful.key({ altkey }, "Left",  function () lain.util.tag_view_nonempty(-1)        end),
awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1)         end),
awful.key({ modkey }, "F1", xrandr), -- Multiple screens
-- }}

-- {{ Default client focus
awful.key({ modkey }, "k", function () awful.client.focus.byidx( 1) if client.focus then client.focus:raise() end end),
awful.key({ modkey }, "j", function () awful.client.focus.byidx(-1) if client.focus then client.focus:raise() end end),
-- }}

-- {{ By direction client focus
awful.key({ altkey }, "j", function() awful.client.focus.bydirection("down")  if client.focus then client.focus:raise() end end),
awful.key({ altkey }, "k", function() awful.client.focus.bydirection("up")    if client.focus then client.focus:raise() end end),
awful.key({ altkey }, "h", function() awful.client.focus.bydirection("left")  if client.focus then client.focus:raise() end end),
awful.key({ altkey }, "l", function() awful.client.focus.bydirection("right") if client.focus then client.focus:raise() end end),
-- }}

-- {{ Show/Hide Wibox
awful.key({ modkey }, "b", function () mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible end),
-- }}

-- {{ Layout manipulation
awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
awful.key({ modkey,           }, "Tab",
function ()
    awful.client.focus.history.previous()
    if client.focus then
        client.focus:raise()
    end
end),
awful.key({ modkey,           }, "l",      function () awful.tag.incmwfact( 0.05)     end),
awful.key({ modkey,           }, "h",      function () awful.tag.incmwfact(-0.05)     end),
awful.key({ modkey, "Shift"   }, "h",      function () awful.tag.incnmaster( 1)       end),
awful.key({ modkey, "Shift"   }, "l",      function () awful.tag.incnmaster(-1)       end),
awful.key({ modkey, "Control" }, "h",      function () awful.tag.incncol( 1)          end),
awful.key({ modkey, "Control" }, "l",      function () awful.tag.incncol(-1)          end),
awful.key({ modkey,           }, "space",  function () awful.layout.inc(layouts,  1)  end),
awful.key({ modkey, "Shift"   }, "space",  function () awful.layout.inc(layouts, -1)  end),
awful.key({ modkey, "Control" }, "n",      awful.client.restore),
-- }}

-- {{ Standard program
awful.key({ modkey, "Control" }, "r",      awesome.restart),
awful.key({ modkey, "Shift"   }, "q",      awesome.quit),
-- }}

-- {{ ALSA volume control
awful.key({ modkey }, "F9", function () couth.notifier:notify( couth.alsa:setVolume('Master','2dB+')) volumewidget.update() end),
awful.key({ modkey }, "F8", function () couth.notifier:notify( couth.alsa:setVolume('Master','2dB-')) volumewidget.update() end),
awful.key({ modkey }, "F7", function () couth.notifier:notify( couth.alsa:setVolume('Master','toggle')) volumewidget.update() end),
-- }}

-- {{ MPD control
awful.key({ modkey }, "F11", function () awful.util.spawn_with_shell("mpc toggle") end),
awful.key({ modkey }, "F10", function () awful.util.spawn_with_shell("mpc prev")   end),
awful.key({ modkey }, "F12", function () awful.util.spawn_with_shell("mpc next")   end),
-- }}

-- {{ XF86keys
awful.key({}, "XF86AudioRaiseVolume", function () couth.notifier:notify( couth.alsa:setVolume('Master','2dB+')) volumewidget.update() end),
awful.key({}, "XF86AudioLowerVolume", function () couth.notifier:notify( couth.alsa:setVolume('Master','2dB-')) volumewidget.update() end),
awful.key({}, "XF86AudioMute", function () couth.notifier:notify( couth.alsa:setVolume('Master','toggle')) volumewidget.update() end),
awful.key({}, "XF86AudioPlay", function () awful.util.spawn_with_shell("mpc toggle") end),
awful.key({}, "XF86AudioPrev", function () awful.util.spawn_with_shell("mpc prev")   end),
awful.key({}, "XF86AudioNext", function () awful.util.spawn_with_shell("mpc next")   end),
awful.key({}, "XF86Display", xrandr),
-- }}

-- System
awful.key({ modkey }, "c",   function () os.execute("xsel -p -o | xsel -i -b") end),
awful.key({ modkey }, "p",   function () awful.util.spawn_with_shell("gnome-screenshot")   end),

-- User programs
awful.key({ modkey }, "s",      function () awful.util.spawn("xscreensaver-command -activate")          end ),
awful.key({ modkey }, "i",      function () awful.util.spawn_with_shell(chat)                           end ),
awful.key({ modkey }, "e",      function () awful.util.spawn_with_shell(fm)                             end ),
awful.key({ modkey }, "a",      function () awful.util.spawn_with_shell("mess")                         end ),
awful.key({ modkey }, "m",      function () awful.util.spawn_with_shell(musicplr)                       end ),
awful.key({ modkey }, "v",      function () run_or_raise(geditor,   { name  = "GVIM"          })        end ),
awful.key({ modkey }, "g",      function () run_or_raise(graphics,  { name  = "Gimp"          })        end ),
awful.key({ modkey }, "n",      function () run_or_raise(browser,   { class = "Google-chrome" })        end ),
awful.key({ modkey }, "Return", function () run_or_raise(terminalp, { class = "URxvt"         })        end ),

-- Prompt
-- awful.key({ modkey }, "r", function () mypromptbox[mouse.screen]:run() end),
awful.key({ modkey }, "r", function () awful.util.spawn("gmrun") end),
awful.key({ modkey }, "x",
function ()
    awful.prompt.run({ prompt = "Run Lua code: " },
    mypromptbox[mouse.screen].widget,
    awful.util.eval, nil,
    awful.util.getdir("cache") .. "/history_eval")
end)
)

clientkeys = awful.util.table.join(
awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
awful.key({ modkey, "Shift"   }, "z",
function (c)
    -- The client currently has the input focus, so it cannot be
    -- minimized, since minimized clients can't have the focus.
    c.minimized = true
end),
awful.key({ modkey, "Shift"   }, "m",
function (c)
    c.maximized_horizontal = not c.maximized_horizontal
    c.maximized_vertical   = not c.maximized_vertical
end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9,
    function ()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
            awful.tag.viewonly(tag)
        end
    end),
    awful.key({ modkey, "Control" }, "#" .. i + 9,
    function ()
        local screen = mouse.screen
        local tag = awful.tag.gettags(screen)[i]
        if tag then
            awful.tag.viewtoggle(tag)
        end
    end),
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
    function ()
        local tag = awful.tag.gettags(client.focus.screen)[i]
        if client.focus and tag then
            awful.client.movetotag(tag)
        end
    end),
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
    function ()
        local tag = awful.tag.gettags(client.focus.screen)[i]
        if client.focus and tag then
            awful.client.toggletag(tag)
        end
    end))
end

clientbuttons = awful.util.table.join(
awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
awful.button({ modkey }, 1, awful.mouse.client.move),
awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
    properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        keys = clientkeys,
        buttons = clientbuttons,
        size_hints_honor = false } },
        { rule = { class = "URxvt" },
        properties = { opacity = 0.90 } },
        { rule = { class = "Gvim" },
        properties = { opacity = 0.90 } },
        { rule = { class = "Screenkey" },
        properties   = {
            opacity  = 0.50,
            floating = true,
            ontop    = true,
            focus    = false },
        callback = function( c )
            c:geometry( { x = 0, width = 3200, y = 700, height = 120 } )
        end },
        { rule = { class = "MPlayer" },
        properties = { floating = true } },
        { rule = { class = "vbam" },
        properties = { floating = true } },
        -- { rule = { class = "Google-chrome-stable" },
        -- properties = { tag = tags[1][2] } },
        { rule = { class = "Gimp" },
        properties = { tag = tags[1][3] } },
        { rule = { class = "Eclipse" },
        properties = { tag = tags[1][4] } },
        { rule = { class = "Steam" },
        properties = { tag = tags[1][5] } },
        { rule = { instance = "exe" },
        properties = { floating = true,
        fullscreen = true } },
        { rule = { instance = "plugin-container" },
        properties = { floating = true,
        fullscreen = true } },
        { rule = { class = "Gimp", role = "gimp-image-window" },
        properties = { maximized_horizontal = true,
        maximized_vertical = true } },
    }
-- }}}
-- vim:ts=4:sw=4:tw=0:ft=lua:fdm=marker:fdls=0
