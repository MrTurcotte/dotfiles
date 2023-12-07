{ config, pkgs, ... }:

{

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    psutils
    psmisc
    python3
    pkgs.pywal
    pkgs.wofi
    pkgs.fuse
    pkgs.speedcrunch
    pkgs.suricata
    pkgs.tcpdump
    #    pkgs.busybox
    pkgs.xss-lock
    pkgs.libnotify
    pkgs.libsForQt5.ghostwriter
    pkgs.alacritty
    #    pkgs.android-studio
    #    pkgs.jetbrains.idea-community
    pkgs.appimage-run
    pkgs.bintools
    pkgs.binutils
    pkgs.brave
    pkgs.cifs-utils
    pkgs.deluge
    #    pkgs.devour
    pkgs.dmidecode
    pkgs.evince
    pkgs.eza
    #    pkgs.gcc
    pkgs.gimp-with-plugins
    pkgs.gitFull
    pkgs.google-chrome
    pkgs.gparted
    pkgs.gst_all_1.gst-libav
    pkgs.htop
    pkgs.imagemagick
    #    pkgs.inkscape-with-extensions
    pkgs.kotlin
    #    pkgs.krita
    pkgs.libreoffice-qt
    pkgs.libsecret
    #    pkgs.libsForQt5.kdenlive
    pkgs.libvorbis
    pkgs.lutris
    pkgs.mgba
    pkgs.mpv
    pkgs.mutt
    pkgs.nasm
    pkgs.neofetch
    pkgs.newsboat
    pkgs.nixfmt
    pkgs.nixos-generators
    pkgs.nuclear
    #    pkgs.obs-studio
    pkgs.openjdk11
    pkgs.patchelf
    pkgs.polkit_gnome
    pkgs.pywal
    #    pkgs.rclone
    #    pkgs.ripgrep-all
    pkgs.snes9x
    pkgs.snes9x-gtk
    pkgs.spotify
    #    pkgs.st
    #    pkgs.steam
    #    pkgs.sublime
    pkgs.sxiv
    pkgs.texlive.combined.scheme-full
    pkgs.texstudio
    pkgs.transmission
    pkgs.unzip
    pkgs.vim
    pkgs.vlc
    pkgs.vorbis-tools
    pkgs.vorbisgain
    pkgs.vscode-with-extensions
    pkgs.wget
    pkgs.winetricks
    #    pkgs.wineWowPackages.waylandFull
    pkgs.wineWowPackages.stable
    pkgs.woeusb
    pkgs.wordgrinder
    #    pkgs.wpsoffice
    pkgs.xautolock
    pkgs.youtube-dl
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
