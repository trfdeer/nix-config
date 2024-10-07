{ defs, pkgs }:
{
  programs.home-manager.enable = true;

  xdg.enable = defs.desktop.enable;
  xdg.mime.enable = defs.desktop.enable;
  fonts.fontconfig.enable = defs.desktop.enable;

  targets.genericLinux.enable = true;

  nix =
    if (defs.config.homeOnly) then
      {
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          # auto-optimise-store = true;
        };
        gc = {
          automatic = true;
          frequency = "weekly";
          options = "--delete-older-than 1d";
        };
        package = pkgs.nixVersions.latest;
      }
    else
      { };

  home.file.".config/libvirt/qemu.conf".text = ''
    nvram = [ "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd", "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd" ]
  '';
}
