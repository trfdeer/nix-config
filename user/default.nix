{ defs, lib, pkgs }:
{
  imports = [
    (import ../modules { inherit defs lib pkgs; type = "user"; })
  ];

  home.stateVersion = "24.05";
}
