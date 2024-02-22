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
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
    };
    
    keymaps = [
      {
        key = "<leader>n";
        action = ":Neotree<CR>";
      }
      
      {
        key = "<leader>m";
        action =":MCstart<CR>";
      }

      {
        key = "<leader>mp";
        action =":MCpattern<CR>";
      }

      {
        key = "<leader>t2";
        action =":set shiftwidth=2 tabstop=2 softtabstop=2<CR>";
      }

      {
        key = "<leader>t4";
        action =":set shiftwidth=4 tabstop=4 softtabstop=4<CR>";
      }
    ];

    plugins = {
      multicursors = {
        enable = true;
      };

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
