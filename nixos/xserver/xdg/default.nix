{ config, pkgs, ... }:

{

  # Environment Variables
  xdg.portal = {
    enable = true;
#    xdgOpenUsePortal = true;
#    wlr = { enable = false; };
#    lxqt = {
#      enable = false;
#      styles = with pkgs;
#        with libsForQt5; [
#          qtstyleplugin-kvantum
#          breeze-qt5
#          qtcurve
#        ];
#    };
#    extraPortals = with pkgs; [
#      xdg-desktop-portal-kde
#      #      xdg-desktop-portal-gtk
#      xdg-desktop-portal-wlr
#    ];
  };

  environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ "${XDG_BIN_HOME}" ];
  };

}
