{ inputs, lib, pkgs, config, outputs, ... }: {
  home.packages = [ pkgs.kitty-themes ];

  programs.kitty = {
    enable = true;
    themeFile = "Tomorrow_Night";

    settings = {
      #background_opacity = "0.93";
      font_family = "FiraCode Nerd Font";
      font_size = 14;
      confirm_os_window_close = 0;
      scrollback_lines = 10000;
      enable_audio_bell = "no";
      window_padding_width = 10;
      disable_ligatures = "always";
    };

    shellIntegration.enableBashIntegration = false;
  };
}
