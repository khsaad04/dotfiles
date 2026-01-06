-- Taken from: https://github.com/yazi-rs/plugins/tree/main/full-border.yazi
local type = opts and opts.type or ui.Border.ROUNDED
local old_build = Tab.build

Tab.build = function(self, ...)
    local bar = function(c, x, y)
        if x <= 0 or x == self._area.w - 1 or th.mgr.border_symbol ~= "│" then
            return ui.Bar(ui.Edge.TOP)
        end

        return ui.Bar(ui.Edge.TOP)
            :area(ui.Rect({
                x = x,
                y = math.max(0, y),
                w = ya.clamp(0, self._area.w - x, 1),
                h = math.min(1, self._area.h),
            }))
            :symbol(c)
    end

    local c = self._chunks
    self._chunks = {
        c[1]:pad(ui.Pad.y(1)),
        c[2]:pad(ui.Pad(1, c[3].w > 0 and 0 or 1, 1, c[1].w > 0 and 0 or 1)),
        c[3]:pad(ui.Pad.y(1)),
    }

    local style = th.mgr.border_style
    self._base = ya.list_merge(self._base or {}, {
        ui.Border(ui.Edge.ALL):area(self._area):type(type):style(style),
        ui.Bar(ui.Edge.RIGHT):area(self._chunks[1]):style(style),
        ui.Bar(ui.Edge.LEFT):area(self._chunks[3]):style(style),

        bar("┬", c[1].right - 1, c[1].y),
        bar("┴", c[1].right - 1, c[1].bottom - 1),
        bar("┬", c[2].right, c[2].y),
        bar("┴", c[2].right, c[2].bottom - 1),
    })

    old_build(self, ...)
end

-- Taken from: https://yazi-rs.github.io/docs/tips/#symlink-in-status
Status:children_add(function(self)
    local h = self._current.hovered
    if h and h.link_to then
        return " -> " .. tostring(h.link_to)
    else
        return ""
    end
end, 3300, Status.LEFT)

-- Taken from: https://yazi-rs.github.io/docs/tips/#username-hostname-in-header
Header:children_add(function()
    if ya.target_family() ~= "unix" then
        return ""
    end
    return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)
