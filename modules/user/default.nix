{ defs, lib, pkgs }: {
  imports = [
    (import ./shell.nix)
    (import ./utils.nix)
    (import ./git.nix { inherit defs; })
    (import ./packages.nix { inherit defs pkgs; })
    (import ./homeConfig.nix { inherit defs pkgs; })
  ] ++ lib.optionals (defs.isHeadless == false) [
    (import ./vscode.nix { inherit pkgs; })
  ];
}
