{ defs, pkgs }:
{
  home.packages =
    with pkgs;
    [
      zsh
      tmux
      git
      devenv

      coreutils
      aria2
      curl
      wget

      eza
      bat
      ripgrep
      fzf
      nnn
      btop
      fd

    ]
    ++ lib.optionals (defs.desktop.enable) [ iosevka ];
}
