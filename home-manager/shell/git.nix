{
  pkgs,
  lib,
  config,
  ...
}:
with lib;
let
  cfg = config.modules.git;
in
{
  options.modules.git = {
    enable = mkEnableOption "git";
  };
  config = mkIf cfg.enable {
    programs.git.enable = true;
    programs.git.userName = "voiceless-zell";
    programs.git.userEmail = "peter.bouchard2893@proton.me";
    home.packages = [ pkgs.gh ];
  };
}
