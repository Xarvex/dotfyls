{
  config,
  lib,
  pkgs,
  self,
  ...
}:

let
  cfg = config.dotfyls.programs.obsidian;
in
{
  options.dotfyls.programs.obsidian = {
    enable = lib.mkEnableOption "Obsidian" // {
      default = config.dotfyls.desktops.enable;
    };
    package = lib.mkPackageOption pkgs "Obsidian" { default = "obsidian"; };
  };

  config = lib.mkIf cfg.enable { home.packages = [ (self.lib.getCfgPkg cfg) ]; };
}
