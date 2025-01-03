{
  pkgs,
  inputs,
  ...
}:
{
  config = {
    wayland.windowManager.hyprland.settings.monitor = [
      "eDP-1,2560x1600,0x0,1"
      "DP-3,1920x1080,-5760x0, 1"
      "HDMI-A-1,1920x1080,-3840x0, 1"
      "DP-2,1920x1080,-x-1080,1"
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
