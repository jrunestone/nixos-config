{ inputs, lib, pkgs, ... }: {
  imports = [
    ../shared/home.nix
    ./features/home/sound.nix
    ./features/home/persistence.nix
  ];

  programs.git = {
    userEmail = "johanrunsten86@gmail.com";
  };
}
