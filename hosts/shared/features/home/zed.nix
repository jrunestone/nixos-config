{ pkgs, lib, config, ... }: let
  zed-fhs = pkgs.buildFHSUserEnv {
    name = "zed";
    targetPkgs = pkgs:
      with pkgs; [
        zed-editor
      ];
    runScript = "zed";
  };
in {
  home.packages = [zed-fhs];
  #home.packages = [ pkgs.zed-editor ];

  home.file."${config.xdg.configHome}/zed/themes/base16-tomorrow-night.json" = {
    force = true;
    source = ../../../../assets/config/zed/base16-tomorrow-night.json;
  };

  home.file."${config.xdg.configHome}/zed/keymap.json" = {
    force = true;

    text = ''
      [
        {
          "bindings": {
            "f5": ["task::Spawn", { "task_name": "Debug" }],
            "shift-f5": ["task::Spawn", { "task_name": "Run" }],
            "f6": ["task::Spawn", { "task_name": "Build" }]
          }
        }, 

        {
          "context": "Editor",
          "bindings": {
            "shift-delete": "editor::DeleteLine",
            "ctrl-'": ["editor::ToggleComments", { "advance_downwards": false }],
            "ctrl-enter": "editor::NewlineAbove",
            "ctrl-shift-enter": "editor::NewlineBelow"
          }
        }
      ]
    '';
  };

  home.file."${config.xdg.configHome}/zed/settings.json" = {
    force = true;

    text = ''
      // Zed settings
      //
      // For information on how to configure Zed, see the Zed
      // documentation: https://zed.dev/docs/configuring-zed
      //
      // To see all of Zed's default settings without changing your
      // custom settings, run the `open default settings` command
      // from the command palette or from `Zed` application menu.
      {
        "theme": "Base16 Tomorrow Night",
        
        "ui_font_family": "FiraCode Nerd Font",
        "ui_font_size": 20,
        "ui_font_features": {
          "calt": false
        },
        
        "buffer_font_family": "FiraCode Nerd Font",
        "buffer_font_size": 18,
        "buffer_font_weight": 100,
        "buffer_font_features": {
          "calt": false
        },

        "scroll_sensitivity": 0.7,
        "show_wrap_guides": false,
        "soft_wrap": "none",

        "gutter": {
          "line_numbers": false
        },
        
        "indent_guides": {
          "enabled": false
        },

        "git": {
          "inline_blame": {
          "enabled": false
          }
        }
      }
    '';
  };
}
