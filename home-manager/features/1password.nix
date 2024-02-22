{ pkgs, lib, config, ... }: {
  home.packages = [ 
    pkgs._1password-gui
    pkgs._1password
  ];
}
