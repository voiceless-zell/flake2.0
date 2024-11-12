{
  lib,
  user,
  ...
}:
{
  # silence warning about setting multiple user password options
  # https://github.com/NixOS/nixpkgs/pull/287506#issuecomment-1950958990
  config = lib.mkMerge [
    {
      users = {
        users = {
          ${user} = {
            isNormalUser = true;
            extraGroups = [
              "networkmanager"
              "wheel"
              "libvirtd"
              "input"
            ];
          };
        };
      };
    }
  ];
}
