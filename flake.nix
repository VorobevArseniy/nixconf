{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    wrappers.url = "github:lassulus/wrappers";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    import-tree.url = "github:vic/import-tree";

    home-manager = {
      url = "github:nix-community/home-manager";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  #  outputs = { self, nixpkgs, nvf, wrappers, ...}:
  #  let
  #    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  #  in
  #  {
  #    packages."x86_64-linux".nvim =
  #      (nvf.lib.neovimConfiguration {
  #        inherit pkgs;
  #        modules = [ ./nvf-configuration.nix ];
  #      }).neovim;
  #
  #    packages."x86_64-linux".niri = (
  #        wrappers.wrapperModules.niri.apply
  #          {
  #             inherit pkgs;
  #             "config.kdl".content = "";
  #          }
  #        ).wrapper;
  #
  #
  #    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
  #      modules = [
  #        ./configuration.nix
  # nvf.nixosModules.default
  #      ];
  #    };
  #  };
}
