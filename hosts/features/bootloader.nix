{ inputs, lib, pkgs, config, outputs, ... }: {
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.configurationLimit = 20;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = ["quiet"];
  boot.initrd.systemd.enable = true;

  boot.loader.grub2-theme = {
    enable = true;
    theme = "vimix";
    footer = false;
  };

  boot.plymouth.themePackages = [ 
    (pkgs.adi1090x-plymouth-themes.override {
      selected_themes = ["spinner_alt"];
    })
  ];

  boot.plymouth.enable = true;
  boot.plymouth.theme = "spinner_alt";
}
