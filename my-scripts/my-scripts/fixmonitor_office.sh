#!/bin/bash

# Assign workspaces to their correct monitors based on your setup

# # Left monitor (workspaces 1-3)
# hyprctl dispatch moveworkspacetomonitor 1 ""  
# hyprctl dispatch moveworkspacetomonitor 2 "desc:Dell Inc. DELL P2211H W4XCG196BDPL"
# hyprctl dispatch moveworkspacetomonitor 3 "desc:Dell Inc. DELL P2211H W4XCG196BDPL"

# # Middle monitor (workspaces 4-6)
# hyprctl dispatch moveworkspacetomonitor 4 "desc:ASUSTek COMPUTER INC VG27VQM RCLMDW004460"  
# hyprctl dispatch moveworkspacetomonitor 5 ""
# hyprctl dispatch moveworkspacetomonitor 6 "desc:ASUSTek COMPUTER INC VG27VQM RCLMDW004460"

# # Right monitor (workspaces 7-9)
# hyprctl dispatch moveworkspacetomonitor 7 "desc:Lenovo Group Limited 0x41B5"  
# hyprctl dispatch moveworkspacetomonitor 8 "desc:Lenovo Group Limited 0x41B5"
# hyprctl dispatch moveworkspacetomonitor 9 ""

LEFT_MONITOR="desc:Dell Inc. DELL P2211H W4XCG196BDPL"
MIDDLE_MONITOR="desc:ASUSTek COMPUTER INC VG27VQM RCLMDW004460"
RIGHT_MONITOR="desc:Lenovo Group Limited 0x41B5"
# RIGHT_MONITOR="Chimei Innolux Corporation 0x1614"

# hyprctl --batch "$(for i in {1..9}; do echo "dispatch workspace $i;"; done)"

hyprctl --batch "\
    dispatch moveworkspacetomonitor 1 $LEFT_MONITOR; \
    dispatch moveworkspacetomonitor 2 $LEFT_MONITOR; \
    dispatch moveworkspacetomonitor 3 $LEFT_MONITOR; \
    dispatch moveworkspacetomonitor 4 $MIDDLE_MONITOR; \
    dispatch moveworkspacetomonitor 5 $MIDDLE_MONITOR; \
    dispatch moveworkspacetomonitor 6 $MIDDLE_MONITOR; \
    dispatch moveworkspacetomonitor 7 $RIGHT_MONITOR; \
    dispatch moveworkspacetomonitor 8 $RIGHT_MONITOR; \
    dispatch moveworkspacetomonitor 9 $RIGHT_MONITOR"

