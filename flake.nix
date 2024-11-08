{
  description = "NixOS flake with host-specific configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      # Custom function to load NixOS and Home Manager configurations for a given hostname
      loadHostConfiguration = hostname: {
        # Load NixOS configuration for the host
        nixos = import ./hosts/${hostname}/default.nix {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          lib = nixpkgs.lib;
          system = "x86_64-linux";
        };

        # Load Home Manager configuration for the host
        homeManager = import ./hosts/${hostname}/home.nix {
          pkgs = import nixpkgs { system = "x86_64-linux"; };
          home-manager = home-manager.lib;
          system = "x86_64-linux";
        };
      };

      # Add any hosts you want to include in your flake.
      hostnames = [
        "WSL"
      ];
    in
    {
      # Define nixosConfigurations for each host in `hostnames`
      nixosConfigurations = builtins.listToAttrs (
        map (hostname: {
          name = hostname;
          value = (loadHostConfiguration hostname).nixos;
        }) hostnames
      );

      # Define homeConfigurations for each host
      homeConfigurations = builtins.listToAttrs (
        map (hostname: {
          name = hostname;
          value = (loadHostConfiguration hostname).homeManager;
        }) hostnames
      );
    };
}
