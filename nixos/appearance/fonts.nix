{
  config,
  lib,
  self,
  ...
}:

let
  cfg' = config.dotfyls.appearance;
  cfg = cfg'.fonts;
  hmCfg = config.hm.dotfyls.appearance.fonts;
in
{
  options.dotfyls.appearance.fonts =
    let
      mkFontOption =
        name:
        lib.mkOption {
          type = lib.types.submodule {
            options = {
              name = lib.mkOption {
                type = lib.types.str;
                description = "Name of the font.";
              };
              package = lib.mkOption {
                type = lib.types.package;
                description = "Package providing the font.";
              };
            };
          };
          description = "Font used for ${name}.";
        };
    in
    {
      enable = lib.mkEnableOption "fonts" // {
        default = hmCfg.enable;
      };

      serif = mkFontOption "serif" // {
        default = hmCfg.serif;
      };
      sansSerif = mkFontOption "sans serif" // {
        default = hmCfg.sansSerif;
      };
      monospace = mkFontOption "monospace" // {
        default = hmCfg.monospace;
      };
      emoji = mkFontOption "emoji" // {
        default = hmCfg.emoji;
      };
      symbols = mkFontOption "nerdfonts" // {
        default = hmCfg.symbols;
      };
      multi-language = mkFontOption "multi-language" // {
        default = hmCfg.multi-language;
      };
    };

  config = lib.mkIf cfg.enable {
    fonts = {
      packages = [
        (self.lib.getCfgPkg cfg.serif)
        (self.lib.getCfgPkg cfg.sansSerif)
        (self.lib.getCfgPkg cfg.monospace)
        (self.lib.getCfgPkg cfg.emoji)
        (self.lib.getCfgPkg cfg.symbols)
        (self.lib.getCfgPkg cfg.multi-language)
      ];

      fontconfig.defaultFonts = {
        serif = with cfg; [ serif.name ];
        sansSerif = with cfg; [ sansSerif.name ];
        monospace = with cfg; [
          monospace.name
          symbols.name
        ];
        emoji = with cfg; [ emoji.name ];
      };
    };
  };
}
