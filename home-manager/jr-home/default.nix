{ inputs, lib, pkgs, ... }: {
  imports = [
    ../shared.nix
    ./monitors.nix
    ./sound.nix
  ];

  programs.git = {
    userEmail = "johanrunsten86@gmail.com";
  };
}
