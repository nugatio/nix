{ pkgs, ... }: {
  home.packages = with pkgs; [
    # --- Nix Tooling ---
    nh
    nix-output-monitor
    nvd
    nix-index
    nix-your-shell
    cachix
    devenv
    comma

    # --- Terminal & Editors ---
    zjstatus
    micro

    # --- Modern CLI Replacements ---
    sd # sed
    procs # ps
    dust # du
    duf # df
    rm-improved # rm
    xcp # cp
    choose # cut/awk
    ouch # unzip/tar
    hyperfine # benchmarking
    tokei # code statistics
    moor
    tlrc # tldr client
    fastfetch

    # --- Network & Monitoring ---
    xh # curl/wget (HTTP client)
    doggo # dig (DNS)
    gping # ping (graph)
    trippy # mtr (network diagnostics)
    bandwhich # network usage monitor

    # --- Git & Generic Workflows ---
    just # command runner
    onefetch # git repo summary
    git-absorb

    # --- Global Container & Cluster Management ---
    lazydocker
    k9s
    kubectl # Kept globally for ad-hoc cluster poking

    # --- Data Processing & Secrets ---
    jaq # jq clone
    yq-go # yaml processor
    usql # universal SQL client
    age # file encryption

    # --- Global Bootstrappers ---
    uv # Kept globally because `uvx` is amazing for running standalone Python CLI tools
  ];
}
