{
  flake.modules.homeManager.legcord =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.legcord ];
    };
}
