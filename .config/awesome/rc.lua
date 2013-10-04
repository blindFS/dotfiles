-------{ libs |-------------------------------------------------------------------------------------
-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")

require("vicious")
require('couth.couth')
require('couth.alsa')
require("blingbling")
require("revelation")
require("eminent")

-- Load Debian menu entries
require("debian.menu")
----------------------------------------------------------------------------------------------------}
-------{ error-handling |---------------------------------------------------------------------------
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title  = "Oops, there were errors during startup!",
                     text   = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.add_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title  = "Oops, an error happened!",
                         text   = err })
        in_error = false
    end)
end

----------------------------------------------------------------------------------------------------}
-------{ run_once/run or raise |--------------------------------------------------------------------

function run_once(cmd)
    findme = cmd
    firstspace = cmd:find(" ")
    if firstspace then
        findme = cmd:sub(0, firstspace-1)
    end
    awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

--- Spawns cmd if no client can be found matching properties
-- If such a client can be found, pop to first tag where it is visible, and give it focus
-- @param cmd the command to execute
-- @param properties a table of properties to match against clients.  Possible entries: any properties of the client object
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

----------------------------------------------------------------------------------------------------}
------{ Autostart |---------------------------------------------------------------------------------

awful.util.spawn_with_shell("xsetroot -cursor_name left_ptr")

run_once("gnome-settings-daemon &")
run_once("conky -c /home/farseer/.conky/.conkyrc-2-dark&")
run_once("compton --config ~/.compton.conf -b")
run_once("nm-applet")
run_once("udisks-glue")
run_once("autokey")
run_once("glipper")

----------------------------------------------------------------------------------------------------}
-------{ Java GUI's fix |---------------------------------------------------------------------------

awful.util.spawn_with_shell("wmname LG3D")

----------------------------------------------------------------------------------------------------}
-------{ Variables |--------------------------------------------------------------------------------

modkey        = "Mod4"
terminal      = "urxvt"
termprompt    = "urxvt -e tmux -2"
editor        = "gvim"
browser       = "chromium-browser"
mailmutt      = terminal .. " -e mutt"
fm            = terminal .. " -e vifm"
chat          = terminal .. " -e weechat-curses"
musicplr      = terminal .. " -e ncmpcpp"
iptraf        = terminal .. " -e /home/farseer/bin/iptraf_all.sh"
canto         = terminal .. " -e canto"
processes     = terminal .. " -e htop"

----------------------------------------------------------------------------------------------------}
-------{ Theme |------------------------------------------------------------------------------------

config_dir = ("/home/farseer/.config/awesome/")
themes_dir = (config_dir .. "/themes")
beautiful.init(themes_dir .. "/powerarrow/theme.lua")

----------------------------------------------------------------------------------------------------}
-------{ Couth Alsa volume applet |-----------------------------------------------------------------

couth.CONFIG.ALSA_CONTROLS = { 'Master', 'PCM' }

----------------------------------------------------------------------------------------------------}
-------{ Table of layouts |-------------------------------------------------------------------------

layouts =
{
    awful.layout.suit.max,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.spiral,
    awful.layout.suit.magnified,
}

----------------------------------------------------------------------------------------------------}
-------{ Naughty theme |----------------------------------------------------------------------------

naughty.config.default_preset.font         = beautiful.notify_font
naughty.config.default_preset.fg           = beautiful.notify_fg
naughty.config.default_preset.bg           = beautiful.notify_bg
naughty.config.presets.normal.border_color = beautiful.notify_border
naughty.config.presets.normal.opacity      = 0.7
naughty.config.presets.low.opacity         = 0.7
naughty.config.presets.critical.opacity    = 0.7

----------------------------------------------------------------------------------------------------}
-------{ Tags |-------------------------------------------------------------------------------------

tags = {}
for s = 1, screen.count() do
    --tags[s] = awful.tag({ 'α','β','λ','μ','ξ' }, s, layouts[1])
    tags[s] = awful.tag({ 'あ ','い ','う ','え ','お ' }, s, layouts[1]);
    --tags[s] = awful.tag({ '我','是','大','傻','逼' }, s, layouts[1])
end

----------------------------------------------------------------------------------------------------}
-------{ Menu |-------------------------------------------------------------------------------------

myawesomemenu = {
    {"edit config",           "gvim /home/farseer/.config/awesome/rc.lua"},
    {"edit theme",            "gvim /home/farseer/.config/awesome/themes/powerarrow/theme.lua"},
    {"restart",               awesome.restart },
    {"quit",                  awesome.quit },
    {"power",                 "/home/farseer/bin/power.sh"},
}

mymainmenu = awful.menu.new({ items = {
    { " @wesome",             myawesomemenu, beautiful.awesome_icon },
}})

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = mymainmenu })

