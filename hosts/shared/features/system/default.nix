{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.systemPackages = [ 
    pkgs.tree
    pkgs.just
    pkgs.ripgrep
    pkgs.killall
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  # system config
  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "se";
      variant = "";
    };
  };

  console.keyMap = "sv-latin1";
  services.printing.enable = true;
  hardware.enableRedistributableFirmware = true;
  fonts.fontDir.enable = true;

  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  # nix config
  nix.gc = {
    automatic = true;
    options = "--delete-older-than 1w";
  };

  # flatpak
  services.flatpak.enable = true;

  # keyring
  services.gnome.gnome-keyring.enable = true;

  # polkit
  security.polkit.enable = true;
}
