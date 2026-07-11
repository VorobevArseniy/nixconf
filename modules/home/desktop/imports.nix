{ config, inputs, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    # inputs.nvf.homeManagerModules.default
    # nvf
    inputs.nixcord.homeModules.nixcord

    office
    media
    social
    ghostty
    # helix
    web-browsers
    wayland
  ];
}
