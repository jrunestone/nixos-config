{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.fzf ];

  programs.bash.sessionVariables = {
    FZF_DEFAULT_COMMAND = "find \\! \\( -path '*/.git' -o -path '*/node_modules' -prune \\) -printf '%P\\n'";
  };
}
