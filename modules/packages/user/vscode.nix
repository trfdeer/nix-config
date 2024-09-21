{ pkgs }:
{
  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      usernamehw.errorlens
      ms-vscode-remote.remote-ssh
      vscode-icons-team.vscode-icons
      ms-vscode.cpptools
      llvm-vs-code-extensions.vscode-clangd
      twxs.cmake
      ms-vscode.cmake-tools
      vadimcn.vscode-lldb
      serayuzgur.crates
      mkhl.direnv
      editorconfig.editorconfig
      tamasfe.even-better-toml
      donjayamanne.githistory
      jnoortheen.nix-ide
      rust-lang.rust-analyzer
      ms-vscode.hexeditor
      redhat.vscode-xml
    ];
    keybindings = [
      {
        key = "ctrl+l";
        command = "workbench.action.terminal.clear";
      }
    ];
    userSettings = {
      # Core Settings
      "window.titleBarStyle" = "custom";
      "workbench.startupEditor" = "none";
      "workbench.activityBar.location" = "top";
      "telemetry.telemetryLevel" = "off";
      "security.workspace.trust.banner" = "always";
      "redhat.telemetry.enabled" = false;
      "security.workspace.trust.untrustedFiles" = "open";
      "settingsSync.ignoredSettings" = [ ];

      # Appearance Settings
      "workbench.iconTheme" = "vscode-icons";
      "workbench.colorTheme" = "Default Dark Modern";
      "editor.fontFamily" = "'Iosevka'";
      "debug.console.fontFamily" = "'Iosevka'";
      "terminal.integrated.fontFamily" = "'Iosevka'";
      "editor.fontSize" = 15;
      "debug.console.fontSize" = 16;
      "terminal.integrated.fontSize" = 16;
      "editor.fontLigatures" = false;
      "editor.cursorBlinking" = "solid";
      "editor.fontVariations" = true;
      "editor.semanticHighlighting.enabled" = true;
      "editor.semanticTokenColorCustomizations" = {
        "enabled" = true;
      };
      "editor.bracketPairColorization.enabled" = true;

      # Behaviour Settings
      "files.eol" = "\n";
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.linkedEditing" = true;
      "editor.minimap.enabled" = true;
      "editor.suggestSelection" = "first";
      "editor.wordWrap" = "on";
      "editor.codeActionsOnSave" = {
        "source.fixAll" = "explicit";
        "source.organizeImports" = "explicit";
      };
      "explorer.compactFolders" = false;
      "explorer.confirmDragAndDrop" = false;
      "notebook.output.scrolling" = true;
      "notebook.output.wordWrap" = true;
      "terminal.integrated.inheritEnv" = true;
      "editor.wordBasedSuggestions" = "off";
      "editor.quickSuggestionsDelay" = 200;

      # Debugging
      "debug.inlineValues" = "on";
      "debug.allowBreakpointsEverywhere" = true;

      # Tasks
      "task.saveBeforeRun" = "always";
      "typescript.tsc.autoDetect" = "off";
      "grunt.autoDetect" = "off";
      "jake.autoDetect" = "off";
      "gulp.autoDetect" = "off";
      "npm.autoDetect" = "off";

      # C++
      "C_Cpp.intelliSenseEngine" = "disabled";
      "C_Cpp.autocomplete" = "disabled";
      "C_Cpp.errorSquiggles" = "disabled";
      "clangd.arguments" = [
        "-log=verbose"
        "-pretty"
        "--background-index"
        "-header-insertion=iwyu"
        "--inlay-hints=true"
      ];
      "cmake.generator" = "Ninja";
      "cmake.showOptionsMovedNotification" = false;
      "cmake.showConfigureWithDebuggerNotification" = false;
      "cmake.configureOnOpen" = true;
      "files.associations" = {
        "*.cppm" = "cpp";
        ".clang-tidy" = "yaml";
        ".clang-format" = "yaml";
      };

      # Rust
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.cachePriming.enable" = false;
      "evenBetterToml.formatter.reorderKeys" = true;
      "evenBetterToml.formatter.reorderArrays" = true;
      "rust-analyzer.rustfmt.extraArgs" = [
        "--config"
        "group_imports=StdExternalCrate,imports_granularity=Crate"
      ];

      # Nix
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.formatterPath" = "nixpkgs-fmt";

      # Git
      "git.autofetch" = true;
      "git.openRepositoryInParentFolders" = "always";

      # Remote Development
      "remote.SSH.enableAgentForwarding" = true;
      "remote.SSH.localServerDownload" = "always";
    };
  };
}
