{
  flake.modules.nixos.auto-login.services.getty = {
    autologinOnce = true;
    autologinUser = "master";
  };
}
