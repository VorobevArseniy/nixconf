{ config, ... }:
{
  flake.modules.homeManager.wayland =
    {
      lib,
      pkgs,
      ...
    }:
    {
      imports = with config.flake.modules.homeManager; [
        niri
        waybar
        # fuzzel
        # gammastep
        # swaync
        # swayosd
      ];

      services.wpaperd = {
        enable = true;
        settings = {
          DP-3.path = ./ign_unsplash17.png;
          DP-4.path = ./ign_unsplash17.png;
        };
      };

      home = {
        packages = lib.attrValues {
          inherit (pkgs)
            wdisplays
            wlr-randr
            wl-clipboard
            ;
        };

        sessionVariables = {
          NIXOS_OZONE_WL = 1;

          SDL_VIDEODRIVER = "wayland";
          QT_QPA_PLATFORM = "wayland";
          QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
          _JAVA_AWT_WM_NONREPARENTING = "1";
          XDG_SESSION_TYPE = "wayland";
        };
      };
    };
}
