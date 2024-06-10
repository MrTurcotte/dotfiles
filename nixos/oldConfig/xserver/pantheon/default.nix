{ config, pkgs, ... }:

{
  programs.pantheon-tweaks.enable = true;
  services.xserver.desktopManager.pantheon.enable = true;
  services.pantheon.apps.enable = true;
  services.pantheon.contractor.enable = true;
}
