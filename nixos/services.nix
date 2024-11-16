{ ... }:
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        AllowUsers = [ "zell" ];
      };
    };
    libinput = {
      enable = true;
      mouse.accelProfile = "flat";
    };

    hardware.bolt.enable = true;
    #   ollama = {
    #  enable = isNIXOS;
    #  acceleration = "cuda";#find why over ride package
    #};
    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = true;
        };
      };
    };
  };
}
