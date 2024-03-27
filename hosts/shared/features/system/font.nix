{ inputs, lib, pkgs, config, outputs, ... }: {
  fonts.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" "IBMPlexMono" ]; })
  ];

  fonts.fontconfig.enable = true;
}
