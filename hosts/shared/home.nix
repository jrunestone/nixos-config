{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak

    ./features/home
    ./features/home/bash.nix
    ./features/home/kitty.nix
    ./features/home/starship.nix
    ./features/home/blesh.nix
    ./features/home/fzf.nix
    ./features/home/git.nix
    ./features/home/tmux.nix
    ./features/home/nixvim.nix
    ./features/home/hyprland.nix
    ./features/home/rofi.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules );

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = lib.mkDefault "jr";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.05";
  };
}
