{ pkgs, lib, config, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      set expandtab
      set tabstop=4
      set softtabstop=4
      set shiftwidth=4
    '';

    plugins = [

    ];
  };
}
