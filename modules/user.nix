{ defs, nixpkgs }:
{
  imports = [
    (import ./packages {
      inherit defs nixpkgs;
      type = "user";
    })
  ];

  home.stateVersion = "24.05";
}
