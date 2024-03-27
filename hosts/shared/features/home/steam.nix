{ inputs, lib, pkgs, config, outputs, ... }: {
  services.flatpak.packages = [
    "com.valvesoftware.Steam"
  ];
}
