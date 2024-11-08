{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.wofi;
in
{
  options.modules.wofi = {
    enable = mkEnableOption "wofi";
  };
  config = mkIf cfg.enable {
    xdg.configFile."wofi".source = ./config;
  };
}
