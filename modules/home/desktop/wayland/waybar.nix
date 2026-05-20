{
  flake.modules.homeManager.waybar =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      programs.waybar = {
        enable = true;
        systemd.enable = true;
        settings = [
          {
            layer = "top";
            outputs = [
              "DP-3"
            ];
            height = 25;
            # margin = "10";

            modules-left = [
              "niri/window"
            ];

            modules-right = [
              "wireplumber"
              "network"
              "clock"
              "custom/power"
            ];

            "niri/window" = {
              format = "{title}";
              max-length = 35;
              rewrite = {
                "" = "nihil";
              };
            };

            "custom/power" = {
              format = "󰤆";
              tooltip = false;
              on-click = "systemctl poweroff";
            };

          }
        ];
        style = ''
          * {
            font-family: "JetBrainsMono Nerd Font", Roboto, Helvetica, Arial, sans-serif;
            font-size: 1rem;
          }

          window#waybar {
            background-color: #39404F;
            transition-property: background-color;
            transition-duration: .5s;
          }

          button {
            box-shadow: inset 0 -3px transparent;
            border: none;
            border-radius: 0;
          }

          button:hover {
            background: inherit;
            box-shadow: inset 0 -3px #ffffff;
          }

          #custom-power,
          #wireplumber,
          #network,
          #clock {
            background-color: #39404F;
            padding: 0 10px;
            margin-left: 8px;
            color: white;
          }

          .modules-left {
            padding: 0 10px;
            margin-left: 8px;
            color: white;
          }


          label:focus {
            background-color: #000000;
          }
        '';
      };
    };
}
