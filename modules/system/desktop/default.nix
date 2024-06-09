{ defs, lib }:
let
  desktopPackages = {
    kde = (import ./kde.nix { inherit defs; });
  };
  isDesktopKnown = defs ? "desktopName" && desktopPackages ? ${defs.desktopName};
in
{
  imports = [
    (import ./audio.nix)
  ] ++ lib.optionals (isDesktopKnown == true) [ desktopPackages.${defs.desktopName} ];
}
