{ config, ... }:
{
  flake.modules.nixos.desktop.imports = with config.flake.modules.nixos; [
    auto-login
    display-manager
    keyring
  ];
}
