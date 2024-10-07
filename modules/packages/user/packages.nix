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
      file

      eza
      bat
      ripgrep
      fzf
      nnn
      btop
      fd

      nixd
      nixfmt-rfc-style

      uv
      bun
    ]
    ++ lib.optionals (defs.desktop.enable) [ iosevka ];
}
