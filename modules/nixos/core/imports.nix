{
  config,
  ...
}:
{
  flake.modules.nixos.core.imports = with config.flake.modules.nixos; [
    #    inputs.disko.nixosModules.disko

    virtualization
    agenix
    network
    nix
    security
    users
  ];
}
