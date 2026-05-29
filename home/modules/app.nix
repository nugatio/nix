{ config, lib, pkgs, ... }:
let
  repoPath = "${config.home.homeDirectory}/.config/nix-private";

  syncMap = {
    "AltTab" = {
      live = "${config.home.homeDirectory}/Library/Preferences/com.lwouis.alt-tab-macos.plist";
      repo = "${repoPath}/alttab/com.lwouis.alt-tab-macos.plist";
    };
    "AlDente" = {
      live = "${config.home.homeDirectory}/Library/Preferences/com.apphousekitchen.aldente-pro.plist";
      repo = "${repoPath}/aldente/com.apphousekitchen.aldente-pro.plist";
    };
    "Bartender" = {
      live = "${config.home.homeDirectory}/Library/Preferences/com.surteesstudios.Bartender.plist";
      repo = "${repoPath}/bartender/com.surteesstudios.Bartender.plist";
    };
    "BetterDisplay" = {
      live = "${config.home.homeDirectory}/Library/Preferences/pro.betterdisplay.BetterDisplay.plist";
      repo = "${repoPath}/betterdisplay/pro.betterdisplay.BetterDisplay.plist";
    };
  };

  syncBackScript = pkgs.writeShellScript "sync-plists-to-nix" ''
    PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin

    ${lib.concatStringsSep "\n" (lib.mapAttrsToList (name: paths: ''
      if [ -f "${paths.live}" ]; then
        # Check if repo file exists and is writable
        if [ -f "${paths.repo}" ] && [ -w "${paths.repo}" ]; then

            # Use a temp file to avoid corruption
            tmp_file=$(mktemp)

            # Convert binary plist to XML (so it's readable in Git)
            if plutil -convert xml1 -o "$tmp_file" "${paths.live}"; then

                # Check if content actually changed
                if ! cmp -s "$tmp_file" "${paths.repo}"; then
                    mv "$tmp_file" "${paths.repo}"
                    echo "✓ Synced ${name} to repo"
                else
                    rm "$tmp_file"
                fi
            else
                # Conversion failed, clean up
                rm "$tmp_file"
                echo "! Error converting ${name}"
            fi
        fi
      fi
    '') syncMap)}
  '';
in
{
  home.activation.importAppPlists = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    echo "Importing application plists..."

    ${lib.concatStringsSep "\n" (lib.mapAttrsToList (name: paths: ''
      if [ -f "${paths.repo}" ]; then
         domain=$(basename "${paths.live}" .plist)
         # 'defaults import' is the safe Apple way to load settings
         $DRY_RUN_CMD /usr/bin/defaults import "$domain" "${paths.repo}" || true
         echo "  ✓ ${name} settings imported"
      else
         echo "  ! Warning: Repo file for ${name} missing at ${paths.repo}"
      fi
    '') syncMap)}

    if [ -z "$DRY_RUN_CMD" ]; then
        # Reload preferences cache
        /usr/bin/killall cfprefsd 2>/dev/null || true
    fi
  '';

  launchd.agents.plist-sync = {
    enable = true;
    config = {
      Label = "org.nix.plist-sync";
      ProgramArguments = [ "${syncBackScript}" ];
      WatchPaths = lib.mapAttrsToList (n: p: p.live) syncMap;
      RunAtLoad = false;
      StandardOutPath = "/tmp/plist-sync.log";
      StandardErrorPath = "/tmp/plist-sync.err";
      ThrottleInterval = 30;
    };
  };
}
