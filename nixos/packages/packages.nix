{ pkgs, ... }:

let
  pkgs = import <nixpkgs> {};

  tte = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "ChrisBuilds";
    repo = "terminaltexteffects";
    rev = "0ba769c3308cf2782b6cb1ff3d6da5ed6a430c94";
    hash = "sha256-1JWDpdlwV1QCzGtDkSC9+rQvTqKbTnQ//8phLGhHHKo=";
  }) {};
in 
{
  #  Packages
  environment.systemPackages = with pkgs; [
    alacritty  
    android-studio
    avizo
    bintools
    binutils
    blueberry
    brightnessctl
    cifs-utils
    deluge
    duf
    elegant-sddm
    evince
    ffmpeg
    figlet
    fuse
    gcc
    geany
    gimp-with-plugins
    gitFull
    gnome.gnome-themes-extra
    gnu-cobol
    google-chrome
    gparted
    grim
    grimblast
    gst_all_1.gst-plugins-good
    htop
    hyprland-protocols
    imagemagick
    jetbrains.pycharm-community-bin
    kotlin
    libnotify
    libreoffice-fresh
    libsecret
    libstdcxx5
    lxqt.lxqt-policykit
    mako
    mpv
    mutt
    neofetch
    networkmanagerapplet
    newsboat
    nixfmt-rfc-style
    nixos-generators
    nwg-bar
    nwg-drawer
    onlyoffice-bin
    oterm
    pamixer
    pavucontrol
    pkgs.onlyoffice-bin
    psmisc
    python3
    python312Packages.mysql-connector
    python312Packages.pip
    pywal
    simplescreenrecorder
    slurp
    speedcrunch
    spotify
    sway-contrib.grimshot
    swayidle
    swaylock-effects
    swww
    sxiv
    sysstat
    texliveFull
    tte
    vim
    volnoti
    vscodium-fhs
    vulkan-headers
    vulkan-tools
    waylock
    wayout
    wayshot
    wget
    wl-clipboard
    wl-screenrec
    wlogout
    wlr-randr
    wofi
    wordgrinder
    xdg-desktop-portal-hyprland
    xfce.thunar
    xfontsel
    xorg.xhost
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
    adb.enable = true;
    steam.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar.enable = true;
    gamemode.enable = true;
  };

  # Enable Flatpak
  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable MySQL
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
    user = "dave";
  };

}
