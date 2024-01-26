{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.starship ];

  programs.starship = {
    enable = true;
  };

  programs.bash.initExtra = ''
    eval "$(starship init bash)"
  '';
}
