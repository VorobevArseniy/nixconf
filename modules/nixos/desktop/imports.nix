{ config, inputs, ... }:
{
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    inputs.zapret-discord-youtube.nixosModules.default

    concord
    qmk
    caps2ctrl
    auto-login
    display-manager
    keyring
    sound
    wayland
  ];
}
