{ pkgs, lib, config, ... }: {
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "CaskaydiaCove" ]; })
  ];
}