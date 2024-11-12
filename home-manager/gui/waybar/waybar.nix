{
  isNixOS,
  ...
}:
{
  programs.waybar = {
    enable = isNixOS;
    systemd = {
      enable = true;
      target = "xdg-desktop-autostart.target";
    };
  };
  #  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
  #    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
  #  });
}
