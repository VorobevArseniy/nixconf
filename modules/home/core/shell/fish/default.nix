{
  flake.modules.homeManager.fish =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
          function fish_greeting
            fastfetch
          end
        '';
      };
      programs.starship.enable = true;
      programs.zoxide = {
        enable = true;
        options = [ "--cmd cd" ];
      };
    };
}
