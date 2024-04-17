{ inputs, lib, pkgs, config, outputs, ... }: {
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

  console.keyMap = "sv-latin1";
  services.printing.enable = true;
  hardware.enableRedistributableFirmware = true;
  fonts.fontDir.enable = true;

  security.sudo.extraConfig = ''
    Defaults lecture = never
  '';

  # nix config
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" "repl-flake" ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
      trusted-users = [ "root" "@wheel" ];
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 1w";
    };
  };

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # zsh completion
  environment.pathsToLink = [ "/share/zsh" ];

  # flatpak
  services.flatpak.enable = true;

  # security/policies
  services.gnome.gnome-keyring.enable = true;
  environment.variables.XDG_RUNTIME_DIR = "/run/user/$UID";
  security.polkit.enable = true;
  security.pam.services.hyprlock = {};

  boot.kernel.sysctl = {
    "fs.inotify.max_queued_events" = 1048576;
    "fs.inotify.max_user_instances" = 1048576;
    "fs.inotify.max_user_watches" = 1048576;
  };

  systemd.extraConfig = ''
    DefaultLimitNOFILE=1048576
    DefaultLimitMEMLOCK=infinity
  '';
}
