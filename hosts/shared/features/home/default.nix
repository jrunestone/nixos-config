{ inputs, lib, pkgs, config, outputs, ... }: {  
  home.packages = [
    pkgs.tree
    pkgs.just
    pkgs.ripgrep
    pkgs.killall
    pkgs.wl-clipboard
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  xdg.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
