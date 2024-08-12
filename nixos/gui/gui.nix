{pkgs, ...}:

{
      # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  # services.xserver.desktopManager.plasma5.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.desktopManager.gnome.enable = true;
  
  # Enable SDDM
  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "breeze";
  services.displayManager.sddm.settings = {
    General = {
      InputMethod = "";
    };
    Theme = {
     # FacesDir = "/home/Faces/";
     ThemeDir = "/home/sddm/";
    };
  };

  # Configure keymap in X11
  # services.xserver = {
  #   xkb.layout = "us";
  #   xkb.variant = "";
  # };


}
