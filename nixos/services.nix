{ isNIXOS, isWSL, ... }:
{
  services = {
    gvfs.enable = isNIXOS;
    gnome.gnome-keyring.enable = isNIXOS;
    dbus.enable = true;
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        AllowUsers = [ "zell" ];
      };
    };
    #   ollama = {
    #  enable = isNIXOS;
    #  acceleration = "cuda";#find why over ride package
    #};
    displayManager = {
      sddm = {
        enable = true;
        wayland = {
          enable = isNIXOS && !isWSL;
        };
      };
    };
  };
}
