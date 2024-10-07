{
  defs,
  nixpkgs,
}:
let
  pkgs = import nixpkgs {
    system = defs.config.system;
    config.allowUnfree = true;
  };
in
{
  imports = [
    (import ../packages {
      inherit defs nixpkgs;
      type = "system";
    })
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.latest;
    registry.nixpkgs.flake = nixpkgs;

    extraOptions = ''
      trusted-users = root ${defs.userName}
    '';
  };
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  networking.hostName = defs.hostName;

  users.users.${defs.userName} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
    ];
    initialHashedPassword = "";
    openssh.authorizedKeys.keys = [ defs.remoteAccess.ssh.authorizedKey ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.05";
}
