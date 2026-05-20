{

  flake.modules.homeManager.noctalia =
    { pkgs, inputs, ... }:
    {
      imports = [ inputs.noctalia.homeModules.default ];

      programs.noctalia-shell = {
        enable = true;
        settings = {
          position = "left";
          density = "compact";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Network";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ];
            right = [
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };

          location = {
            monthBeforeDay = false;
            name = "Tyumen, Russia";
          };

          colors = {
            mError = "#dddddd";
            mOnError = "#111111";
            mOnPrimary = "#111111";
            mOnSecondary = "#111111";
            mOnSurface = "#828282";
            mOnSurfaceVariant = "#5d5d5d";
            mOnTertiary = "#111111";
            mOnHover = "#ffffff";
            mOutline = "#3c3c3c";
            mPrimary = "#aaaaaa";
            mSecondary = "#a7a7a7";
            mShadow = "#000000";
            mSurface = "#111111";
            mHover = "#1f1f1f";
            mSurfaceVariant = "#191919";
            mTertiary = "#cccccc";
          };
        };
      };

      home.file.".cache/noctialia/wallpapers.json" = {
        text = builtins.toJSON {
          defaultWallpaper = ./ign_unsplash17.png;

          wallpapers = {
            "DP-1" = ./ign_unsplash17.png;
            "DP-2" = ./ign_unsplash17.png;
            "DP-3" = ./ign_unsplash17.png;
            "DP-4" = ./ign_unsplash17.png;
          };
        };
      };
    };
}
