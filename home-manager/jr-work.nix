{ inputs, lib, pkgs, ... }: let
  inherit (inputs.nix-colors) colorSchemes;
in {
  imports = [
    ./shared.nix
  ];

  programs.git = {
    userName = "Johan Runsten";
    userEmail = "johan.runsten@toxic.se";
  };

  #wallpaper = pkgs.wallpapers.aurora-borealis-water-mountain;
  #colorScheme = lib.mkDefault colorSchemes.tokyo-city-terminal-dark;
}
