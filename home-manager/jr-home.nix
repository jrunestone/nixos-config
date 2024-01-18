{ inputs, lib, pkgs, ... }: let
  inherit (inputs.nix-colors) colorSchemes;
in {
  imports = [
    ./shared.nix
  ];

  programs.git = {
    userName = "Johan Runsten";
    userEmail = "johanrunsten86@gmail.com";
  };

  #wallpaper = pkgs.wallpapers.aurora-borealis-water-mountain;
  #colorScheme = lib.mkDefault colorSchemes.tokyo-city-terminal-dark;

  #  ------   -----   ------
  # | DP-3 | | DP-1| | DP-2 |
  #  ------   -----   ------
  # monitors = [
  #   {
  #     name = "DP-1";
  #     width = 2560;
  #     height = 1080;
  #     x = 1920;
  #     workspace = "1";
  #     primary = true;
  #   }
  # ];
}