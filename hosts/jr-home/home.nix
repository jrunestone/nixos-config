{ inputs, lib, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim

    ../shared/home.nix
    ../shared/features/home/firefox.nix
    ../shared/features/home/obsidian.nix
    ../shared/features/home/slack.nix
    ../shared/features/home/spotify.nix
    ../shared/features/home/steam.nix
    ../shared/features/home/podman.nix

    ./features/home/sound.nix
    ./features/home/persistence.nix
    ./features/home/hyprland.nix
  ];

  programs.git = {
    userEmail = "johanrunsten86@gmail.com";
  };
}
