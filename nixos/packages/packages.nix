{ pkgs, ... }:

{
  #  Packages
  environment.systemPackages = with pkgs; [
    # (import ./7zz.nix)
    # (import ./docker)
    # d1x-rebirth-full
    # d2x-rebirth-full
    # dxx-rebirth
    # waybar
    alacritty  
    android-studio
    bintools
    binutils
    blueberry
    brightnessctl
    cifs-utils
    deluge
    elegant-sddm
    evince
    ffmpeg
    fuse
    gimp-with-plugins
    gitFull
    gnu-cobol
    google-chrome
    gparted
    grim
    grimblast
    gst_all_1.gst-plugins-good
    htop
    hyprland-protocols
    imagemagick
    kooha
    kotlin
    libnotify
    libreoffice-fresh
    libretro.bsnes-hd
    libsecret
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
    pamixer
    pavucontrol
    psmisc
    pywal
    simplescreenrecorder
    slurp
    snes9x-gtk
    speedcrunch
    spotify
    sway-contrib.grimshot
    swayidle
    swaylock-effects
    swww
    sxiv
    sysstat
    texliveFull
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
    wlogout
    wlr-randr
    wofi
    wordgrinder
    xdg-desktop-portal-hyprland
    xfontsel
    xorg.xhost
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
    adb.enable = true;
    steam.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    waybar.enable = true;
  };

  # Enable Flatpak
  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


}
