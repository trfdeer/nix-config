{ defs, lib }:
{
  imports = [
    (import ./hardware-configuration.nix { inherit lib; })
  ];

  wsl.enable = true;
  wsl.defaultUser = defs.userName;
}
