{
  flake.modules.nixos.core = {
  };
}
#    programs.neovim = {
#      enable = true;
#      vimAlias = true;
#      defaultEditor = true;
#    };
#   programs.nvf = {
#     enable = true;
#     settings = {
#       vim = {
#         options = {
#           tabstop = 2;
#           shiftwidth = 2;
#           signcolumn = "no";
#           cursorlineopt = "screenline";
#         };
#         theme = {
#           enable = true;
#           name = "gruvbox";
#           style = "dark";
#         };
#         mini = {
#           pick.enable = true;
#           pairs.enable = true;
#           # surround.enable = true;
#           notify.enable = true;
#           icons.enable = true;
#           git.enable = true;
#           cursorword.enable = true;
#         };
#         lsp = {
#           enable = true;
#           formatOnSave = true;
#           lspkind.enable = true;
#         };
#
#         diagnostics = {
#           enable = true;
#           config.virtual_lines = true;
#         };
#
#         languages = {
#           enableTreesitter = true;
#
#           nix.enable = true;
#         };
#         autocomplete.blink-cmp = {
#           enable = true;
#           friendly-snippets.enable = true;
#         };
#         formatter.conform-nvim.enable = true;
#
#         utility = {
#           motion.flash-nvim.enable = true;
#           oil-nvim.enable = true;
#           surround.enable = true;
#         };
#
#         navigation = {
#           harpoon.enable = true;
#         };
#
#         keymaps = [
#           {
#             key = "<leader>ff";
#             mode = "n";
#             action = ":Pick files<CR>";
#           }
#           {
#             key = "<leader>fg";
#             mode = "n";
#             action = ":Pick grep_live<CR>";
#           }
#
#           {
#             key = "<leader>w";
#             mode = [
#               "n"
#               "v"
#             ];
#             action = ":write<CR>";
#           }
#
#           {
#             key = "<leader>q";
#             mode = [
#               "n"
#               "v"
#             ];
#             action = ":quit<CR>";
#           }
#
#           {
#             key = "-";
#             mode = "n";
#             action = ":Oil<CR>";
#           }
#           {
#             key = "<leader>y";
#             mode = [
#               "n"
#               "x"
#             ];
#             action = ''"+y'';
#           }
#           {
#             key = "<leader>p";
#             mode = [
#               "n"
#               "x"
#             ];
#             action = ''"+p'';
#           }
#           {
#             key = "<leader>P";
#             mode = [
#               "n"
#               "x"
#             ];
#             action = ''"+P'';
#           }
#         ];
#       };
#     };
#   };
#   programs.nano.enable = false;
# };
