{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.systemPackages = [
    pkgs.yubioath-flutter
    pkgs.yubikey-manager
  ];

  services.udev.packages = [ pkgs.yubikey-personalization ];
  services.pcscd.enable = true;
}
