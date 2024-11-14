{
  pkgs,
  inputs,
  config,
  nixpkgs,
  self,
  ...
}:
{

  boot.kernelModules = [ "intel" ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };
  networking = {
    hostName = "P72";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "intel" "nvidia" "modesetting" ];
    desktopManager.gnome.enable = true;
  };
  hardware.nvidia = {
    open = true;
    modesetting.enable = false;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:1:00:0";
      nvidiaBusId = "PCI:1:00:0";
    };
  };
  hardware.opengl = {
    enable = true;
  };
  powerManagement.cpuFreqGovernor = "performance";
}
