{ defs, lib }:
let
  gitConfig = defs.programs.git;
in
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = gitConfig.userName;
    userEmail = gitConfig.userEmail;
    signing = {
      key = gitConfig.signingKey;
      signByDefault = true;
    };
    extraConfig =
      {
        init.defaultBranch = "main";
        gpg.format = "ssh";
      }
      // lib.optionalAttrs defs.config.isWsl {
        core.sshCommand = "ssh.exe";
        "gpg \"ssh\"".program = "/mnt/c/Program Files/1Password/app/8/op-ssh-sign-wsl";
      }
      // lib.optionalAttrs (!defs.config.isWsl && defs.desktop.enable) {
        "gpg \"ssh\"".program = "/opt/1Password/op-ssh-sign";
      };
  };

  programs.lazygit = {
    enable = true;
  };
}
