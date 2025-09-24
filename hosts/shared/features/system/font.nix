{ inputs, lib, pkgs, config, outputs, ... }: {
  fonts.packages = [
    pkgs.nerd-fonts.fira-code
    pkgs.font-awesome
    (pkgs.noto-fonts.override { variants = [ "NotoSans" ]; })
  ];

  fonts.fontconfig.enable = true;
}
