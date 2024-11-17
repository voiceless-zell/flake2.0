{ pkgs, isNixOS, ... }:
{
  imports = [
    ./firefox.nix
    ./gtk.nix
    ./kitty.nix
    ./wofi
    ./waybar
    ./mako.nix
    ./qute.nix
    ./wlogout
  ];
  home.packages = with pkgs; [
    # others
    bitwarden
    discord
    p7zip
    neofetch
    openssl
    libnotify
    pamixer
    xfce.thunar
    pavucontrol
    wget
    unzip
    gparted
    mpv
    playerctl
    qalculate-gtk
    htop
    nvtopPackages.full
    fzf
    ffmpeg
    eza
    #programming
    nix-prefetch-github
    #Tmux things stdin/write to file
    moreutils
    libcxxStdenv
    alejandra
    nerdfonts
  ];
}
