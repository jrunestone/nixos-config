{ inputs, lib, pkgs, config, outputs, ... }: {
  fonts.packages = [
    (pkgs.noto-fonts.override { variants = [ "NotoSans" ]; })
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  fonts.fontconfig.enable = true;
}
