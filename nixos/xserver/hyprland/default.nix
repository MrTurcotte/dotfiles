{ pkgs, config, ... }:


let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in



{

  imports = [ ( import "${home-manager}/nixos" ) ];

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  home-manager.users.dave = {
#    xdg.configFile."hypr/hyprland.conf".source = ./hypr/dave.conf;
#    xdg.configFile."rofi/style.css".source = ./rofi/dave.css;
#    xdg.configFile."waybar/config".source = ./waybar/dave;
#    xdg.configFile."waybar/style.css".source = ./waybar/dave.css;

    home.stateVersion = "23.05";

    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        ignore-empty-password = true;
        image = "$HOME/.lockscreen";
        indicator = true;
        indicator-idle-visible = true;
        indicator-caps-lock = true;
        indicator-radius = 100;
        indicator-thickness = 16;
        line-uses-inside = true;
        effect-blur = "9x7";
        effect-vignette = "0.85:0.85";
        fade-in = 0.1;
      };
    };

    services.swayidle = {
      enable = true;
      events = [{
        event = "before-sleep";
        command = "swaylock";
      }];
      timeouts = [{
        timeout = 450;
        command = "swaylock";
      }];
    };

  };

  #  Packages
  environment.systemPackages = with pkgs; [
    volnoti
    shotman
    #    flameshot
    #    cliphist
    #    copyq
    sway-contrib.grimshot
    kooha
    pamixer
    pavucontrol
    gnome.gnome-screenshot
    networkmanagerapplet
    brightnessctl
    wofi
    xfce.thunar
    xfontsel
    sysstat
    kitty
    hyprland-protocols
    #    hyprland-share-picker
    xdg-desktop-portal-hyprland
    waybar
    mako
    swww
    mpvpaper
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
  ];

  nixpkgs.overlays = [
    (self: super: {
      waybar = super.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      });
    })
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver = { displayManager = { defaultSession = "hyprland"; }; };

}
