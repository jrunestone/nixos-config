{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    historySubstringSearch.enable = true;

    history = {
      extended = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }

      {
        name = "powerlevel10k-config";
        src = ../../../../assets/config/zsh;
        file = ".p10k.zsh";
      }

      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
        };
      }
    ];

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
      LS_COLORS = builtins.readFile ../../../../assets/config/LS_COLORS;
    };

    shellAliases = {
      ls = "eza -lgaa --group-directories-first";
      cat = "bat";
      jd = "just develop";

      nixdir = "cd $NIXCONFIG";
      nixedit = "nv $NIXCONFIG";
      nixbuild = "git -C $NIXCONFIG add . && sudo nixos-rebuild --flake $NIXCONFIG/#$HOST";
      nixupdates = "echo 'Run sudo nix flake update first' && nixbuild build && nix store diff-closures /run/current-system ./result && rm ./result";
      nixversions = "find /etc/profiles/per-user/jr/bin -type l | xargs readlink -f | cut -d- -f2- | cut -d/ -f1 | sort -u";
      nixgenerations = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
      nixcleanup = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5; nix-collect-garbage; nix-store --optimise";
    };

    initExtra = ''
      function redraw-prompt() {
        local f
        for f in chpwd "''${chpwd_functions[@]}" precmd "''${precmd_functions[@]}"; do
          [[ "''${+functions[$f]}" == 0 ]] || "$f" &>/dev/null || true
        done
        p10k display -r
      }

      function run() {
        $1 > /dev/null 2>&1 & disown
      }

      # cd up and back (alt-up, alt-left)
      cd-up() { builtin cd .. && redraw-prompt }
      cd-prev() { builtin cd - && redraw-prompt }

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
