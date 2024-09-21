{ defs }:
{
  imports = [
    (import ./boot.nix { inherit defs; })
    (import ./packages.nix { inherit defs; })
  ];
}
