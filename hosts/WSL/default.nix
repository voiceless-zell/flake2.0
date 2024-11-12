{
  nixos-wsl,
  config,
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.nixos-wsl.nixosModules.default
  ];
  programs.zsh.enable = true;
  networking = {
    hostName = "WSL";
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  programs.dconf.enable = true;
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
