{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      primary = {
        mode = "dock";
        layer = "top";
        position = "bottom";
        margin = "10";
        modules-center = [ "hyprland/workspaces" "clock" "tray" ];

        clock = {
          format = "{:%b %d %H:%M}";
        };
      };
    };

    style = ''
      * {
        border: none;
        font-family: FiraCode Nerd Font;
        font-size: 14px;
        font-weight: bold;
      }

      window#waybar {
        background: transparent;
      }

      #workspaces, #clock, #tray {
        border-radius: 10px;
        background: #383c4a;
      }

      #workspaces button {
        color: #7c818c;
      }

      #workspaces button.focused,
      #workspaces button.active {
        color: #ffffff;
      }

      #clock {
        color: #ffffff;
        padding-left: 15px;
        padding-right: 15px;
        margin-right: 10px;
      }

      #tray {
        padding-left: 15px;
        padding-right: 15px;
      }
    '';
  };
}
