{ defs, pkgs }: {
  home.packages = [
    pkgs.zsh
    pkgs.tmux
    pkgs.git

    pkgs.coreutils
    pkgs.aria2
    pkgs.curl

    pkgs.eza
    pkgs.bat
    pkgs.ripgrep
    pkgs.fzf
    pkgs.nnn
    pkgs.btop

  ] ++ pkgs.lib.optionals (defs.isHeadless == false) [
    pkgs.iosevka
  ];
}
