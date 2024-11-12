{
  pkgs,
  isNIXOS,
  isWSL,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    virtiofsd
  ];
  virtualisation = {
    libvirtd = {
      enable = isNIXOS && !isWSL;
      qemu = {
        swtpm.enable = isNIXOS && !isWSL;
        ovmf.enable = isNIXOS && !isWSL;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = isNIXOS && !isWSL;
  };
  services.spice-vdagentd.enable = isNIXOS && !isWSL;
}
