{ pkgs, lib, config, ... }: {
  programs.bash = {
    enable = true;

    sessionVariables = {
      NIXCONFIG = "/etc/nixos/nixos-config/";
    };

    shellAliases = {
      ls = "ls -lah --color=auto";
      buildnix = "sudo nixos-rebuild --flake $NIXCONFIG#$HOST";
    };

    initExtra = ''
      # autocd
      shopt -s autocd

      # bind alt-up to go up one dir level
      bind -x '"\201":cd ..'
      bind '"\e[1;3A": "\C-a\C-k\201\C-m\C-y"'

      # ctrl-backspace delete word
      bind '"\C-h": backward-kill-word'

      # to scan in history
      bind '"\e[A": history-search-backward'
      bind '"\e[B": history-search-forward'
    '';
  };
}
