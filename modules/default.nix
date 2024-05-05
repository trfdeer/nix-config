{ defs, lib, pkgs, type }:
let
  configs = {
    "system" = [ (import ./system { inherit defs lib; }) ];
    "user" = [ (import ./user { inherit defs lib pkgs; }) ];
  };
in
{
  imports = configs.${type};
}
