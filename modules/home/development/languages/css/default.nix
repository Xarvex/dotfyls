# TODO: Complete checklist:
# [/] LSP
# [ ] Linter
# [ ] Formatter
# [ ] Debugger
# [ ] Tester
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg'' = config.dotfyls.development;
  cfg' = cfg''.languages;
  cfg = cfg'.css;
in
{
  options.dotfyls.development.languages.css.enable = lib.mkEnableOption "CSS" // {
    default = cfg'.defaultEnable;
  };

  config = lib.mkIf (cfg''.enable && cfg.enable) {
    dotfyls.development.tools = with pkgs; [ vscode-langservers-extracted ];
  };
}
