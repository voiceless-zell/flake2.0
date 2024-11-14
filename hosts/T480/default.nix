{
  pkgs,
  nixpkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    ../../nixos/virtualisation.nix
    ../../nixos/steam.nix
  ];
  boot.kernelModules = [ "kvm-intel" ];
  networking = {
    hostName = "T480";
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "nvidia" ];
    desktopManager.gnome = {
      enable = true;
    };
  };
  hardware = {
    nvidia.open = true;
    opengl = {
      enable = true;
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
