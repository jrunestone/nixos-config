{ inputs, lib, pkgs, config, outputs, ... }: {
  xdg.configFile."hypr/hyprpaper.conf".text = ''
    preload = ${../../../../assets/wallpapers/1.png}
    wallpaper = , ${../../../../assets/wallpapers/1.png}
  '';

  systemd.user.services.hyprpaper = {
    Unit = {
      Description = "Hyprland wallpaper daemon";
      PartOf = ["graphical-session.target"];
    };

    Service = {
      ExecStart = "${lib.getExe inputs.hyprpaper.packages.${pkgs.system}.default}";
      Restart = "on-failure";
    };
    
    Install.WantedBy = ["graphical-session.target"];
  };
}
