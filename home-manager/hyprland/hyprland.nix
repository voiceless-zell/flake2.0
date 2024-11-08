{
  pkgs,
  lib,
  isNIXOS,
  ...
}:
with lib;
{
  home.packages = with pkgs; [
    swww
    hyprpicker
    wofi
    rofi-wayland
    wlogout
    grim
    slurp
    hyprcursor
    wl-clipboard
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    grimblast
  ];
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    systemd.enable = true;
    enable = isNIXOS;
    xwayland = {
      enable = isNIXOS;
      #  hidpi = true;
    };
    #nvidiaPatches = false;
  };
}
