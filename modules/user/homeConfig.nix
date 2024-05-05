{ defs, pkgs }: {
  programs.home-manager.enable = true;

  xdg.enable = true;
  xdg.mime.enable = true;
  targets.genericLinux.enable = true;
  fonts.fontconfig.enable = true;

  nix =
    if (defs.configureHomeOnly == true) then {
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        auto-optimise-store = true;
      };
      gc = {
        automatic = true;
        frequency = "weekly";
        options = "--delete-older-than 1d";
      };
      package = pkgs.nixVersions.latest;
    } else { };
}
