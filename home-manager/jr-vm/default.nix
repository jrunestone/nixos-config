{ inputs, lib, pkgs, ... }: {
  imports = [
    ../shared.nix
  ];

  programs.git = {
    userEmail = "johanrunsten86@gmail.com";
  };
}
