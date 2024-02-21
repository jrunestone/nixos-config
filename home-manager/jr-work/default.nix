{ inputs, lib, pkgs, ... }: {
  imports = [
    ../shared.nix
  ];

  programs.git = {
    userEmail = "johan.runsten@toxic.se";
  };
}
