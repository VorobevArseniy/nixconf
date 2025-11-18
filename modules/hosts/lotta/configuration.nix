{
  flake.modules.nixos."nixosConfigurations/lotta" =
    { config, ... }:
    {
      networking.hostName = "lotta";

      boot.loader.timeout = 3;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
