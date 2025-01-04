{
  pkgs,
  isNIXOS,
  isWSL,
  inputs,

  ...
}:
{
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  # xdg.portal = {
  #  enable = true;
  #  wlr.enable = true;
  #  extraPortals = [
  #    pkgs.xdg-desktop-portal-hyprland
  #  ];
  #};
}
