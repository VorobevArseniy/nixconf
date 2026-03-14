{ config, ... }:
{
  flake.modules.homeManager.media.imports = with config.flake.modules.homeManager; [
    mpv
  ];
}
