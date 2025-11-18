{
  flake.modules.nixos.users = {
    users = {
      mutableUsers = false;

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
