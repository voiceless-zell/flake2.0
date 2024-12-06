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
      useRoutingFeatures = "both";
    };
    xserver = {
      enable = true;
      xkb.layout = "us";
      videoDrivers = [ "intel" ];
    };
    mdadm = {
      enable = true;
      devices = [
        "/dev/sda"
        "/dev/sdb"
      ];
      level = "0";
    };
    samba = {
      enable = true;
      settings = {
        public = {
          browsable = "yes";
          "guest ok" = "yes";
          path = "/mnt/raid/";
        };
      };
    };
  };
  hardware.opengl = {
    enable = true;
    extraPackages =
      [
      ];
  };
}
