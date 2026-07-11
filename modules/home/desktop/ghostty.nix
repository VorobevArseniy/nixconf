{
  flake.modules.homeManager.ghostty = {
    home.sessionVariables = {
      TERMINAL = "ghostty";
    };

    programs.ghostty = {
      enable = true;

      settings = {
        mouse-hide-while-typing = true;
        confirm-close-surface = false;
        working-directory = "inherit";

        theme = "Nordfox";

        # keybindings = {
        #   "super+shift+h" = "goto_split:left";
        #   "super+shift+j" = "goto_split:bottom";
        #   "super+shift+k" = "goto_split:top";
        #   "super+shift+l" = "goto_split:right";
        # };
      };
    };
  };
}
