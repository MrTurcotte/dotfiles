{ config, pkgs, ... }:

{

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nixos-generators
#    protonvpn-gui
    psutils
    psmisc
    python3
    pywal
    wofi
    fuse
    speedcrunch
    suricata
    tcpdump
    #    busybox
    xss-lock
    libnotify
    libsForQt5.ghostwriter
    alacritty
    #    android-studio
    #    jetbrains.idea-community
    appimage-run
    bintools
    binutils
    brave
    cifs-utils
    deluge
    #    devour
    dmidecode
    evince
    eza
    #    gcc
    gimp-with-plugins
    gitFull
    google-chrome
    gparted
    gst_all_1.gst-libav
    htop
    imagemagick
    #    inkscape-with-extensions
    kotlin
    #    krita
    libreoffice-qt
    libsecret
    #    libsForQt5.kdenlive
    libvorbis
    lutris
    mgba
    mpv
    mutt
    nasm
    neofetch
    newsboat
    nixfmt
    nixos-generators
    nuclear
    #    obs-studio
    openjdk11
    patchelf
    polkit_gnome
    pywal
    #    rclone
    #    ripgrep-all
    snes9x
    snes9x-gtk
    spotify
    #    st
    #    steam
    #    sublime
    sxiv
#    texlive.combined.scheme-full
#    texstudio
    transmission
    unzip
    vim
    vlc
    vorbis-tools
    vorbisgain
    vscode-with-extensions
    wget
    winetricks
    #    wineWowPackages.waylandFull
    wineWowPackages.stable
    woeusb
    wordgrinder
    #    wpsoffice
    xautolock
    youtube-dl
  ];

  programs = {
    firefox = {
      enable = true;
      policies = {
        CaptivePortal = false;
        DisableFirefoxAccounts = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        FirefoxHome = {
          Pocket = false;
          Snippets = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };
      };
    };
  };

}
