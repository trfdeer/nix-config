{ defs, lib }:
let
  desktopPackages = {
    kde = (import ./kde.nix { inherit defs; });
  };
  isDesktopKnown =
    defs.desktop ? "environmentName" && desktopPackages ? ${defs.desktop.environmentName};
in
{
  imports = [
    (import ./audio.nix)
  ] ++ lib.optionals isDesktopKnown [ desktopPackages.${defs.desktop.environmentName} ];
}
