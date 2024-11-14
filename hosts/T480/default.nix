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

    networkmanager.enable = true;
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "nvidia" ];
  };
  hardware = {
    nvidia.open = true;
    opengl = {
      enable = true;
    };
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
