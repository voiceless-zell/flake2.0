{
  pkgs,
  lib,
  config,
  ...
}:
{
    programs.git.enable = true;
    programs.git.userName = "voiceless-zell";
    programs.git.userEmail = "peter.bouchard2893@proton.me";
    home.packages = [ pkgs.gh ];
}
