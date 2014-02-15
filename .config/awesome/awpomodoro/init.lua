-- awpomodoro.lua - A very simple Pomodoro widget for awesome window manager
--
-- Copyright (c) 2014 Piotr F. Mieszkowski
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local textbox	= require "wibox.widget.textbox"
local naughty	= require "naughty"
local awbutton	= require "awful.button"
local awutil	= require "awful.util"
local awtip	= require "awful.tooltip"
local beautiful	= require "beautiful"

local setmetatable = setmetatable


-- Pseudo-constants
local const = {
   INITIAL_LABEL	= "Pomodoro",
   NAUGHTY_TITLE	= "awpomodoro",

   MINUTE		= 60,

   MOUSE_LEFT		= 1,
   MOUSE_RIGHT		= 3,
   KEY_SHIFT		= "Shift",

   -- Pomodoro states:
   INITIAL		= 0,
   WORKING		= 1,
   BREAK		= 2,
   LONGBREAK		= 3
}

-- Messages displayed to the user
local messages = {
   INVALID_STATE = "Invalid state: ",

   WORK_START = "The clock's been started, do your best!",
   WORK_END = "Congratulations! Another Pomodoro copmleted!\n"
      .. "And now, for being so productive, give yourself a %d minute break.",

   PAUSE = "You've stopped the clock after %d minute%s.",

   BREAK_START = "The clock's been started, have some fun!",
   BREAK_END = "That was nice, but now let's get back to work.\n"
      .. "Hacks and glory await!",

   TOOLTIP = "You have completed %d Pomodoro%s today."
}

-- The main table, it'll become a "class" later
local pomodoro = {
   -- Global configuration options exposed to the user via the __index
   -- metatable entry.
   settings = {
      work_minutes = 25,
      work_tag = "work",
      break_minutes = 5,
      break_tag = "break",
      longbreak_minutes = 15,
      longbreak_tag = "break+",

      -- One of the following characters is used to build the content
      -- of the widget, depending on it's state.
      active_separator = ":",
      inactive_separator = "|",

      -- Settings for the Naughty notifications.
      naughty_preset = {
	 ontop = true,
	 border_width = "1",
	 fg = beautiful.fg_urgent,
	 bg = beautiful.bg_urgent
      },

      -- By default, we reset and stop the timer in case the user went
      -- away from the computer and could't see the message we would
      -- like to display.
      stop_after_break = true
   },

   -- Meta-table, to be filled later.
   mt = {}
}


--
-- Returns the name of the state.
--
local function state_tag (state)
   if state == const.INITIAL then
      return const.INITIAL_LABEL
   elseif state == const.WORKING then
      return pomodoro.settings.work_tag
   elseif state == const.BREAK then
      return pomodoro.settings.break_tag
   elseif state == const.LONGBREAK then
      return pomodoro.settings.longbreak_tag
   else
      error (messages.INVALID_STATE .. state)
   end
end

--
-- Updates the state of the object according to the elapsed time.
--
function pomodoro:tick ()
   self.ticks = self.ticks + 1

   if (self.state == const.BREAK
       and self.ticks >= pomodoro.settings.break_minutes)
      or (self.state == const.LONGBREAK
	  and self.ticks >= pomodoro.settings.longbreak_minutes) then
      self:set_state (const.WORKING)
      self:reset_timer (pomodoro.settings.stop_after_break)

      self:emit_signal ("awpomodoro::break_end", self)

      naughty.notify ({ title = const.NAUGHTY_TITLE,
			 timeout = 0,
			 text = messages.BREAK_END,
			 preset = pomodoro.settings.naughty_preset })
   elseif self.state == const.WORKING
      and self.ticks >= pomodoro.settings.work_minutes then
      local how_long = nil

      self.completed = self.completed + 1

      if 0 == (self.completed % 4) then
	 self:set_state (const.LONGBREAK)
	 how_long = pomodoro.settings.longbreak_minutes
      else
	 self:set_state (const.BREAK)
	 how_long = pomodoro.settings.break_minutes
      end

      self:reset_timer (false)

      local ticks_plural = ""
      if self.ticks ~= 1 then
	 ticks_plural = "s"
      end

      self:emit_signal ("awpomodoro::work_end", self)

      naughty.notify ({ title = const.NAUGHTY_TITLE,
			 timeout = 5,
			 text = string.format (messages.WORK_END,
					       self.ticks,
					       ticks_plural),
			 preset = pomodoro.settings.naughty_preset })
   end

   self:redraw ()
end

--
-- Starts the timer.
--
function pomodoro:start ()
   self.timer:start ()
   self.timer_running = true
end