----------------------------------------------------------------------------------------------------}
-------{ Wibox |------------------------------------------------------------------------------------

mysystray = widget({ type = "systray" })
mywibox = {}
bowibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
    mytaglist.buttons = awful.util.table.join(
    awful.button({ },        1 , awful.tag.viewonly),
    awful.button({ modkey }, 1 , awful.client.movetotag),
    awful.button({ },        3 , awful.tag.viewtoggle),
    awful.button({ modkey }, 3 , awful.client.toggletag),
    awful.button({ },        4 , awful.tag.viewnext),
    awful.button({ },        5 , awful.tag.viewprev)
)
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
awful.button({ }, 1, function (c)
    if c == client.focus then
        c.minimized = true
    else
        if not c:isvisible() then
            awful.tag.viewonly(c:tags()[1])
        end
        client.focus = c
        c:raise()
    end
end),
awful.button({ }, 3, function ()
    if instance then
        instance:hide()
        instance = nil
    else
        instance = awful.menu.clients({ width=450 })
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
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
    awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
    awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
    awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
    mytasklist[s] = awful.widget.tasklist(function(c)
        return awful.widget.tasklist.label.currenttags(c, s)
    end, mytasklist.buttons)

----------------------------------------------------------------------------------------------------}
-------{ Chat widget |------------------------------------------------------------------------------

chaticon = widget ({type = "imagebox" })
chaticon.image = image(beautiful.widget_chat)
chaticon:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(chat) end)))

----------------------------------------------------------------------------------------------------}
-------{ Mail widget |------------------------------------------------------------------------------

mailicon = widget ({type = "imagebox" })
mailicon.image = image(beautiful.widget_mail)
mailicon:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(mailmutt) end)))

----------------------------------------------------------------------------------------------------}
-------{ Music widget |-----------------------------------------------------------------------------

music = widget ({type = "imagebox" })
music.image = image(beautiful.widget_music)
music:buttons(awful.util.table.join(
awful.button({ }, 1, function () awful.util.spawn_with_shell(musicplr) end),
awful.button({ }, 3, function () awful.util.spawn_with_shell("mpc toggle") end),
awful.button({ }, 4, function () couth.notifier:notify( couth.alsa:setVolume('PCM','2dB+')) end),
awful.button({ }, 5, function () couth.notifier:notify( couth.alsa:setVolume('PCM','2dB-')) end)
))
mpdwidget = widget({ type = "textbox" })
vicious.register(mpdwidget, vicious.widgets.mpd,
    function (widget, args)
        if args["{state}"] == "Stop" then
            return ""
        else
            return args["{Artist}"]..' - '.. args["{Title}"]
        end
    end, 10)

----------------------------------------------------------------------------------------------------}
-------{ RSS widget |-------------------------------------------------------------------------------

rsswidget = widget ({type = "imagebox" })
rsswidget.image = image(beautiful.widget_task)
rsswidget:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(canto) end)))

