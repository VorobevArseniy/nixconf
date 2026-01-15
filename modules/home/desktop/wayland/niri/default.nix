{
  flake.modules.homeManager.niri =
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {
      home.packages = lib.attrValues {
        inherit (pkgs)
          playerctl
          swaybg
          xdg-utils
          wayland-utils
          xwayland-satellite
          ;
      };
      programs.niri.settings = {
        prefer-no-csd = true;

        layout = {
          gaps = 20;

          struts = {
            left = 0;
            right = 0;
            top = -10;
            bottom = 0;
          };

          focus-ring.active.color = "#88bfd0";

          border.width = 2;
          always-center-single-column = true;
          empty-workspace-above-first = true;
        };

        cursor.size = 12;

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
            geometry-corner-radius =
              let
                r = 8.0;
              in
              {
                top-left = r;
                top-right = r;
                bottom-left = r;
                bottom-right = r;
              };
            clip-to-geometry = true;
          }
        ];

        outputs = {
          "DP-4" = {
            mode.width = 2560;
            mode.height = 1440;
            position.x = 0;
            position.y = 0;
          };
          "DP-3" = {
            mode.width = 1440;
            mode.height = 2560;
            position.x = 2560;
            position.y = -720;
            transform.rotation = 90;
          };
        };

        screenshot-path = "~/Pictures/Screenshots/%Y-%m-%dT%H:%M:%S.png";

        binds = with config.lib.niri.actions; {
          "Mod+D".action.spawn = "fuzzel";
          "Mod+T".action.spawn = "ghostty";
          "Mod+B".action.spawn = "zen";

          "Mod+Shift+E".action = quit;
          "Mod+Shift+P".action = power-off-monitors;

          "Mod+Q".action = close-window;
          "Mod+R".action = switch-preset-column-width;
          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = fullscreen-window;
          "Mod+C".action = center-column;

          "Mod+H".action = focus-column-left;
          "Mod+L".action = focus-column-right;

          "Mod+Ctrl+H".action = move-column-left;
          "Mod+Ctrl+L".action = move-column-right;

          "Mod+Shift+H".action = focus-monitor-left;
          "Mod+Shift+L".action = focus-monitor-right;

          "Mod+Shift+Ctrl+H".action = move-column-to-monitor-left;
          "Mod+Shift+Ctrl+L".action = move-column-to-monitor-right;

          "Mod+J".action = focus-workspace-down;
          "Mod+K".action = focus-workspace-up;
          "Mod+Ctrl+J".action = move-column-to-workspace-down;
          "Mod+Ctrl+K".action = move-column-to-workspace-up;
          "Mod+Shift+J".action = move-workspace-down;
          "Mod+Shift+K".action = move-workspace-up;

          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;

          "Mod+Minus".action = set-column-width "-10%";
          "Mod+Equal".action = set-column-width "+10%";
          "Mod+Shift+Minus".action = set-window-height "-10%";
          "Mod+Shift+Equal".action = set-window-height "+10%";

          "Mod+Shift+S".action.screenshot = [ ];
          "Print".action.screenshot-screen = [ ];
          "Mod+Print".action.screenshot-window = [ ];
        };
      };
    };
}
