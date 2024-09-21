{
  config = {
    homeOnly = false;
    isWsl = false;
    system = "x86_64-linux";
  };

  desktop = {
    enable = true;
    environmentName = "kde"; # Supported values: [none kde]
  };

  remoteAccess = {
    ssh = {
      enable = true;
      authorizedKey = "";
    };
    rdp.enable = false;
  };

  userName = "";
  hostName = "";

  programs = {
    git = {
      userName = "";
      userEmail = "";
      signingKey = "";
    };
  };
}
