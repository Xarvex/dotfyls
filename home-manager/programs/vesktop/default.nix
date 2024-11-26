{
  config,
  lib,
  pkgs,
  self,
  ...
}:

let
  cfg = config.dotfyls.programs.vesktop;
in
{
  options.dotfyls.programs.vesktop = {
    enable = lib.mkEnableOption "Vesktop" // {
      default = config.dotfyls.desktops.enable;
    };
    package = lib.mkPackageOption pkgs "Vesktop" { default = "vesktop"; };
  };

  config = lib.mkIf cfg.enable {
    dotfyls.persist.cacheDirectories = [ ".config/vesktop/sessionData" ];

    home.packages = [ (self.lib.getCfgPkg cfg) ];

    xdg.configFile = {
      "vesktop/settings.json".source = ./settings.json;
      "vesktop/settings/settings.json".source = ./settings/settings.json;
    };
  };
}
