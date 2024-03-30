{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        layer = "overlay";
        terminal = "kitty";
        font = "Noto Sans:size=18";
        dpi-aware = "no";
        icons-enabled = "no";
      };
    };
  };
}
