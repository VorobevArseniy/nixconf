{
  flake.modules.homeManager.ghostty =
    { lib, ... }:
    {
      home.sessionVariables = {
        TERMINAL = "ghostty";
      };

      programs.ghostty = {
        enable = true;

        settings = {
          mouse-hide-while-typing = true;
          confirm-close-surface = false;
          working-directory = "home";
          window-inherit-working-directory = true;

          theme = "Nordfox";
        };
      };
    };
}
