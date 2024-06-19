{ config, lib, ... }:

{
  options.custom.program.zsh.enable = lib.mkEnableOption "Zsh" // { default = true; };

  config = lib.mkIf config.custom.program.zsh.enable {
    programs.zsh = {
      enable = true;
    };

    custom.persist.files = [ ".local/state/zsh/history" ];
  };
}
