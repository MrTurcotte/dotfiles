{ config, pkgs, ... }:

{
  services = {
    xserver.desktopManager.deepin.enable = true;
    deepin.dde-daemon.enable = true;
    deepin.dde-api.enable = true;
    deepin.app-services.enable = true;
  };
}
