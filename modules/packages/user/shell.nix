{ lib, defs }:
{
  programs.zsh =
    {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      dotDir = ".config/zsh";
      history.save = 0;
      loginExtra = ''
        if [[ -z $TMUX ]] && [[ -n $SSH_TTY ]]; then
          exec tmux -u new-session -A -s default
        fi
      '';
      initExtra = ''
        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
          . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi
      '';
      shellAliases = {
        ls = "exa";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "tmux"
          "direnv"
        ];
      };
    }
    // lib.optionalAttrs defs.config.isWsl {
      shellAliases = {
        ssh = "ssh.exe";
        ssh-add = "ssh-add.exe";
      };
    };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      right_format = "$time";
      time = {
        disabled = false;
        style = "bold bright-black";
        format = "[$time]($style)";
      };
      line_break.disabled = true;
    };
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    mouse = true;
    terminal = "screen-256color";
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };
}
