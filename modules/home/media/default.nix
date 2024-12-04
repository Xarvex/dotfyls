{ config, lib, ... }:

{
  imports = [
    ./foliate
    ./libreoffice
    ./mpv
    ./nomacs
    ./steam
    ./spotify
    ./zathura

    ./mime-apps.nix
    ./mpris.nix
    ./pipewire.nix
  ];

  options.dotfyls.media.enable = lib.mkEnableOption "media" // {
    default = config.dotfyls.desktops.enable;
  };
}