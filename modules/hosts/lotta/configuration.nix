{
  flake.modules.nixos."nixosConfigurations/lotta" =
    { config, ... }:
    {
      networking.hostName = "lotta";

      age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLy+1nigP0uXc9sTiAn7rpQPNGCGomWpqWzlxZPSwb8 dr.venitus@gmail.com";

      boot.loader.timeout = 3;

      system = {
        autoUpgrade.enable = false;
        stateVersion = "25.05";
      };
    };
}
