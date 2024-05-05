{ defs, lib }: {
  imports = [
    (import ./core { inherit defs; })
  ] ++ lib.optionals (defs.isHeadless == false) [
    (import ./desktop { inherit defs lib; })

  ];
}
