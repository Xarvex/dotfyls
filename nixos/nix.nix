{ pkgs, ... }:

{
  nix = rec {
    nixPath = [ "nixpkgs=flake:nixpkgs" ];

    channel.enable = false;

    package = pkgs.nixVersions.latest;

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 14d";
    };

    settings = {
      nix-path = nixPath;

      auto-optimise-store = true;
      use-xdg-base-directories = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  systemd.tmpfiles.rules = [ "R /nix/var/nix/profiles/per-user - - - 0" ];
}
