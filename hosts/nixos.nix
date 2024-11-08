{
  inputs,
  lib,
  system,
  specialArgs,
  user ? "zell",
  ...
}:
let
  # provide an optional { pkgs } 2nd argument to override the pkgs
  mkNixosConfiguration =
    host:
    {
      pkgs ? (
        import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      ),
    }:
    lib.nixosSystem {
      inherit pkgs;

      specialArgs = specialArgs // {
        inherit host user;
        isNixOS = true;
        isWSL = host == "WSL";
        isLaptop = host == "P16" || host == "G14";
        isVm = host == "vm" || host == "vm-hyprland";
        dots = "/persist/home/${user}/projects/dotfiles";
      };

      modules = [
        ./${host} # host specific configuration
        ./${host}/hardware.nix # host specific hardware configuration
        ../nixos
        ../overlays
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;

            extraSpecialArgs = specialArgs // {
              inherit host user;
              isNixOS = true;
              isWSL = host == "WSL";
              isLaptop = host == "P16" || host == "G14";
              isVm = host == "vm" || host == "vm-hyprland";
              dots = "/persist/home/${user}/projects/dotfiles";
            };

            users.${user} = {
              imports = [
                inputs.nix-index-database.hmModules.nix-index
                ./${host}/home.nix # host specific home-manager configuration
                ../home-manager
              ];
            };
          };
        }
        # alias for home-manager
        (lib.mkAliasOptionModule [ "hm" ] [
          "home-manager"
          "users"
          user
        ])
      ];
    };
in
{
  WSL = mkNixosConfiguration "WSL" { };
  G14 = mkNixosConfiguration "G14" { };
  P16 = mkNixosConfiguration "P16" { };
  vm = mkNixosConfiguration "vm" { };
  vm-hyprland = mkNixosConfiguration "vm-hyprland" { };
}
