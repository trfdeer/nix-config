{ defs, lib }:
{
  imports = [
    (import ./hardware-configuration.nix { inherit lib; })
    (import ./disk-configuration.nix)
  ];

  virtualisation.vmware.guest = {
    enable = true;
    headless = !defs.desktop.enable;
  };

  boot.kernelParams = [
    "intel_idle.max_cstate=4"
    "mem_sleep_default=deep"
  ];
  boot.extraModprobeConfig = ''
    options snd-hda-intel model=hp-mute-led-mic3
  '';
}
