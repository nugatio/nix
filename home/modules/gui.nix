# nb@2026.05.30

{ pkgs, lib, ... }: {

  # ////////// PROGRAMS //////////

  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nil
      rust-analyzer
      ruff
      basedpyright
      markdown-oxide
      marksman
      taplo
      harper
      tinymist
      typstyle
      bash-language-server
      shfmt
      yaml-language-server
      vscode-langservers-extracted
      typescript-language-server
      texlab
      texlivePackages.latexindent
      zls
      rPackages.languageserver
      nixpkgs-fmt
      prettier
    ];
  };


  # ////////// CONFIG FILES //////////

  xdg.configFile = {
    "aerospace/aerospace.toml".source = ../configs/aerospace.toml;
    "helix".source = ../configs/helix;
    "ghostty".source = ../configs/ghostty;
    "wezterm".source = ../configs/wezterm;
    "micro".source = ../configs/micro;
    "linearmouse/linearmouse.json".source = ../configs/linearmouse.json;
    "zellij/config.kdl" = {
      source = ../configs/zellij/config.kdl;
      force = true;
    };
    "zellij/layouts".source = ../configs/zellij/layouts;
    "zellij/plugins/zjstatus.wasm".source = "${pkgs.zjstatus}/bin/zjstatus.wasm";
    "yazi".source = ../configs/yazi;
  };
  home.file = {
    ".hammerspoon/".source = ../configs/hammerspoon;
    ".btt_autoload_preset.json".source = ../configs/btt/preset.json;
  };
}
