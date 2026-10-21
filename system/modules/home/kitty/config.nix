{ ... }:

{
  programs.kitty = {
    shellIntegration.mode = null;

    font = {
      name = "CaskaydiaCove Nerd Font";
      size = 10;
    };

    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      enable_audio_bell = false;
      window_padding_width = 25;
      input_delay = 0;
      repaint_delay = 2;
      enabled_layouts = "splits:split_axis=horizontal";
    };

    keybindings = {
      "ctrl+shift+;" = "launch --location=vsplit";
      "ctrl+shift+h" = "neighboring_window left";
      "ctrl+shift+j" = "neighboring_window down";
      "ctrl+shift+k" = "neighboring_window up";
      "ctrl+shift+l" = "neighboring_window right";
    };

    extraConfig = "include theme.conf";
  };

  xdg.configFile."kitty/theme.conf".source = ./theme.conf;
}
