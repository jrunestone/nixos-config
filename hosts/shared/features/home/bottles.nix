{ inputs, lib, pkgs, config, outputs, ... }: {
  home.packages = [ 
    pkgs.bottles 
    pkgs.wine
  ];
}
