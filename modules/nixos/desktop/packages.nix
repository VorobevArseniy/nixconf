{
  flake.modules.nixos.desktop =
    { pkgs, inputs, ... }:
    {
      environment.systemPackages = with pkgs; [
        # Multimedia
        ffmpeg
        ffmpegthumbnailer
        gthumb
        imagemagick
        vlc

        tuigreet
        kanata

        lazygit
      ];

    };
}
