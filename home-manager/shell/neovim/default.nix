{
  pkgs,
  lib,
  ...
}:
{
  programs = {
    lazyvim = {
      enable = true;
      extras = {
        coding = {
          mini-surround.enable = true;

          yanky.enable = true;
        };
        lang = {
          nix.enable = true;
        };
        test = {
          core.enable = true;
        };
      };
    };
    lazygit.enable = true;
    ripgrep.enable = true;

  };

  # Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
  xdg.configFile = {
    "nvim/lua".source = ./lua;
    "nvim/lua/plugins/obsidian.lua".source = ./lua/plugins/obsidian.lua;
  };
}
