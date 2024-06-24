{ inputs, pkgs, ... }:

let
  mkHomeConfiguration =
    host:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        inputs.neovim.homeManagerModules.default
        inputs.wezterm.homeManagerModules.default

        ./${host}/home.nix
        ../home-manager
        ../overlays
      ];
    };
in
{
  botworks-virtualized = mkHomeConfiguration "botworks-virtualized";
}
