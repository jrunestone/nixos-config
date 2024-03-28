{ inputs, lib, pkgs, config, outputs, ... }: {
  home.packages = [ pkgs.kitty-themes ];

  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";

    settings = {
      background_opacity = "0.93";
      font_family = "Fira Code Nerd Font";
      font_size = 14;
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = "no";
    };

    shellIntegration.enableBashIntegration = false;
  };
}
