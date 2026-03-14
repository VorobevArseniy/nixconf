{
  flake.modules.homeManager.nvf =
    { lib, ... }:
    {
      programs.nvf = {
        enable = true;
        settings = {
          vim = {
            viAlias = true;
            vimAlias = true;

            options = {
              tabstop = 2;
              shiftwidth = 2;
              undofile = true;
              scrolloff = 20;

              switchbuf = "usetab";

              signcolumn = "no";
              cursorlineopt = "both";
              cursorline = true;

              breakindent = true;
              breakindentopt = "list:-1";
              linebreak = true;
              wrap = false;
              splitright = true;
              splitbelow = true;

              spelloptions = "camel";
              iskeyword = "@,48-57,_,192-255,-";
            };

            mini = {
              pick.enable = true;
              extra.enable = true;
              pairs.enable = true;
              ai.enable = true;
              notify.enable = true;
              icons.enable = true;
              git.enable = true;
              cursorword.enable = true;
              bufremove.enable = true;
            };
            lsp = {
              enable = true;
              formatOnSave = true;

              inlayHints.enable = true;
              lspkind.enable = true;

              mappings = {
                codeAction = "<leader>ca";
                goToDefinition = "gd";
                goToDeclaration = "gD";
                goToType = "gt";
              };
            };

            lsp.servers.nil.settings.nil.nix.flake.autoArchive = false;

            diagnostics = {
              enable = true;
              config.virtual_lines = true;
            };

            languages = {

              enableTreesitter = true;

              nix.enable = true;

              go.enable = true;

              ts.enable = true;

              rust.enable = true;

              elixir.enable = true;

              typst.enable = true;

              lua.enable = true;

              clang.enable = true;
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

            formatter.conform-nvim = {
              enable = true;

              setupOpts = {
                formatters_by_ft = {
                  tsx = "prettier";
                };
              };
            };

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

            navigation.harpoon.enable = true;

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
              {
                key = "<leader>fb";
                mode = "n";
                action = ":Pick buffers<CR>";
              }
              {
                key = "<leader>fh"; # find home
                mode = "n";
                action = ":lua MiniPick.builtin.files(nil, { source = { cwd = '~/'} })<CR>";
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
                key = "<C-t>";
                mode = [ "n" ];
                action = ":vsplit<CR> :term <CR> i";
              }
              {
                key = "<esc>";
                mode = [ "t" ];
                action = "<C-\\><C-n>";
              }
              {
                key = "tT";
                mode = [ "t" ];
                action = ":term <CR> i";
              }

              {
                key = "<leader>lg";
                mode = [ "n" ];
                action = ":term lazygit <CR> i";
              }

              # Buffers
              {
                key = "<leader>ba";
                mode = [
                  "n"
                  "t"
                ];
                action = "<Cmd>lua MiniBufremove.delete()<CR>";
              }
              {
                key = "<leader>bd";
                mode = [
                  "n"
                  "t"
                ];
                action = "<Cmd>lua MiniBufremove.delete(0, true)<CR>";
              }
              {
                key = "<leader>bs";
                mode = [
                  "n"
                  "t"
                ];
                action =
                  let
                    new_scratch_buffer = "vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))";
                  in
                  "<Cmd>lua ${new_scratch_buffer}<CR>";
              }
              {
                key = "<leader>bw";
                mode = [
                  "n"
                  "t"
                ];
                action = "<Cmd>lua MiniBufremove.wipeout()<CR>";
              }
              {
                key = "<leader>bW";
                mode = [
                  "n"
                  "t"
                ];
                action = "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>";
              }
            ];
          };
        };
      };
    };
}
