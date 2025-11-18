{ config, ... }:
{
  flake.modules.homeManager."homeConfigurations/lotta" = {
    imports = with config.flake.modules.homeManager; [
      desktop
    ];
  };
}
