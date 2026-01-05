{ inputs, ... }:
{
  nixosHosts.lotta = {
    unstable = true;
  };
  flake.modules.nixos."nixosConfigurations/lotta".imports = with inputs.self.modules.nixos; [
    # nvidia

    grub
    efi

    desktop
    dev
  ];
}
