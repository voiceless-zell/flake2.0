{
  pkgs,
  lib,
  ...
}:
{
  imports =
    [
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
    "vm.max_map_count" = 16777216;
    "fs.file-max" = 524288;
  };
  networking = {
    hostName = "P16";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [
      "nvidia"
      "inter"
    ];
  };

  services.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
    };
  };

  services.hardware.bolt.enable = true;
  services.xserver.displayManager.sessionCommands = ''
    ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  '';
  hardware.nvidia = {
    modesetting.enable = false;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    nvidiaSettings = true;
    open = true;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:02:0";
      nvidiaBusId = "PCI:1:00:0";
    };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      mesa
      intel-vaapi-driver
      vaapiVdpau
    ];
  };
  powerManagement.cpuFreqGovernor = "performance";
  # services.tailscale = {
  #   enable = true;
  #   useRoutingFeatures = "client";
  #   };

  nixpkgs.hostPlatform = "x86_64-linux";
}
