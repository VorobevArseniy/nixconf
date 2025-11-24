{
  flake.modules.nixos.users = {
    users = {
      mutableUsers = false;

      allowNoPasswordLogin = true;

      users = {
        root = {
          isSystemUser = true;
          hashedPassword = "$6$4fFvPv2zYuwxibzM$X6fgc1MDlQx2pYMH/Z2D6MOxx3rFqZqcI336aVFoDAjjHZ0odQdrkfZeObbd.Nf1Gdzn9jwJVYmVPBvmPd8/q1";
        };

        master = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
          ];
          hashedPassword = "$6$4fFvPv2zYuwxibzM$X6fgc1MDlQx2pYMH/Z2D6MOxx3rFqZqcI336aVFoDAjjHZ0odQdrkfZeObbd.Nf1Gdzn9jwJVYmVPBvmPd8/q1";
        };
      };
    };
  };
}
