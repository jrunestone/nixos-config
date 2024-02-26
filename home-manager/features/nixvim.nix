{ pkgs, lib, config, ... }: {
  home.packages = [ pkgs.ripgrep ];

  programs.bash = {
    sessionVariables = {
      EDITOR = "nvim";
    };

    initExtra = ''
      function nv() { nvim -c "lcd $1" $1; }
    '';
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
        action = ":MCstart<CR>";
      }

      {
        key = "<leader>mp";
        action = ":MCpattern<CR>";
      }

      {
        key = "<leader>t2";
        action = ":set shiftwidth=2 tabstop=2 softtabstop=2<CR>";
      }

      {
        key = "<leader>t4";
        action = ":set shiftwidth=4 tabstop=4 softtabstop=4<CR>";
      }

      {
        key = "<leader>w";
        action = ":BufferClose<CR>";
      }

      {
        key = "<leader>q";
        action = ":BufferCloseBuffersLeft<CR>";
      }

      {
        key = "<leader>e";
        action = ":BufferCloseBuffersRight<CR>";
      }
    ];

    plugins = {
      which-key = {
        enable = true;
      };

      barbar = {
        enable = true;

        keymaps = {
          previous = "<leader>a";
          next = "<leader>d";
          close = "<leader>w";
        };
      };

      multicursors = {
        enable = true;
      };

      telescope = {
        enable = true;
  
        keymaps = {
          "<leader><leader>" = "find_files";
          "<leader>fb" = "buffers";
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

        filesystem = {
          followCurrentFile = {
            enabled = true;
            leaveDirsOpen = true;
          };
        };

        buffers = {
          followCurrentFile = {
            enabled = true;
            leaveDirsOpen = true;
          };
        };
      };
      
      lualine = {
        enable = true;
      };
    };
  };
}
