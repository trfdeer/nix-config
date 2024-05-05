{ defs, nixpkgs }:
let pkgs = nixpkgs.legacyPackages.${defs.system};
in
{
  nixdev = pkgs.mkShell {
    packages = [
      pkgs.nixpkgs-fmt
      pkgs.nixd
    ];
  };
}
