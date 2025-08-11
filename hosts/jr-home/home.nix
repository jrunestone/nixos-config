{ inputs, config, lib, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim

    ../shared/home.nix

    ../shared/features/home/firefox.nix
    ../shared/features/home/slack.nix
    ../shared/features/home/spotify.nix
    ../shared/features/home/podman.nix
    ../shared/features/home/steam.nix
    ../shared/features/home/notesnook.nix
    ../shared/features/home/hypridle.nix

    ./features/home/sound.nix
    ./features/home/hyprland.nix
    ./features/home/minecraft.nix
    ./features/home/vintagestory.nix
    ./features/home/qbittorrent.nix
  ];

  host-options.hostname = "jr-home";

  host-options.home = {

  };
}
