{ inputs, lib, pkgs, config, ... }: let
  monitors = import ../../hosts/jr-home/monitors.xml.nix;
in {
  xdg.configFile."monitors.xml".text = monitors.monitors.xml;
}
