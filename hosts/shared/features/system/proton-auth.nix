{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.systemPackages = [ pkgs.proton-authenticator ];
}
