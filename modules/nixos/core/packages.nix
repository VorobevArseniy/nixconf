{
  flake.modules.nixos.core =
    { lib, pkgs, ... }:
    {
      environment.systemPackages = lib.attrValues {
        inherit (pkgs)
          git
          ripgrep
          tree
          unzip
          usbutils
          wget
          zip
          ;
      };

    };
}
