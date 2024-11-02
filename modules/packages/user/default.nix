{
  defs,
  nixpkgs,
}:
let
  pkgs = import nixpkgs {
    system = defs.config.system;
    config.allowUnfree = true;
  };
  desktopPackages = {
    kde = (import ./kde.nix { });
  };
  isDesktopKnown =
    defs.desktop ? "environmentName" && desktopPackages ? ${defs.desktop.environmentName};
  lib = pkgs.lib;
in
{
  imports =
    [
      (import ./shell.nix { inherit lib defs; })
      (import ./editor.nix)
      (import ./git.nix { inherit defs lib; })
      (import ./packages.nix { inherit defs pkgs; })
      (import ./homeConfig.nix { inherit defs pkgs; })
    ]
    ++ lib.optionals (defs.desktop.enable) [ (import ./vscode.nix { inherit pkgs; }) ]
    ++ lib.optionals isDesktopKnown [ desktopPackages.${defs.desktop.environmentName} ];
}
