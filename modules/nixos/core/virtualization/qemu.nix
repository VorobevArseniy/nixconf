{
  flake.modules.nixos.qemu =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        qemu
      ];
    };
}
