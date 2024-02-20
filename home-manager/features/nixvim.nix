{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.ripgrep ];

  programs.bash.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    
    colorschemes.base16 = {
      enable = true;
      colorscheme = "twilight";
    };

    globals = {
      mapleader = " ";
    };

    options = {
      number = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
    };
    
    keymaps = [
      {
        key = "<leader>n";
        action = ":Neotree<CR>";
      }
    ];

    plugins = {
      telescope = {
        enable = true;
  
        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
        };
      };
  
      treesitter = {
        enable = true;
  
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          nix
          c_sharp
        ];
      };
      
      neo-tree = {
        enable = true;
      };
      
      lualine = {
        enable = true;
      };
    };
  };
}
