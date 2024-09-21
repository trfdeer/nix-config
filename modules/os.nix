{
  defs,
  nixpkgs,
  disko,
  home-manager,
  nix-index-database,
  nixos-wsl,
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
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${defs.userName} = (import ./user.nix { inherit defs nixpkgs; });
      }
    ];
  };

  wsl = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit defs nixpkgs;
      host = {
        hostName = defs.hostName;
      };
    };

    modules = [
      (import ./machines {
        inherit defs nixpkgs;
        machine = "wsl";
      })
      nixos-wsl.nixosModules.default
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${defs.userName} = (
          import ./user.nix { inherit defs nixpkgs nix-index-database; }
        );
      }
    ];
  };
}
