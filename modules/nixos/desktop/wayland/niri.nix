{ inputs, ... }:
{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      programs.niri.enable = true;
      nixpkgs.overlays = [ inputs.niri.overlays.niri ];
      programs.niri.package = pkgs.niri;

      environment.systemPackages = with pkgs; [
        fuzzel
        alacritty
      ];
    };
}
