{ defs }:
let
  enableGrub = !defs.config.isWsl;
in
{
  boot.loader.grub = {
    enable = enableGrub;
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
  };

  boot.tmp = {
    cleanOnBoot = true;
    tmpfsSize = "5GB";
  };

  boot.extraModprobeConfig = "options kvm_intel nested=1";
}
