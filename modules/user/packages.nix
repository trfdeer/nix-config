{ defs, pkgs }: {
  home.packages = with pkgs; [
    zsh
    tmux
    git

    coreutils
    aria2
    curl

    eza
    bat
    ripgrep
    fzf
    nnn
    btop

  ] ++ lib.optionals (defs.desktop.enable == true) [
    iosevka
  ];
}
