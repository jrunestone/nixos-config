{ pkgs, lib, config, ... }: {
  programs.zsh = {
    sessionVariables = {
      EDITOR = "nvim";
    };

    initExtra = ''
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

      {
        key = "<leader>do";
        action = ":lua require('dapui').open()<CR>";
      }

      {
        key = "<leader>dc";
        action = ":lua require('dapui').close()<CR>";
      }

      {
        key = "<leader>db";
        action = ":lua require('dap').toggle_breakpoint()<CR>";
      }

      {
        key = "<leader>dh";
        action = ":lua require('dap.ui.widgets').hover()<CR>";
      }

      {
        key = "<F5>";
        action = ":lua require('dap').continue()<CR>";
      }

      {
        key = "<S>-<F5>";
        action = ":lua require('dap').terminate()<CR>";
      }

      {
        key = "<F10>";
        action = ":lua require('dap').step_over()<CR>";
      }

      {
        key = "<F11>";
        action = ":lua require('dap').step_into()<CR>";
      }

      {
        key = "<S><F11>";
        action = ":lua require('dap').step_out()<CR>";
      }
    ];

    plugins = {
      lsp = {
        enable = true;

        servers = {
          ccls.enable = true;
          cmake.enable = true;
        };

        keymaps = {
          lspBuf = {
            "<leader>gd" = "definition";
            "<leader>gr" = "references";
            "<leader>gh" = "hover";
          };
        };
      };

      # disabled for now because of limitations
      dap = {
        #enable = true;
        #extensions.dap-ui.enable = true;
          
        adapters = {
          executables.gdb = {
            command = "gdb";
            args = [ "-i" "dap" ];
          };
        };

        configurations = {
          c = [{
            name = "Debug";
            type = "gdb";
            request = "launch";
            #program = ""; # TODO: must specify a hard coded path atm
          }];
        };
      };

      coq-nvim = {
        enable = true;
        
        settings = {
          auto_start = "shut-up";
          completion.always = true;
          keymap.recommended = true;
        };
      };

      which-key = {
        enable = true;
      };

      barbar = {
        enable = true;

        keymaps = {
          previous = "<leader>a";
          next = "<leader>s";
          close = "<leader>w";
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
  
      treesitter = {
        enable = true;
  
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          nix
          c_sharp
          c
          cpp
          javascript
          typescript
          html
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
    };
  };
}
