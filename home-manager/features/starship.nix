{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.starship ];

  programs.starship = {
    enable = true;
  };

  programs.bash.promptInit = ''
    eval "$(starship init bash)"
  '';
}
