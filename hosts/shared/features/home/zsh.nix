{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    history.ignoreDups = true;
    historySubstringSearch.enable = true;

    autosuggestion = {
      enable = true;

      # sets the wrong variable, see initExtra
      highlight = "fg=#464d57";
    };

    syntaxHighlighting = {
      enable = true;
      
      styles = {
        command = "fg=#${config.colorScheme.palette.base06},bold";
        builtin = "fg=#${config.colorScheme.palette.base06},bold";
        alias = "fg=#${config.colorScheme.palette.base06},bold";
        function = "fg=#${config.colorScheme.palette.base06},bold";
        precommand = "fg=#${config.colorScheme.palette.base06},bold";
        autodirectory = "fg=#${config.colorScheme.palette.base0E},underline";
        path = "none";
      };
    };

    sessionVariables = {
      NIXCONFIG = "/etc/nixos/nixos-config";
      EZA_COLORS = "xx=36:sn=36:sb=36:uu=36:uR=36:un=36:gu=36:gR=36:gn=36:da=36:or=31";
      LS_COLORS = builtins.readFile ../../../../assets/LS_COLORS;
    };

    shellAliases = {
      ls = "eza -lgaa --group-directories-first";

      nixdir = "cd $NIXCONFIG";
      nixedit = "nv $NIXCONFIG";
      nixbuild = "git -C $NIXCONFIG add . && sudo nixos-rebuild --flake $NIXCONFIG/#$HOST";
      nixupdates = "echo 'Run sudo nix flake update first' && nixbuild build && nix store diff-closures /run/current-system ./result && rm ./result";
      nixversions = "find /etc/profiles/per-user/jr/bin -type l | xargs readlink -f | cut -d- -f2- | cut -d/ -f1 | sort -u";
    };

    initExtra = ''
      # cd up and back (alt-up, alt-left)
      cd-up() { builtin cd .. && zle reset-prompt }
      cd-prev() { builtin cd - && zle reset-prompt }

      zle -N cd-up
      zle -N cd-prev

      bindkey "^[[1;3A" cd-up
      bindkey "^[[1;3D" cd-prev

      # go to start/end of line (ctrl-a, ctrl-e)
      bindkey "^A" beginning-of-line
      bindkey "^E" end-of-line

      # skip and delete word (ctrl-backspace, ctrl-left, ctrl-right)
      bindkey "^H" backward-kill-word
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word

      ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#464d57"
    '';
  };
}
