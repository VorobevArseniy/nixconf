{
  flake.modules.nixos.desktop = {
    services.zapret-discord-youtube = {
      enable = true;
      configName = "general(ALT11)"; # Или любой конфиг из папки configs (general, general(ALT), general (SIMPLE FAKE) и т.д.)
    };
  };
}
