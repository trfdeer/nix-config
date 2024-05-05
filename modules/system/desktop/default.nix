{ defs, lib }:
let
  desktopPackages = { };
  isDesktopKnown = defs ? "desktopName" && desktopPackages ? defs.desktopName;
in
{
  imports = [
    (import ./audio.nix)
  ] ++ lib.optionals (isDesktopKnown == true) desktopPackages.${defs.desktopName};
}
