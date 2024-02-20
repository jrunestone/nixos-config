{ pkgs, lib, config, ... }: {
  programs.bash.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true;

    options = {
      number = true;
      shiftwidth = 2;
    };
  };
}
