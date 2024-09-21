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
      // lib.optionalAttrs defs.prefs.isWsl {
        core.sshCommand = "ssh.exe";
        "gpg \"ssh\"".program = "/mnt/c/Program Files/1Password/app/8/op-ssh-sign-wsl";
      };
  };

  programs.lazygit = {
    enable = true;
  };
}
