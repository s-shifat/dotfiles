{ config, pkgs, ... }:

let
  quietSession = pkgs.writeShellScript "greetd-quiet-session" ''
    log_dir="''${XDG_STATE_HOME:-$HOME/.local/state}"
    mkdir -p "$log_dir"

    exec "$@" > "$log_dir/greetd-session.log" 2>&1
  '';
in
{
  services.greetd = {
    enable = true;

    settings.default_session = {
      command = ''
        ${pkgs.tuigreet}/bin/tuigreet \
          --time \
          --remember \
          --remember-session \
          --sessions ${config.services.displayManager.sessionData.desktops}/share/wayland-sessions \
          --session-wrapper ${quietSession}
      '';

      user = "greeter";
    };
  };
}
