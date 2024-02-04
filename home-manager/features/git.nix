{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.git ];
  
  programs.git = {
    enable = true;
    
    aliases = {
    };

    extraConfig = {
      init.defaultBranch = "main";
    };

    userName = "Johan Runsten";
  };
}
