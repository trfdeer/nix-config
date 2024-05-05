{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "ayu_dark";
      editor = {
        mouse = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        indent-guides = {
          render = true;
          skip-levels = 1;
        };
        true-color = true;
      };
    };
    languages = {
      language = [{
        name = "nix";
        language-servers = [ "nixd" ];
        formatter.command = "nixpkgs-fmt";
        auto-format = true;
      }];
      language-server.nixd.command = "nixd";
    };
  };
}
