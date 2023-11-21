{ config, pkgs, ... }:

{

  #  Auto-Lock Requirements
  services.logind = { lidSwitch = "lock"; };

  #  Enable Blueman
  services.blueman.enable = true;

  # Picom
  services.picom = {
    enable = true;
    backend = "glx";
    settings = {
      blur = {
        method = "dual_kawase";
        size = 10;
        deviation = 5.0;
      };
    };
    shadow = true;
    shadowOffsets = [ (-15) (-15) ];
    activeOpacity = 1.0;
    fade = true;
    fadeDelta = 3;

  };

  #  Packages
  environment.systemPackages = with pkgs; [
#    pa_applet
    pamixer
    pavucontrol
    flameshot
#    networkmanagerapplet
    brightnessctl
    picom
    dmenu
    rofi
    nitrogen
    xautolock
    xfce.thunar
    xfontsel
    sysstat
  ];

  #  Programs
  programs = {
    slock.enable = true;
    xss-lock.enable = true;
    xss-lock.lockerCommand = "/run/wrappers/bin/slock";
  };
  #  Enable DWM
  services.xserver.windowManager.dwm.enable = true;

  #  Overlays
  nixpkgs.overlays = [
    (final: prev: { dwm = prev.dwm.overrideAttrs (old: { src = ./src; }); })
  ];

}
