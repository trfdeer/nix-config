{
  defs,
  nixpkgs,
  machine,
}:
let
  lib = nixpkgs.lib;
  available_configs = {
    "vmware" = (import ./vmware { inherit defs lib; });
    "wsl" = (import ./wsl { inherit defs lib; });
  };
in
{
  imports = [
    (import ./configuration.nix {
      inherit defs nixpkgs;
    })
    available_configs.${machine}
  ];
}
