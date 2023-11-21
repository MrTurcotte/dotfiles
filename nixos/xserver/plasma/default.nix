{ config, pkgs, ... }:

{

  imports = [
    ../sddm-themes
  ];

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasma";

  environment.systemPackages = with pkgs; [
    libsForQt5.kaccounts-integration
    libsForQt5.kaccounts-providers
    libsForQt5.kio-gdrive
    libsForQt5.bismuth
    libsForQt5.discover
    libsForQt5.packagekit-qt
    libportal-qt5
  ];

}
