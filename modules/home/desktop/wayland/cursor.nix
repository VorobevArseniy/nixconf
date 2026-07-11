{
  flake.modules.homeManager.waylandCursor =
    { pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          apple-cursor
        ];

        sessionVariables = {
          XCURSOR_THEME = "macOS";
          XCURSOR_SIZE = "24";
        };

      };

      # home.pointerCursor = {
      #   gtk.enable = true;
      #   x11.enable = true;
      #   name = "Adwaita-Pop";
      #   size = 16;
      #   package = pkgs.bibata-cursors;
      # };

    };
}
