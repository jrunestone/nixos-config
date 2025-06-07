{ pkgs, lib, config, ... }: {
  programs.zed-editor = {
    enable = true;

    userKeymaps = [
      {
        bindings = {
          f5 = ["task::Spawn" { task_name = "Debug"; }];
          shift-f5 = ["task::Spawn" { task_name = "Run"; }];
          f6 = ["task::Spawn" { task_name = "Build"; }];
        };
      }

      {
        context = "Editor";

        bindings = {
          shift-delete = "editor::DeleteLine";
          ctrl-' = ["editor::ToggleComments" { advance_downwards = false; }];
          ctrl-enter = "editor::NewlineAbove";
          ctrl-shift-enter = "editor::NewlineBelow";
          ctrl-shift-space = "editor::ShowSignatureHelp";
        };
      }
    ];

    userSettings = {
      theme = "Base16 Tomorrow Night";
      
      ui_font_family = "FiraCode Nerd Font";
      ui_font_size = 20;
      ui_font_features = {
        calt = false;
      };
      
      buffer_font_family = "FiraCode Nerd Font";
      buffer_font_size = 18;
      buffer_font_weight = 100;
      buffer_font_features = {
        calt = false;
      };

      scroll_sensitivity = 0.7;
      show_wrap_guides = false;
      soft_wrap = "none";
      tab_size = 2;
      format_on_save = "off";

      gutter = {
        line_numbers = true;
      };
      
      indent_guides = {
        enabled = false;
      };

      git = {
        inline_blame = {
          enabled = false;
        };
      };
    };

    extensions = [
      "nix"
      "html"
      "scss"
      "csharp"
    ];

    themes = {
      base16-tomorrow-night = ../../../../assets/config/zed/base16-tomorrow-night.json;
    };
  };
}
