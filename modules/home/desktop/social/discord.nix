{
  flake.modules.homeManager.discord =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.legcord
        pkgs.discordo
      ];
    };
}
