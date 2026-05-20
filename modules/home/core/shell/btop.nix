{
  flake.modules.homeManager.core =
    { lib, pkgs, ... }:
    {
      programs.btop = {
        enable = true;
        package = lib.mkDefault pkgs.btop;
      };
    };
  flake.modules.homeManager.desktop =
    { lib, pkgs, ... }:
    {
      programs.btop = {
        settings = {
          color_theme = "nord";
        };
        package = lib.mkForce pkgs.btop-rocm;
      };
    };
}
