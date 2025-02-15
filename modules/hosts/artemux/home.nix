_:

{
  dotfyls = {
    browsers.browsers.chromium.enable = true;

    desktops.displays = [
      {
        name = "HDMI-A-1";
        width = 1920;
        height = 1080;
        refresh = 75;
        position = "-1920x0";
      }
      {
        name = "eDP-1";
        width = 1920;
        height = 1200;
        refresh = 60;
        scale = 1.3333;
      }
    ];

    input.solaar = {
      enable = true;
      deviceConfig = ./solaar/config.yaml;
    };

    shells.shells.zsh.enable = true;

    terminals.terminals = {
      alacritty.enable = true;
      foot.enable = true;
      wezterm.enable = true;
    };
  };
}
