{
  defs,
  nixpkgs,
  type,
}:
let
  lib = nixpkgs.lib;
  configs = {
    "system" = [ (import ./system { inherit defs lib; }) ];
    "user" = [ (import ./user { inherit defs nixpkgs; }) ];
  };
in
{
  imports = configs.${type};
}
