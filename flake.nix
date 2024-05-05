{
  description = "Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, disko, home-manager, ... }:
    let
      defs = (import ./config.nix);
    in
    {
      homeConfigurations = if (defs.configureHomeOnly == true) then (import ./home { inherit defs nixpkgs home-manager; }) else { };
      nixosConfigurations = if (defs.configureHomeOnly == false) then (import ./os { inherit defs nixpkgs disko home-manager; }) else { };
      devShells.${defs.system} = (import ./shells { inherit defs nixpkgs; });
    };
}
