{ inputs, lib, pkgs, config, outputs, ... }: {
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    (pkgs.noto-fonts.override { variants = [ "NotoSans" ]; })
  ];

  fonts.fontconfig.enable = true;
}
