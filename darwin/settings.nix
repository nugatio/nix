{ self, pkgs, primaryUser, ... }: {
  networking = {
    hostName = "macbookpro";
    computerName = "macbookpro";
  };

  system = {
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    startup.chime = false;

    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowScrollBars = "Always";
        NSTableViewDefaultSizeMode = 1;
        ApplePressAndHoldEnabled = false;
        AppleScrollerPagingBehavior = true;
        NSWindowShouldDragOnGesture = true;
      };

      dock = {
        tilesize = 40;
        magnification = true;
        largesize = 60;
        orientation = "right";

        autohide = true;
        minimize-to-application = true;
        show-recents = false;

        mru-spaces = false;
        expose-group-apps = true;

        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;

        persistent-apps = [
          "/System/Applications/System Settings.app"
          "/Applications/Ghostty.app"
          "/Users/${primaryUser}/Applications/Home Manager Apps/LibreWolf.app"
          "/Applications/UTM.app"
          "/Applications/Linear.app"
          "/Applications/Claude.app"
          "/Applications/Perplexity.app"
          "/Applications/Tuta Mail.app"
          "/System/Applications/Calendar.app"
          "/System/Applications/Notes.app"
          "/System/Applications/Maps.app"
          "/Applications/Infuse.app"
          "/Applications/Legcord.app"
          "/Applications/TIDAL.app"
          "/Applications/TradingView.app"
        ];

        persistent-others = [
          "/Applications"
        ];
      };

      finder = {
        AppleShowAllFiles = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        CreateDesktop = false;
        QuitMenuItem = true;
        FXPreferredViewStyle = "Nlsv";
        _FXSortFoldersFirst = false;
        FXEnableExtensionChangeWarning = false;
        FXDefaultSearchScope = "SCcf";
        NewWindowTarget = "Home";
      };

      menuExtraClock = {
        Show24Hour = true;
        ShowDayOfWeek = false;
        ShowSeconds = true;
        ShowDate = 1;
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = false;
      };

      CustomUserPreferences = {
        "com.apple.AppleMultitouchTrackpad" = {
          TrackpadThreeFingerVertSwipeGesture = 0;
          TrackpadFourFingerVertSwipeGesture = 0;

          TrackpadFourFingerPinchGesture = 0;
          TrackpadFiveFingerPinchGesture = 0;
        };
        "com.apple.driver.AppleBluetoothMultitouch.trackpad" = {
          TrackpadThreeFingerVertSwipeGesture = 0;
          TrackpadFourFingerVertSwipeGesture = 0;
          TrackpadFourFingerPinchGesture = 0;
          TrackpadFiveFingerPinchGesture = 0;
        };

        "com.apple.finder" = {
          FXPreferOpenInTabs = true;
          WarnOnEmptyTrash = true;
          FXRemoveOldTrashItems = false;

          SidebarShowingSignedIntoiCloud = false;
          ShowRecentTags = false;

          ShowExternalHardDrivesOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;

          _FXSortFoldersFirstOnDesktop = false;

          "FK_AppCentricShowSidebar" = true;

          "FK_DefaultListViewSettings" = {
            calculateAllSizes = false;
            columns = [
              { ascending = true; identifier = "name"; visible = true; width = 300; }
              { ascending = false; identifier = "dateModified"; visible = true; width = 181; }
              { ascending = false; identifier = "dateCreated"; visible = false; width = 181; }
              { ascending = false; identifier = "size"; visible = true; width = 97; }
              { ascending = true; identifier = "kind"; visible = true; width = 115; }
              { ascending = true; identifier = "label"; visible = false; width = 100; }
              { ascending = true; identifier = "version"; visible = false; width = 75; }
              { ascending = true; identifier = "comments"; visible = false; width = 300; }
              { ascending = false; identifier = "dateLastOpened"; visible = false; width = 200; }
            ];
            arrangBy = "name";
            iconSize = 16;
            showIconPreview = true;
            sortColumn = "name";
            textSize = 12;
            useRelativeDates = true;
            viewOptionsVersion = 1;
          };

          "FK_DefaultIconViewSettings" = {
            arrangeBy = "name";
            gridSpacing = 64;
            iconSize = 64;
            labelOnBottom = true;
            showIconPreview = true;
            showItemInfo = true;
            textSize = 12;
            viewOptionsVersion = 1;
          };

          "StandardViewSettings" = {
            "ExtendedListViewSettingsV2" = {
              calculateAllSizes = false;
              columns = [
                { ascending = true; identifier = "name"; visible = true; width = 300; }
                { ascending = false; identifier = "dateModified"; visible = true; width = 181; }
                { ascending = false; identifier = "dateCreated"; visible = false; width = 181; }
                { ascending = false; identifier = "size"; visible = true; width = 97; }
                { ascending = true; identifier = "kind"; visible = true; width = 115; }
                { ascending = true; identifier = "label"; visible = false; width = 100; }
                { ascending = true; identifier = "version"; visible = false; width = 75; }
                { ascending = true; identifier = "comments"; visible = false; width = 300; }
                { ascending = false; identifier = "dateLastOpened"; visible = false; width = 200; }
              ];
              iconSize = 16;
              showIconPreview = true;
              sortColumn = "name";
              textSize = 12;
              useRelativeDates = true;
              viewOptionsVersion = 1;
            };
          };

          "DesktopViewSettings" = {
            "IconViewSettings" = {
              arrangeBy = "none";
              backgroundColorBlue = 0;
              backgroundColorGreen = 0;
              backgroundColorRed = 0;
              backgroundType = 0;
              gridSpacing = 54;
              iconSize = 40;
              labelOnBottom = true;
              showIconPreview = true;
              showItemInfo = false;
              textSize = 10;
              viewOptionsVersion = 1;
            };
          };
        };

        "com.apple.dock" = {
          "enable-spring-load-actions-on-all-items" = false;
          showMissionControlGestureEnabled = false;
          showLaunchpadGestureEnabled = false;
          showAppExposeGestureEnabled = false;
          showDesktopGestureEnabled = false;
        };

        "com.mitchellh.ghostty" = {
          NSUserKeyEquivalents = {
            "Quit Ghostty" = "@~^$!";
            "Hide Ghostty" = "@~^$!";
            "Hide Others" = "@~^$!";
            "Minimize" = "@~^$!";
            "Terminal Inspector" = "@~^$!";
          };
        };

        "com.apple.screensaver" = {
          idleTime = 120;
          askForPassword = 1;
          askForPasswordDelay = 0;
        };

        "com.apple.desktop" = {
          BackgroundColor = "0.000000 0.000000 0.000000";
          Picture = "";
          Change = "Never";
          Random = false;
          ImageFileAlias = "";
          ImageFilePath = "";
        };

        ".GlobalPreferences" = {
          AppleHighlightColor = "1.000000 0.749020 0.823529 Pink";
          AppleICUNumberSymbols = {
            "0" = "."; "1" = ","; "10" = "."; "17" = ",";
          };
        };

        "com.apple.controlcenter" = {
          "AirplayRecieverEnabled" = false;
          "NSStatusItem Visible WiFi" = true;
          "NSStatusItem Visible TimeMachine" = true;
          "NSStatusItem Visible NowPlaying" = true;

          "NSStatusItem Visible Battery" = false;
          "NSStatusItem Visible Bluetooth" = false;
          "NSStatusItem Visible Sound" = false;
          "NSStatusItem Visible FocusModes" = false;
          "NSStatusItem Visible ScreenMirroring" = false;
          "NSStatusItem Visible Display" = false;
          "NSStatusItem Visible Siri" = false;
          "NSStatusItem Visible UserSwitcher" = false;
        };
        "com.apple.Spotlight" = { "MenuItemHidden" = true; };

        "com.apple.windowmanager" = {
          globallyEnabled = false;
          EnableStandardClickToShowDesktop = 0;
          EnableTilingByEdgeDrag = 0;
          EnableTopTilingByEdgeDrag = 0;
          EnableTilingOptionAccelerator = 0;
        };
        "com.apple.WindowManager" = {
          StandardHideWidgets = true;
          StageManagerHideWidgets = true;
        };

        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = let
            range = pkgs.lib.range 0 300;
          in
            pkgs.lib.listToAttrs (map (i: {
              name = builtins.toString i;
              value = { enabled = false; };
            }) range);
        };
      };

      CustomSystemPreferences = {
        "/Library/Preferences/com.apple.iokit.AmbientLightSensor" = {
          "Automatic Keyboard Enabled" = true;
          "Keyboard Dim Time" = 300;
        };
      };
    };
  };

  system.activationScripts.postActivation.text = ''
    sudo defaults write /Library/Preferences/com.apple.BezelServices kDimTime -int 300
    sudo pmset -b displaysleep 10
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

    /usr/bin/killall cfprefsd 2>/dev/null || true
    /usr/bin/killall SystemUIServer 2>/dev/null || true
    /usr/bin/killall Dock 2>/dev/null || true
  '';
}
