{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.git ];
  
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    
    aliases = {
    };

    extraConfig = {
      init.defaultBranch = "main";
    };
    
    lfs.enable = true;
  };
}
