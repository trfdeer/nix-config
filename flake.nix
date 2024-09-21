{
  description = "Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      disko,
      home-manager,
      nix-index-database,
      ...
    }:
    let
      defs = (import ./config.nix);
    in
    {
      homeConfigurations =
        if (defs.prefs.homeOnly) then
          (import ./modules/home.nix {
            inherit
              defs
              nixpkgs
              home-manager
              nix-index-database
              ;
          })
        else
          { };
      nixosConfigurations =
        if (defs.prefs.homeOnly == false) then
          (import ./modules/os.nix {
            inherit
              defs
              nixpkgs
              disko
              home-manager
              nix-index-database
              ;
          })
        else
          { };
      devShells.${defs.prefs.system} = (import ./modules/shells.nix { inherit defs nixpkgs; });
    };
}
