{ pkgs, lib, config, ... }: {
  programs.zsh = {
    sessionVariables = {
      EDITOR = "nvim";
    };

    initContent = ''
      nv() { nvim -c "lcd $1" $1; }
    '';
  };

  programs.nixvim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    
    colorschemes.base16 = {
      enable = true;
      colorscheme = "tomorrow-night";
    };

    # TODO: color scheme
    #highlightOverride = {
    #  NeoTreeNormal.bg = "#2B2D30";
    #  NeoTreeNormalNC.bg = "#2B2D30";
    #};

    globals = {
      mapleader = " ";
    };

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      expandtab = true;
      wrap = false;
    };

    keymaps = [
      {
        key = "<leader>n";
        action = ":Neotree<CR>";
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

      # set filetype to json and format with jq
      {
        key = "<leader>fj";
        action =":set filetype=json | %!jq '.'<CR>";
      }
    ];

    plugins = {
      lsp = {
        enable = true;
        servers = {
          csharp_ls.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
      };

      web-devicons ={
        enable = true;
      };

      which-key = {
        enable = true;
      };

      barbar = {
        enable = true;

        keymaps = {
          previous = { key = "<leader>a"; };
          next = { key = "<leader>d"; };
          close = { key = "<leader>w"; };
        };
      };

      telescope = {
        enable = true;
  
        keymaps = {
          "<leader><leader>" = "find_files";
          "<leader>fb" = "buffers";
          "<leader>fg" = "live_grep";
          "<leader>fc" = "commands";
        };
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
    };
  };
}
