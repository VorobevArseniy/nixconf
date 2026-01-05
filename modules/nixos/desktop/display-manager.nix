{
  flake.modules.nixos.display-manager =
    { pkgs, ... }:
    {
      services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --greeting '★·.·´¯`·.·★·.·´¯`·.·★·.·´¯`·.·★·.·´¯`·.·★' --asterisks --remember --time --cmd niri-session";
            user = "greeter";
          };
        };
      };

      systemd.services.greetd.serviceConfig = {
        Type = "idle";
        StandartInput = "tty";
        StandartOutput = "tty";
        StandartError = "journal";

        TTYReset = true;
        TTYVHangup = true;
        TTYVTDisallocate = true;
      };
    };
  # {
  #   services = {
  #
  #     displayManager = {
  #       autoLogin = {
  #         enable = true;
  #         user = "master";
  #       };
  #
  #       sddm = {
  #         enable = true;
  #         wayland.enable = true;
  #         autoNumlock = true;
  #         theme = "where_is_my_sddm_theme_qt5";
  #       };
  #     };
  #   };
  #
  #   environment.systemPackages = [
  #     (pkgs.where-is-my-sddm-theme.override {
  #       variants = [ "qt5" ];
  #     })
  #   ];
  # };
}
