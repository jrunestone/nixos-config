{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        position = "bottom";
        #margin = "10 20 20 20";
        height = 40;
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "clock" ];

        clock = {
          format = "{:%H:%M}";
        };

        tray = {
          spacing = 8;
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: Noto Sans;
        font-size: 14px;
        font-weight: bold;
      }

      window#waybar {
        background-color: rgba(24,24,26,1) /*#${config.colorScheme.palette.base00}*/;
      }

      #workspaces {
        margin-left: 10px;
      }

      #workspaces button {
        color: #${config.colorScheme.palette.base02};
        padding: 3px;
      }

      #workspaces button.focused,
      #workspaces button.active {
        color: #${config.colorScheme.palette.base05};
      }

      #clock, #tray {
        color: #${config.colorScheme.palette.base05};
        margin-right: 15px;
      }

      #tray {
        margin-right: 17px;
      }
    '';
  };
}