--
-- Sets the Pomodoro widget state and updates the textbox content.
--
function pomodoro:set_state (state)
   self.state = state
   self:set_text (state_tag (state))
end

--
-- Redisplays the Pomodoro timer.
--
function pomodoro:redraw ()
   local st = state_tag (self.state)
   local sep = ''

   if self.timer_running then
      sep = pomodoro.settings.active_separator
   else
      sep = pomodoro.settings.inactive_separator
   end

   self:set_text (st .. sep .. self.ticks)
end

--
-- Stops the timer.
--
function pomodoro:stop ()
   self.timer:stop ()
   self.timer_running = false
end

--
-- Starts the timer if it's not running, otherwise stops it.  When
-- stopping the timer, a message is displayed for the user to know how
-- much time he or she has been working.
--
function pomodoro:toggle_timer ()
   if self.timer_running then
      self:stop ()

      local ticks_plural = ""
      if self.ticks ~= 1 then
	 ticks_plural = "s"
      end

      -- Let's display some meaningful message so that the user knows
      -- how much time they have spent on their current task.
      naughty.notify ({ title = const.NAUGHTY_TITLE,
			 timeout = 5,
			 text = string.format (messages.PAUSE,
					       self.ticks,
					       ticks_plural),
			 preset = pomodoro.settings.naughty_preset })
   else
      -- First, ensure that the state is one of: work or break.
      if self.state == const.INITIAL then
	 self:set_state (const.WORKING)
      end

      -- Next: start the timer and display a motivating / encouraging
      -- message.
      self:start ()
      if self.state == const.WORKING then
	 naughty.notify ({ title = const.NAUGHTY_TITLE,
			    timeout = 5,
			    text = messages.WORK_START,
			    preset = pomodoro.settings.naughty_preset })
      else
	 naughty.notify ({ title = const.NAUGHTY_TITLE,
			    timeout = 5,
			    text = messages.BREAK_START,
			    preset = pomodoro.settings.naughty_preset })
      end
   end
end

--
-- Resets and probably stops the timer.
--
function pomodoro:reset_timer (stop)
   if stop and self.timer_running then
      self:stop ()
   end

   self.ticks = 0
end

--
-- Resets the completed Pomodoro counter.
--
function pomodoro:reset_counter ()
   self.completed = 0
end

--
-- Returns the the tooltip text.
--
function pomodoro:get_tooltip ()
   local plural = ""

   if self.completed ~= 1 then
      plural = "s"
   end

   return string.format (messages.TOOLTIP,
			 self.completed,
			 plural)
end

--
-- Creates a pomodoro object.
--
local function create ()
   local pom = textbox (const.INITIAL_LABEL)

   -- Let's add pomodoro methods to the widget.
   for k, v in pairs (pomodoro) do
      if type (v) == "function" then
	 pom[k] = v
      end
   end

   -- Some basic textbox settings:
   pom:set_valign ("center")
   pom:set_align ("left")

   pom:add_signal ("awpomodoro::toggle")
   pom:add_signal ("awpomodoro::break_end")
   pom:add_signal ("awpomodoro::work_end")

   -- Mouse events:
   -- + left-click toggles the Pomodoro timer,
   -- + right-click resets and stops the timer,
   -- + right-click w/ Shift resets the completed Pomodoro counter.
   pom:buttons (awutil.table.join(awbutton ({}, const.MOUSE_LEFT,
					    function ()
					       pom:toggle_timer ()
					       pom:redraw ()
					       pom:emit_signal ("awpomodoro::toggle",
								pom)
					    end),
				  awbutton ({}, const.MOUSE_RIGHT,
					    function ()
					       pom:reset_timer (true)
					       pom:redraw ()
					    end),
				  awbutton ({const.KEY_SHIFT}, const.MOUSE_RIGHT,
					    function ()
					       pom:reset_counter ()
					    end)))

   -- The timer that will trigger changes of state.
   pom.timer = timer ({ timeout = const.MINUTE })
   pom.timer:connect_signal ("timeout", function () pom:tick () end)

   -- Number of ticks, i.e. minutes.
   pom.ticks = 0
   -- Number of pomodoros completed:
   pom.completed = 0
   -- Initial state of our Pomodoro widget.
   pom.state = const.INITIAL

   -- Now let's set the tooltip.
   pom.tip = awtip ({ objects = { pom },
		       timer_function = function () return pom:get_tooltip () end
		    })

   return pom
end

--
-- Forward calls to the constructor.
--
function pomodoro.mt:__call ()
   return create ()
end

--
-- Returns a configuration parameter named PARAM.
--
function pomodoro.mt:__index (param)
   return pomodoro.settings[param]
end

return setmetatable (pomodoro, pomodoro.mt)
