{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        layer = "overlay";
        terminal = "kitty";
        font = "Noto Sans:size=18";
        prompt = "\"   \"";
        dpi-aware = "no";
        horizontal-pad = 35;
        vertical-pad = 20;
        inner-pad = 15;
        width = 20;
      };

      colors = {
        background = "#${config.colorScheme.palette.base00}E5";
        text = "#${config.colorScheme.palette.base06}FF";
        match = "#${config.colorScheme.palette.base0A}FF";
        selection = "#${config.colorScheme.palette.base01}FF";
        selection-text = "#${config.colorScheme.palette.base04}FF";
        selection-match = "#${config.colorScheme.palette.base0A}FF";
        border = "#${config.colorScheme.palette.base06}FF";
      };

      border = {
        width = 3;
        radius = 7;
      };
    };
  };
}
