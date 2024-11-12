{
  user,
  pkgs,
  ...
}:
{
  users.users.zell.useDefaultShell = pkgs.zsh;
  home = {
    stateVersion = "23.05";
  };
}
