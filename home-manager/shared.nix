{ inputs, lib, pkgs, config, outputs, ... }: let
  inherit (inputs.nix-colors) colorSchemes;
in {
  imports = [
    inputs.nix-colors.homeManagerModule
    ./features/git.nix
    ./features/nerdfonts.nix
    ./features/bash.nix
    ./features/fzf.nix
    ./features/blackbox.nix
    ./features/starship.nix
    ./features/hyprland.nix
    ./features/neofetch.nix
    ./features/spotify.nix
    ./features/slack.nix
    ./features/rider.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

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
    stateVersion = lib.mkDefault "23.11";
    sessionPath = [ "$HOME/.local/bin" ];
    sessionVariables = {
      FLAKE = "$HOME/Documents/NixConfig";
    };

    #colorScheme = lib.mkOverride 1499 colorSchemes.nord;
  };
}
