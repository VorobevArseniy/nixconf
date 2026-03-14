{
  flake.modules.homeManager.mpv =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        yt-dlp
      ];

      programs.mpv = {
        enable = true;

        package = (
          pkgs.mpv.override {
            scripts = with pkgs.mpvScripts; [
              uosc
              sponsorblock
            ];

            mpv-unwrapped = pkgs.mpv-unwrapped.override {
              waylandSupport = true;
            };
          }
        );

        config = {
          profile = "high-quality";
          ytdl-format = "bestvideo+bestaudio";
        };
      };
    };
}
