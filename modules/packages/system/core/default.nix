{ defs }:
{
  imports = [
    (import ./boot.nix)
    (import ./packages.nix { inherit defs; })
  ];
}
