{ inputs, lib, pkgs, config, outputs, ... }: {
  home.packages = [ pkgs.rofi-catppuccin ];

  programs.rofi = {
    enable = true;
    theme = "${pkgs.rofi-catppuccin}/share/themes/catppuccin-mocha.rasi";
  };
}
