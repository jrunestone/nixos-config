{ pkgs, lib, config, ... }: {
  services.flatpak.packages = [
    "com.valvesoftware.Steam"
  ];
}
