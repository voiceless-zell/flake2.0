{
  config,
  lib,
  ...
}:
with lib;
let
  cfg = config.modules.kitty;
in
{
  options.modules.kitty = {
    enable = mkEnableOption "kitty";
  };
  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      theme = "Tokyo Night";
    };
  };
}
