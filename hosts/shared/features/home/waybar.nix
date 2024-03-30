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
        modules-center = [ "clock" ];
        modules-right = [ "tray" ];

        clock = {
          format = "{:%b %d %H:%M}";
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
      }

      #workspaces button {
        color: #${config.colorScheme.palette.base02};
      }

      #workspaces button.focused,
      #workspaces button.active {
        color: #${config.colorScheme.palette.base05};
      }

      #clock, #tray {
        color: #${config.colorScheme.palette.base05};
      }
    '';
  };
}
