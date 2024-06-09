{ defs, nixpkgs }:
let pkgs = nixpkgs.legacyPackages.${defs.config.system};
in
{
  nixdev = pkgs.mkShell {
    packages = [
      pkgs.nixpkgs-fmt
      pkgs.nixd
    ];
  };
}
