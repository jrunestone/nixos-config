{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    
    ./features/bash.nix
    ./features/basic.nix 
    ./features/tmux.nix 
    ./features/git.nix
    ./features/xdg.nix
    ./features/theme.nix 
    ./features/persistence.nix
    ./features/nerdfonts.nix
    ./features/keybindings.nix
    ./features/gnome-settings.nix
    ./features/fzf.nix
    ./features/blesh.nix
    ./features/dircolors.nix
    ./features/alacritty.nix
    ./features/starship.nix
    ./features/vivaldi.nix
    ./features/obsidian.nix
    ./features/spotify.nix
    ./features/slack.nix
    ./features/nixvim.nix
    ./features/just.nix
    ./features/podman.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules );

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = lib.mkDefault "jr";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.05";
    sessionPath = [ "$HOME/.local/bin" ];
  };
}
