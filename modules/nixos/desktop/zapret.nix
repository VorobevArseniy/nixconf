{
  flake.modules.nixos.desktop = {
    services.zapret-discord-youtube = {
      enable = true;
      config = "general(ALT11)"; # Или любой конфиг из папки configs (general, general(ALT), general (SIMPLE FAKE) и т.д.)
    };
  };
}
