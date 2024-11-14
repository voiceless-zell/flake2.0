{
  config,
  isNixOS,
  lib,
  pkgs,
  user,
  inputs,
  ...
}:
{
  imports = [
    ./hyprland
    ./gui
    # ./impermanence.nix # only contains options
    ./shell

  ];

  options.custom = with lib; {
    fonts = {
      regular = mkOption {
        type = types.str;
        default = "JetBrainsMono Nerd Font";
        description = "The font to use for regular text";
      };
      monospace = mkOption {
        type = types.str;
        default = "JetBrainsMono Nerd Font";
        description = "The font to use for monospace text";
      };
      packages = mkOption {
        type = types.listOf types.package;
        description = "The packages to install for the fonts";
      };
    };
    headless = mkEnableOption "headless mode" // {
      default = false;
      description = "Whether to enable headless mode, no GUI programs will be available";
    };
    symlinks = mkOption {
      type = types.attrsOf types.str;
      default = { };
      description = "Symlinks to create in the format { dest = src;}";
    };
  };

  config = {
    # setup fonts for other distros, run "fc-cache -f" to refresh fonts
    fonts.fontconfig.enable = true;

    home = {
      username = user;
      homeDirectory = "/home/${user}";
      # do not change this value
      stateVersion = "23.05";

      sessionVariables = {
        __IS_NIXOS = if isNixOS then "1" else "0";
        NIXPKGS_ALLOW_UNFREE = "1";
      };
      packages =
        with pkgs;
        [
          gzip
          libreoffice
          xdg-utils
        ]
        # home-manager executable only on nixos
        ++ (lib.optional isNixOS home-manager)
        # handle fonts
        ++ (lib.optionals (!isNixOS) config.custom.fonts.packages);
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    xdg = {
      enable = true;
      userDirs.enable = true;
      mimeApps.enable = true;
    };

    custom = {
      fonts.packages = with pkgs; [
        noto-fonts-emoji
      ];

    };
  };
}
