{
  flake.modules.homeManager.core = {
    home.shellAliases = {
      ff = "fastfetch";
    };
    programs.fastfetch = {
      enable = true;
      settings = {
        "logo" = {
          "source" = "~/nixconf/modules/home/core/shell/sylveon.txt";
          "type" = "file";
        };
        "modules" = [
          "title"
          "separator"
          "os"
          "shell"
          "de"
          "wm"
          "terminal"
          "cpu"
          "gpu"
          "memory"
          "break"
          "colors"
        ];
      };
    };
  };
}
