{ inputs, self, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages.fuzzel = inputs.nix-wrapper-modules.wrappers.fuzzel.wrap {
        inherit pkgs;

        settings = {
          border.radius = 0;
          colors = {
            background = "2e3440ff";
            text = "cdcecfff";
            message = "cdcecfff";
            prompt = "7e8188ff";
            placeholder = "444c5eff";
            input = "e7ecf4ff";
            match = "bf616aff";
            selection = "39404fff";
            selection-text = "e7ecf4ff";
            selection-match = "bf616aff";
            counter = "465780ff";
            border = "465780ff";
          };
        };
      };

      packages.fuzzel-powermenu = (
        pkgs.writeShellApplication {
          name = "fuzzel-powermenu";
          runtimeInputs = with pkgs; [
            self.packages.${pkgs.stdenv.hostPlatform.system}.fuzzel
            niri
          ];
          text = ''
            choices="logout\nshutdown\nreboot\nreboot(uefi)"

            selected=$(echo -e "$choices" | fuzzel --dmenu \
            --anchor top-right \
            --lines 4 \
            --border-radius 0)

            case "$selected" in
              "logout") niri msg action quit ;;
              "shutdown") systemctl poweroff ;;
              "reboot") systemctl reboot ;;
              "reboot(uefi)") systemctl reboot --firmware-setup ;;
            esac

          '';
        }
      );
    };
}
