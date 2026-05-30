# nb@2026.05.30

{ pkgs, lib, ... }: {
  programs.mise = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    globalConfig.settings = {
      experimental = true;
      verbose = false;
      auto_install = true;
      python = {
        uv_venv_auto = true;
      };
    };
  };

  home.sessionVariables = {
    MISE_NODE_COREPACK = "1";
  };
}
