{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
    ./features/git.nix
    ./features/xdg.nix
    ./features/theme.nix
    ./features/persistence.nix
    ./features/nerdfonts.nix
    ./features/bash.nix
    ./features/fzf.nix
    ./features/blesh.nix
    ./features/dircolors.nix
    ./features/blackbox.nix
    ./features/starship.nix
  #  ./features/hyprland.nix
    ./features/neofetch.nix
  #  ./features/spotify.nix
  #  ./features/slack.nix
  #  ./features/rider.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules );

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      warn-dirty = false;
    };
  };

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
