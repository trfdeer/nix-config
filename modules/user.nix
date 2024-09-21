{
  defs,
  nixpkgs,
  nix-index-database,
}:
{
  imports = [
    nix-index-database.hmModules.nix-index
    (import ./packages {
      inherit defs nixpkgs;
      type = "user";
    })
  ];

  home.stateVersion = "24.05";
}
