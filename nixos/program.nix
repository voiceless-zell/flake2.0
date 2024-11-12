{
  isNIXOS,
  ...
}:
{
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  programs.tmux.enable = true;
  programs.xwayland.enable = isNIXOS;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
