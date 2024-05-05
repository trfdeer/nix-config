{ pkgs }: {
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

        iosevka
    ];
}
