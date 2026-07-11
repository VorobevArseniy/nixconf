{ inputs, ... }:
{
  perSystem =
    { pkgs, lib, ... }:
    {
      packages.niri = inputs.nix-wrapper-modules.wrappers.niri.wrap {
        inherit pkgs;

        settings = {
          xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

          prefer-no-csd = true;

          layout = {
            gaps = 10;

            struts = {
              left = 0;
              right = 0;
              top = 0;
              bottom = 0;
            };

            border = {
              width = 2;
              active-color = "#88bfd0";
            };
            always-center-single-column = true;
            empty-workspace-above-first = true;

            focus-ring = {
              active-color = "#88bfd0";
              width = 2;
            };
          };

          cursor = {
            xcursor-theme = "macOS";
            xcursor-size = 24;
            hide-when-typing = true;
          };

          input = {
            keyboard = {
              repeat-delay = 200;
              repeat-rate = 35;

              xkb = {
                layout = "us,ru";
                options = "grp:lalt_lshift_toggle,caps:esc";
              };

            };
          };

          window-rules = [
            {
              geometry-corner-radius = 0;
              clip-to-geometry = true;
            }
          ];

          outputs = {
            "DP-1" = {
              mode = "2560x1080";
              position = _: {
                props = {
                  x = 0;
                  y = 0;
                };
              };
            };
            "DP-2" = {
              mode = "2560x1080";
              position = _: {
                props = {
                  x = 0;
                  y = 0;
                };
              };
            };
            "DP-3" = {
              mode = "1440x2560";
              position = _: {
                props = {
                  x = 2560;
                  y = -720;
                };
              };
              transform = "90";
            };
            "DP-4" = {
              mode = "1440x2560";
              position = _: {
                props = {
                  x = 2560;
                  y = -720;
                };
              };
              transform = "90";
            };
          };

          screenshot-path = "~/Pictures/Screenshots/%Y-%m-%dT%H:%M:%S.png";

          binds = {
            "Mod+D".spawn-sh = "fuzzel";
            "Mod+T".spawn-sh = lib.getExe pkgs.ghostty;
            "Mod+B".spawn-sh = lib.getExe pkgs.qutebrowser;
            "Mod+Shift+Q".spawn-sh = "fuzzel-powermenu";

            "Mod+Shift+E".quit = _: { };
            "Mod+Shift+P".power-off-monitors = _: { };

            "Mod+Q".close-window = _: { };
            "Mod+R".switch-preset-column-width = _: { };
            "Mod+F".maximize-column = _: { };
            "Mod+Shift+F".fullscreen-window = _: { };
            "Mod+C".center-column = _: { };

            "Mod+H".focus-column-left = _: { };
            "Mod+L".focus-column-right = _: { };

            "Mod+Ctrl+H".move-column-left = _: { };
            "Mod+Ctrl+L".move-column-right = _: { };

            "Mod+Shift+H".focus-monitor-left = _: { };
            "Mod+Shift+L".focus-monitor-right = _: { };

            "Mod+Shift+Ctrl+H".move-column-to-monitor-left = _: { };
            "Mod+Shift+Ctrl+L".move-column-to-monitor-right = _: { };

            "Mod+J".focus-workspace-down = _: { };
            "Mod+K".focus-workspace-up = _: { };
            "Mod+Ctrl+J".move-column-to-workspace-down = _: { };
            "Mod+Ctrl+K".move-column-to-workspace-up = _: { };
            "Mod+Shift+J".move-workspace-down = _: { };
            "Mod+Shift+K".move-workspace-up = _: { };

            "Mod+Comma".consume-window-into-column = _: { };
            "Mod+Period".expel-window-from-column = _: { };

            "Mod+Minus".set-column-width = "-10%";
            "Mod+Equal".set-column-width = "+10%";
            "Mod+Shift+Minus".set-window-height = "-10%";
            "Mod+Shift+Equal".set-window-height = "+10%";

            "Mod+Shift+S".screenshot = _: { };
            "Print".screenshot-screen = _: { };
            "Mod+Print".screenshot-window = _: { };

            "Mod+V".toggle-window-floating = _: { };

            "Mod+Space".toggle-overview = _: { };
          };
        };
      };
    };
}
