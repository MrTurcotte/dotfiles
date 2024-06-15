{pkgs, ... }:

{
  environment.sessionVariables = {
#    CLUTTER_BACKEND = "wayland";          # Specifies Wayland as the backend for Clutter.
    MOZ_ENABLE_WAYLAND = "1";             # Enables Wayland support in Mozilla applications (e.g., Firefox).
    NIXOS_OZONE_WL = "1";                 # Enables the Ozone Wayland backend for Chromium-based browsers.
#    NIXPKGS_ALLOW_UNFREE = "1";           # Allows the installation of packages with unfree licenses in Nixpkgs.
#    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";  # Disables window decorations in Qt applications when using Wayland.
#    SDL_VIDEODRIVER = "wayland";          # Sets the video driver for SDL applications to Wayland.
#    XDG_SESSION_TYPE = "wayland";         # Defines the session type as Wayland.
  };

  # For Laptops
  environment.systemPackages = with pkgs; [
      acpi
      cpufrequtils
      cpupower-gui
      ethtool
      powerstat
      powertop
      tlp
  ];
}
