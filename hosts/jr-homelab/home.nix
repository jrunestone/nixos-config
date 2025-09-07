{ inputs, config, lib, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
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
}
