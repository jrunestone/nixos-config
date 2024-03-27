{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    mouse = true;
    prefix = "C-x";
    escapeTime = 0;
    disableConfirmationPrompt = true;

    plugins = [
      {
        plugin = pkgs.tmuxPlugins.catppuccin;

        extraConfig = ''
          set -g @catppuccin_flavour "mocha"

          set -g @catppuccin_status_modules "null"
          set -g @catppuccin_window_default_text "#W"
          set -g @catppuccin_window_current_text "#W"

          set -g @catppuccin_window_right_separator "█ "
          set -g @catppuccin_window_number_position "left"
          set -g @catppuccin_window_middle_separator ":"

          set -g @catppuccin_window_default_fill "none"
          set -g @catppuccin_window_current_fill "all"
        '';
      }
    ];

    extraConfig = ''
      set -g default-terminal "$TERM"
      set -ag terminal-overrides ",$TERM:Tc"
      set -g status-position top
      set -g status-style "bg=#1d1d2b"
      set -g pane-border-lines heavy
    '';
  };
}
