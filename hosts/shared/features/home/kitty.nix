{ inputs, lib, pkgs, config, outputs, ... }: {
  home.packages = [ pkgs.kitty-themes ];

  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";

    settings = {
      background_opacity = "0.93";
      font_family = "Fira Code Nerd Font";
      font_size = 14;
    };
  };
}
