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
        mpv

        tuigreet
        kanata

        lazygit
      ];

    };
}
