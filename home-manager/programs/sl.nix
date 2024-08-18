# TODO: make own version
{ config, lib, pkgs, ... }:

let
  cfg = config.dotfyls.programs.sl;
in
{
  options.dotfyls.programs.sl = {
    enable = lib.mkEnableOption "Steam Locomotive" // { default = true; };
    package = lib.mkPackageOption pkgs "Steam Locomotive" { default = "sl"; };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = with cfg; [ package ];

      shellAliases.sl = "sl -cew10";
    };
  };
}
