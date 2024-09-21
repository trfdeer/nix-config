{ defs, nixpkgs }:
let
  pkgs = import nixpkgs {
    system = defs.prefs.system;
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
