{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.blesh ];
  #programs.blesh.enable = true;

  programs.bash.initExtra = ''
    source "$(blesh-share)"/ble.sh --attach=none
    ble-attach
  '';
}
