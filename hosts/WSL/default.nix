{
  nixos-wsl,
  config,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];
  networking = {
    hostName = "WSL";
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  services.gvfs.enable = true;
  wsl = {
    enable = true;
    defaultUser = "zell";
    nativeSystemd = true;
    useWindowsDriver = true;
    startMenuLaunchers = true;
  };
  nixpkgs.hostPlatform = "x86_64-linux";
}
