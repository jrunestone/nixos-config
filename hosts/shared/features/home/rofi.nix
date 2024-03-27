{ inputs, lib, pkgs, config, outputs, ... }: {
  home.packages = [ pkgs.rofi-catppuccin ];

  programs.rofi = {
    enable = true;
    theme = "${pkgs.rofi-catppuccin}/share/themes/catppuccin-mocha.rasi";
    terminal = "kitty";

    extraConfig = {
      modes = "drun";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      display-drun = ">";
      normalize-match = true;
      hover-select = true;
      font = "Fira Code Nerd Font 14";
    };
  };
}
