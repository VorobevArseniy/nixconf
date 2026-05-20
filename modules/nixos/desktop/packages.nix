{
  flake.modules.nixos.desktop =
    { pkgs, inputs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # Multimedia
        vlc

        tuigreet
      ];
    };
}
