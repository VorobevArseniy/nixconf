{
  flake.modules.nixos.nvidia =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    {
      hardware.graphics = {
        enable = true;
      };

      nixpkgs.config.cudaSupport = true;
      environment.systemPackages = [ pkgs.nvtopPackages.nvidia ];

      programs.nix-required-mounts = {
        enable = true;
        presets.nvidia-gpu.enable = true;
      };

      # Load nvidia driver for Xorg and Wayland
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {

        # Modesetting is required.
        modesetting.enable = true;

        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        # Enable this if you have graphical corruption issues or application crashes after waking
        # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
        # of just the bare essentials.
        powerManagement.enable = false;

        open = true;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };
}

#   # Load nvidia driver for Xorg and Wayland
#   services.xserver.videoDrivers = [ "nvidia" ];
#
#   hardware.nvidia = {
#
#     # Modesetting is required.
#     modesetting.enable = true;
#
#     # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
#     # Enable this if you have graphical corruption issues or application crashes after waking
#     # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
#     # of just the bare essentials.
#     powerManagement.enable = false;
#
#     # Fine-grained power management. Turns off GPU when not in use.
#     # Experimental and only works on modern Nvidia GPUs (Turing or newer).
#     powerManagement.finegrained = false;
#
#     # Use the NVidia open source kernel module (not to be confused with the
#     # independent third-party "nouveau" open source driver).
#     # Support is limited to the Turing and later architectures. Full list of
#     # supported GPUs is at:
#     # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
#     # Only available from driver 515.43.04+
#     open = false;
#
#     # Enable the Nvidia settings menu,
#     # accessible via `nvidia-settings`.
#     nvidiaSettings = true;
#
#     # Optionally, you may need to select the appropriate driver version for your specific GPU.
#     package = config.boot.kernelPackages.nvidiaPackages.stable;
#   };
# };

#   # PROPRIERARY DRIVER #######################################################################
#   nixpkgs.config.cudaSupport = true;
#   environment.systemPackages = [ pkgs.nvtopPackages.nvidia ];
#   ############################################################################################
#
#   # This machine can run cuda tests
#   programs.nix-required-mounts = {
#     enable = true;
#     presets.nvidia-gpu.enable = true;
#   };
#
#   hardware = {
#     graphics = {
#       enable = true;
#       enable32Bit = true;
#     };
#
#     nvidia = {
#       # Use latest drivers
#       package = config.boot.kernelPackages.nvidiaPackages.latest;
#
#       # Modesetting is required.
#       modesetting.enable = true;
#
#       # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
#       powerManagement.enable = false;
#       # Fine-grained power management. Turns off GPU when not in use.
#       # Experimental and only works on modern Nvidia GPUs (Turing or newer).
#       powerManagement.finegrained = false;
#
#       # Use the NVidia open source kernel module
#       open = false;
#
#       # Enable the Nvidia settings menu,
#       # accessible via `nvidia-settings`.
#       nvidiaSettings = true;
#     };
#   };
# };
