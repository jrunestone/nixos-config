{ pkgs, lib, config, ... }: {
  programs.bash = {
    enable = true;

    sessionVariables = {
      NIXCONFIG = "/etc/nixos/nixos-config";
    };

    historyControl = [ "ignoredups" ];

    shellAliases = {
      ls = "ls -lah --color=auto";
      nixdir = "cd $NIXCONFIG";
      nixedit = "nv $NIXCONFIG";
      nixbuild = "git -C $NIXCONFIG add . && sudo nixos-rebuild --flake $NIXCONFIG/#$HOST";
      nixupdates = "echo 'Run nix flake update first' && nixbuild build && nix store diff-closures /run/current-system ./result && rm ./result";
      nixversions = "find /etc/profiles/per-user/jr/bin -type l | xargs readlink -f | cut -d- -f2- | cut -d/ -f1 | sort -u";
    };

    initExtra = ''
      # autocd
      shopt -s autocd

      # bind alt-up to go up one dir level
      bind -x '"\201":cd ..'
      bind '"\e[1;3A": "\C-a\C-k\201\C-m\C-y"'

      # ctrl-backspace delete word
      bind '"\C-h": backward-kill-word'

      function run() {
        $1 > /dev/null 2>&1 & disown
      }
    '';
  };
}
