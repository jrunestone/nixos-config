{ pkgs, lib, config, ... }: {
  programs.tmux = {
    enable = true;
    sensibleOnTop = false;
    mouse = true;
    prefix = "C-e";
    disableConfirmationPrompt = true;

    extraConfig = ''
      set -g status-position top
      set -g status-right ""
      set -g status-justify left
      set -g status-style "bg=#181717"
      set -g window-status-format " #I:#W "
      set -g window-status-current-format "#[bg=#4e4e4e] #I:#W "
    '';
  };
}
