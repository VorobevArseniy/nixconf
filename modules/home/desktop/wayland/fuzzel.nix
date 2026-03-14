{
  flake.modules.homeManager.fuzzel =
    { pkgs, ... }:
    {
      programs.fuzzel = {
        enable = true;
        settings = {
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
    };
}
