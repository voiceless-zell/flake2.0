{
  inputs,
  system,
  specialArgs,
  user ? "zell",
  lib,
  ...
}:
let
  # provide an optional { pkgs } 2nd argument to override the pkgs
  mkHomeConfiguration =
    host:
    {
      pkgs ? (
        import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        }
      ),
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs lib;

      extraSpecialArgs = specialArgs // {
        inherit host user;
        isNixOS = false;
        isLaptop = host == "G14" || host == "P16";
        isVm = host == "vm" || host == "vm-hyprland";
        # NOTE: don't reference /persist on legacy distros
        dots = "/home/${user}/projects/dotfiles";
      };

      modules = [
        inputs.nix-index-database.hmModules.nix-index
        ./${host}/home.nix # host specific home-manager configuration
        ../home-manager
        ../overlays
      ];
    };
in
{
  G14 = mkHomeConfiguration "G14" { };
  P16 = mkHomeConfiguration "P16" { };
  # NOTE: standalone home-manager doesn't make sense for VM config!
}
