{
  pkgs,
  inputs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    };
    users.zell = {
      imports = [ ];
      home.username = "zell";
      home.homeDirectory = "/home/zell";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };
  users.users = {
    "zell" = {
      isNormalUser = true;
      description = "Pete";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "input"
      ];
      shell = pkgs.zsh;
    };
  };

  nix.settings.allowed-users = [
    "zell"
  ];
}
