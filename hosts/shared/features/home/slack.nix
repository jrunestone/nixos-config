{ inputs, lib, pkgs, config, outputs, ... }: {
  home.packages = [ pkgs.slack ];
}