----------------------------------------------------------------------------------------------------}
-------{ MEM widget |-------------------------------------------------------------------------------

memwidget = widget({ type = "textbox" })
memicon = blingbling.task_warrior.new(beautiful.widget_mem)
memicon:set_task_done_icon(beautiful.task_done_icon)
memicon:set_task_icon(beautiful.task_icon)
memicon:set_project_icon(beautiful.project_icon)
vicious.register(memwidget, vicious.widgets.mem, '<span background="#777E76" font="hooge 05_53 14"> <span font="hooge 05_53 9" color="#EEEEEE" background="#777E76">$2 MB </span> </span>', 13)
blingbling.popups.htop(memwidget,
{
    title_color = beautiful.notify_font_color_1,
    user_color  = beautiful.notify_font_color_2,
    root_color  = beautiful.notify_font_color_3,
    sort_order  = "mem"
})

----------------------------------------------------------------------------------------------------}
-------{ CPU / sensors widget |---------------------------------------------------------------------

cpuwidget      = widget ({ type = "textbox"  })
cpuicon        = widget ({ type = "imagebox" })
sensors        = widget ({ type = "textbox"  })
tempicon       = widget ({ type = "imagebox" })

cpuicon.image  = image(beautiful.widget_cpu)
cpuicon:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(processes) end)))
tempicon.image = image(beautiful.widget_temp)
vicious.register(sensors, vicious.widgets.sensors)
vicious.register(cpuwidget, vicious.widgets.cpu,
'<span background="#4B696D" font="hooge 05_53 14"> <span font="hooge 05_53 9" color="#DDDDDD">$2% <span color="#888888">·</span> $3% </span> </span>', 3)
blingbling.popups.htop(cpuwidget,
{
    title_color = beautiful.notify_font_color_1,
    user_color  = beautiful.notify_font_color_2,
    root_color  = beautiful.notify_font_color_3,
    sort_order  = "cpu"
})
blingbling.popups.cpusensors(tempicon,
{
    cpu_color   = "#9fcfff",
    safe_color  = beautiful.notify_font_color_1,
    high_color  = beautiful.notify_font_color_2,
    crit_color  = beautiful.notify_font_color_3,
})

