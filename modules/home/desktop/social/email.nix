{
  flake.modules.homeManager.email =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.thunderbird ];
    };
}
