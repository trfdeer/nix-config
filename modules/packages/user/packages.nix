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

      eza
      bat
      ripgrep
      fzf
      nnn
      btop

    ]
    ++ lib.optionals (defs.desktop.enable) [ iosevka ];
}
