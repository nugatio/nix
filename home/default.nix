# nb@2026.05.30

{ primaryUser, ... }: {
  imports = [
    ./modules
    ./packages.nix
  ];

  home = {
    username = primaryUser;
    homeDirectory = "/Users/${primaryUser}";
    stateVersion = "25.11";
  };
}
