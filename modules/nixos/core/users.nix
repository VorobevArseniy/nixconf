{
  flake.modules.nixos.users = {
    users = {
      mutableUsers = false;

      allowNoPasswordLogin = true;

      users = {
        root = {
          isSystemUser = true;
        };

        master = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
          ];
        };
      };
    };
  };
}
