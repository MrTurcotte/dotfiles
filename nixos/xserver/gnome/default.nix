{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome3.gnome-tweaks
    gnome-extension-manager
    gnome.dconf-editor
    gnomeExtensions.appindicator
    gnome.adwaita-icon-theme  
    fluent-icon-theme
    zafiro-icons
    gnomeExtensions.blur-my-shell
  ];
#  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

}
