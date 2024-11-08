{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.modules.tmux;
in
{
  options.modules.tmux = {
    enable = mkEnableOption "tmux";
  };
  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      escapeTime = 10;
      historyLimit = 100000;
      plugins = with pkgs; [
        tmuxPlugins.better-mouse-mode
        tmuxPlugins.continuum
        tmuxPlugins.resurrect
        {
          plugin = tmuxPlugins.mkTmuxPlugin {
            pluginName = "tokyo-night-tmux";
            version = "6189acc";
            rtpFilePath = "tokyo-night.tmux";
            src = pkgs.fetchFromGitHub {
              owner = "janoamaral";
              repo = "tokyo-night-tmux";
              rev = "6189acc8b3c76afd545b824494884684f57b714d";
              sha256 = "sha256-am3qcVJOt27gpu1UQ+o1jPnCX68kDzSHvER12Lh2cvY=";
            };
          };
        }
      ];
      extraConfig = ''
        set -g @plugin 'fabioluciano/tmux-tokyo-night'
        set-option -g mouse on
        set -g default-terminal 'tmux-256color'
        set -as terminal-overrides ",foot*:Tc"
        set -g @resurrect-strategy-nvim 'session'
        set -g @resurrect-capture-pane-contents 'on'
        set -g @continuum-restore 'on'
        set -g @continuum-boot 'on'
        set -g @continuum-boot-options 'foot'
        set -g @continuum-save-interval '10'
      '';
    };
  };
}
