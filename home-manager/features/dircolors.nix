{ pkgs, lib, config, ... }: {
  xdg.configFile."dircolors".source = builtins.fetchGit {
    url = "https://github.com/joshjon/bliss-dircolors";
  };

  programs.bash.initExtra = ''
    eval "$(dircolors ${xdf.configFile.dircolors})"
  '';
}
