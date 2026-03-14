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

          function fish_user_key_bindings
            fish_vi_key_bindings
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
