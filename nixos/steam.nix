{
  lib,
  isNIXOS,
  isWSL,
  ...
}:
{
  programs.steam = {
    enable = isNIXOS && !isWSL;
    remotePlay.openFirewall = isNIXOS && !isWSL;
    dedicatedServer.openFirewall = false;
  };
  programs.gamemode.enable = isNIXOS && !isWSL;
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-original"
      "steam-runtime"
    ];
}
