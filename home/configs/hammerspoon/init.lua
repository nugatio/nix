-- Set animation duration to 0 for a "snappier" feel
hs.window.animationDuration = 0

-- ---
-- IMPORTANT: Set the full path to your aerospace binary
-- Find this by running "which aerospace" in your terminal
-- ---
-- (It's probably /opt/homebrew/bin/aerospace or /usr/local/bin/aerospace)
local aero = "/opt/homebrew/bin/aerospace"


--
-- === Center Window Function ===
--
hs.urlevent.bind("centerWindow", function(eventName, params)
    hs.execute(aero .. " layout floating")

    hs.timer.doAfter(0.05, function()
        local win = hs.window.focusedWindow()
        if not win then return end

        local width = tonumber(params["width"]) or 0.7
        local height = tonumber(params["height"]) or 0.8
        local screen = win:screen()
        local frame = screen:frame()
        local w = frame.w * width
        local h = frame.h * height
        local x = frame.x + (frame.w - w) / 2
        local y = frame.y + (frame.h - h) / 2

        win:setFrame({x = x, y = y, w = w, h = h})
    end)
end)


--
-- === Move Focused Window Function ===
--
hs.urlevent.bind("moveWindow", function(eventName, params)
    hs.execute(aero .. " layout floating")

    hs.timer.doAfter(0.1, function()
        local win = hs.window.focusedWindow()
        if not win then return end

        local dx = tonumber(params["x"]) or 0
        local dy = tonumber(params["y"]) or 0

        local currentFrame = win:frame()
        local newFrame = {
            x = currentFrame.x + dx,
            y = currentFrame.y + dy,
            w = currentFrame.w,
            h = currentFrame.h
        }

        win:setFrame(newFrame)
    end)
end)
