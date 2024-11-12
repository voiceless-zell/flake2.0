{
  user,
  pkgs,
  ...
}:
{
  shell = pkgs.zsh;
  home = {
    stateVersion = "23.05";
  };
}
