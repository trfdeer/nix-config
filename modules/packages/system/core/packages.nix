{ defs }:
{
  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

  services.openssh.enable = defs.remoteAccess.ssh.enable;
}