----------------------------------------------------------------------------------------------------}
-------{ FS's widget / udisks-glue menu |-----------------------------------------------------------

fswidget = widget({ type = "textbox" })
vicious.register(fswidget, vicious.widgets.fs,
    '<span background="#D0785D" font="hooge 05_53 14"> <span font="hooge 05_53 9" color="#EEEEEE">${/ used_p}% </span> </span>', 8)
udisks_glue = blingbling.udisks_glue.new(beautiful.widget_hdd)
udisks_glue:set_mount_icon(beautiful.accept)
udisks_glue:set_umount_icon(beautiful.cancel)
udisks_glue:set_detach_icon(beautiful.cancel)
udisks_glue:set_Usb_icon(beautiful.usb)
udisks_glue:set_Cdrom_icon(beautiful.cdrom)
awful.widget.layout.margins[udisks_glue.widget] = { top = 0}
udisks_glue.widget.resize = false

----------------------------------------------------------------------------------------------------}
-------{ Battery widget |---------------------------------------------------------------------------

baticon       = widget ({type = "imagebox" })
baticon.image = image(beautiful.widget_battery)
batwidget     = widget({ type = "textbox" })
vicious.register( batwidget, vicious.widgets.bat, '<span background="#92B0A0" font="hooge 05_53 14"> <span font="hooge 05_53 9" color="#FFFFFF" background="#92B0A0">$1$2% </span> </span>', 1, "BAT1" )

----------------------------------------------------------------------------------------------------}
-------{ Net widget |-------------------------------------------------------------------------------

netwidget = widget({ type = "textbox" })
vicious.register(netwidget,
vicious.widgets.net,
    '<span background="#C2C2A4" font="hooge 05_53 14"> <span font="hooge 05_53 9" color="#FFFFFF">${eth0 down_kb}↓ ${eth0 up_kb}↑</span> </span>', 3)
blingbling.popups.netstat(netwidget,
{
    title_color = beautiful.notify_font_color_1,
    established_color= beautiful.notify_font_color_3,
    listen_color=beautiful.notify_font_color_2
})
netwidget:buttons(awful.util.table.join(awful.button({ }, 1,
function () awful.util.spawn_with_shell(iptraf) end)))

neticon = blingbling.net.new({},beautiful.widget_net)
neticon:set_ippopup()
neticon:set_h_margin()

----------------------------------------------------------------------------------------------------}
-------{ text Clock |-------------------------------------------------------------------------------
tdwidget = widget({ type = "textbox" })
vicious.register(tdwidget, vicious.widgets.date, '<span background="#777E76" font="hooge 05_53 14"> <span font="hooge 05_53 9" color="#FFFFFF">◴  %b %d %I:%M</span> </span>', 4)

----------------------------------------------------------------------------------------------------}
-------{ Calendar widget |--------------------------------------------------------------------------

 my_cal = blingbling.calendar.new({type = "imagebox", image = beautiful.widget_cal})
 my_cal:set_cell_padding(4)
 my_cal:set_title_font_size(10)
 my_cal:set_title_text_color("#4F98C1")
 my_cal:set_font_size(10)
 my_cal:set_inter_margin(1)
 my_cal:set_columns_lines_titles_font_size(9)
 my_cal:set_columns_lines_titles_text_color("#d4aa00ff")
 my_cal:set_link_to_external_calendar(true) ---- <-- popup reminder

----------------------------------------------------------------------------------------------------}
-------{ Separators widgets |-----------------------------------------------------------------------

spr        = widget({ type         = "textbox" })
spr.text   = '  '
sprd       = widget({ type         = "textbox" })
sprd.text  = '<span background = "#313131" font = "hooge 05_53 14"> </span>'
spr3f      = widget({ type         = "textbox" })
spr3f.text = '<span background = "#777e76" font = "hooge 05_53 14"> </span>'
arr1       = widget ({type         = "imagebox" })
arr1.image = image(beautiful.arr1)
arr2       = widget ({type         = "imagebox" })
arr2.image = image(beautiful.arr2)
arr3       = widget ({type         = "imagebox" })
arr3.image = image(beautiful.arr3)
arr4       = widget ({type         = "imagebox" })
arr4.image = image(beautiful.arr4)
arr5       = widget ({type         = "imagebox" })
arr5.image = image(beautiful.arr5)
arr6       = widget ({type         = "imagebox" })
arr6.image = image(beautiful.arr6)
arr7       = widget ({type         = "imagebox" })
arr7.image = image(beautiful.arr7)
arr8       = widget ({type         = "imagebox" })
arr8.image = image(beautiful.arr8)
arr9       = widget ({type         = "imagebox" })
arr9.image = image(beautiful.arr9)
arr0       = widget ({type         = "imagebox" })
arr0.image = image(beautiful.arr0)


----------------------------------------------------------------------------------------------------}
-------{ Panel |------------------------------------------------------------------------------------

mywibox[s] = awful.wibox({ position = "top", screen = s, height = "16" })
bowibox[s] = awful.wibox({ position = "right", screen = s, width = "16" })
mywibox[s].widgets =
{
    { mylauncher, mytaglist[s], mypromptbox[s], layout = awful.widget.layout.horizontal.leftright },
    mylayoutbox[s],
    arr1,
    spr3f,
    tdwidget,
    spr3f,
    arr2,
    netwidget,
    neticon,
    arr3,
    batwidget,
    baticon,
    arr4,
    fswidget,
    udisks_glue.widget,
    arr5,
    sensors,
    tempicon,
    arr6,
    cpuwidget,
    cpuicon,
    arr7,
    memwidget,
    memicon.widget,
    arr8,
    rsswidget,
    arr9,
    chaticon,
    arr0,
    mailicon,
    arr9,
    my_cal.widget,
    spr,
    mpdwidget,
    music,
    spr,
    mysystray,
    --s == 1 and mysystray, spr or nil, mytasklist[s],
    layout = awful.widget.layout.horizontal.rightleft
}
bowibox[s].widgets =
{
    mytasklist[s],
    layout = awful.widget.layout.vertical.flex
}
end


----------------------------------------------------------------------------------------------------}
-------{ mouse bindings |---------------------------------------------------------------------------------
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

----------------------------------------------------------------------------------------------------}
-------{ keys |---------------------------------------------------------------------------------
function hide_bars()
    mywibox[mouse.screen].visible = not mywibox[mouse.screen].visible
    bowibox[mouse.screen].visible = not bowibox[mouse.screen].visible
end
globalkeys = awful.util.table.join(
    awful.key({ modkey            }, "w",      revelation               ),
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "q",
        function ()
            mymainmenu:show({keygrabber=true})
        end),

    -- Layout manipulation
    awful.key({ modkey            }, "b",               hide_bars),
    awful.key({ modkey, "Shift"   }, "j",               function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k",               function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j",               function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k",               function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u",               awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",               function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",               function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",               function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",               function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",               function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",               function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space",           function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space",           function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey },            "i",               function () awful.util.spawn_with_shell(chat)     end),
    awful.key({ modkey },            "e",               function () awful.util.spawn_with_shell(fm)       end),
    awful.key({ modkey },            "Return",          function () awful.util.spawn(termprompt)          end),
    awful.key({ modkey },            "m",               function () awful.util.spawn_with_shell(musicplr) end),
    awful.key({ modkey },            "s",               function () awful.util.spawn_with_shell(canto)    end),
    awful.key({ modkey, "Shift"   }, "m",               function () awful.util.spawn_with_shell(mailmutt) end),
    awful.key({ modkey },            "n",               function () run_or_raise(browser, { name = "Chromium" }) end),
    awful.key({ modkey },            "v",               function () run_or_raise(editor,  { name = "GVIM"     }) end),

    awful.key({ modkey },            "=",               function () awful.util.spawn_with_shell("transset -a --inc 0.05") end),
    awful.key({ modkey },            "-",               function () awful.util.spawn_with_shell("transset -a --dec 0.05") end),

    awful.key({ },                   "XF86Sleep",       function () awful.util.spawn_with_shell("sudo pm-hibernate") end),
    awful.key({ modkey },            "F11",             function () awful.util.spawn_with_shell("mpc toggle")        end),
    awful.key({ modkey },            "F10",             function () awful.util.spawn_with_shell("mpc prev")          end),
    awful.key({ modkey },            "F12",             function () awful.util.spawn_with_shell("mpc next")          end),
    awful.key({ modkey, "Control" }, "n",               awful.client.restore),

    -- Prompt
    awful.key({ modkey, "Shift"   }, "r",               function () mypromptbox[mouse.screen]:run()                    end),
    awful.key({ modkey},             "r",               function () awful.util.spawn_with_shell("gmrun")               end),
    awful.key({ modkey,           }, "x",               function () awful.util.spawn("xscreensaver-command -activate") end),
    awful.key({ modkey,           }, "p",               function () awful.util.spawn("wallscroll.sh")                  end),

    awful.key({ modkey , "Shift" },  "x",
        function ()
            awful.prompt.run({ prompt = "Run Lua code: " },
            mypromptbox[mouse.screen].widget,
            awful.util.eval, nil,
            awful.util.getdir("cache") .. "/history_eval")
        end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",               function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "c",               function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",           awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return",          function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",               awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "d",               function (c) c:redraw()                       end),
    awful.key({ modkey, "Shift"   }, "t",               function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey, "Shift"   }, "n",
        function (c)
            c.minimized = true
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(5, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(
        globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
            function ()
                local screen = mouse.screen
                if tags[screen][i] then
                    awful.tag.viewonly(tags[screen][i])
                end
            end
        ),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
            function ()
                local screen = mouse.screen
                if tags[screen][i] then
                    awful.tag.viewtoggle(tags[screen][i])
                end
            end
        ),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus and tags[client.focus.screen][i] then
                    awful.client.movetotag(tags[client.focus.screen][i])
                end
            end
        ),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
            function ()
                if client.focus and tags[client.focus.screen][i] then
                    awful.client.toggletag(tags[client.focus.screen][i])
                end
            end
        )
    )
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

