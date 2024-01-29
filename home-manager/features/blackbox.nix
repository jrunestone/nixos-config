{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.blackbox-terminal ];

  home.file = {
    ".var/app/com.raggesilver.BlackBox/config/glib-2.0/settings/keyfile" = {
      text = ''
        [com/raggesilver/BlackBox]
        window-width=1809
        window-height=1042
        remember-window-size=true
        headerbar-drag-area=true
        font='CaskaydiaCove Nerd Font 14'
        terminal-bell=false
        opacity=90
        theme-dark='Solarized Dark'
      '';

      executable = false;
    };
  };
}
