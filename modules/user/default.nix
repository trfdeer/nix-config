{ defs, lib, pkgs }:
let
  desktopPackages = {
    kde = (import ./kde.nix { });
  };
  isDesktopKnown = defs.desktop ? "environmentName" && desktopPackages ? ${defs.desktop.environmentName};
in
{
  imports = [
    (import ./shell.nix)
    (import ./utils.nix)
    (import ./git.nix { inherit defs; })
    (import ./packages.nix { inherit defs pkgs; })
    (import ./homeConfig.nix { inherit defs pkgs; })
  ] ++ lib.optionals (defs.desktop.enable) [
    (import ./vscode.nix { inherit pkgs; })
  ] ++ lib.optionals (isDesktopKnown) [ desktopPackages.${defs.desktop.environmentName} ];
}
