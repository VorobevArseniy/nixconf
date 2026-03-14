{ config, inputs, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    inputs.nvf.homeManagerModules.default
    inputs.nixcord.homeModules.nixcord

    media
    social
    ghostty
    web-browsers
    wayland
    nvf
  ];
}
