{ inputs, config, lib, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ../shared/home.nix

    ../shared/features/home/firefox.nix
    ../shared/features/home/slack.nix
    ../shared/features/home/spotify.nix
    ../shared/features/home/podman.nix
    ../shared/features/home/notesnook.nix

    ./features/home/persistence.nix
    ./features/home/hyprland.nix
  ];

  host-options.home = {

  };

  programs.git = {
    userEmail = "johan.runsten@toxic.se";
  };
}
