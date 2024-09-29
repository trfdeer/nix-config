{ defs, nixpkgs }:
let
  pkgs = import nixpkgs {
    system = defs.config.system;
    config.allowUnfree = true;
  };
in
{
  nixdev = pkgs.mkShell {
    packages = with pkgs; [
      nixfmt-rfc-style
      nixd
    ];
  };
}
