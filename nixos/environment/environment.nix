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
    LIBVA_DRIVER_NAME = "iHD";                 # Specifies the VA-API driver to use for hardware acceleration
    WLR_NO_HARDWARE_CURSORS = "1";                # Disables hardware cursors for Wayland to avoid issues with some Nvidia drivers
     __GLX_VENDOR_LIBRARY_NAME = "intel";         # Specifies the GLX vendor library to use, ensuring Nvidia's library is used
    __GL_SHADER_CACHE = "1";                      # Enables the GL shader cache, which can improve performance by caching compiled shaders
    __GL_THREADED_OPTIMIZATION = "1";             # Enables threaded optimization in Nvidia's OpenGL driver for better performance
    CLUTTER_BACKEND = "wayland";                  # Specifies Wayland as the backend for Clutter
    NIXPKGS_ALLOW_UNFREE = "1";                   # Allows the installation of packages with unfree licenses in Nixpkgs
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";    # Disables window decorations in Qt applications when using Wayland
    SDL_VIDEODRIVER = "wayland";                  # Sets the video driver for SDL applications to Wayland
    MOZ_DBUS_REMOTE = "1";
    MOZ_ALLOW_DOWNGRADE = "1";			              # Don't throw "old profile" dialog box.
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
