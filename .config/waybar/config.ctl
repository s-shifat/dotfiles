' Source: https://github.com/prasanthrangan/hyprdots/issues/1318#issuecomment-2063093473
' Each field is split by a "|"

' Field 1: Which waybar style it will be using (0 is disabled, 1 is enabled)
' Field 2: Waybar width (in pixels (if nothing is given will default to a certain side))
' Field 3: Which side of the the screen it will use
' Field 4: Waybar left modules
' Field 5: Waybar middle modules
' Field 6: Waybar right modules
' The modules field has modules in parentheses () which determine module groups.

0|28|bottom|( cpu memory custom/cpuinfo custom/gpuinfo ) ( idle_inhibitor clock )|( hyprland/workspaces hyprland/window )|( backlight network pulseaudio pulseaudio#microphone custom/updates custom/keybindhint ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|28|top|( cpu memory custom/cpuinfo custom/gpuinfo ) ( idle_inhibitor clock )|( hyprland/workspaces hyprland/window )|( backlight network pulseaudio pulseaudio#microphone custom/updates custom/keybindhint ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|28|bottom|( cpu memory custom/cpuinfo custom/gpuinfo ) ( idle_inhibitor clock ) ( hyprland/workspaces )|( hyprland/window )|( backlight network pulseaudio pulseaudio#microphone custom/updates custom/keybindhint ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|28|top|( cpu memory custom/cpuinfo ) ( idle_inhibitor clock ) ( hyprland/workspaces )|( hyprland/window )|( backlight network pulseaudio pulseaudio#microphone custom/updates custom/keybindhint ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0||bottom|( hyprland/workspaces hyprland/window )|( idle_inhibitor clock )|( cpu memory custom/cpuinfo custom/gpuinfo ) ( backlight network pulseaudio pulseaudio#microphone custom/updates custom/keybindhint ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0||top|( hyprland/workspaces hyprland/window )|( idle_inhibitor clock )|( cpu memory custom/cpuinfo custom/gpuinfo ) ( backlight network pulseaudio pulseaudio#microphone custom/updates custom/keybindhint ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|31|bottom|( custom/power custom/cliphist custom/wbar custom/theme custom/wallchange ) ( wlr/taskbar custom/spotify ) |( idle_inhibitor clock )|( tray battery ) ( backlight network pulseaudio pulseaudio#microphone custom/notifications custom/keybindhint )
0|31|left|( custom/power custom/cliphist custom/wbar custom/theme custom/wallchange ) ( wlr/taskbar custom/spotify ) |( idle_inhibitor clock )|( tray battery ) ( backlight network pulseaudio pulseaudio#microphone custom/keybindhint )
0|31|top|( custom/power custom/cliphist custom/wbar custom/theme custom/wallchange ) ( wlr/taskbar custom/spotify ) |( idle_inhibitor clock )|( tray battery ) ( backlight network pulseaudio pulseaudio#microphone custom/keybindhint )
0|31|right|( custom/power custom/cliphist custom/wbar custom/theme custom/wallchange ) ( wlr/taskbar custom/spotify ) |( idle_inhibitor clock )|( tray battery ) ( backlight network pulseaudio pulseaudio#microphone custom/keybindhint )
0|32|bottom||( custom/power ) ( tray battery ) ( wlr/taskbar idle_inhibitor clock ) ( custom/cliphist ) ( custom/wbar ) ( custom/wallchange ) ( custom/theme )|
0|32|left||( custom/power ) ( tray battery ) ( wlr/taskbar idle_inhibitor clock ) ( custom/cliphist ) ( custom/wbar ) ( custom/wallchange ) ( custom/theme )|
0|32|top||( custom/power ) ( tray battery ) ( wlr/taskbar idle_inhibitor clock ) ( custom/cliphist ) ( custom/wbar ) ( custom/wallchange ) ( custom/theme )|
0|32|right||( custom/power ) ( tray battery ) ( wlr/taskbar idle_inhibitor clock ) ( custom/cliphist ) ( custom/wbar ) ( custom/wallchange ) ( custom/theme )|
0|31|bottom|( cpu memory custom/cpuinfo custom/gpuinfo ) ( idle_inhibitor clock ) ( hyprland/workspaces )|( wlr/taskbar )|( backlight network pulseaudio pulseaudio#microphone custom/updates custom/keybindhint ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
1|31|top|( cpu memory custom/cpuinfo custom/gpuinfo ) ( idle_inhibitor clock ) ( hyprland/workspaces )|( wlr/taskbar )|( backlight network pulseaudio pulseaudio#microphone custom/updates custom/keybindhint ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|29|bottom|( wlr/taskbar mpris )|( idle_inhibitor clock )|( backlight network pulseaudio pulseaudio#microphone custom/updates ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|29|left|( wlr/taskbar mpris )|( idle_inhibitor clock )|( backlight network pulseaudio pulseaudio#microphone custom/updates ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|29|top|( wlr/taskbar mpris )|( idle_inhibitor clock )|( backlight network pulseaudio pulseaudio#microphone custom/updates ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|29|right|( wlr/taskbar mpris )|( idle_inhibitor clock )|( backlight network pulseaudio pulseaudio#microphone custom/updates ) ( tray battery ) ( custom/wallchange custom/theme custom/wbar custom/cliphist custom/power )
0|28|bottom|( custom/power custom/cliphist custom/wbar custom/theme custom/wallchange ) ( idle_inhibitor clock custom/spotify )|( wlr/taskbar )|( tray ) ( backlight network pulseaudio pulseaudio#microphone )
0|28|left|( custom/power custom/cliphist custom/wbar custom/theme custom/wallchange ) ( idle_inhibitor clock custom/spotify )|( wlr/taskbar )|( tray ) ( backlight network pulseaudio pulseaudio#microphone )
0|28|top|( custom/power custom/cliphist custom/wbar custom/theme custom/wallchange ) ( idle_inhibitor clock custom/spotify )|( wlr/taskbar )|( tray ) ( backlight network pulseaudio pulseaudio#microphone )
0|28|right|( custom/power custom/notification custom/cliphist custom/wbar custom/theme custom/wallchange ) ( idle_inhibitor clock custom/spotify )|( wlr/taskbar )|( tray ) ( backlight network pulseaudio pulseaudio#microphone )
' 0||left| ( custom/notification )
