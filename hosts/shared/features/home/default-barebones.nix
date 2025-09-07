{ inputs, lib, pkgs, config, outputs, ... }: {  
  home.packages = [
    pkgs.zip
    pkgs.unzip
    pkgs.unar
    pkgs.file
    pkgs.tree
    pkgs.just
    pkgs.jq
    pkgs.ripgrep
    pkgs.killall
    pkgs.nix-search-cli
    pkgs.bat
    pkgs.htop
  ];

  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  programs.eza.enable = true;

  # envs
  home.sessionVariables = {
    HOSTNAME = "${config.host-options.hostname}";
  };
}
