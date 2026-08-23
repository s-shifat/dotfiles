-- ==========================================
-- 1. BEZIER CURVE DEFINITIONS
-- ==========================================
hl.curve("wind", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.curve("winIn", { type = "bezier", points = { {0.1, 1.1}, {0.1, 1.1} } })
hl.curve("winOut", { type = "bezier", points = { {0.3, -0.3}, {0, 1} } })
hl.curve("liner", { type = "bezier", points = { {1, 1}, {1, 1} } })

-- ==========================================
-- 2. ANIMATION DEFINITIONS
-- ==========================================

-- Master global switch (Equivalent to `enabled = yes`)

-- Window Animations
hl.animation({ leaf = "windows",     enabled = true, speed = 6, bezier = "wind",   style = "slide" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 6, bezier = "winIn",  style = "slide" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 5, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind",   style = "slide" })

-- Border & Fade Animations
hl.animation({ leaf = "border",      enabled = true, speed = 1,  bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "liner",  style = "loop" })
hl.animation({ leaf = "fade",        enabled = true, speed = 10, bezier = "default" })

-- Workspace Animations
hl.animation({ leaf = "workspaces",  enabled = true, speed = 5, bezier = "winIn", style="slidevert" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 3, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 3, bezier = "winIn", style = "slide" })

