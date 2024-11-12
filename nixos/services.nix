{ isNIXOS, ... }:
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
    self-deploy.sshKeyFile = "~/.ssh/id_ed25519";
    #   ollama = {
    #  enable = isNIXOS;
    #  acceleration = "cuda";#find why over ride package
    #};
    displayManager = {
      sddm = {
        enable = isNIXOS;
        wayland = {
          enable = isNIXOS;
        };
      };
    };
  };
}
