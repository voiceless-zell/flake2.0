{
  config,
  lib,
  user,
  ...
}:
{
  config = {
    wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1,2560x1600,0x0,1"
    ];
  };
}
