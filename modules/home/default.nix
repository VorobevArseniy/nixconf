{
  flake.modules.homeManager.core =
    { lib, ... }:
    {
      home = {
        username = lib.mkDefault "master";
        homeDirectory = lib.mkDefault "/home/master";
      };
    };
}
