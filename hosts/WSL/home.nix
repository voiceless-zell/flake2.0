{
  user,
  pkgs,
  ...
}:
{
  user.zell.useDefaultShell = pkgs.zsh;
  home = {
    stateVersion = "23.05";
  };
}
