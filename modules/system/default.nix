{ defs, lib }: {
  imports = [
    (import ./core { inherit defs; })
  ] ++ lib.optionals (defs.desktop.enable == false) [
    (import ./desktop { inherit defs lib; })
  ];
}
