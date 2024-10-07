{ defs, nixpkgs }:
let
  pkgs = nixpkgs.legacyPackages.${defs.config.system};
in
{
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        vhostUserPackages = [ pkgs.virtiofsd ];
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };

    oci-containers.backend = "podman";
    oci-containers.containers = { };
  };

  environment.systemPackages = with pkgs; [
    podman-tui
    docker-compose
  ];
}
