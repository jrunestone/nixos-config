{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        layer = "overlay";
        terminal = "kitty";
        font = "FiraCode Nerd Font:size=18";
        dpi-aware = "no";
      };
    };
  };
}
