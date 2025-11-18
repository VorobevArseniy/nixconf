{
  flake.modules.nixos.display-manager =
    { pkgs, ... }:
    {
      services = {
        displayManager = {
          autoLogin = {
            enable = true;
            user = "master";
          };
          sddm = {
            enable = true;
            wayland.enable = true;
            autoNumlock = true;
            theme = "where_is_my_sddm_theme_qt5";
          };
        };
      };

      environment.systemPackages = [
        (pkgs.where-is-my-sddm-theme.override {
          variants = [ "qt5" ];
        })
      ];
    };
}
