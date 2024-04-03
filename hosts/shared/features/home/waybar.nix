{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        position = "bottom";
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "clock" ];

        clock = {
          format = "{:%H:%M}";
        };

        tray = {
          spacing = 10;
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
        background: #${config.colorScheme.palette.base00};
        box-shadow: 0px -5px 10px 0px #ee1a1a;
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
    '';
  };
}
