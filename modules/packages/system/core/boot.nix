{ defs }:
let
  enableGrub = !defs.prefs.isWsl;
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
}
