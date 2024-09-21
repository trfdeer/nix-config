{
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
  };

  boot.tmp = {
    cleanOnBoot = true;
    tmpfsSize = "5GB";
  };
}
