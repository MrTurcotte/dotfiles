{ pkgs, ... }:

{
  #  Packages
  environment.systemPackages = with pkgs; [
    google-chrome
    gimp-with-plugins
    sxiv
    vscodium
    xorg.xhost
    lxqt.lxqt-policykit
    grimblast
    libnotify
    pywal
    libreoffice-fresh
    onlyoffice-bin
    psmisc
    nwg-drawer
    nwg-bar
    volnoti
    sway-contrib.grimshot
    kooha
    pamixer
    pavucontrol
    networkmanagerapplet
    brightnessctl
    wofi
    xfontsel
    sysstat
    hyprland-protocols
    xdg-desktop-portal-hyprland
    waybar
    mako
    swww
    wlr-randr
    wayout
    grim
    slurp
    wayshot
    simplescreenrecorder
    wlogout
    waylock
    blueberry
    wl-clipboard
    gst_all_1.gst-plugins-good
    gparted
    texliveFull
    gnu-cobol
    android-studio
  ];

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

}
