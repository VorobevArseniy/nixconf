{
  flake.modules.homeManager.nixcord =
    { inputs, ... }:
    {
      programs.nixcord = {
        enable = true;
        user = "master";

        discord.equicord.enable = true;
        discord.vencord.enable = false;
      };
    };
}
