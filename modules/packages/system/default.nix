{
  defs,
  lib,
  nixpkgs,
}:
{
  imports = [
    (import ./core { inherit defs nixpkgs; })
  ] ++ lib.optionals (defs.desktop.enable) [ (import ./desktop { inherit defs lib; }) ];
}
