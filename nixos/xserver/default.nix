{ config, pkgs, ... }:

{

  imports = [
    ./sddm-themes
    ./xdg
    ./hyprland
    ./plasma
#    ./budgie
#    ./cinnamon
#    ./deepin
#    ./dwm
#    ./gnome
#    ./mate
#    ./pantheon
  ];

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
    libinput = {
      enable = true;
      touchpad.tapping = false;
      touchpad.naturalScrolling = true;
      touchpad.scrollMethod = "twofinger";
      touchpad.disableWhileTyping = true;
      touchpad.clickMethod = "clickfinger";
    };
    exportConfiguration = true;
  };
}

