{ inputs, lib, pkgs, config, outputs, ... }: {
  programs.firefox = {
    enable = true;
  };
}
