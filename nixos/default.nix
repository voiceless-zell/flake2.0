{
  pkgs,
  host,
  lib,
  ...
}:
{
  imports =
    [
      ./program.nix
    ]
    ++ lib.optionals (host != "WSL") [
      ./boot.nix
    ]
    ++ [
      ./security.nix
      ./services.nix
      ./users.nix
      ./wayland.nix
    ]
    ++ lib.optionals (host == "P16") [
      ./steam.nix

    ];
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      #   substituters = if isNixOS then [ "https://nix-gaming.cachix.org" ] else [ ];
      #trusted-public-keys =
      #  if isNixOS then [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ] else [ ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  environment.systemPackages = with pkgs; [
    obsidian
    wget
    git
    nh
    nix-output-monitor
    nvd
    # nerdfonts
    cifs-utils
  ];

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "23.05";
}
