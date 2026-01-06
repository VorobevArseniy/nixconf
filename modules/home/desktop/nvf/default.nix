{
  flake.modules.homeManager.nvf = {
    programs.nvf = {
      enable = true;
      settings = {
        vim = {
          viAlias = true;
          vimAlias = true;

          options = {
            tabstop = 2;
            shiftwidth = 2;
            signcolumn = "no";
            cursorlineopt = "screenline";
            cursorline = true;

            splitright = true;
            splitbelow = true;
          };

          mini = {
            pick.enable = true;
            pairs.enable = true;
            ai.enable = true;
            notify.enable = true;
            icons.enable = true;
            git.enable = true;
            cursorword.enable = true;
          };
          lsp = {
            enable = true;
            formatOnSave = true;

            inlayHints.enable = true;
            lspkind.enable = true;

            mappings = {
              codeAction = "<leader>ca";
            };

            servers.nixd.settings.nil.nix.autoArchive = true;
          };

          diagnostics = {
            enable = true;
            config.virtual_lines = true;
          };

          languages = {
            enableTreesitter = true;

            nix.enable = true;
            go.enable = true;
          };

          autocomplete.blink-cmp = {
            enable = true;
            friendly-snippets.enable = true;

            setupOpts = {
              keymap.preset = "default";

              cmdline = {
                keymap.preset = "enter";
              };
              signature.enabled = true;
            };
          };

          formatter.conform-nvim.enable = true;

          utility = {
            motion.flash-nvim.enable = true;

            nix-develop.enable = true;

            oil-nvim = {
              enable = true;

              setupOpts = {
                view_options = {
                  show_hidden = true;
                  natural_order = true;
                };

                skip_confirm_for_simple_edits = true;
                prompt_save_on_select_new_entry = false;
              };
            };
          };

          navigation = {
            harpoon.enable = true;
          };

          terminal.toggleterm = {
            enable = true;
            lazygit = {
              enable = true;
              mappings.open = "<leader>lg";
            };

            setupOpts.size = 30;
          };

          theme = {
            enable = true;

            name = "base16";
            base16-colors = {
              base00 = "2e3440";
              base01 = "39404f";
              base02 = "444c5e";
              base03 = "465780";
              base04 = "7e8188";
              base05 = "cdcecf";
              base06 = "abb1bb";
              base07 = "e7ecf4";
              base08 = "bf616a";
              base09 = "c9826b";
              base0A = "ebcb8b";
              base0B = "a3be8c";
              base0C = "88c0d0";
              base0D = "81a1c1";
              base0E = "b48ead";
              base0F = "bf88bc";
            };
          };
          keymaps = [
            # Mini pick
            {
              key = "<leader>ff";
              mode = "n";
              action = ":Pick files<CR>";
            }
            {
              key = "<leader>fg";
              mode = "n";
              action = ":Pick grep_live<CR>";
            }

            # Fast save/quit
            {
              key = "<leader>w";
              mode = [
                "n"
                "v"
              ];
              action = ":write<CR>";
            }
            {
              key = "<leader>q";
              mode = [
                "n"
                "v"
              ];
              action = ":quit<CR>";
            }

            # Oil
            {
              key = "-";
              mode = "n";
              action = ":Oil<CR>";
            }

            # Clipboard
            {
              key = "<leader>y";
              mode = [
                "n"
                "x"
              ];
              action = ''"+y'';
            }
            {
              key = "<leader>p";
              mode = [
                "n"
                "x"
              ];
              action = ''"+p'';
            }
            {
              key = "<leader>P";
              mode = [
                "n"
                "x"
              ];
              action = ''"+P'';
            }

            # Splits
            {
              key = "<M-h>";
              mode = [
                "n"
                "t"
              ];
              action = "<C-w>h";
            }
            {
              key = "<M-j>";
              mode = [
                "n"
                "t"
              ];
              action = "<C-w>j";
            }
            {
              key = "<M-k>";
              mode = [
                "n"
                "t"
              ];
              action = "<C-w>k";
            }
            {
              key = "<M-l>";
              mode = [
                "n"
                "t"
              ];
              action = "<C-w>l";
            }

            {
              key = "<M-e>";
              mode = [
                "n"
              ];
              action = ":split<CR>";
            }
            {
              key = "<M-o>";
              mode = [
                "n"
              ];
              action = ":vsplit<CR>";
            }

            # Toggle term
            {
              key = "<esc>";
              mode = [ "t" ];
              action = "<C-\\><C-n>";
            }
          ];
        };
      };
    };
  };
}
