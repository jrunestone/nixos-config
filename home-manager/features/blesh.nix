{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.blesh ];
  #programs.blesh.enable = true;

  programs.bash.initExtra = ''
    source "$(blesh-share)"/ble.sh --attach=none
    ble-attach
  '';

  home.file.".blerc".text = ''
    ble-bind -f up 'history-search-backward immediate-accept'
    ble-bind -f down 'history-search-forward immediate-accept'
  '';
}
