{ inputs, lib, pkgs, config, outputs, ... }: {
  fonts.packages = [
    (pkgs.noto-fonts.override { variants = [ "NotoSans" ]; })
    pkgs.nerd-fonts.fira-code
  ];

  fonts.fontconfig.enable = true;
}
