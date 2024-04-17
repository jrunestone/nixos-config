{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.fzf = {
    enable = true;
    defaultCommand = "find \\! \\( -path '*/.git' -o -path '*/node_modules' -o -path '*/containers' -prune \\) -printf '%P\\n'";
  };

  programs.bash.initExtra = ''
    source "$(fzf-share)/key-bindings.bash"
    source "$(fzf-share)/completion.bash"
  '';
}
