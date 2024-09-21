{ defs, lib }:
{
  imports = [
    <nixos-wsl/modules>
    (import ./hardware-configuration.nix { inherit lib; })
  ];

  wsl.enable = true;
  wsl.defaultUser = defs.userName;
}
