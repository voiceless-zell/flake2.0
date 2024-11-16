{
  ...
}:
{
  networking = {
    hostName = "Galifrey";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "intel" ];
  };
  hardware.opengl = {
    enable = true;
    extraPackages =
      [
      ];
  };
}
