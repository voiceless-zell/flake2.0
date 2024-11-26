{
  pkgs,
  inputs,
  ...
}:
{
  config = {
    wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1,2560x1600,0x0,1"
    ];
    home.packages = with pkgs; [
      protontricks
      discord
      inputs.nix-citizen.packages.${system}.star-citizen
      inputs.nix-citizen.packages.${system}.star-citizen-helper
      inputs.nix-citizen.packages.${system}.lug-helper
      lutris
      wineWowPackages.waylandFull
      winetricks
      gamescope
      prismlauncher
    ];
  };
}
