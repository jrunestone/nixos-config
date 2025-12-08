{ inputs, lib, pkgs, config, outputs, ... }: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    inputs.nix-colors.homeManagerModules.default

    ./features/home
    ./features/home/root-cert.nix
    ./features/home/certs.nix
    ./features/home/zsh.nix
    ./features/home/kitty.nix
    ./features/home/fzf.nix
    ./features/home/git.nix
    ./features/home/gh.nix
    ./features/home/lf.nix
    ./features/home/nixvim.nix
    ./features/home/zed.nix
    ./features/home/vscode.nix
    ./features/home/hyprland.nix
    ./features/home/hyprpaper.nix
    ./features/home/hyprlock.nix
    ./features/home/waybar.nix
    ./features/home/fuzzel.nix
    ./features/home/dunst.nix
  ] ++ (builtins.attrValues outputs.homeManagerModules );

  colorScheme = inputs.nix-colors.colorSchemes.tomorrow-night;

  programs = {
    home-manager.enable = true;
  };

  home = {
    username = lib.mkDefault "jr";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "24.05";
  };
}
