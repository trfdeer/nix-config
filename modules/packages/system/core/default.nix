{ defs, nixpkgs }:
{
  imports = [
    (import ./boot.nix { inherit defs; })
    (import ./packages.nix { inherit defs; })
    (import ./virtualization.nix { inherit defs nixpkgs; })
  ];
}
