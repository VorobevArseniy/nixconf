{ config, inputs, ... }:
{
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    inputs.niri.nixosModules.niri
    inputs.zapret-discord-youtube.nixosModules.default

    caps2ctrl
    auto-login
    display-manager
    keyring
    sound
  ];
}
