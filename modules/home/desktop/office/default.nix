{ config, ... }:
{
  flake.modules.homeManager.office =
    {
      lib,
      pkgs,
      ...
    }:
    {
      imports = with config.flake.modules.homeManager; [
        onlyoffice
      ];
    };
}
