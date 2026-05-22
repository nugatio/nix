{ ... }: {
  homebrew = {
    enable = true;

    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };

    taps = [ "nikitabobko/tap" ];
    casks = [
      "adguard"
      "aerospace"
      "affinity"
      "aldente"
      "alt-tab"
      "antigravity"
      # "app-cleaner"
      "balenaetcher"
      "bartender"
      "betterdisplay"
      "bettertouchtool"
      "bitwarden"
      "caffeine"
      "claude"
      "daisydisk"
      "font-sf-pro"
      "ghostty"
      "google-chrome"
      "google-gemini"
      "granola"
      "hammerspoon"
      "jetbrains-toolbox"
      "lark"
      "legcord"
      "linear"
      "linearmouse"
      "numi"
      "mactex"
      "microsoft-word"
      "microsoft-powerpoint"
      "microsoft-excel"
      "microsoft-teams"
      "mochi"
      "motu-m-series"
      "mullvad-vpn"
      "obsidian"
      "orbstack"
      "positron"
      "raycast"
      "skim"
      "spotify"
      "synology-drive"
      "tailscale-app"
      "tidal"
      "tradingview"
      "tuta-mail"
      "utm"
      "visual-studio-code"
      "zed"
      "zotero"
    ];

    masApps = {
      # "Things 3" = 904280696;
      # "Infuse" = 1136220934;
      # "Dropover - Easier Drag & Drop" = 1355679052;
      # "Flow: Pomodoro & Study Timer" = 1423210932;
      # "NextDNS" = 1464122853;
      # "Perplexity: Ask Anything" = 6714467650;
      # "reMarkable desktop" = 1276493162;
    };
  };
}
