{

  flake.modules.homeManager.qutebrowser = {
    programs.qutebrowser = {
      enable = true;
      quickmarks = {
        yt = "https://youtube.com";
        gh = "https://github.com";
        nixpkgs = "https://github.com/NixOS/nixpkgs";
      };

      keyBindings = {
        normal = {
          ",m" = "spawn mpv {url}";
          ",M" = "hint links spawn mpv {hint-url}";
        };
      };

      settings = {
        colors = {
          webpage.darkmode.enabled = true;
          tabs.bar.bg = "#39404F";
        };
      };
    };

  };
}
