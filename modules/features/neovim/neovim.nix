{ self, inputs, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.neovim = inputs.nix-wrapper-modules.wrappers.neovim.wrap {
        inherit pkgs;

        imports = [ self.modules.neovim.lsp ];

        runtimePkgs = with pkgs; [
          tree-sitter
        ];

        specs.init = {
          data = null;
          config = builtins.readFile ./init.lua;
        };
      };
    };
}
