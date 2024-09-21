{ defs, lib }:
{
  imports = [
    (import ./core { inherit defs; })
  ] ++ lib.optionals (defs.desktop.enable) [ (import ./desktop { inherit defs lib; }) ];
}