----------------------------------------------------------------------------------------------------}
-------{ rules |---------------------------------------------------------------------------------
awful.rules.rules = {
    { rule = { },
        properties = { border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = true,
        keys = clientkeys,
        buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
        properties = { floating = true } },
    { rule = { class = "pinentry" },
        properties = { floating = true } },
    { rule = { class = "Gimp" },
        properties = { floating = true } },
    { rule = { class = "Firefox" },
        properties = { tag = tags[1][2] } },
    { rule = { class = "Chromium-browser" },
        properties = { tag = tags[1][2] } },
    { rule = { class = "Gvim" },
        properties = { opacity = 0.7;g } },
    { rule = { class = "Emacs24" },
        properties = { opacity = 0.7;g } },
    { rule = { class = "Gnome-terminal" },
        properties = { opacity = 0.7;g } },
    { rule = { class = "XTerm" },
        properties = { opacity = 0.7;g } },
    { rule = { class = "Rxvt" },
        properties = { opacity = 0.7;g } },
    { rule = { instance = "exe" },
        properties = { floating = true } },
    { rule = { instance = "plugin-container" },
        properties = { floating = true } }
}

----------------------------------------------------------------------------------------------------}
-------{ signals |---------------------------------------------------------------------------------
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
     --awful.titlebar.add(c, { modkey = modkey })

    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- vim: set ts=4 sw=4 tw=0 ft=lua
