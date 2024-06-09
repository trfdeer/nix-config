{ defs, nixpkgs, home-manager }:
let
  system = defs.config.system;
  pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
  lib = nixpkgs.lib;
in
{
  ${defs.userName} = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [
      (import ../user { inherit defs lib pkgs; })
      {
        home = {
          username = defs.userName;
          homeDirectory = "/home/${defs.userName}";
        };
      }
    ];
  };
}
