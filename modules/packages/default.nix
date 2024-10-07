{
  defs,
  nixpkgs,
  type,
}:
let
  lib = nixpkgs.lib;
  configs = {
    "system" = [ (import ./system { inherit defs lib nixpkgs; }) ];
    "user" = [ (import ./user { inherit defs nixpkgs; }) ];
  };
in
{
  imports = configs.${type};
}
