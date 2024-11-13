{
  pkgs,
  isNIXOS,
  isWSL,

  ...
}:
{
  programs.hyprland.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
