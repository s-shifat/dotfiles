#!/bin/bash

# # Assign workspaces to their correct monitors based on your setup

# # Left monitor (workspaces 1-3)
# hyprctl dispatch moveworkspacetomonitor 1 ""  
# hyprctl dispatch moveworkspacetomonitor 2 "desc:Dell Inc. DELL E2009W M743D91GB14L"
# hyprctl dispatch moveworkspacetomonitor 3 "desc:Dell Inc. DELL E2009W M743D91GB14L"

# # Middle monitor (workspaces 4-6)
# hyprctl dispatch moveworkspacetomonitor 4 "desc:Dell Inc. DELL P2211H W4XCG18KA4PM"  
# hyprctl dispatch moveworkspacetomonitor 5 ""
# hyprctl dispatch moveworkspacetomonitor 6 "desc:Dell Inc. DELL P2211H W4XCG18KA4PM"

# # Right monitor (workspaces 7-9)
# hyprctl dispatch moveworkspacetomonitor 7 "desc:Lenovo Group Limited 0x41B5"  
# hyprctl dispatch moveworkspacetomonitor 8 ""
# hyprctl dispatch moveworkspacetomonitor 9 "desc:Lenovo Group Limited 0x41B5"

LEFT_MONITOR="desc:Dell Inc. DELL E2009W M743D91GB14L"
MIDDLE_MONITOR="desc:Dell Inc. DELL P2211H W4XCG18KA4PM"
RIGHT_MONITOR="desc:Lenovo Group Limited 0x41B5"


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


