{
  isNIXOS,
  ...
}:
{
  programs.waybar = {
    enable = isNIXOS;
    systemd = {
      enable = true;
      target = "xdg-desktop-autostart.target";
    };
  };
  #  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
  #    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
  #  });
}
