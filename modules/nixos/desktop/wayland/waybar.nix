{ self, ... }:
{
  flake.modules.nixos.waybar =
    { pkgs, ... }:
    {
      programs.waybar = {
        enable = true;
        # systemd.enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.waybar;
      };
    };
}
