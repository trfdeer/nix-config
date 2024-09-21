{ defs }:
{
  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "plasma";
  };

  services.xrdp = {
    enable = defs.remoteAccess.rdp.enable;
    defaultWindowManager = "startplasma-x11";
    openFirewall = true;
  };
}
