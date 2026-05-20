{
  flake.modules.darwin.desktop =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.neovim ];

      # Add ability to used TouchID for sudo authentication
      security.pam.services.sudo_local.touchIdAuth = true;

      # Add homebrew package management
      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          cleanup = "uninstall"; # This makes homebrew declarative!
          upgrade = true;
        };
        taps = [
          # "tuist/tuist"
        ];
        brews = [
          "sapling" # Looks like nix version is very outdated, mayhaps learn how to update and PR?
          "tailscale"

          # "tuist/tuist/tuist@4.20.0"
          # "awscli"
          # "swiftformat"
          # "swiftlint"
          # "lefthook"
        ];
        casks = [
          "ghostty"
          "docker"
          "spotify"
        ];
      };
    };

  flake.modules.homeManager.darwin-desktop =
    { config, ... }:
    {

    };
}
