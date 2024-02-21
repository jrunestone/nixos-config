{ inputs, lib, pkgs, config, ... }: let
  monitorsXmlContent = import ./monitors.xml.nix;
  monitorsConfig = pkgs.writeText "gdm_monitors.xml" monitorsXmlContent.monitors.xml;
in {
  systemd.tmpfiles.rules = [
    "L+ /run/gdm/.config/monitors.xml - - - - ${monitorsConfig}"
  ];
}
