{ inputs, lib, pkgs, config, outputs, ... }: {  
  home.packages = [
    pkgs.libnotify
    pkgs.unzip
    pkgs.file
    pkgs.tree
    pkgs.just
    pkgs.jq
    pkgs.ripgrep
    pkgs.killall
    pkgs.wl-clipboard
    pkgs.hyprpicker
    pkgs.playerctl # for media key ctl
    pkgs.satty # screenshot editor
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

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

  # more programs/services
  services.playerctld.enable = true;
  programs.eza.enable = true;

  # envs
  home.sessionVariables = {
    GRIMBLAST_EDITOR = "satty --filename";
  };
}
