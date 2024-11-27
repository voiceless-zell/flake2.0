{
  pkgs,
  ...
}:
{
  systemd.services.tailscaled = {
    description = "Tailscale Mode";
    wantedBy = [ "multi-user.target" ];
  };
  networking = {
    hostName = "Galifrey";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  services = {
    plex = {
      enable = true;
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "server";
    };
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "intel" ];
    };
  };
  hardware.opengl = {
    enable = true;
    extraPackages =
      [
      ];
  };

}
