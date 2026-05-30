# nb@2026.05.30

{ primaryUser, config, ... }: {
  programs.git = {
    enable = true;
    signing = {
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    settings = {
      gpg = {
        format = "ssh";
        ssh = {
          allowSignersFile = "${config.home.homeDirectory}/.ssh/allow_signers";
        };
      };
      user = {
        name = "Niklas Bitzer";
        email = "mail@nbitzer.de";
      };

      alias = {
        absorb = "absorb";
        fixup = "commit --fixup";
      };

      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      push.default = "current";

      rebase.autoStash = true;
      rebase.autoSquash = true;

      fetch.prune = true;
      fetch.pruneTags = true;

      diff.algorithm = "histogram";
      diff.colorMoved = "default";

      merge.conflictstyle = "zdiff3";

      rerere.enabled = true;
      log.date = "iso";
      status.showUntrackedFiles = "all";
      commit.verbose = true;
      branch.sort = "-committerdate";

      core = {
        editor = "hx";
        autocrlf = "input";
        preloadindex = true;
        fscache = true;
      };

      blame.ignoreRevsFile = ".git-blame-ignore-revs";

      github.user = primaryUser;
    };

    lfs.enable = true;

    ignores = [
      "**/.DS_Store"
      ".direnv/"
      ".devenv/"
      ".env"
      "*.pyc"
      "__pycache__/"
      ".venv/"
      "venv/"
      ".pytest_cache/"
      "node_modules/"
      "target/"
      ".cargo/"
      "dist/"
      "build/"
      "*.swp"
      "*.swo"
      "*~"
      ".idea/"
      ".vscode/"
      "*.log"
    ];
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git.paging = {
        colorArg = "always";
        pager = "delta --dark --paging=never";
      };
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      light = false;
      side-by-side = true;
      line-numbers = true;
    };
  };
}
