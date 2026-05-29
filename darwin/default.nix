{ pkgs, inputs, self, primaryUser, ... }: {
  imports = [
    ./settings.nix
    ./homebrew.nix
    inputs.determinate.darwinModules.default
    inputs.home-manager.darwinModules.home-manager
    inputs.nix-homebrew.darwinModules.nix-homebrew
    inputs.sops-nix.darwinModules.sops
  ];

  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/Users/${primaryUser}/.config/sops/age/keys.txt";
  };

  security = {
    pam.services.sudo_local.touchIdAuth = true;
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@admin"
        primaryUser
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://devenv.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
      ];
    };
    enable = false;
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (final: prev: {
        zjstatus = inputs.zjstatus.packages.${prev.stdenv.hostPlatform.system}.default;
      })
      inputs.rust-overlay.overlays.default
      (final: prev: {
        kvazaar = prev.kvazaar.overrideAttrs (oldAttrs: {
          doCheck = false;
        });
        chromaprint = prev.chromaprint.overrideAttrs (oldAttrs: {
          doCheck = false;
        });
      })
    ];
  };

  nix-homebrew = {
    enableRosetta = true;
    user = primaryUser;
    enable = true;
    autoMigrate = true;
    enableFishIntegration = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${primaryUser} = {
      imports = [
        ../home
      ];
      home.file.".hushlogin".text = "";
    };
    extraSpecialArgs = {
      inherit inputs self primaryUser;
    };
  };

  system = {
    primaryUser = primaryUser;
  };

  programs = {
    fish.enable = true;
  };

  users.users.${primaryUser} = {
    name = primaryUser;
    home = "/Users/${primaryUser}";
    shell = pkgs.fish;
  };

  environment = {
    systemPackages = [ pkgs.git pkgs.fish pkgs.nushell ];
    shells = [ pkgs.fish pkgs.nushell ];
    systemPath = [
      "/opt/homebrew/bin"
    ];
    pathsToLink = [ "/Applications" ];
  };

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
