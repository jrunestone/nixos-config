{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.tree ];
}
