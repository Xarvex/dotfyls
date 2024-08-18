{ config, lib, self, ... }:

let
  cfg = config.dotfyls.development;

  enabledLanguages = lib.filterAttrs (name: value: !value.enable) cfg.languages;
in
{
  imports = [
    ./rust.nix

    (self.lib.mkAliasPackageModule
      [ "dotfyls" "development" "direnv" ]
      [ "programs" "direnv" ])

    (self.lib.mkCommonModules [ "dotfyls" "development" "languages" ]
      (language: lCfg: {
        enable = lib.mkEnableOption language.name // { default = true; };
        templates = lib.mkOption {
          type = with lib.types; listOf str;
          description = "Templates available for ${language.name}.";
        };
      })
      {
        rust = {
          name = "Rust";
          specialArgs = {
            templates.default = [
              "rs"
              "rust"

              "rs-pg"
              "rs-postgres"
              "rust-pg"
              "rust-postgres"
            ];
          };
        };
      })
  ];

  options.dotfyls.development = {
    enable = lib.mkEnableOption "development" // { default = config.dotfyls.desktops.enable; };
    direnv.enable = lib.mkEnableOption "direnv" // { default = true; };
  };

  config = lib.mkIf cfg.enable (lib.mkMerge [
    { }

    (lib.mkIf cfg.direnv.enable {
      dotfyls.persist = {
        directories = [ ".local/share/direnv" ];
        cacheDirectories = [ ".cache/direnv/layouts" ];
      };

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;

        config = {
          strict_env = true;
          hide_env_diff = true;
        };
        stdlib = ''
          declare -A direnv_layout_dirs
          direnv_layout_dir() {
              printf '%s\n' "''${direnv_layout_dirs[''${PWD}]:=${config.xdg.cacheHome}/direnv/layouts/$(sha1sum - <<< "''${PWD}" | head -c40)''${PWD//[^a-zA-Z0-9]/-}}"
          }
        '';
      };
    })
  ]);
}

