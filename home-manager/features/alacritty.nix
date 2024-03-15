{ pkgs, lib, config, ... }: {
  home.packages = [ 
    pkgs.alacritty-theme
    pkgs.nautilus-open-any-terminal
  ];

  programs.alacritty = {
    enable = true;

    settings = {
      import = [ "${pkgs.alacritty-theme}/gruvbox_material_hard_dark.toml" ];

      window = {
        opacity = 0.85;
        dimensions = {
          columns = 120;
          lines = 30;
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
