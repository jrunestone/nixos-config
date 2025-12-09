{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.systemPackages = [
    pkgs.insomnia
  ];
}
