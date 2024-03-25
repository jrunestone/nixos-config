{ pkgs, lib, config, ... }: {
  home.packages = [ 
    pkgs.alacritty-theme
    pkgs.nautilus-open-any-terminal
  ];

  programs.alacritty = {
    enable = true;

    settings = {
      import = [ "${pkgs.alacritty-theme}/catppuccin_mocha.toml" ];

      env = {
        TERM = "xterm-256color";
      };

      window = {
        opacity = 0.93;
        blur = true;
        decorations = "None";
        decorations_theme_variant = "Dark";

        dimensions = {
          columns = 130;
          lines = 35;
        };
      };

      font = {
        normal = { 
          family = "Fira Code Nerd Font";
          style = "Regular";
        };

        size = 14;
      };
    };
  };

  dconf.settings = {
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "alacritty";
      name = "Open terminal";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };
  };
}
