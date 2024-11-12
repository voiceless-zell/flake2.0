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
        inherit
          host
          user
          ;
        isNixOS = true;
        isWSL = host == "WSL";
        isLaptop = host == "P16" || host == "G14" || host == "T480";
        isVm = host == "vm" || host == "vm-hyprland";
      };

      modules =
        [
          ./${host} # host specific configuration

        ]
        # Conditionally add the hardware module if host is not "WSL"
        ++ lib.optionals (host != "WSL") [
          ./${host}/hardware.nix
        ]
        ++ [
          ../nixos
          ../overlays
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;

              extraSpecialArgs = specialArgs // {
                inherit host user;
                isWSL = host == "WSL";
                isNixOS = true;
                isLaptop = host == "P16" || host == "G14";
                isVm = host == "vm" || host == "vm-hyprland";
              };

              users.${user} = {
                imports = [
                  inputs.LazyVim.homeManagerModules.default
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
