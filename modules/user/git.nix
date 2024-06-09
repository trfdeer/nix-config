{ defs }:
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
    extraConfig = {
      init.defaultBranch = "main";
      gpg.format = "ssh";
    };
  };

  programs.lazygit = {
    enable = true;
  };
}
