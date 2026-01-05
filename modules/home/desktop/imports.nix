{ config, inputs, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    inputs.nvf.homeManagerModules.default

    discord
    ghostty
    web-browsers
    wayland
    nvf
  ];
}
