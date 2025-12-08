{ inputs, pkgs, lib, config, ... }: {
  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-poi ];
    settings = {
      git_protocol = "ssh";
    };
    hosts = {
      "github.com" = {
        user = "jrunestone";
      };
    };
  };
}
