{ defs, nixpkgs, pkgs }: {
  imports = [
    (import ../modules {
      inherit defs pkgs;
      lib = nixpkgs.lib;
      type = "system";
    })
  ];

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };
    package = pkgs.nixVersions.latest;
    registry.nixpkgs.flake = nixpkgs;
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
    extraGroups = [ "wheel" ];
    initialHashedPassword = "";
    openssh.authorizedKeys.keys = [ defs.userSshKey ];
    shell = pkgs.zsh;
  };

  system.stateVersion = "24.05";
}
