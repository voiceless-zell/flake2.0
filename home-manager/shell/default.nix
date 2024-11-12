{
  config,
  isNixOS,
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./git.nix
    ./ripgrep.nix
    ./starship.nix
    ./tmux.nix
    ./neovim
  ];

  options.custom = with lib; {
    terminal = {
      package = mkOption {
        type = types.package;
        default = pkgs.kitty;
        description = "Terminal package to use.";
      };

      exec = mkOption {
        type = types.str;
        default = lib.getExe config.custom.terminal.package;
        description = "Terminal command to execute other programs.";
      };

      font = mkOption {
        type = types.str;
        default = config.custom.fonts.monospace;
        description = "Font for the terminal.";
      };

      size = mkOption {
        type = types.int;
        default = 10;
        description = "Font size for the terminal.";
      };

      padding = mkOption {
        type = types.int;
        default = 12;
        description = "Padding for the terminal.";
      };

      opacity = mkOption {
        type = types.str;
        default = "0.8";
        description = "Opacity for the terminal.";
      };
    };

  };

  config = {
    home.packages = with pkgs; [
      ets # add timestamp to beginning of each line
      fd # better find
      htop
    ];
  };
}
