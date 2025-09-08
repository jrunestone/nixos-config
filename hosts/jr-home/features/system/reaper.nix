{ inputs, lib, pkgs, config, outputs, ... }: {
  environment.systemPackages = [
    pkgs.reaper
    pkgs.pipewire.jack
  ];
}
