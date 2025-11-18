{
  flake.modules.nixos."nixosConfiguratoins/lotta" =
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
