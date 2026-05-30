# nb@2026.05.30

{ pkgs, lib, config, ... }: {

  # ////////// ENVIRONMENT //////////

  home.sessionVariables = {
    EDITOR = "hx";
    PAGER = "moor";
    MANPAGER = "batman";
    FLAKE = "${config.home.homeDirectory}/.config/nix";
  };


  # ////////// ALIASES //////////

  home.shellAliases = {
    cd = "z";
    ".." = "cd ..";
    ls = "eza --icons --group-directories-first";
    ll = "eza --icons --group-directories-first -l";
    lt = "eza --icons --tree --level=2";
    la = "eza --icons --group-directories-first -la";
    cat = "bat -p";
    tldr = "tlrc";
    less = "moor";
    grep = "rg";
    find = "fd";
    ps = "procs";
    top = "btop";
    htop = "btop";
    du = "dust";
    df = "duf";
    curl = "xh";
    dig = "doggo";
    ping = "gping";
    rm = "rip";
    # sed = "sd";
    cp = "xcp";

    k = "kubectl";
    tf = "terraform";
    a = "ansible";
    d = "docker";
    p = "pulumi";
    m = "micro";
    zj = "zellij";
    lg = "lazygit";
    g = "git";
    make = "just";
    ff = "fastfetch";
    meta = "exiftool";

    viewtex = "latexmk -pvc -pdf";
    pdf = "open -a Preview";
  };


  # ////////// PROGRAMS //////////

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting
        fastfetch --config ${config.xdg.configHome}/fastfetch/config.jsonc
        if command -q nix-your-shell
          nix-your-shell fish | source
        end
        if status is-interactive
          and not set -q ZELLIJ
          and not set -q IN_NIX_SHELL
          and test -t 0
          zellij
        end
      '';
      plugins = [ ];
    };
    nushell = {
      enable = true;
      extraConfig = ''
        $env.config.show_banner = false
        fastfetch --config ${config.xdg.configHome}/fastfetch/config.jsonc
        if (which nix-your-shell | is-not-empty) {
            nix-your-shell nu | save -f "${config.xdg.cacheHome}/nix-your-shell.nu"
            source "${config.xdg.cacheHome}/nix-your-shell.nu"
        }
      '';
    };

    starship = { enable = true; enableFishIntegration = true; enableTransience = true; };
    zoxide = { enable = true; enableFishIntegration = true; };
    atuin = { enable = true; enableFishIntegration = true; };
    direnv = { enable = true; nix-direnv.enable = true; };
    carapace = { enable = true; enableFishIntegration = true; };
    nix-index.enable = true;

    bat = {
      enable = true;
      extraPackages = with pkgs.bat-extras; [ batman ];
    };

    eza = { enable = true; enableFishIntegration = true; };
    fzf = { enable = true; enableFishIntegration = true; };
    yazi = { enable = true; enableFishIntegration = false; };
    broot = { enable = true; enableFishIntegration = true; };

    ripgrep = { enable = true; };
    fd = { enable = true; };
    btop = { enable = true; };
    gh = { enable = true; };
  };


  # ////////// CONFIG FILES //////////

  xdg.configFile = {
    "starship.toml".source = ../configs/starship.toml;
    "fastfetch/config.jsonc".source = ../configs/fastfetch.jsonc;
  };
}
