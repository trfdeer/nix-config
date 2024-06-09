{ defs }: {
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = defs.git.userName;
    userEmail = defs.git.userEmail;
    signing = {
      key = defs.git.signingKey;
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
