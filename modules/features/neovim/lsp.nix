{ self, ... }:
{
  flake.modules.neovim.lua =
    { pkgs, ... }:
    {
      runtimePkgs = [ pkgs.lua-language-server ];

      specs.lua-language-server = {
        data = [ pkgs.vimPlugins.nvim-lspconfig ];
        config =
          #lua
          ''
            vim.lsp.config("lua_ls", {
            	settings = {
            		Lua = {
            			diagnostics = {
            				globals = { 'vim', 'love' }
            			}
            		}
            	}
            })
            vim.lsp.enable("lua_ls")
          '';
      };
    };

  flake.modules.neovim.nix =
    { pkgs, ... }:
    {
      runtimePkgs = [
        pkgs.nixd
        pkgs.nixfmt
        # pkgs.alejandra
      ];
      specs.nix = {
        data = [ pkgs.vimPlugins.nvim-lspconfig ];
        config =
          #lua
          ''
            vim.lsp.config("nixd", {
              cmd = { "nixd" },
              settings = {
                nixd = {
                  nixpkgs = {
                    expr = "import <nixpkgs> { }",
                  },
                  formatting = {
                    command = { "nixfmt" },
                  },
                },
              },
            })
            vim.lsp.enable("nixd")
          '';
      };
    };

  flake.modules.neovim.ts =
    { pkgs, ... }:
    {
      runtimePkgs = [
        pkgs.typescript-language-server
        pkgs.tailwindcss-language-server
      ];
      specs.ts = {
        data = [ pkgs.vimPlugins.nvim-lspconfig ];
        config =
          #lua
          ''
            vim.lsp.config("ts_ls", {
              settings = {
                suggestionActions = {
                  enabled = false
                }
              }
            })
            vim.lsp.enable({
              "ts_ls",
              "biome",
              "emmet_language_server",
              "astro",
              "tailwindcss"
            })
          '';
      };
    };

  flake.modules.neovim.go =
    { pkgs, ... }:
    {
      runtimePkgs = [ pkgs.gopls ];
      specs.go = {
        data = [ pkgs.vimPlugins.nvim-lspconfig ];
        config =
          #lua
          ''
            vim.lsp.config("gopls", {
            	settings = {
            		gopls = {
            			hints = {
            				parameterNames = true,
            				rangeVariableTypes = true,
            			}
            		}
            	}
            })
            vim.lsp.enable("gopls")
          '';
      };
    };

  flake.modules.neovim.emmet =
    { pkgs, ... }:
    {
      runtimePkgs = [ pkgs.emmet-language-server ];
      specs.emmet = {
        data = [ pkgs.vimPlugins.nvim-lspconfig ];
        config =
          #lua
          ''
            vim.lsp.config("emmet_language_server", {
              init_options = {
                showSuggestionsAsSnippets = true,
              }
            })
            vim.lsp.enable("emmet_language_server")
          '';
      };
    };
  flake.modules.neovim.c =
    { pkgs, ... }:
    {
      specs.c = {
        data = [ pkgs.vimPlugins.nvim-lspconfig ];
        config =
          #lua
          ''
            vim.lsp.config("clangd", {
              init_options = {
                clangdFileStatus = true,
            	  usePlaceholders = true,
            	  completeUnimportedDeclarations = true,
            	}
            })
          '';
      };
    };

  flake.modules.neovim.lsp =
    { pkgs, ... }:
    {
      specs.lsp = {
        data = [ pkgs.vimPlugins.nvim-lspconfig ];
        config =
          #lua
          ''
            vim.lsp.enable({ "tinymist", "rust_analyzer", "clangd", "zls" })
          '';
      };
      imports = [
        self.modules.neovim.lua
        self.modules.neovim.ts
        self.modules.neovim.nix
        self.modules.neovim.go
        self.modules.neovim.emmet
        self.modules.neovim.c
      ];
    };
}
