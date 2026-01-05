{ inputs, ... }:
{
  flake.modules.nixos.agenix =
    { config, pkgs, ... }:
    {
      imports = [
        inputs.agenix.nixosModules.default
        inputs.agenix-rekey.nixosModules.default
      ];

      environment.systemPackages = [ pkgs.rage ];

      age.rekey = {
        storageMode = "local";
        masterIdentities = [ ../../../.secrets/identity.age ];
        localStorageDir = ../../../.secrets/nixos/${config.networking.hostName};
      };
    };
}
