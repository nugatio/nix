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
