{
  defs,
  nixpkgs,
  disko,
  home-manager,
  nix-index-database,
}:
let
  system = defs.prefs.system;
in
{
  vmware = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit defs nixpkgs;
      host = {
        hostName = defs.hostName;
      };
    };

    modules = [
      disko.nixosModules.disko
      (import ./machines {
        inherit defs nixpkgs;
        machine = "vmware";
      })
      nix-index-database.nixosModules.nix-index
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${defs.userName} = (import ./user.nix { inherit defs nixpkgs; });
      }
    ];
  };
}