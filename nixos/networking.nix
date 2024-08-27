{ config, lib, ... }:

# TODO: firewalls
let
  cfg = config.dotfyls.networking;
in
{
  options.dotfyls.networking = {
    wireless = lib.mkEnableOption "wireless networking" // { default = true; };
    bluetooth = lib.mkEnableOption "Bluetooth networking" // { default = true; };
  };

  config = lib.mkMerge [
    (lib.mkIf cfg.wireless {
      networking = {
        # Pick only one of the below networking options.
        # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
        networkmanager.enable = true; # Easiest to use and most distros use this by default.
      };

      dotfyls.persist.directories = [ "/etc/NetworkManager" ];
    })

    (lib.mkIf cfg.bluetooth {
      dotfyls.persist.directories = [ "/var/lib/bluetooth" ];

      services.blueman.enable = true;

      hardware.bluetooth.enable = true;
    })
  ];
}
