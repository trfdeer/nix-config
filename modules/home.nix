{
  defs,
  nixpkgs,
  home-manager,
  nix-index-database,
}:
let
  pkgs = import nixpkgs {
    system = defs.config.system;
    config.allowUnfree = true;
  };
in
{
  ${defs.userName} = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
    modules = [
      {
        home = {
          username = defs.userName;
          homeDirectory = "/home/${defs.userName}";
        };
      }
      (import ./user.nix { inherit defs nixpkgs nix-index-database; })
    ];
  };
}
