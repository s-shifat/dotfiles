{ ... }:

{
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "CaskaydiaCove Nerd Font:size=10";
        pad = "25x25";
      };

      bell.system = "no";

      colors-dark = {
        foreground = "FFFFFF";
        background = "0B1834";
        selection-foreground = "0B1834";
        selection-background = "FFFFFF";

        regular0 = "293652";
        regular1 = "8A304D";
        regular2 = "CCD4FF";
        regular3 = "E4CCFF";
        regular4 = "9AB2E6";
        regular5 = "9AA5E6";
        regular6 = "BE9AE6";
        regular7 = "FFCCDB";

        bright0 = "57698F";
        bright1 = "D87595";
        bright2 = "AAB5F0";
        bright3 = "CBAAF0";
        bright4 = "C2D2FF";
        bright5 = "9AA5E6";
        bright6 = "BE9AE6";
        bright7 = "F0AABF";
      };
    };
  };
}
