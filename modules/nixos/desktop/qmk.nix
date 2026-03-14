{
  flake.modules.nixos.qmk =
    { pkgs, ... }:
    {

      hardware.keyboard.qmk.enable = true;

      environment.systemPackages = with pkgs; [ via ];
      services.udev.packages = with pkgs; [
        qmk-udev-rules
        via
      ];
    };
}
