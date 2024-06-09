{ defs, lib }: {
  imports =
    [
      (import ./hardware-configuration.nix { inherit lib; })
      (import ./disko-configuration.nix)
    ];

  virtualisation.vmware.guest = {
    enable = true;
    headless = !defs.desktop.enable;
  };
}
