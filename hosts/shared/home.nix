{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
    ./features/home
  ] ++ (builtins.attrValues outputs.homeManagerModules );

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = lib.mkDefault "jr";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.05";
  };
}
