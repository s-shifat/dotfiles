#!/usr/bin/python

import subprocess
import re
from typing import Callable, Any
import os
from pathlib import Path
import glob

BUILTIN_MONITOR_DESCRIPTION = 'Lenovo Group Limited 0x41B5'




HOME = Path.home()
DOTFILES = os.path.join(HOME, 'dotfiles')

HYPRDOTS = os.path.join(DOTFILES, 'hypr', '.config', 'hypr')

MONITORSCONF = os.path.join(HYPRDOTS, 'monitors', 'monitors.conf')

PROFILES_DIR = os.path.join(HYPRDOTS, 'monitors', 'profiles')




def reset_workspaces():
    """Reset all workspace assignments to avoid conflicts."""
    subprocess.run(["hyprctl", "--batch", " ".join([f"dispatch moveworkspacetomonitor {i} reset;" for i in range(1, 11)])])

class Profiles:
    PROFILE_PATHS = glob.glob(PROFILES_DIR + "/*.conf")
    def __init__(self) -> None:
        self.__raw_profiles = []
        self.__load_profiles()
        self.active_profile = None

    def __load_profiles(self):
        for path in Profiles.PROFILE_PATHS:
            with open(path) as f:
                contents = f.readlines()
            raw_monitors = [x for x in contents if x.startswith('monitor=')]
            self.__raw_profiles.append(raw_monitors)

    def __process_profiles(self):
        pass













class Monitor:
    BUILTIN_MONITOR_DESCRIPTION = BUILTIN_MONITOR_DESCRIPTION
    def __init__(self, data:str) -> None:
        self.data = data

        self.attributes = {}
        self.name = None
        self.mode = None
        self.__parse_raw_data()

        self.transform = int(self.attributes['transform'])
        self.orientation = None
        self.width = None
        self.height = None
        self.posx = None
        self.posy = None
        self.refresh_rate = None
        self.__parse_mode()

        self.desc = self.__sanitize_attribue('description')
        self.make = self.__sanitize_attribue('make')
        self.model = self.__sanitize_attribue('model')
        self.scale = self.__sanitize_attribue('scale', float)

        self.x = None
        self.y = None

    @property
    def is_builtin(self) -> bool:
        is_eDP = "eDP-" in self.name
        is_builtin_description = Monitor.BUILTIN_MONITOR_DESCRIPTION == self.desc
        return is_eDP and is_builtin_description

    # alias block for `desc`

    @property
    def description(self) -> str:
        return self.desc

    @description.setter
    def description(self, value:str):
        self.desc = value

    def mathecs_description(self, desc:str):
        return self.desc == desc

    # Utils block

    def __parse_raw_data(self):
        raw_name, raw_mode, *raw_attributes = self.data.split("\n")
        self.name = raw_name.split(" ")[1].strip()
        self.mode = raw_mode.strip()
        for attribute in raw_attributes:
            key, value = attribute.strip().split(":")
            self.attributes[key] = value.strip()

    def __parse_mode(self):
        numbers = [float(x) if '.' in x else int(x) for x in re.findall(r'-?\d+\.\d+|-?\d+', self.mode.strip())]
        width, height, refresh_rate, x, y = numbers
        match self.transform:
            case 0:
                # landscape
                self.orientation = "Landscape"
                self.width = width
                self.height = height
            case 1:
                # potrait
                self.orientation = "Portrait"
                self.width = height
                self.height = width

        self.posx = x
        self.posy = y
        self.refresh_rate = refresh_rate

    def __sanitize_attribue(self, attr:str, f:Callable[[str], Any]=str) -> Any:
        return f(self.attributes[attr].strip())

    def __repr__(self) -> str:
        return f"Monitor(name={self.name!r},\n\tmode={self.mode!r},\n\torientation={self.orientation},\n\tdesc={self.description!r})"

    def __str__(self) -> str:
        width = len(self.desc) + 20
        padding = ' '
        top_horr_line = '+' + '-' * (width - 2) + '+'
        bottom_horr_line = "'-" + '-' * (width - 4) + "-'"

        info_monitor = f"|{padding}Monitor: {self.name}"
        info_mode = f"|{padding}\tMode -> {self.mode}"
        info_orientation = f"|{padding}\tOrientation -> {self.orientation}"
        info_desc = f"|{padding}\tDesc -> {self.description}"

        return f"""{top_horr_line}
{info_monitor}{' '* (width - len(info_monitor) - 1)}|
{info_mode}{' '* (width - len(info_mode) - 1-5)}|
{info_orientation}{' '* (width - len(info_orientation) - 1-5)}|
{info_desc}{' '* (width - len(info_desc) - 1-5)}|
{top_horr_line}\n"""




class MonitorFix:
    COMMANDS = {
            "monitors": ["hyprctl", "monitors", "all"]
            }

    def __init__(self):
        self.__monitors_data = self.__get_monitors_data()
        self.builtin_monitor = None


        self.monitor_count = len(self.__monitors_data)
        self.monitors = self.get_monitors()  # sorted from left to right by current position

    @property
    def get_builtin_monitor(self):
        for monitor in self.monitors:
            if monitor.is_builtin:
                return monitor

    def get_monitors(self):
        monitors = []
        for monitor_data in self.__monitors_data:
            monitor = Monitor(monitor_data)
            if monitor.is_builtin:
                self.builtin_monitor = monitor
            monitors.append(monitor)
        return sorted(monitors, key=lambda x: x.posx)

    def setup_tripple_monitor(self):
        reset_workspaces()
        left_monitor = None
        middle_monitor = None
        right_monitor = None


    def __get_monitors_data(self):
        """Fetch all the monitors and relative information"""

        cmd_response = subprocess.run(
                MonitorFix.COMMANDS['monitors'],
                capture_output=True,
                text=True
                ).stdout.strip().split("\n\n")

        return cmd_response




if __name__ == "__main__":
    m = MonitorFix()
    counts = m.monitor_count
    monitors = m.monitors
    for x in monitors:
        print(x.is_builtin)
        print(x)


