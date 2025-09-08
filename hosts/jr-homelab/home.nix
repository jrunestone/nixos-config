{ inputs, config, lib, pkgs, outputs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.nix-colors.homeManagerModules.default

    ../shared/features/home/default-barebones.nix
    ../shared/features/home/root-cert.nix
    ../shared/features/home/zsh.nix
    ../shared/features/home/kitty.nix
    ../shared/features/home/fzf.nix
    ../shared/features/home/git.nix
    ../shared/features/home/lf.nix
    ../shared/features/home/nixvim.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules );

  home.packages = [

  ];

  host-options.hostname = "jr-homelab";

  host-options.home = {

  };

  colorScheme = inputs.nix-colors.colorSchemes.tomorrow-night;

  programs = {
    home-manager.enable = true;
    eza.enable = true;
  };

  home = {
    username = lib.mkDefault "jr";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.05";
  };
}
