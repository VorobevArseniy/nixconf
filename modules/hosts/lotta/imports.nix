{ inputs, ... }:
{
  nixosHosts.lotta = {
    unstable = true;
  };
  flake.modules.nixos."nixosconfigurations/lotta".imports = with inputs.self.modules.nixos; [
    grub
    efi

    desktop

  ];
}
