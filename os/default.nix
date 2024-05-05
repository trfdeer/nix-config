{ defs, nixpkgs, disko, home-manager }:
let
  system = defs.system;
  pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
  lib = nixpkgs.lib;
in
{
  vmware = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit defs nixpkgs pkgs;
      host = {
        hostName = defs.hostName;
      };
    };

    modules = [
      (import ./configuration.nix { inherit defs pkgs nixpkgs; })
      (import ./vmware { inherit defs lib; })
      disko.nixosModules.disko
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${defs.userName} = (import ../user { inherit defs lib pkgs; });
      }
    ];
  };
}
