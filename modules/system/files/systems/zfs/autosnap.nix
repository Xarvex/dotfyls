{
  config,
  lib,
  self,
  ...
}:

let
  cfg' = config.dotfyls.files.systems.systems.zfs;
  cfg = cfg'.autosnap;
in
{
  imports = [
    (self.lib.mkAliasPackageModule
      [
        "dotfyls"
        "files"
        "systems"
        "systems"
        "zfs"
        "autosnap"
      ]
      [
        "services"
        "sanoid"
      ]
    )
  ];

  options.dotfyls.files.systems.systems.zfs.autosnap.enable =
    lib.mkEnableOption "autosnap using Sanoid"
    // {
      default = true;
    };

  config = lib.mkIf (cfg'.enable && cfg.enable) {
    services.sanoid = {
      enable = true;

      templates.default = {
        daily_hour = 0;
        daily_min = 0;

        weekly_wday = 7;
        weekly_hour = 0;
        weekly_min = 0;
      };
      datasets."zroot/persist" = {
        hourly = 48;
        daily = 14;
        weekly = 8;
        monthly = 2;
      };
    };
  };
}
