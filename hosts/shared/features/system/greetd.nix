{ lib, config, pkgs, inputs, ...}: let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  hyprland-pkg = "${inputs.hyprland.packages.${pkgs.system}.hyprland}";
in {
  services.greetd = {
    enable = true;

    settings = {
      initial_session = lib.mkIf (config.host-options.system.autoLogin) {
        command = "${hyprland-pkg}/bin/Hyprland";
        user = "jr";
      };

      default_session = {
        command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-pkg}/share/wayland-sessions";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd = {
    enable = true;

    serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput = "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };
}
