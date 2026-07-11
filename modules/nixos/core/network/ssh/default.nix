{
  flake.modules.nixos.ssh =
    { lib, ... }:
    {
      # imports = with config.flake.modules.nixos; [
      #   sshd
      # ];

      programs.ssh = {
        startAgent = true;
        enableAskPassword = true;
      };

      environment.variables = {
        SSH_ASKPASS_REQUIRE = "prefer";
      };

      # load secrets that are only readable by master
      # secrets = lib.listToAttrs (
      #   map
      #     (
      #       keyName:
      #       lib.nameValuePair "ssh-${keyName}" {
      #         rekeyFile = ./keys/${keyName}.age;
      #         owner = "master";
      #         mode = "600";
      #       }
      #     )
      #     [
      #       "github"
      #     ]
      # );
    };
}
