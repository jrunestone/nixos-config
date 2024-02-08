{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.blackbox-terminal ];
  
  dconf.settings = {
    "com/raggesilver/BlackBox" = {
      window-width = lib.hm.gvariant.mkUint32 1809;
      window-height = lib.hm.gvariant.mkUint32 1042;
      remember-window-size = true;
      headerbar-drag-area = true;
      font = "FiraCode Nerd Font 14";
      terminal-bell = false;
      opacity = lib.hm.gvariant.mkUint32 80;
      theme-dark = "base16: Twilight (dark)";
      notify-process-completion = false;
      scrollback-lines = lib.hm.gvariant.mkUint32 10000;
    };
  };
}
