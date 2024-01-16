{ pkgs, lib, config, ... }: {
  home.packages = [ git ];
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