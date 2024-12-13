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
  networking = {
    hostName = "WSL";
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  wsl = {
    enable = true;
    defaultUser = "zell";
    nativeSystemd = true;
    useWindowsDriver = true;
    startMenuLaunchers = true;
  };
  nixpkgs.hostPlatform = "x86_64-linux";
  environment.systemPackages = with pkgs; [
    obsidian
  ];

}
