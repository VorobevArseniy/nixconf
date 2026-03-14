{
  flake.modules.homeManager.nixcord =
    { inputs, ... }:
    {
      programs.nixcord = {
        enable = true;
        user = "master";

        vesktop.enable = true;
      };
    };
}
