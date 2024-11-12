{
  pkgs,
  isNIXOS,
  isWSL,

  ...
}:
{
  programs.hyprland.enable = isNIXOS && !isWSL;
  xdg.portal = {
    enable = isNIXOS && !isWSL;
    wlr.enable = isNIXOS && !isWSL;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
