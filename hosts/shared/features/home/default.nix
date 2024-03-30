{ inputs, lib, pkgs, config, outputs, ... }: {  
  home.packages = [
    pkgs.tree
    pkgs.just
    pkgs.ripgrep
    pkgs.killall
    pkgs.wl-clipboard
    pkgs.hyprpicker
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  xdg.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.simp1e-cursors;
    name = "Simp1e Adw Dark";
    size = 16;
  };
}
