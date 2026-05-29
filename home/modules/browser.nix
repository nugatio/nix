{ pkgs, config, lib, primaryUser, ... }: {

  programs.librewolf = {
    enable = true;
    package = pkgs.librewolf;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
      };
      HardwareAcceleration = true;

      ExtensionSettings = {
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # SponsorBlock
        "sponsorBlocker@ajay.app" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
          installation_mode = "force_installed";
        };
        # Enhancer for YouTube
        "{c49b13b1-5dee-4345-925e-0c793377e3fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-enhancer-vc/latest.xpi";
          installation_mode = "force_installed";
        };
        # Tab Stash
        "tab-stash@condordes.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/tab-stash/latest.xpi";
          installation_mode = "force_installed";
        };
        # Unpaywall
        "{f209234a-76f0-4735-9920-eb62507a54cd}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/unpaywall/latest.xpi";
          installation_mode = "force_installed";
        };
        # Bypass Paywalls Clean
        "magnolia@12.34" = {
          install_url = "https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass_paywalls_clean-latest.xpi";
          installation_mode = "force_installed";
        };
        # Custom New Tab Page
        "custom-new-tab-page@mint.as" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/custom-new-tab-page/latest.xpi";
          installation_mode = "force_installed";
        };
        # AdGuard Browser Assistant
        "browserassistant@adguard.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-browser-assistant/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.nb = {
      isDefault = true;
      id = 0;
      userChrome = builtins.readFile ../configs/librewolf/userChrome.css;

      settings = {
        "browser.uiCustomization.state" = builtins.toJSON {
          placements = {
            widget-overflow-fixed-list = [ ];
            unified-extensions-area = [
              "newtaboverride_agenedia_com-browser-action"
              "enhancerforyoutube_maximerf_addons_mozilla_org-browser-action"
              "tab-stash_condordes_net-browser-action"
              "magnolia_12_34-browser-action"
              "_f209234a-76f0-4735-9920-eb62507a54cd_-browser-action"
              "addon_darkreader_org-browser-action"
            ];
            nav-bar = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "urlbar-container"
              "downloads-button"
              "fxa-toolbar-menu-button"
              "unified-extensions-button"
              "ublock0_raymondhill_net-browser-action"
              "sponsorblocker_ajay_app-browser-action"
              "browserassistant_adguard_com-browser-action"
            ];
            TabsToolbar = [
              "tabbrowser-tabs"
              "new-tab-button"
              "alltabs-button"
            ];
            PersonalToolbar = [
              "import-button"
              "personal-bookmarks"
            ];
          };
          seen = [
            "developer-button"
            "ublock0_raymondhill_net-browser-action"
            "sponsorblocker_ajay_app-browser-action"
            "enhancerforyoutube_maximerf_addons_mozilla_org-browser-action"
            "tab-stash_condordes_net-browser-action"
          ];
          currentVersion = 23;
          newElementCount = 4;
        };

        "browser.startup.homepage" = "http://192.168.0.192:5005/";
        "browser.startup.page" = 3;
        "browser.newtabpage.activity-stream.showSearch" = false;
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
        "font.size.variable.x-western" = 13;
        "full-screen-api.ignore-widgets" = true;
        "browser.tabs.drawInTitlebar" = true;

        "browser.download.useDownloadDir" = true;
        "browser.download.dir" = "${config.home.homeDirectory}/Downloads";
        "browser.download.lastDir" = "${config.home.homeDirectory}/Downloads";
        "browser.download.panel.shown" = true;

        "browser.search.suggest.enabled" = true;
        "browser.urlbar.suggest.searches" = true;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.placeholderName" = "DuckDuckGo";

        "browser.contentblocking.category" = "strict";
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.emailtracking.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.globalprivacycontrol.was_ever_enabled" = true;

        "privacy.fingerprintingProtection" = true;
        "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
        "privacy.resistFingerprinting" = false;
        "webgl.disabled" = true;

        "media.eme.enabled" = true;
        "pdfjs.enableAltText" = true;

        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.policies.applied" = true;
        "browser.translations.panelShown" = true;
      };
    };
  };

  home.activation.linkLibreWolfPlaces = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    PRIVATE_DB="${config.home.homeDirectory}/.config/nix-private/librewolf/places.sqlite"
    TARGET_DIR="${config.home.homeDirectory}/Library/Application Support/librewolf/Profiles/${primaryUser}"
    TARGET_DB="$TARGET_DIR/places.sqlite"

    if [ -f "$PRIVATE_DB" ]; then
      echo "Linking private LibreWolf places.sqlite..."
      mkdir -p "$TARGET_DIR"

      # If it's a file but not a symlink, back it up first
      if [ -f "$TARGET_DB" ] && [ ! -L "$TARGET_DB" ]; then
        mv "$TARGET_DB" "$TARGET_DB.backup"
      fi

      ln -sf "$PRIVATE_DB" "$TARGET_DB"
    fi
  '';
}
