{ inputs, self, ... }:
{
  perSystem =
    { system, ... }:
    {
      packages.concord = inputs.concord.packages.${system}.concord;
    };

  flake.modules.nixos.concord =
    { pkgs, ... }:
    {
      environment.systemPackages = [ self.packages.${pkgs.stdenv.hostPlatform.system}.concord ];
    };
}
